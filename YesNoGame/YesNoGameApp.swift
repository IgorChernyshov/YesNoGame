//
//  YesNoGameApp.swift
//  YesNoGame
//
//  Created by Igor Chernyshov on 03.04.2021.
//

import SwiftUI
import Firebase

@main
struct YesNoGameApp: App {

	init() {
		FirebaseApp.configure()
	}

	var body: some Scene {
		WindowGroup {
			MainView()
		}
	}
}
