//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Roman Zhukov on 29.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var songImage: UIImageView!
    @IBOutlet var songTitleLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var progressSlider: UISlider!
    @IBOutlet var currentTimeLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    let song = Song.getSong()
    let audioPlayer = AudioManager()
    
    var isPlaying = false
    
    lazy var displayLink: CADisplayLink = CADisplayLink(target: self, selector: #selector(updateProgressSong))
    lazy var currentTimeLink: CADisplayLink = CADisplayLink(target: self, selector: #selector(updateCurrentTime))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func playButtonAction() {
        if isPlaying == false {
            playSong()
        } else if isPlaying == true {
           pauseSong()
        }
    }
}

extension ViewController {
    private func setupUI() {
        songImage.image = UIImage(named: song.title)
        songTitleLabel.text = song.title
        playButton.layer.cornerRadius = playButton.frame.width/2
        
        guard let url = Bundle.main.url(forResource: song.title, withExtension: "mp3") else { return }
        
        audioPlayer.getPlayer(at: url)
        
        currentTimeLink.add(to: .main, forMode: .common)
        durationLabel.text = "\(Float(audioPlayer.player?.duration ?? 0))"
    }
    
    private func playSong() {
        audioPlayer.player?.play()
        displayLink.add(to: .main, forMode: .common)
        playButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        isPlaying = true
    }
    
    private func pauseSong() {
        audioPlayer.player?.pause()
        displayLink.isPaused
        playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        isPlaying = false
    }
    
    @objc private func updateProgressSong() {
        let progress = Float((audioPlayer.player?.currentTime ?? 0) / (audioPlayer.player?.duration ?? 0))
        progressSlider.setValue(progress, animated: true)
    }
    
    @objc private func updateCurrentTime() {
        let time = Float(audioPlayer.player?.currentTime ?? 0)
        currentTimeLabel.text = "\(time)"
    }
}

