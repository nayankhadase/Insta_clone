//
//  AddFieldView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct AddEmailView: View {
    
    @ObservedObject var signupViewModel: SignupViewModel
    
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader{ geo in
                VStack(alignment: .center, spacing: 20){
                    Text("Add your email")
                        .font(.title2.bold())
                    
                    VStack{
                        Text("You'll use this email to sign in to your account.")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        TextField("Email", text: $signupViewModel.email)
                            .frame(width: geo.size.width * 0.8)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    NavigationLink {
                        AddUsernameView(signupViewModel: signupViewModel)
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

struct AddEmailView_Previews: PreviewProvider {
    
    static var previews: some View {
        AddEmailView(signupViewModel: SignupViewModel())
    }
}
