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
	}

	var body: some View {
		NavigationView {
			StoriesListView(viewModel: storiesListViewModel)
				.navigationBarTitle("Данетки", displayMode: .inline)
		}.accentColor(.primary)
	}
}

struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(storiesListViewModel: StoriesListViewModel(storiesRepository: PreviewStoryRepository()))
	}
}
