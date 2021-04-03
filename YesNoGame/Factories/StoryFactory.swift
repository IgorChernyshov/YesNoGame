//
//  StoryFactory.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import Foundation
import SwiftSoup

/// A factory that produces Yes-No Story model from a SwiftSoup Document that represents Yes-No Story web page.
final class StoryFactory {

	/// MARK: - Properties
	private let document: Document

	/// Init factory with a source document.
	/// - Parameter document: Parsed SwiftSoup Document to process.
	init(document: Document) {
		self.document = document
	}

	// MARK: - Model production.
	func makeStory() -> Story? {
		guard let preview = makePreview(), let body = makeBody(), let stats = makeStats() else { return nil }
		return .init(preview: preview, body: body, stats: stats)
	}

	// MARK: - Submodels production.
	private func makePreview() -> Story.Preview? {
		guard let title = try? document.select("h1").first()?.text().replacingOccurrences(of: "Данетка", with: ""),
			  let imageSource = try? document.select("div.quest__image").first(),
			  let imageURL = try? imageSource.select("img[src]").attr("src").description else { return nil }
		return .init(title: title, imageURL: imageURL)
	}

	private func makeBody() -> Story.Body? {
		guard let question = try? document.select("div.quest__story_question").first()?.text(),
			  let answer = try? document.select("div.quest__story_answer").first()?.text() else { return nil }
		return .init(question: question, answer: answer)
	}

	private func makeStats() -> Story.Stats? {
		guard let about = try? document.select("div.quest__about__value") else { return nil }
		var texts = about.compactMap { try? $0.text() }
		
		guard let rating = UInt(texts.removeFirst().components(separatedBy: "%").first ?? ""),
			  let timeTaken = UInt(texts.removeFirst().components(separatedBy: " ").first ?? ""),
			  let difficulty = UInt(texts.removeFirst().components(separatedBy: "/").first ?? "") else { return nil }
		return .init(rating: rating, difficulty: difficulty, timeTaken: timeTaken)
	}
}
