//
//  StoryStatsStack.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 04.04.2021.
//

import SwiftUI

struct StoryStatsStack: View {

	let story: Story

    var body: some View {
		HStack {
			Image(systemName: "hand.thumbsup")
			Text(story.stats.ratingText)
			Spacer()
			Image(systemName: "puzzlepiece")
			Text(story.stats.difficultyText)
			Spacer()
			Image(systemName: "stopwatch")
			Text(story.stats.timeTakenText)
		}
    }
}

struct StoryStatsStack_Previews: PreviewProvider {
    static var previews: some View {
		StoryStatsStack(story: Story.demoStory)
    }
}
