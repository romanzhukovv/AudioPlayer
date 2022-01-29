//
//  AudioManager.swift
//  AudioPlayer
//
//  Created by Roman Zhukov on 29.01.2022.
//

import AVFoundation

class AudioManager {
    var player: AVAudioPlayer?

    func getPlayer(at url: URL) {
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }
}
