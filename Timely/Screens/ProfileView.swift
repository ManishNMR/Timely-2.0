//
//  ProfileView.swift
//  Timely
//
//  Created by user2 on 06/02/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isPetSheetPresented = false
    @State private var isHistorySheetPresented = false
    
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
       
        if let user = viewModel.currentUser {
            ZStack {
                Color(.black).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    
                    Text("Profile")
                        .font(.system(size: 28, weight: .heavy, design: .default))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    List{
                        Section{
                            HStack(alignment: .center) {
                                Text(user.initials)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .frame(width: 72, height: 72)
                                    .background(.grey2)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                                VStack(alignment:.leading){
                                    
                                    Text(user.username)
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                    Text(user.email)
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                }
                                .padding(.leading, 30)
                            }
                            .padding(2)
                        }
                        .listRowBackground(Color.grey1)
                        
                        Section("Avatar"){
                            
                            HStack{
                                Image("pet")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 35, height: 35) // Set the image size
                                    .padding(.leading)
                                
                                Button(action: {isPetSheetPresented.toggle()}, label: {
                                    Text("Pet")
                                })
                                .sheet(isPresented: $isPetSheetPresented) {
                                    
        //                            NavigationView {
        //                                 ChoosePetSheet()
        //                                .background(Color.grey1)
        //                                .foregroundColor(.white)
        //                                .navigationBarItems(
        //                                    trailing: Button(action: {
        //                                        isPetSheetPresented.toggle()
        //                                    }) {
        //                                        Image(systemName: "xmark.circle.fill")
        //                                    }
        //                                )
        //                                                    .navigationBarTitle("Mission")
        //                                .foregroundColor(.white)
        //                                .environment(\.colorScheme, .dark)
        //                            }
                                }
                                .padding(.leading)
                                .foregroundColor(.white)
                                
                            }
                            HStack{
                                Image("history")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 35, height: 35) // Set the image size
                                    .padding(.leading)
                                
                                Button(action: {isHistorySheetPresented.toggle()}, label: {
                                    Text("History")
                                })
                                .sheet(isPresented: $isHistorySheetPresented) {
        //                            NavigationView {
        //                                HistoryView()
        //                                .background(Color.grey1)
        //                                .foregroundColor(.white)
        //                                .navigationBarItems(
        //                                    trailing: Button(action: {
        //                                        isHistorySheetPresented.toggle()
        //                                    }) {
        //                                        Image(systemName: "xmark.circle.fill")
        //                                    }
        //                                )
        //                                                    .navigationBarTitle("Mission")
        //                                .foregroundColor(.white)
        //                                .environment(\.colorScheme, .dark)
        //                            }
                                }
                                .padding(.leading)
                                .foregroundColor(.white)
                            }
                        }
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .padding(.bottom, 10)
                        .listRowBackground(Color.grey1)
                        
                        Section("Account"){
                            
                            HStack{
                                Image("edit")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.leading)
                                
                                Button(action: {}, label: {
                                    Text("Edit Profile")
                                })
                                .padding(.leading)
                                .foregroundColor(.white)
                            }
                            
                                Button{
                                    viewModel.signOut()
                                } label: {
                                    HStack{
                                        Image("logout")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 30, height: 30) // Set the image size
                                            .padding(.leading)
                                        Text("Log Out")
                                            .padding(.leading)
                                            .foregroundColor(.white)
                                    }
                                }
                                
                            
                            HStack{
                                Image("terms")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 35, height: 35) // Set the image size
                                    .padding(.leading)
                                
                                Button(action: {}, label: {
                                    Text("Terms and Policies")
                                })
                                .padding(.leading)
                                .foregroundColor(.white)
                            }
                            
                        }
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .padding(.bottom, 10)
                        .listRowBackground(Color.grey1)
                        
                    }
                    .scrollContentBackground(.hidden)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
        }
        
        
    }
}

#Preview {
    ProfileView()
}

