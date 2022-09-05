//
//  TestView.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 25.08.22.
//

import SwiftUI

struct TestView: View {
    @State var text = "label"
    var body: some View {
        VStack {
            Text(text)
            
            TextField("Text", text: $text)
                .frame(width: 300, height: 50)
                //.background(Color.blue)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
