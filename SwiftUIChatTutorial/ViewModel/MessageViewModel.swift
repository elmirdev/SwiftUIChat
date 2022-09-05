//
//  MessageViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 27.08.22.
//

import Foundation

class MessageViewModel: ObservableObject {
    let message: Message
    
    init(_ message: Message) {
        self.message = message
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        return URL(string: profileImageUrl)
    }
}
