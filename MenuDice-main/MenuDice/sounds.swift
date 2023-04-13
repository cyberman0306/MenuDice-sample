//
//  sounds.swift
//  MenuDice
//
//  Created by yook on 2023/03/06.
//

import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    init(player: AVAudioPlayer? = nil) {
        self.player = player
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.ambient, mode: .default, options: [.mixWithOthers])
        } catch {
            print("Failed to set audio session category.")
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "effect01", withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error about sound.\(error.localizedDescription)")
        }
    }
}
