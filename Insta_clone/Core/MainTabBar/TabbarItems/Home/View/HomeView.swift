//
//  HomeView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            GeometryReader{ geo in
                VStack(spacing: 0){
                    TopNavBarView(geo:geo)
                    
                    FeedView(geo:geo)
                    
                    
                }
                .frame(maxWidth: geo.size.width)
            }
        }
    }
}

struct TopNavBarView: View{
    let geo: GeometryProxy
    
    var body: some View{
        ZStack{
            HStack(alignment: .center, spacing: 10){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.3)
                
                Spacer()
                
                NavigationLink {
                    //
                } label: {
                    Image(systemName:"heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.06)
                        .foregroundColor(.primary)
                }

                NavigationLink {
                    //code
                } label: {
                    Image("msg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.07)
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
            .background(.white)
//            .shadow(color: .black.opacity(0.2),radius: 1, x:1,y:1)
        }
    }
}

struct FeedView: View{
    let geo:GeometryProxy
    
    var body: some View{
        ZStack{
            ScrollView(.vertical){
                StatusView(geo: geo)
                
                LazyVStack{
                    ForEach(0...10, id: \.self){ _ in
                        FeedCardView(geo: geo)
                    }
                }
            }
            
        }
    }
}

struct StatusView: View{
    let geo: GeometryProxy
    let nameArray = ["ad_raj", "loki_god", "spider", "thor","shaktiman"]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 5){
                VStack{
                    Image("user1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width*0.2)
                        .clipShape(Circle())
                        .overlay(alignment:.bottomTrailing) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .padding(5)
                                .background(.white)
                                .clipShape(Circle())
                        }
                        .overlay(alignment:.bottomTrailing) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .imageScale(.small)
                                .padding(4)
                                .background(.blue)
                                .clipShape(Circle())
                        }
                        
                        Text("name")
                        .foregroundColor(.secondary)
                        .font(.caption)
                }
                
                ForEach(2..<10) { i in
                    VStack{
                        Image("user\(i)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width*0.2)
                            .clipShape(Circle())
                            .padding(4)
                            .overlay {
                                Circle()
                                    .stroke(LinearGradient(colors: [.red,.orange,.red,.pink], startPoint: .leading, endPoint: .trailing), lineWidth: 2)
                            }
                        Text(nameArray[i % nameArray.count])
                            .foregroundColor(.secondary)
                            .font(.callout)
                    }
                }
            }
            .padding(.leading)
            .padding(.top, 2)
        }
        .padding(.vertical, 8)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct FeedCardView: View {
    let geo: GeometryProxy
    
    var body: some View {
        VStack{
            HStack{
                Image("user1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.1)
                    .clipShape(Circle())
                    .padding(4)
                    .overlay {
                        Circle()
                            .stroke(LinearGradient(colors: [.red,.orange,.red,.pink], startPoint: .leading, endPoint: .trailing), lineWidth: 1)
                    }
                
                Text("user_name")
                    .font(.callout.bold())
                
                
                Spacer()
                
                Button {
                    //code
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.primary)
                }
                
            }
            .padding(.horizontal, 5)
            
            Image("img1")
                .resizable()
                .scaledToFit()
            //                    .frame(width: geo.size.width)
            
            HStack(spacing: 15){
                Button {
                    //code
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.primary)
                }
                
                Button {
                    //code
                } label: {
                    Image(systemName: "message")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.primary)
                }
                
                Button {
                    //code
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                Button {
                    //code
                } label: {
                    Image(systemName: "tag")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal, 5)
        }
        .padding(.bottom)
    }
}
