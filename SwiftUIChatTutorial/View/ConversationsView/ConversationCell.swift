//
//  ConversationCell.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 21.08.22.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    
    @ObservedObject var viewModel: ConversationCellViewModel
    
    var body: some View {
        if let user = viewModel.message.user {
            NavigationLink(destination: ChatView(user: user)) {
                VStack {
                    HStack {
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.fullname)
                                .font(.system(size: 14, weight: .semibold))
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 15))
                        }
                        .foregroundColor(.black)
                        
                        Spacer()
                    }
                    
                    Divider()
                }
                .padding([.top, .horizontal])
            }
        }
    }
}

//struct ConversationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ConversationCell()
//    }
//}
