//
//  StoryBackgroundView.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 04.04.2021.
//

import SwiftUI

struct StoryBackgroundView: View {

	let viewModel: StoryBackgroundViewModel

    var body: some View {
		LinearGradient(gradient: Gradient(colors: viewModel.colors), startPoint: .topLeading, endPoint: .bottomTrailing)
			.edgesIgnoringSafeArea(.all)
    }
}

struct StoryBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
		StoryBackgroundView(viewModel: StoryBackgroundViewModel(storyDifficulty: 0))
		StoryBackgroundView(viewModel: StoryBackgroundViewModel(storyDifficulty: 2))
		StoryBackgroundView(viewModel: StoryBackgroundViewModel(storyDifficulty: 5))
		StoryBackgroundView(viewModel: StoryBackgroundViewModel(storyDifficulty: 8))
    }
}
