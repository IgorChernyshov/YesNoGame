//
//  StoryDetailsScreenViewModel.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 17.04.2021.
//

import Foundation

struct StoryDetailsScreenViewModel {

	// MARK: - View Model
	var title: String { story.preview.title }
	var question: String { story.body.question }
	var answer: String { story.body.answer }
	var storyStats: Story.Stats { story.stats }
	var backgroundViewModel: StoryBackgroundViewModel { .init(storyDifficulty: story.stats.difficulty) }

	// MARK: - Model
	private var story: Story

	/// Initializer.
	/// - Parameter story: Story model.
	init(story: Story) {
		self.story = story
	}
}
