//
//  PreviewStoryRepository.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 13.04.2021.
//

import Foundation

final class PreviewStoryRepository: BaseStoryRepository {}

extension PreviewStoryRepository: StoryRepository {

	func addStory(_ story: Story) {}

	func getStories() {
		stories = Story.demoStories
	}

	func updateStory(_ story: Story) {}
}
