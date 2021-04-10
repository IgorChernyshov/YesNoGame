//
//  Story.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import Foundation
import FirebaseDatabase

/// A model for Yes-No Story.
struct Story {

	/// Story ID.
	let id: String?

	/// Did user complete the story.
	let isCompleted: Bool

	/// Data for preview.
	let preview: Preview

	/// Data for detailed view.
	let body: Body

	/// Story stats.
	let stats: Stats
}

// MARK: - Model composition
extension Story {

	/// Data for preview.
	struct Preview {
		let title: String
		let imageURL: String
	}

	/// Data for detailed view.
	struct Body {
		let question: String
		let answer: String
	}

	/// Story stats.
	struct Stats {
		let rating: UInt
		let difficulty: UInt
		let timeTaken: UInt
	}
}

// MARK: - Stats text representation
extension Story.Stats {

	var ratingText: String { "\(rating)%" }
	var difficultyText: String { "\(difficulty)/10" }
	var timeTakenText: String { "\(timeTaken) минут" }
}

#if DEBUG
// MARK: - Demo mode data
extension Story {
	static var demoStory: Story = {
		Story(id: "TestStoryID",
			  completed: false,
			  preview: Preview(title: "Человек со спичкой", imageURL: "sources/some.png"),
			  body: Body(question: "Голый человек был найден мертвым посреди поля. В его руке была сгоревшая спичка. Что произошло и как он сюда попал?",
						 answer: "Человек летел вместе со своим другом на воздушном шаре. Воздушный шар начал падать и чтобы сделать его легче, они выкинули все вещи, в том числе всю свою одежду. Этого было недостаточно и они решили, что один из них должен прыгнуть для спасения другого. Они договорились тянуть спичку: кому выпадет сгоревшая спичка, тому придется прыгать. Этому человеку попалась сгоревшая спичка и он прыгнул, как они и договаривались."),
			  stats: Stats(rating: 77, difficulty: 7, timeTaken: 18))
	}()
}
#endif
