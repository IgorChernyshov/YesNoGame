//
//  StoryRepository.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 10.04.2021.
//

import Foundation
import Combine

/// Base Story repository.
class BaseStoryRepository: ObservableObject {
	@Published var stories: [Story] = []
}

/// Protocol of an entity that is able to work with Story repository.
protocol StoryRepository: BaseStoryRepository {

	/// Add a story to repository.
	/// - Parameter story: A story to add.
	func addStory(_ story: Story)

	/// Read bunch of stories from repository filtered by IDs.
	func getStories()

	/// Update a story in repository.
	/// - Parameter story: A story to update.
	func updateStory(_ story: Story)
}
