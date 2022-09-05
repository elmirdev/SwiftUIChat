//
//  Extensions.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 22.08.22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
