//
//  StoryPreviewCell.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import SwiftUI

struct StoryPreviewCell: View {

	let viewModel: StoryPreviewCellViewModel

	var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			Text(viewModel.title)
				.font(.headline)
			Text(viewModel.question)
				.font(.footnote)
				.lineLimit(2)
			StoryStatsStack(storyStats: viewModel.storyStats)
		}.padding()
		.foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
		.background(StoryBackgroundView(storyDifficulty: viewModel.storyDifficulty))
	}
}

struct StoryPreviewCell_Previews: PreviewProvider {
	static var previews: some View {
		StoryPreviewCell(viewModel: StoryPreviewCellViewModel(story: Story.demoStory))
	}
}
