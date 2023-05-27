//
//  ContentView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        MyNavigation {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
