//
//  SearchView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 27/05/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchTap = false
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                ScrollView{
                    VStack{
                        TopSearchBar(searchTap: $searchTap, geo:geo)
                        
                        if searchTap{
                            SearchSuggestions(geo:geo)
                        }else{
                            SuggestedItems(geo:geo)
                        }
                        
                    }
                }
            }
        }
    }
}

struct TopSearchBar: View{
    @Binding var searchTap: Bool
    let geo: GeometryProxy
    
    @State private var searchText = ""
    
    var body: some View{
        HStack{
            if searchTap{
                Button {
                    withAnimation{
                        searchTap = false
                    }
                } label: {
                    Image(systemName: "arrow.left")
                }
                .foregroundColor(.secondary)
            }

            
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading,10)
                TextField("Search..", text: $searchText)
                    .padding(5)
                    .onTapGesture {
                        withAnimation{
                            searchTap = true
                        }
                    }
            }
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        
        .padding(.horizontal)
        .padding(.vertical, 3)
    }
}

struct SuggestedItems: View{
    let geo: GeometryProxy
    let column: [GridItem] = [GridItem(), GridItem(),GridItem()]
    
    var body: some View{
            LazyVGrid(columns: column) {
                ForEach(1..<30, id: \.self) { i in
                    Image("user\(i % 10 + 1)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width * 0.33, height: geo.size.width * 0.32)
                        .clipShape(RoundedRectangle(cornerRadius: 1))
                }
            }
    }
}

struct SearchSuggestions: View{
    let geo: GeometryProxy
    
    let arr = ["mahi reel", "sport", "nature", "adventure", "thrill"]
    
    var body: some View{
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(arr, id: \.self) { item in
                        HStack{
                            Image(systemName: "arrow.up.right")
                                .imageScale(.small)
                            Text(item)
                            
                        }
                        .foregroundColor(.secondary)
                        .padding(4)
                        .background()
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.secondary)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
            
            HStack{
                Text("Recent search")
                    .font(.caption)
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(2..<10) { i in
                        HStack{
                            Image("user\(i)")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.size.width * 0.2)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                Text("search_name")
                                    .font(.callout)
                                Text("description")
                                    .font(.caption)
                            }
                            
                            Spacer()
                            
                            Button {
                                //code
                            } label: {
                                Image(systemName: "multiply")
                                    .imageScale(.small)
                                    .foregroundColor(.secondary)
                            }

                        }
                        .padding(.trailing)
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
