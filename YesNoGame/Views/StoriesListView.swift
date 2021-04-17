//
//  StoriesListView.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 11.04.2021.
//

import SwiftUI

struct StoriesListView: View {

	@ObservedObject var viewModel: StoriesListViewModel

	var body: some View {
		List {
			ForEach(viewModel.previewCellViewModels) { storyPreviewViewModel in
				NavigationLink(destination: Text("Story Details View")) {
					StoryPreviewCell(viewModel: storyPreviewViewModel)
				}.listRowInsets(EdgeInsets())
			}
		}
	}
}

struct StoriesListView_Previews: PreviewProvider {
	static var previews: some View {
		StoriesListView(viewModel: StoriesListViewModel(storiesRepository: PreviewStoryRepository()))
	}
}
