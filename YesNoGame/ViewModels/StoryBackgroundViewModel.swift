//
//  StoryBackgroundViewModel.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 17.04.2021.
//

import SwiftUI

struct StoryBackgroundViewModel {

	let colors: [Color]

	init(storyDifficulty: UInt) {
		switch storyDifficulty {
		case 1...3:
			colors = [Color("storyBackgroundEasy1"), Color("storyBackgroundEasy2")]
		case 4...6:
			colors = [Color("storyBackgroundNormal1"), Color("storyBackgroundNormal2")]
		case 7...10:
			colors = [Color("storyBackgroundHard1"), Color("storyBackgroundHard2")]
		default:
			colors = [Color("storyBackgroundEasy1"), Color("storyBackgroundNormal1"), Color("storyBackgroundHard1")]
		}
	}
}
