//
//  StatusCell.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 18.08.22.
//

import SwiftUI

struct StatusCell: View {
    let status: UserStatus
    var body: some View {
        HStack {
            Text(status.title)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)
        .foregroundColor(.black)
    }
}
