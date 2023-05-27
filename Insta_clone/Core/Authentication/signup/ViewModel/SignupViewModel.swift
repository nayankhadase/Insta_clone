//
//  SignupViewModel.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import Foundation

class SignupViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
}
