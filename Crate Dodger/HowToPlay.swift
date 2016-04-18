//
//  HowToPlay.swift
//  Crate Dodger
//
//  Created by Ben Loan on 5/19/15.
//  Copyright (c) 2015 TreeTop Games. All rights reserved.
//

import SpriteKit

class HowToPlay: SKScene {
    
    let backButton = SKSpriteNode(imageNamed: "backButton")
    let redStatusBar = SKSpriteNode(imageNamed: "logoRed")
    
    let howToPlayLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine1 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine2 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine3 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine4 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine5 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine6 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine7 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine8 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine85 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine9 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine10 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine105 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlayLabelLine11 = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    var soundEffectsBool = false
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor(red: 7 / 255, green: 88 / 255, blue: 255 / 255, alpha: 1)
        
        backButton.size = CGSize(width: 70, height: 70)
        backButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backButton.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.945)
        
        howToPlayLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.922)
        howToPlayLabel.fontSize = 55
        howToPlayLabel.text = "How To Play"
        howToPlayLabel.fontColor = SKColor.blackColor()
        
        redStatusBar.size = CGSize(width: self.frame.size.width, height: 100)
        redStatusBar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        redStatusBar.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.95)
        
        howToPlayLabelLine1.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.84)
        howToPlayLabelLine1.fontSize = 35
        howToPlayLabelLine1.text = "Once in the Game Scene tap"
        howToPlayLabelLine1.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine2.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.8)
        howToPlayLabelLine2.fontSize = 35
        howToPlayLabelLine2.text = "anywhere to take a selfie."
        howToPlayLabelLine2.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine3.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.7)
        howToPlayLabelLine3.fontSize = 35
        howToPlayLabelLine3.text = "Then choose a selfie from your"
        howToPlayLabelLine3.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine4.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.65)
        howToPlayLabelLine4.fontSize = 35
        howToPlayLabelLine4.text = "camera roll or take a selfie."
        howToPlayLabelLine4.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine5.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.55)
        howToPlayLabelLine5.fontSize = 35
        howToPlayLabelLine5.text = "Once in the game, drag your"
        howToPlayLabelLine5.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine6.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.51)
        howToPlayLabelLine6.fontSize = 35
        howToPlayLabelLine6.text = "selfie left and right across the"
        howToPlayLabelLine6.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine7.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.47)
        howToPlayLabelLine7.fontSize = 35
        howToPlayLabelLine7.text = "screen avoiding crates, while"
        howToPlayLabelLine7.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine8.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.43)
        howToPlayLabelLine8.fontSize = 35
        howToPlayLabelLine8.text = "trying to collect coins"
        howToPlayLabelLine8.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine85.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.39)
        howToPlayLabelLine85.fontSize = 35
        howToPlayLabelLine85.text = "and power ups."
        howToPlayLabelLine85.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine9.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.29)
        howToPlayLabelLine9.fontSize = 35
        howToPlayLabelLine9.text = "Be sure to check out the store"
        howToPlayLabelLine9.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine10.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.25)
        howToPlayLabelLine10.fontSize = 35
        howToPlayLabelLine10.text = "to buy power ups."
        howToPlayLabelLine10.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine105.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.15)
        howToPlayLabelLine105.fontSize = 35
        howToPlayLabelLine105.text = "Have Fun!"
        howToPlayLabelLine105.fontColor = SKColor.blackColor()
        
        howToPlayLabelLine11.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.05)
        howToPlayLabelLine11.fontSize = 35
        howToPlayLabelLine11.text = "Tap Here to Play!"
        howToPlayLabelLine11.fontColor = SKColor.blackColor()
        
        howToPlayLabel.zPosition = 100
        backButton.zPosition = 100
        
        self.addChild(redStatusBar)
        self.addChild(backButton)
        self.addChild(howToPlayLabel)
        self.addChild(howToPlayLabelLine1)
        self.addChild(howToPlayLabelLine2)
        self.addChild(howToPlayLabelLine3)
        self.addChild(howToPlayLabelLine4)
        self.addChild(howToPlayLabelLine5)
        self.addChild(howToPlayLabelLine6)
        self.addChild(howToPlayLabelLine7)
        self.addChild(howToPlayLabelLine8)
        self.addChild(howToPlayLabelLine85)
        self.addChild(howToPlayLabelLine9)
        self.addChild(howToPlayLabelLine10)
        self.addChild(howToPlayLabelLine105)
        self.addChild(howToPlayLabelLine11)
        
        soundEffectsBool = NSUserDefaults.standardUserDefaults().boolForKey("Effects")
        
        let scale = SKAction.scaleBy(0.8, duration: 0.5)
        howToPlayLabelLine11.runAction(SKAction.repeatActionForever(SKAction.sequence([scale.reversedAction(), scale])))
    }
    
    func playTapSound() {
        if soundEffectsBool == true {
            let tapSound = SKAction.playSoundFileNamed("TapSound.wav", waitForCompletion: false)
            runAction(tapSound)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if backButton.containsPoint(location) {
                playTapSound()
                let settings = Settings(size: self.size)
                settings.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsCloseVerticalWithDuration(1)
                self.view?.presentScene(settings, transition: reveal)
            }
            
            if howToPlayLabelLine11.containsPoint(location) {
                playTapSound()
                let gamePlay = CrateDodger(size: self.size)
                gamePlay.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
                self.view?.presentScene(gamePlay, transition: reveal)
            }
            
        }
    }
}