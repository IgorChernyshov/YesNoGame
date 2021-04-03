//
//  StoryBackgroundView.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 04.04.2021.
//

import SwiftUI

struct StoryBackgroundView: View {

	let storyDifficulty: UInt

    var body: some View {
		gradient(forDifficulty: storyDifficulty)
			.edgesIgnoringSafeArea(.all)
    }

	private func gradient(forDifficulty difficulty: UInt) -> LinearGradient {
		var colors: [Color]
		switch difficulty {
		case 1...3:
			colors = [Color("storyBackgroundEasy1"), Color("storyBackgroundEasy2")]
		case 4...6:
			colors = [Color("storyBackgroundNormal1"), Color("storyBackgroundNormal2")]
		case 7...10:
			colors = [Color("storyBackgroundHard1"), Color("storyBackgroundHard2")]
		default:
			colors = [Color("storyBackgroundEasy1"), Color("storyBackgroundNormal1"), Color("storyBackgroundHard1")]
		}
		return LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
	}
}

struct StoryBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
		StoryBackgroundView(storyDifficulty: 0)
		StoryBackgroundView(storyDifficulty: 1)
		StoryBackgroundView(storyDifficulty: 5)
		StoryBackgroundView(storyDifficulty: 9)
    }
}
