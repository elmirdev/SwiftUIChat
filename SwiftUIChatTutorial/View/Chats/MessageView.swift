//
//  MessageView.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 23.08.22.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let viewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                Spacer()
                
                Text(viewModel.message.text)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
            } else {
                HStack(alignment: .bottom) {
                    KFImage(viewModel.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isCurrentUser: false))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(isCurrentUser: true, messageText: "Hi bro")
//    }
//}
