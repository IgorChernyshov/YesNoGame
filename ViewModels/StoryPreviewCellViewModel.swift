//
//  StoryPreviewCellViewModel.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 12.04.2021.
//

import Foundation

/// A view model for Story preview cells.
struct StoryPreviewCellViewModel: Identifiable {

	// MARK: - View Model
	var id: String = ""
	var title: String { story.preview.title }
	var question: String { story.body.question }
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
