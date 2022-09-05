//
//  ChatBubble.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 22.08.22.
//

import SwiftUI

struct ChatBubble: Shape {
    var isCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight, isCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isCurrentUser: true)
    }
}
