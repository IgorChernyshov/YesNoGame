//
//  StoriesListViewModel.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 11.04.2021.
//

import Combine

final class StoriesListViewModel: ObservableObject {

	@Published var previewCellViewModels = [StoryPreviewCellViewModel]()
	@Published var storiesRepository: StoryRepository

	private var cancellables = Set<AnyCancellable>()

	init(storiesRepository: StoryRepository) {
		self.storiesRepository = storiesRepository

		self.storiesRepository.$stories.map { stories in
			stories.map { story -> StoryPreviewCellViewModel in
				StoryPreviewCellViewModel(story: story)
			}
		}
		.assign(to: \.previewCellViewModels, on: self)
		.store(in: &cancellables)
	}
}
