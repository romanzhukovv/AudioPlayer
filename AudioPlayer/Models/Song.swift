//
//  Song.swift
//  AudioPlayer
//
//  Created by Roman Zhukov on 29.01.2022.
//

struct Song {
    let name: String
    let artist: String
    
    var title: String {
        "\(artist) - \(name)"
    }
    
    static func getSong() -> Song {
        Song(name: "Life In Silico", artist: "Scott Buckley")
    }
}
