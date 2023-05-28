//
//  MainTabBarView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct MainTabBarView: View {
    @State var selectedTag = "1"
    
    var body: some View {
        TabView(selection: $selectedTag) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag("1")
                .transition(.slide)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag("2")
                .transition(.slide)
            
            Text("Tab Content 3")
                .tabItem {
                    Image(systemName: "plus.app")
                }
                .tag("3")
                .transition(.slide)
            
            ReelsView(tag: $selectedTag)
                .tabItem {
                    Image(systemName: "play.square")
                }
                .tag("4")
                .transition(.slide)
            
            SettingView()
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag("5")
                .transition(.slide)
        }
//        .animation(.easeInOut, value: selectedTag)
//        .transition(.slide)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
    }
}
