//
//  MainViewModel.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import UIKit
import SwiftUI

class MainViewModel: ObservableObject{
    var rootViewController: UIViewController?{
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
}


struct MyNavigation<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack(root: content)
        } else {
            NavigationView(content: content)
        }
    }
}

//struct MyNavigationLink<Content>: View where Content: View {
//    @ViewBuilder var content: () -> Content
//    let value: (any Decodable & Encodable & Hashable)
//
//    var body: some View {
//        if #available(iOS 16, *) {
//            NavigationLink(value: value, label: content)
//        } else {
//            NavigationLink(destination: <#T##() -> View#>, label: <#T##() -> View#>)
//        }
//    }
//}
