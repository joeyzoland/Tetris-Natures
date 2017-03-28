//
//  GameScene.swift
//  Tetris Natures
//
//  Created by Joseph Zoland on 3/27/17.
//  Copyright © 2017 Joseph Zoland. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    let airCategoryName = "air"
    let darkCategoryName = "dark"
    let earthCategoryName = "earth"
    let fireCategoryName = "fire"
    let lightCategoryName = "light"
    let waterCategoryName = "water"
    
    override init(size: CGSize) {
        super.init(size:size)
        
        
        //The below code didn't work, but archiving it here anyways...
        
//        let bgMusicURL = Bundle.main.url(forResource: "Netherplace_Looping_Eric_Matyas", withExtension: "mp3")
//        
//        do {
//            print ("started do loop")
//            let backgroundMusicPlayer = try AVAudioPlayer(contentsOf: bgMusicURL!)
//            backgroundMusicPlayer.numberOfLoops = -1
//            backgroundMusicPlayer.prepareToPlay()
//            backgroundMusicPlayer.play()
//            print ("ended do loop")
//        } catch {
//            print("\(error)")
//        }

        let backgroundMusic = SKAudioNode (fileNamed: "Netherplace_Looping_Eric_Matyas.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
        
        let backgroundImage = SKSpriteNode(imageNamed: "background.png")
//        let backgroundImageRect = CGRect(origin: CGPoint(x: 0, y: 0))
        backgroundImage.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        backgroundImage.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        addChild(backgroundImage)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
