//
//  ContentView.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {

	@State private var story: Story?
	@State private var storyNumber: String = "1"

	let service = WebScrapService(apiFactory: APIFactory(),
								  storyFactory: StoryFactory(),
								  storyRepository: FirestoreStoryRepository(database: Firestore.firestore()),
								  isDemoMode: false)

	init() {
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().isTranslucent = true
		UINavigationBar.appearance().tintColor = .white
		UINavigationBar.appearance().backgroundColor = .clear
	}

	var body: some View {
		NavigationView {
			VStack {
				if let story = story {
					NavigationLink(destination: StoryDetailsScreen(story: story)) {
							StoryPreviewCell(story: story)
						}
				}
				HStack(alignment: .center, spacing: 16) {
					Button("Get story") {
						service.getStoryData(storyNumber: storyNumber) { story in
							self.story = story
						}
					}
					TextField("Story number", text: $storyNumber)
				}.padding()
				Button("🏴‍☠️ Scrap all stories 🏴‍☠️") {
					service.scrapAllStories()
				}
			}.navigationBarTitle("Выберите историю", displayMode: .inline)
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
