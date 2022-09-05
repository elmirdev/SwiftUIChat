//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 23.08.22.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
