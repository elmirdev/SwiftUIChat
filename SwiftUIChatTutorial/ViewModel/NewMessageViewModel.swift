//
//  NewMessageViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 25.08.22.
//

import SwiftUI

class NewMessageViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) }).filter({ $0.id != AuthViewModel.shared.userSession?.uid })
                        
            //Alternative1...
            
//            self.users = documents.compactMap { document in
//                try? document.data(as: User.self)
//            }
            
            //Alternative2...
            
//            documents.forEach { document in
//                guard let user = try? document.data(as: User.self) else { return }
//                self.users.append(user)
//            }
        }
    }
}
