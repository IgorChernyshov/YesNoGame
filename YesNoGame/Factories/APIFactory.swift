//
//  APIFactory.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import Foundation

final class APIFactory {

	private let basePath = "https://yesnogame.net"
	private let storiesPath = "/stories/"

	func makeStoryURL(storyNumber: String) -> URL {
		URL(string: basePath + storiesPath + storyNumber)!
	}

	func makeImageURL(relativePath: String) -> URL? {
		URL(string: basePath + relativePath)
	}
}
