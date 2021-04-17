//
//  FirestoreStoryRepository.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 11.04.2021.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

/// A repository that works with Stories stored in Firestore.
final class FirestoreStoryRepository: BaseStoryRepository {

	// MARK: - Services
	private let database: Firestore

	// MARK: - Configuration
	private let storiesPath = "stories"

	// MARK: - Initializer
	/// Initializer.
	/// - Parameter database: Firestore database to read/write data.
	init(database: Firestore) {
		self.database = database
		super.init()
	}
}

// MARK: - StoryRepository
extension FirestoreStoryRepository: StoryRepository {

	func addStory(_ story: Story) {
		do {
			let _ = try database.collection(storiesPath).addDocument(from: story)
		} catch {
			fatalError("Unable to encode story: \(error.localizedDescription).")
		}
	}

	func getStories() {
		let storiesQuery = database.collection(storiesPath)
			.order(by: "id")
		storiesQuery.getDocuments { querySnapshot, error in
			if let querySnapshot = querySnapshot {
				self.stories = querySnapshot.documents.compactMap { document -> Story? in
					try? document.data(as: Story.self)
				}
			} else if let error = error {
				print("Unable to execute Get Stories query. Error: \(error.localizedDescription)")
			}
		}
	}

	func updateStory(_ story: Story) {
		if let storyID = story.id {
			do {
				try database.collection(storiesPath).document(storyID).setData(from: story)
			} catch {
				fatalError("Unable to encode story: \(error.localizedDescription).")
			}
		} else {
			fatalError("Missing story id")
		}
	}
}
