//
//  StoryPreviewCell.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import SwiftUI

struct StoryPreviewCell: View {

	let story: Story

	var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			Text(story.preview.title)
				.font(.headline)
			Text(story.body.question)
				.font(.footnote)
				.lineLimit(2)
			StoryStatsStack(story: story)
		}.padding()
		.foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
		.background(StoryBackgroundView(storyDifficulty: story.stats.difficulty))
	}
}

struct StoryPreviewCell_Previews: PreviewProvider {
	static var previews: some View {
		StoryPreviewCell(story: Story.demoStory)
	}
}
