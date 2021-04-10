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
	private let isDemoMode: Bool

	init(apiFactory: APIFactory, storyFactory: StoryFactory, isDemoMode: Bool = false) {
		self.apiFactory = apiFactory
		self.storyFactory = storyFactory
		self.isDemoMode = isDemoMode
	}
	
	func getStoryData(storyNumber: String, completion: @escaping (Story?) -> ()) {
		guard !isDemoMode else {
			completion(Story.demoStory)
			return
		}

		let taskURL = apiFactory.makeStoryURL(storyNumber: storyNumber)
		let task = URLSession.shared.dataTask(with: taskURL) { (data, response, error) in
			guard let data = data, let parsedString = String(data: data, encoding: .utf8) else { return }
			let document = try? SwiftSoup.parseBodyFragment(parsedString)
			let story = self.storyFactory.makeStory(from: document)
			completion(story)
		}
		task.resume()
	}
}
