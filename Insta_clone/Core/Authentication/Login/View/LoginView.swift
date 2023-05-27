//
//  LoginView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                ZStack(alignment: .bottom){
                    VStack(alignment: .center, spacing: 20){
                        
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.6)
                        
                        // textfields
                        VStack{
                            TextField("Enter your email", text: $email)
                                .frame(width: geo.size.width * 0.8)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            TextField("Enter your password", text: $password)
                                .frame(width: geo.size.width * 0.8)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        HStack(alignment: .center){
                            Spacer()
                            Button {
                                //forget pass code
                            } label: {
                                Text("Forget password ?")
                                    .foregroundColor(.init("Primary"))
                                    .fontWeight(.semibold)
                            }

                        }
                        .padding(.trailing)
                        
                        // Login Button
                        NavigationLink {
                            MainTabBarView()
                        } label: {
                            Text("Login")
                                .fontWeight(.semibold)
                                .frame(width: geo.size.width * 0.8)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                            
                                
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                        
                        // OR
                        
                        HStack{
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1.5)
                                .foregroundColor(.gray.opacity(0.4))
                            
                            Text("OR")
                                .fontWeight(.semibold)
                                .foregroundColor(.gray.opacity(0.7))
                            
                            RoundedRectangle(cornerRadius: 1)
                                .frame(height: 1.5)
                                .foregroundColor(.gray.opacity(0.4))
                        }
                        .padding()
                        
                        // facebook login
                        Button {
                            //code
                        } label: {
                            Label {
                                Text("Continue with facebook")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("Primary"))
                            } icon: {
                                Image("facebook")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                            }
                        }


                        //
    //                    Spacer()
                        
                        
                        
                        
                        // end
                    }
                    .frame(height: geo.size.height)
                    
                    HStack{
                        Text("Don't have accpunt?")
                            .foregroundColor(Color("Primary"))
                        NavigationLink {
                            SignupView()
                        } label: {
                            Text("Sign up")
                                .fontWeight(.semibold)
                                .foregroundColor(Color("Primary"))
                        }
                       
                    }
                    .frame(width: geo.size.width)
                    .padding(.vertical)
                    .background()
                    .shadow(color: .black.opacity(0.1),radius: 2, x:-2, y:-2)
                    
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
