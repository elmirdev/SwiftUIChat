//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 25.08.22.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let MOCK_USER = User(id: "123123123123",
                     username: "Test",
                     fullname: "TEst test",
                     email: "Test@gmail.com",
                     profileImageUrl: "www.google.com")
