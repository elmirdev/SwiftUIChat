//
//  EditProfileView.swift
//  SwiftUIChatTutorial
//
//  Created by ELMIR ISMAYILZADA on 17.08.22.
//

import SwiftUI

struct EditProfileView: View {
    @State private var fullname = "Peter Parker"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 44) {
                //header
                VStack {
                    HStack {
                        VStack {
                            if let profileImage = profileImage {
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } else {
                                Image("venom-7")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            }
                            
                            Button {
                                showImagePicker.toggle()
                            } label: {
                                Text("Edit")
                            }
                            .fullScreenCover(isPresented: $showImagePicker, onDismiss: loadImage) {
                                ImagePicker(image: $selectedImage)
                            }                        }
                        .padding(.top)
                        
                        Text("Enter your name or your profile photo")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.bottom, .horizontal])
                    }
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("", text: $fullname)
                        .padding(8)
                }
                .background(Rectangle().fill(.white))
                //status
                
                VStack(alignment: .leading) {
                    Text("Status")
                        .foregroundColor(.gray)
                        .padding()
                    
                    NavigationLink {
                        StatusSelectorView()
                    } label: {
                        HStack {
                            Text("Busy")
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                    }

                }
                
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
