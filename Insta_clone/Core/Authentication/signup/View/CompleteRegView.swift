//
//  CompleteRegView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct CompleteRegView: View {
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                VStack(spacing: 20){
                    Spacer()
                    VStack(spacing: 10){
                        Text("Welcome to")
                            .font(.title.bold())
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.6)
                    }
                    
                    Text("click below button to complete your registration and start using instagram.")
                        .font(.subheadline.bold())
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                    
                    Button {
    //                   AddPasswordView(signupViewModel: signupViewModel)
                    } label: {
                        Text("Continue")
                            .fontWeight(.semibold)
                            .frame(width: geo.size.width * 0.8)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                }
                .padding()
                .frame(width: geo.size.width)
            }
        }
    }
}

struct CompleteRegView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRegView()
    }
}
