//
//  StatusSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 18.08.22.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                    
                    StatusCell(status: viewModel.status)
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach((UserStatus.allCases.filter({ $0 != .notConfigured })), id: \.self) { status in
                        Button {
                            self.viewModel.updateStatus(status)
                        } label: {
                            StatusCell(status: status)
                        }

                    }
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}
