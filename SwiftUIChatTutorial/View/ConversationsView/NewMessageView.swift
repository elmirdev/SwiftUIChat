//
//  NewMessageView.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 21.08.22.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .padding()
                .onTapGesture {
                    isEditing.toggle()
                }
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    Button {
                        self.user = user
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    } label: {
                        UserCell(user: user)
                    }

                }
            }
        }
    }
}

//struct NewMessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewMessageView(showChatView: .constant(true))
//    }
//}
