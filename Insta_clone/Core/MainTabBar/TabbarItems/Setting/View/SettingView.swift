//
//  SettingView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 14/05/23.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        ZStack{
            GeometryReader { geo in
                ScrollView(.vertical){
                    VStack{
                        TopSettingBar(geo: geo)
                        
                        UserInfoView(geo:geo)
                        
                        HighlightView(geo:geo)
                        
                        MyUploadItemsView(geo:geo)
                    }
                }
            }
        }
    }
}

struct TopSettingBar: View{
    let geo: GeometryProxy
    
    var body: some View{
        ZStack{
            HStack(spacing: 15){
                Image(systemName: "lock")
                
                Text("User_name")
                    .font(.body.bold())
                
                Spacer()
                
                Button {
                    //code
                } label: {
                    Image(systemName: "plus.square")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.primary)
                        .frame(width: geo.size.width * 0.06)
                        .font(.body.bold())
                }
                
                Button {
                    //code
                } label: {
                    Image(systemName: "list.dash")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.primary)
                        .frame(width: geo.size.width * 0.06)
                        .font(.body.bold())
                        
                }
                
            }
            .background()
            .padding(.horizontal)
        }
    }
}

struct UserInfoView: View{
    let geo: GeometryProxy
    
    var body: some View{
        ZStack{
            VStack{
                HStack{
                    VStack{
                        Image("user1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width*0.2)
                            .clipShape(Circle())
                        
                        Text("User_name")
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20){
                        VStack(spacing: 5){
                            Text("11")
                                .font(.callout.bold())
                            Text("Posts")
                        }
                        VStack(spacing: 5){
                            Text("200")
                                .font(.callout.bold())
                            Text("Followers")
                        }
                        VStack(spacing: 5){
                            Text("500")
                                .font(.callout.bold())
                            Text("Following")
                        }
                    }
                    
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("Music 🎤")
                        Text("Sport 🏄🏻‍♂️")
                        Text("Study 📚")
                    }
                    .foregroundColor(.secondary)
                    Spacer()
                }
                HStack{
                    Button {
                        //code
                    } label: {
                        Text("Edit profile")
                            .padding(.horizontal)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        //code
                    } label: {
                        Text("Share profile")
                            .padding(.horizontal)
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                        
                    }
                    .buttonStyle(.bordered)
                    
                    Button {
                        //code
                    } label: {
                        Image(systemName: "person.fill.badge.plus")
                            .foregroundColor(.primary)
                    }
                    .buttonStyle(.bordered)
                    

                }
            }
            .padding(.horizontal, 5)
        }
    }
}

struct HighlightView: View{
    let geo: GeometryProxy
    let nameArray = ["Happy", "Awesome", "🥰", "Chill","👨‍👩‍👧"]
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                ForEach(1..<20) { i in
                    VStack{
                        Image("user\(i % 10 + 1)")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width*0.2)
                            .clipShape(Circle())
                            .padding(4)
                            .overlay {
                                Circle()
                                    .stroke(.gray)
                            }
                        
                        Text(nameArray[i % nameArray.count])
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding(.leading)
        }
        .padding(.vertical)
    }
}

struct MyUploadItemsView: View{
    let geo: GeometryProxy
    let arrayItems = ["square.grid.3x3", "video.square", "person.crop.rectangle"]
    @State private var selectedSegment = "square.grid.3x3"
    @Namespace var namespace2
    
    let column: [GridItem] = [GridItem(),GridItem(),GridItem()]
    
    var body: some View{
        VStack{
            
            HStack{
                ForEach(arrayItems, id: \.self){ item in
                    
                    
                    Image(systemName: item)
                        .foregroundColor(selectedSegment == item ? .primary : .primary.opacity(0.3) )
                        .frame(maxWidth: .infinity)
                        .frame(height: geo.size.width * 0.1)
                        .onTapGesture {
                            withAnimation(.spring()){
                                selectedSegment = item
                            }
                        }
                        .overlay(alignment:.bottom) {
                            if selectedSegment == item{
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.primary.opacity(0.6))
                                    .matchedGeometryEffect(id: "item", in: namespace2)
                            }
                            
                        }
                }
            }
            
            LazyVGrid(columns: column) {
                ForEach(1..<20) { i in
                    Image("user\(i % 10 + 1)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width * 0.32, height: geo.size.width * 0.32)
                        .clipShape(RoundedRectangle(cornerRadius: 1))
                }
            }
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

/*
 

 */
