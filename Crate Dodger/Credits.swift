//
//  Credits.swift
//  Crate Dodger
//
//  Created by Ben Loan on 4/17/15.
//  Copyright (c) 2015 TreeTop Games. All rights reserved.
//

import SpriteKit

class Credits: SKScene {
    
    let backButton = SKSpriteNode(imageNamed: "backButton")
    let redStatusBar = SKSpriteNode(imageNamed: "logoRed")
    
    let designers = SKLabelNode(fontNamed: "Spaceship Bullet")
    let programmers = SKLabelNode(fontNamed: "Spaceship Bullet")
    let projectMangers = SKLabelNode(fontNamed: "Spaceship Bullet")
    let imageDesigners = SKLabelNode(fontNamed: "Spaceship Bullet")
    let programmersLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let projectMangersLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let imageDesignersLabel = SKLabelNode(fontNamed: "Spaceship Bullet")

    
    let betaTesters = SKLabelNode(fontNamed: "Spaceship Bullet")
    let creditsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let betaTestersLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let wwwtreetopgamesnet = SKLabelNode(fontNamed: "Spaceship Bullet")
    let userInterfaceDesigners = SKLabelNode(fontNamed: "Spaceship Bullet")
    let aTreeTopGamesProduction = SKLabelNode(fontNamed: "Spaceship Bullet")
    let userInterfaceDesignersLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    
    var soundEffectsBool = false
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor(red: 7 / 255, green: 88 / 255, blue: 255 / 255, alpha: 1)
        
        redStatusBar.size = CGSize(width: self.frame.size.width, height: 100)
        redStatusBar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        redStatusBar.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.95)
        
        backButton.size = CGSize(width: 70, height: 70)
        backButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backButton.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.945)
        
        creditsLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.922)
        creditsLabel.fontSize = 60
        creditsLabel.text = "Credits"
        creditsLabel.fontColor = SKColor.blackColor()
        
        projectMangersLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.82)
        projectMangersLabel.fontSize = 60
        projectMangersLabel.text = "Project Managers"
        projectMangersLabel.fontColor = SKColor.blackColor()
        
        projectMangers.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.77)
        projectMangers.fontSize = 37
        projectMangers.text = "Thomas Burke and Ben loan"
        projectMangers.fontColor = SKColor.blackColor()
        
        programmersLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.68)
        programmersLabel.fontSize = 60
        programmersLabel.text = "Programmers"
        programmersLabel.fontColor = SKColor.blackColor()
        
        programmers.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.63)
        programmers.fontSize = 37
        programmers.text = "Ben Loan and Thomas Burke"
        programmers.fontColor = SKColor.blackColor()
        
        imageDesignersLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.54)
        imageDesignersLabel.fontSize = 60
        imageDesignersLabel.text = "Image Designers"
        imageDesignersLabel.fontColor = SKColor.blackColor()
        
        imageDesigners.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.49)
        imageDesigners.fontSize = 37
        imageDesigners.text = "Thomas Burke and Ben Loan"
        imageDesigners.fontColor = SKColor.blackColor()
        
        userInterfaceDesignersLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.4)
        userInterfaceDesignersLabel.fontSize = 60
        userInterfaceDesignersLabel.text = "User Interface"
        userInterfaceDesignersLabel.fontColor = SKColor.blackColor()
        
        designers.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.34)
        designers.fontSize = 60
        designers.text = "Designers"
        designers.fontColor = SKColor.blackColor()
        
        userInterfaceDesigners.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.29)
        userInterfaceDesigners.fontSize = 37
        userInterfaceDesigners.text = "Ben Loan and Thomas Burke"
        userInterfaceDesigners.fontColor = SKColor.blackColor()
        
        betaTestersLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.2)
        betaTestersLabel.fontSize = 60
        betaTestersLabel.text = "Game Testers"
        betaTestersLabel.fontColor = SKColor.blackColor()
        
        betaTesters.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.15)
        betaTesters.fontSize = 37
        betaTesters.text = "Ryan Long and Dylan Hogan"
        betaTesters.fontColor = SKColor.blackColor()
        
        aTreeTopGamesProduction.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.08)
        aTreeTopGamesProduction.fontSize = 39
        aTreeTopGamesProduction.text = "A TreeTop Games Production"
        aTreeTopGamesProduction.fontColor = SKColor.blackColor()
        
        wwwtreetopgamesnet.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.019)
        wwwtreetopgamesnet.fontSize = 39
        wwwtreetopgamesnet.text = "www.treetopgames.net"
        wwwtreetopgamesnet.fontColor = SKColor.blackColor()
        
        creditsLabel.zPosition = 100
        backButton.zPosition = 100
        
        self.addChild(redStatusBar)
        self.addChild(backButton)
        self.addChild(creditsLabel)
        self.addChild(projectMangersLabel)
        self.addChild(projectMangers)
        self.addChild(programmersLabel)
        self.addChild(programmers)
        self.addChild(imageDesignersLabel)
        self.addChild(imageDesigners)
        self.addChild(userInterfaceDesignersLabel)
        self.addChild(designers)
        self.addChild(userInterfaceDesigners)
        self.addChild(betaTestersLabel)
        self.addChild(betaTesters)
        self.addChild(aTreeTopGamesProduction)
        self.addChild(wwwtreetopgamesnet)
        
        soundEffectsBool = NSUserDefaults.standardUserDefaults().boolForKey("Effects")
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
            
            if wwwtreetopgamesnet.containsPoint(location) {
                playTapSound()
                UIApplication.sharedApplication().openURL(NSURL(string:"http://www.TreeTopGames.net")!)
            }
        }
    }
}