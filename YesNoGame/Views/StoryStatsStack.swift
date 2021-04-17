//
//  StoryStatsStack.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 04.04.2021.
//

import SwiftUI

struct StoryStatsStack: View {

	let storyStats: Story.Stats

    var body: some View {
		HStack {
			Image(systemName: "hand.thumbsup")
			Text(storyStats.ratingText)
			Spacer()
			Image(systemName: "puzzlepiece")
			Text(storyStats.difficultyText)
			Spacer()
			Image(systemName: "stopwatch")
			Text(storyStats.timeTakenText)
		}
    }
}

struct StoryStatsStack_Previews: PreviewProvider {
    static var previews: some View {
		StoryStatsStack(storyStats: Story.demoStory.stats)
    }
}
