//
//  ChatsView.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 14.08.22.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            
            ScrollView {
                VStack {
                    ForEach(viewModel.messages) { message in
                        MessageView(viewModel: MessageViewModel(message))
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    
    func sendMessage() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView()
//    }
//}
