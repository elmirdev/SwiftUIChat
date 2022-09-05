//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 23.08.22.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    
    static let shared = AuthViewModel()
    
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private var tempCurrentUser: FirebaseAuth.User?
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login..\(error.localizedDescription)")
                return
            }
            
//            guard let user = result?.user else { return }
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func register(email: String, username: String, fullname: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error - \(error.localizedDescription)")
                return
            } else {
                guard let user = result?.user else { return }
                self.tempCurrentUser = user
                
                let data: [String: Any] = ["email": email,
                                           "username": username,
                                           "fullname": fullname]
                
                COLLECTION_USERS.document(user.uid).setData(data) { error in
                    if let error = error {
                        print("DEBUG: Failed to register with error - \(error.localizedDescription)")
                        return
                    } else {
                        self.didAuthenticateUser = true
                    }
                }
            }
        }
    }
    
    func uploadProfileImage(image: UIImage) {
        guard let user = tempCurrentUser else { return }
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(user.uid).updateData(["profileImageUrl": imageUrl]) { _ in
                self.userSession = user
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        self.currentUser = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
