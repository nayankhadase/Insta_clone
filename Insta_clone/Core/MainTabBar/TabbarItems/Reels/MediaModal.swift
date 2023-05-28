//
//  MediaModal.swift
//  Insta_clone
//
//  Created by Nayan Khadase on 28/05/23.
//

import Foundation
import AVKit

struct MediaModal{
    let id = UUID().uuidString
    let url : String
    let isExpanded = false
}


var mediaJson: [MediaModal] = [
    MediaModal(url: "reel1"),
    MediaModal(url: "reel2"),
    MediaModal(url: "reel3"),
]


struct Reel: Identifiable{
    var id = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaModal
}
