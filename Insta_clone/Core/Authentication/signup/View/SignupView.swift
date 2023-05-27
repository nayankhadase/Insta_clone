//
//  SignupView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct SignupView: View {
//    @State private var email: String = ""
//    @State private var username: String = ""
//    @State private var passward: String = ""
//    @State private var menuTag: Int = 0
    
    @StateObject var signupViewModel = SignupViewModel()
    
    var body: some View {
        ZStack{
            AddEmailView(signupViewModel: signupViewModel)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
