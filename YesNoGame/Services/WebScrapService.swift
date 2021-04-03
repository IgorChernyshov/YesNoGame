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
	private let isDemoMode: Bool

	init(apiFactory: APIFactory, isDemoMode: Bool = false) {
		self.apiFactory = apiFactory
		self.isDemoMode = isDemoMode
	}
	
	func getStoryData(storyNumber: String, completion: @escaping (Story?) -> ()) {
		guard !isDemoMode else {
			completion(Story.demoStory)
			return
		}

		let taskURL = apiFactory.makeStoryURL(storyNumber: storyNumber)
		let task = URLSession.shared.dataTask(with: taskURL) { (data, response, error) in
			guard let data = data,
				  let parsedString = String(data: data, encoding: .utf8) else { return }
			do {
				let document: Document = try SwiftSoup.parseBodyFragment(parsedString)
				let storyFactory = StoryFactory(document: document)
				let story = storyFactory.makeStory()
				completion(story)
			} catch {
				print("Web page parse error")
			}
		}
		task.resume()
	}
}
