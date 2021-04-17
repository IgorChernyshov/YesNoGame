//
//  PreviewStoryRepository.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 13.04.2021.
//

import Foundation

final class PreviewStoryRepository: BaseStoryRepository {

	override init() {
		super.init()
		self.getStories(storiesPerRequest: 10)
	}
}

extension PreviewStoryRepository: StoryRepository {

	func addStory(_ story: Story) {}

	func getStories(storiesPerRequest: Int) {
		stories = [Story.demoStory]
	}

	func updateStory(_ story: Story) {}
}
