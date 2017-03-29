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
    
    let airCategoryName = "Air"
    let darkCategoryName = "Darkness"
    let earthCategoryName = "Earth"
    let fireCategoryName = "Fire"
    let lightCategoryName = "Light"
    let waterCategoryName = "Water"
    
    let airBlock = SKSpriteNode(imageNamed: "Air")
    let darkBlock = SKSpriteNode(imageNamed: "Darkness")
    let earthBlock = SKSpriteNode(imageNamed: "Earth")
    let fireBlock = SKSpriteNode(imageNamed: "Fire")
    let lightBlock = SKSpriteNode(imageNamed: "Light")
    let waterBlock = SKSpriteNode(imageNamed: "Water")
    
    var nextXPosition = 0
    var nextYPosition = 0
    
    var baseXY = Int()
    
    
    
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
        
        print ("self is \(self)")
        
        var baseXY = Int(self.frame.width / 6 / 2)
        
        let backgroundMusic = SKAudioNode (fileNamed: "Netherplace_Looping_Eric_Matyas.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
        
        let backgroundImage = SKSpriteNode(imageNamed: "background.png")
        //        let backgroundImageRect = CGRect(origin: CGPoint(x: 0, y: 0))
        backgroundImage.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        backgroundImage.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        addChild(backgroundImage)
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -30)
        
        let worldBorder = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = worldBorder
        self.physicsBody?.restitution = 0
        self.physicsBody?.friction = 1
        
        
        
//        airBlock.name = airCategoryName
//        airBlock.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
//        airBlock.position = CGPoint(x: self.frame.width / 6 / 2, y: self.frame.width / 6 / 2)
//        
//        airBlock.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: airBlock.frame.width, height: airBlock.frame.height))
//        airBlock.physicsBody?.restitution = 0
//        airBlock.physicsBody?.allowsRotation = false
//        airBlock.physicsBody?.affectedByGravity = true
        

        
        
        
        func addBlock() {
//            let BlockArray = [airBlock, darkBlock, earthBlock, fireBlock, lightBlock, waterBlock]
//            //This generates a row, which is currently set to be of length 6
//            
//            //This picks a random block from the BlockArray
//            let randomInt = Int(arc4random_uniform(UInt32(BlockArray.count)))
//            let newBlock = BlockArray[randomInt]
//            
//            let baseXY = Int(self.frame.width / 6 / 2)
//            
//            newBlock.position = CGPoint(x: baseXY + (nextPosition * baseXY), y: baseXY)
//            nextPosition += 1
//            
//            self.addChild(newBlock)
            
            let BlockArray = ["Air", "Darkness", "Earth", "Fire", "Light", "Water"]
            //This generates a row, which is currently set to be of length 6
            
            //This picks a random block from the BlockArray
            let randomInt = Int(arc4random_uniform(UInt32(BlockArray.count)))
            let newBlock = SKSpriteNode(imageNamed: BlockArray[randomInt])
            
            
            newBlock.name = BlockArray[randomInt]
            newBlock.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
//            newBlock.position = CGPoint(x: self.frame.width / 6 / 2, y: self.frame.width / 6 / 2)
            newBlock.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: newBlock.frame.width, height: newBlock.frame.height))
            newBlock.physicsBody?.restitution = 0
            newBlock.physicsBody?.allowsRotation = false
            newBlock.physicsBody?.affectedByGravity = true
            
            if nextXPosition == 6 {
//                print ("Before incrementing, \(newBlock.name) nextXposition is \(nextXPosition)")
                nextXPosition = 1
                nextYPosition += 1
                newBlock.position = CGPoint(x: baseXY, y: baseXY + (nextYPosition * baseXY * 2))
//                print (newBlock.name!)
            }
            
            else {
                newBlock.position = CGPoint(x: baseXY + (nextXPosition * baseXY * 2), y: baseXY + (nextYPosition * baseXY * 2))
//                print ("Before incrementing, \(newBlock.name) nextXposition is \(nextXPosition)")
                nextXPosition += 1
            }
            
            self.addChild(newBlock)
        }
        
        for _ in 0...53 {
            addBlock()
        }
        
