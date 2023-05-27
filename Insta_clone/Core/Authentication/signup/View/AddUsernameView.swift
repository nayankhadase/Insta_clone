//
//  AddUsernameView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct AddUsernameView: View {
    
    @ObservedObject var signupViewModel: SignupViewModel
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader{ geo in
                VStack(alignment: .center, spacing: 20){
                    Text("Create your Username")
                        .font(.title2.bold())
                    
                    VStack{
                        Text("You'll use this email to sign in to your account.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        TextField("Username", text: $signupViewModel.username)
                            .frame(width: geo.size.width * 0.8)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    NavigationLink {
                       AddPasswordView(signupViewModel: signupViewModel)
                    } label: {
                        Text("Next")
                            .fontWeight(.semibold)
                            .frame(width: geo.size.width * 0.8)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .frame(minWidth: geo.size.width)
            }
        }
    }
}

struct AddUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        AddUsernameView(signupViewModel: SignupViewModel())
    }
}
