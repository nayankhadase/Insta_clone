//
//  ReelsView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 28/05/23.
//

import SwiftUI
import AVKit


struct ReelsView: View {
    @Binding var tag: String
    @State private var currentReel = ""
    @State private var reels = mediaJson.map { media -> Reel in
        let url = Bundle.main.path(forResource: media.url, ofType: "mp4") ?? ""
        let player = AVPlayer(url: URL(fileURLWithPath: url))
        
        return Reel(player: player,mediaFile: media)
    }
    
    
    var body: some View {
        GeometryReader{ geo in
            ZStack(alignment: .top){
                
                ScrollView{
                    ReelsView2(geo: geo, reels: $reels, tag: $tag)
//                    ReelsView1(geo: geo)
                }
//                .edgesIgnoringSafeArea(.top)
                
                
                HStack{
                    Text("Reels")
                        .font(.headline)
                    
                    Spacer()
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.08)
                }
                .offset(y:geo.size.height * 0.04)
                .padding()
                .foregroundColor(.white)
                
            }
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ReelsView2: View{
    let geo: GeometryProxy
    @Binding var reels: [Reel]
    @Binding var tag: String
    @State private var isMute = true
    
    
    var body: some View{
        VStack{
            ForEach($reels) { $reel in
                ZStack{
                    Color.init(red: Double.random(in:  0.1...0.9), green: Double.random(in: 0.1...0.9), blue: Double.random(in:  0.1...0.9))
                        .opacity(Double.random(in:  0.7...1))
                    
                    ReelView(reel: $reel, isMute: $isMute, currentReel: $tag)
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                    VStack{
                        Spacer()
                        
                        HStack(alignment: .bottom){
                            HStack{
                                Image("user2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.15)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle()
                                            .stroke(Color.white)
                                    }
                                
                                Text("hollyday")
                                    .foregroundColor(.white)
                                
                                
                                
                                Button {
                                    //code
                                } label: {
                                    Text("Follow")
                                        .padding(7)
                                        .padding(.horizontal,7)
                                        .background(.clear)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(.white)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                                Spacer()
                                
                            }
                            VStack(spacing: 30){
                                Button {
                                    //
                                } label: {
                                    VStack{
                                        Image(systemName: "heart")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.05)
                                        Text(String(format: "%.2f", CGFloat.random(in: 14.1...55.7)) + "K")
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    VStack{
                                        Image(systemName: "message")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.05)
                                        Text("1342")
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    VStack{
                                        Image(systemName: "arrowshape.turn.up.forward")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.05)
                                        Text("142")
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geo.size.width * 0.05)
                                }
                            }
                            .frame(width: geo.size.width * 0.15)
                            
                        }
                        .padding(.horizontal, 6)
                    }
                    .padding(.bottom)
                    .foregroundColor(.white)
                }
            }
        }
    }
}
struct ReelView: View{
    @Binding var reel: Reel
    @Binding  var isMute: Bool
    @Binding var currentReel: String
    @State private var volumeAnimation = false
    
    
    var body: some View{
        VStack{
            if let player = reel.player{
                
                ZStack{
                    
                    ReelPlayerView(player: player)
                    GeometryReader{ geo -> Color in
                        let minY = geo.frame(in: .global).minY
                        let size = geo.size
                        player.isMuted = isMute
                        if -minY < (size.height / 2) && minY < (size.height / 2) && currentReel == "4"{
                            player.play()
                        }else{
                            player.pause()
                        }
                        
                        
                        return Color.clear
                    }
                    
                    ZStack{
                        Color.black
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
      
//                        Button {
//                            player.isMuted = isMute
//                            withAnimation {
//                                isMute.toggle()
//                                volumeAnimation.toggle()
//                            }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//                                withAnimation {
//                                    volumeAnimation.toggle()
//                                }
//                            }
//                        } label: {
                            Image(systemName: !isMute ? "speaker.wave.2.fill" : "speaker.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
//                        }

                    }
                    .foregroundColor(.white)
                    .opacity(volumeAnimation ? 0.5 : 0.01)
                    .onTapGesture {
                        player.isMuted = isMute
                        withAnimation {
                            isMute.toggle()
                            volumeAnimation.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            withAnimation {
                                volumeAnimation.toggle()
                            }
                        }
                        
                    }
                        
                    
                }
            }
            
        }
    }
}

struct ReelsView1: View{
    let geo: GeometryProxy
    var body: some View{
        VStack{
            ForEach(1..<10){ i in
                ZStack(alignment: .center){
                    Color.init(red: Double.random(in:  0.1...0.9), green: Double.random(in: 0.1...0.9), blue: Double.random(in:  0.1...0.9))
                        .opacity(Double.random(in:  0.7...1))
                    
                    
                    Image(i == 1 ? "img1" : "user\(i)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    
                    VStack{
                        Spacer()
                        
                        HStack(alignment: .bottom){
                            HStack{
                                Image("user\(i)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.15)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle()
                                            .stroke(Color.white)
                                    }
                                
                                Text("hollyday")
                                    .foregroundColor(.white)
                                
                                
                                
                                Button {
                                    //code
                                } label: {
                                    Text("Follow")
                                        .padding(7)
                                        .padding(.horizontal,7)
                                        .background(.clear)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(.white)
                                        }
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                                Spacer()
                                
                            }
                            VStack(spacing: 30){
                                Button {
                                    //
                                } label: {
                                    VStack{
                                        Image(systemName: "heart")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.05)
                                        Text(String(format: "%.2f", CGFloat.random(in: 14.1...55.7)) + "K")
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    VStack{
                                        Image(systemName: "message")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.05)
                                        Text("1342")
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    VStack{
                                        Image(systemName: "arrowshape.turn.up.forward")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: geo.size.width * 0.05)
                                        Text("142")
                                    }
                                }
                                Button {
                                    //
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geo.size.width * 0.05)
                                }
                            }
                            .frame(width: geo.size.width * 0.15)
                            
                        }
                        .padding(.horizontal, 6)
                    }
                    .padding(.bottom)
                    .foregroundColor(.white)
                }
                
                .frame(height: geo.size.height)
                
                
            }
        }
    }
}



struct ReelsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ReelsView(tag: .constant("4"))
    }
}
