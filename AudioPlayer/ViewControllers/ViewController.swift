//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Roman Zhukov on 29.01.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var songImage: UIImageView!
    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    
    let song = Song.getSong()
    
    var isPlay = false
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songImage.image = UIImage(named: song.title)
        songTitleLabel.text = song.title
        playButton.layer.cornerRadius = playButton.frame.width/2
        
        guard let url = Bundle.main.url(forResource: song.title, withExtension: "mp3") else { return }
        
        player = try? AVAudioPlayer(contentsOf: url)
    }

    @IBAction func playButtonAction() {
        if isPlay == false {
            player?.play()
            playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            isPlay = true
        } else if isPlay == true {
            player?.pause()
            playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            isPlay = false
        }
    }
}

