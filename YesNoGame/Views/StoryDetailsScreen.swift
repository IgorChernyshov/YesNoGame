//
//  StoryDetailsScreen.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 04.04.2021.
//

import SwiftUI

struct StoryDetailsScreen: View {

	let story: Story

	@State private var isShowingQuestion = true

	var body: some View {
		ZStack {
//			StoryBackgroundView(storyDifficulty: story.stats.difficulty)
			VStack(spacing: 16) {
				StoryStatsStack(storyStats: story.stats)
				Spacer()
				VStack(alignment: .leading, spacing: 8) {
					Text(story.preview.title)
						.font(.title)
					ScrollView {
						VStack {
							Text(isShowingQuestion ? story.body.question : story.body.answer)
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
		StoryDetailsScreen(story: Story.demoStory)
	}
}
