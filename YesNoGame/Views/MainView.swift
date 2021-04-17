//
//  ContentView.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import SwiftUI
import FirebaseFirestore

struct MainView: View {

	@ObservedObject private var storiesListViewModel: StoriesListViewModel

	init(storiesListViewModel: StoriesListViewModel) {
		self.storiesListViewModel = storiesListViewModel
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().isTranslucent = true
		UINavigationBar.appearance().tintColor = .white
		UINavigationBar.appearance().backgroundColor = .clear
	}

	var body: some View {
		NavigationView {
			StoriesListView(viewModel: storiesListViewModel)
				.navigationBarTitle("Выберите историю", displayMode: .inline)
		}
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(storiesListViewModel: StoriesListViewModel(storiesRepository: PreviewStoryRepository()))
	}
}
