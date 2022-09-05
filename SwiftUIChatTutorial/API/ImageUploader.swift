//
//  ImageUploader.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 25.08.22.
//

import Firebase
import UIKit
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: There is error - \(error.localizedDescription)")
                return
            }
            
            print("DEBUG: Successfully uploaded image to firebase storage..")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
