//
//  StoryRepository.swift
//  YesNoGame
//
//  Created by 17565501 on 10.04.2021.
//

import Foundation
import Combine

import FirebaseFirestore
import FirebaseFirestoreSwift

protocol StoryRepository {
	func addStory(_ story: Story)
	func updateStory(_ story: Story)
}

class BaseStoryRepository {
	@Published var stories = [Story]()
}

final class FirestoreStoryRepository: BaseStoryRepository {

	// MARK: - Services
	private let database: Firestore

	// MARK: - Configuration
	private let storiesPath = "stories"

	// MARK: - Initializer
	init(database: Firestore) {
		self.database = database
	}
}

// MARK: - StoryRepository
extension FirestoreStoryRepository: StoryRepository {

	func addStory(_ story: Story) {
		do {
			let _ = try database.collection(storiesPath).addDocument(from: story)
		} catch {
			fatalError("Unable to encode task: \(error.localizedDescription).")
		}
	}

	func updateStory(_ story: Story) {
		if let storyID = story.id {
			do {
				try database.collection(storiesPath).document(storyID).setData(from: story)
			} catch {
				fatalError("Unable to encode task: \(error.localizedDescription).")
			}
		} else {
			fatalError("Missing story id")
		}
	}
}