//        for i in self.children {
//            if i.position == CGPoint(x: baseXY, y: baseXY) {
//            print ("\(i.name)'s position is \(i.position)")
//                print (i.name)
//            }
//            
//        }
        
        //This returns the node from the second row
        print("node at this position is \(self.atPoint(CGPoint(x: baseXY, y: baseXY + (1 * baseXY * 2))))")
        
//        print ("self.children is \(self.children)")
        
        
//        func addBlock() {
//            let BlockArray = [airBlock, darkBlock, earthBlock, fireBlock, lightBlock, waterBlock]
//            //This generates a row, which is currently set to be of length 6
//            
//            //This picks a random block from the BlockArray
//            let randomInt = Int(arc4random_uniform(UInt32(BlockArray.count)))
//            let newBlock = BlockArray[randomInt]
//                
//            let baseXY = Int(self.frame.width / 6 / 2)
//                
//            newBlock.position = CGPoint(x: baseXY + (nextPosition * baseXY), y: baseXY)
//            nextPosition += 1
//                
//            self.addChild(newBlock)
//        }
//        
//        addBlock()
        
    }
    
    override func didMove(to view: SKView) {
        
//        let backgroundMusic = SKAudioNode (fileNamed: "Netherplace_Looping_Eric_Matyas.mp3")
//        backgroundMusic.autoplayLooped = true
//        addChild(backgroundMusic)
//        
////        let backgroundImage = SKSpriteNode(imageNamed: "background.png")
//////        let backgroundImageRect = CGRect(origin: CGPoint(x: 0, y: 0))
////        backgroundImage.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
////        backgroundImage.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
////        addChild(backgroundImage)
//        
//        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
//        
//        let worldBorder = SKPhysicsBody(edgeLoopFrom: self.frame)
//        self.physicsBody = worldBorder
//        self.physicsBody?.friction = 0
//        
//        let airBlock = SKSpriteNode(imageNamed: "Air")
//        
//        print ("self.physicsBody is \(self.physicsBody)")
//        print ("self.physicsWorld.gravity is \(self.physicsWorld.gravity)")
//        
//        airBlock.name = airCategoryName
////        airBlock.size = CGSize(width: 100, height: 100)
//        airBlock.position = CGPoint(x: 220, y: 220)
//        self.addChild(airBlock)
//        
//        airBlock.physicsBody = SKPhysicsBody(edgeLoopFrom: airBlock.frame)
//        
//        airBlock.physicsBody?.restitution = 1
//        airBlock.physicsBody?.friction = 0
//        airBlock.physicsBody?.linearDamping = 0
//        airBlock.physicsBody?.isDynamic = true
//        airBlock.physicsBody?.allowsRotation = false
//        airBlock.physicsBody?.affectedByGravity = true
//        airBlock.physicsBody?.mass = 1
//        
//        
//        
//        
//        fireBlock.name = fireCategoryName
//        fireBlock.size = CGSize(width: 100, height: 100)
//        fireBlock.position = CGPoint(x: 320, y: 320)
//        fireBlock.physicsBody = SKPhysicsBody(edgeLoopFrom: fireBlock.frame)
//        //        fireBlock.physicsBody?.restitution = 0
//        fireBlock.physicsBody?.isDynamic = true
//        fireBlock.physicsBody?.allowsRotation = false
//        fireBlock.physicsBody?.affectedByGravity = true
//        //        fireBlock.physicsBody?.applyForce(CGVector(dx: 100, dy: 100))
//        
////        self.addChild(fireBlock)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func update(_ currentTime: TimeInterval) {
//        print ("airBlock position is \(airBlock.position)")
//        print ("airBlock physicsBody is \(airBlock.physicsBody)")
    }
    
}
