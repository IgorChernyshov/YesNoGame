//
//  YesNoGameApp.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import SwiftUI
import Firebase

@main
struct YesNoGameApp: App {

	// MARK: - Dependencies
	private let database: Firestore
	private let storyRepository: StoryRepository

	init() {
		FirebaseApp.configure()
		database = Firestore.firestore()
//		storyRepository = FirestoreStoryRepository(database: database)
		storyRepository = PreviewStoryRepository()
	}

	var body: some Scene {
		WindowGroup {
			MainView(storiesListViewModel: StoriesListViewModel(storiesRepository: storyRepository))
		}
	}
}
