//
//  SwiftUIChatTutorialApp.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 12.08.22.
//

import SwiftUI
import Firebase

@main
struct SwiftUIChatTutorialApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
