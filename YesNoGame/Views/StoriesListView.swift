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
			ForEach(viewModel.previewCellViewModels) { viewModel in
				NavigationLink(destination: StoryDetailsScreen(viewModel: viewModel.detailsScreenViewModel)) {
					StoryPreviewCell(viewModel: viewModel)
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
