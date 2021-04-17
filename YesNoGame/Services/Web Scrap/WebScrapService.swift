//
//  WebScrapService.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import Foundation
import SwiftSoup

final class WebScrapService {

	private let apiFactory: APIFactory
	private let storyFactory: StoryFactory
	private let storyRepository: StoryRepository
	private let isDemoMode: Bool

	init(apiFactory: APIFactory, storyFactory: StoryFactory, storyRepository: StoryRepository, isDemoMode: Bool = false) {
		self.apiFactory = apiFactory
		self.storyFactory = storyFactory
		self.storyRepository = storyRepository
		self.isDemoMode = isDemoMode
	}

	func getStoryData(storyNumber: String, completion: @escaping (Story?) -> ()) {
		guard !isDemoMode else {
			completion(Story.demoStories.first)
			return
		}

		let taskURL = apiFactory.makeStoryURL(storyNumber: storyNumber)
		let task = URLSession.shared.dataTask(with: taskURL) { (data, response, error) in
			guard let data = data, let parsedString = String(data: data, encoding: .utf8) else { return }
			let document = try? SwiftSoup.parseBodyFragment(parsedString)
			let story = self.storyFactory.makeStory(from: document)
			if let story = story {
				self.storyRepository.addStory(story)
			}
			completion(story)
		}
		task.resume()
	}

	#if DEBUG
	// MARK: - 🏴‍☠️
	private var timer: Timer?
	private var lastStoryNumber: UInt = 0

	func scrapAllStories() {
		timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrapStory), userInfo: nil, repeats: true)
	}

	@objc private func scrapStory() {
		getStoryData(storyNumber: lastStoryNumber.description) { _ in }
		lastStoryNumber += 1
		if lastStoryNumber > 2000 { timer?.invalidate() }
	}
	#endif
}
