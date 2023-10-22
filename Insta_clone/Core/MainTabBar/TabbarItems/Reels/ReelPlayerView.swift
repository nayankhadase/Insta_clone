//
//  ReelPlayerView.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 28/05/23.
//

import SwiftUI
import AVKit


struct ReelPlayerView: UIViewControllerRepresentable{
    
    var player: AVPlayer?
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
//        controller.player?.play()
        
        // to loop reel
        player?.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(context.coordinator,
                                               selector: #selector(context.coordinator.restartReel(notification:)),
                                                       name: .AVPlayerItemDidPlayToEndTime,
                                                       object: player?.currentItem)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        //code
    }
}

class Coordinator: NSObject{
    var parent: ReelPlayerView
    init(parent: ReelPlayerView) {
        self.parent = parent
    }
    @objc func restartReel(notification: Notification){
        parent.player?.seek(to: .zero)
    }
    
}



