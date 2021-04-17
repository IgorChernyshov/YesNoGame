//
//  StoryDetailsScreen.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 04.04.2021.
//

import SwiftUI

struct StoryDetailsScreen: View {

	let viewModel: StoryDetailsScreenViewModel

	@State private var isShowingQuestion = true

	var body: some View {
		ZStack {
			StoryBackgroundView(viewModel: viewModel.backgroundViewModel)
			VStack(spacing: 16) {
				StoryStatsStack(storyStats: viewModel.storyStats)
				Spacer()
				VStack(alignment: .leading, spacing: 8) {
					Text(viewModel.title)
						.font(.title)
					ScrollView {
						VStack {
							Text(isShowingQuestion ? viewModel.question : viewModel.answer)
								.lineLimit(nil)
						}.frame(maxWidth: .infinity)
						.animation(.easeOut)
					}
				}
				Spacer()
				Button(action: {
					isShowingQuestion.toggle()
				}, label: {
					Text("Показать \(isShowingQuestion ? "ответ" : "вопрос")")
						.fontWeight(.bold)
						.padding(.all, 9)
						.overlay(
							RoundedRectangle(cornerRadius: 20)
								.stroke(Color.white, lineWidth: 2)
						)
				})
			}.padding()
			.foregroundColor(.white)
		}
	}
}

struct StoryDetailsScreen_Previews: PreviewProvider {
	static var previews: some View {
		StoryDetailsScreen(viewModel: StoryDetailsScreenViewModel(story: Story.demoStories.first!))
	}
}
