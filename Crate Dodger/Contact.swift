//
//  Contact.swift
//  Crate Dodger
//
//  Created by Ben Loan on 4/18/15.
//  Copyright (c) 2015 TreeTop Games. All rights reserved.
//

import SpriteKit
import MessageUI

class Contact: SKScene, MFMailComposeViewControllerDelegate {
    
    let backButton = SKSpriteNode(imageNamed: "backButton")
    let redStatusBar = SKSpriteNode(imageNamed: "logoRed")
    
    let contactLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let emailUs = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let support = SKLabelNode(fontNamed: "Spaceship Bullet")
    let supportEmail = SKLabelNode(fontNamed: "Spaceship Bullet")
    let feedback = SKLabelNode(fontNamed: "Spaceship Bullet")
    let feedbackEmail = SKLabelNode(fontNamed: "Spaceship Bullet")
    let followUs = SKLabelNode(fontNamed: "Spaceship Bullet")
    let instagram = SKLabelNode(fontNamed: "Spaceship Bullet")
    let twitter = SKLabelNode(fontNamed: "Spaceship Bullet")
    let facebook = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    var roundsPlayed = 0
    var highScore = 0
    var coins = 0
    
    var soundEffectsBool = false
    
    func emailFeedback() {
        if (MFMailComposeViewController.canSendMail()) {
            let emailTitle = "Crate Dodger Feedback"
            let messageBody = "Tell us what you like or dislike about the game. Also list some feateures you would like to see in later versions of Crate Dodger: \n \n \n Do you like the game? \n \n Would you recomond the game to a friend?"
            let toRecipents = ["feedback.cratedodger@gmail.com"]
            
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients(toRecipents)
            
            self.view?.window?.rootViewController?.presentViewController(mc, animated: true, completion: nil)
        }
    }
    
    func emailSupport() {
        if (MFMailComposeViewController.canSendMail()) {
            let emailTitle = "Crate Dodger Support"
            let messageBody = "Please tell us what you need help with. If you found a glithch in the game please tell us how you can see the glitch and we will try to fix it."
            let toRecipents = ["help.treetopgames@gmail.com"]
            
            let mc: MFMailComposeViewController = MFMailComposeViewController()
            mc.mailComposeDelegate = self
            mc.setSubject(emailTitle)
            mc.setMessageBody(messageBody, isHTML: false)
            mc.setToRecipients(toRecipents)
            
            self.view?.window?.rootViewController?.presentViewController(mc, animated: true, completion: nil)
        }
        
    }
    
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail sent failure: \(error!.localizedDescription)")
        default:
            break
        }
        
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor(red: 7 / 255, green: 88 / 255, blue: 255 / 255, alpha: 1)
        
        redStatusBar.size = CGSize(width: self.frame.size.width, height: 100)
        redStatusBar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        redStatusBar.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.95)
        
        backButton.size = CGSize(width: 70, height: 70)
        backButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backButton.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.945)
        
        contactLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.922)
        contactLabel.fontSize = 70
        contactLabel.text = "Contact"
        contactLabel.fontColor = SKColor.blackColor()
        
        emailUs.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.8)
        emailUs.fontSize = 70
        emailUs.text = "Email Us"
        emailUs.fontColor = SKColor.blackColor()
        
        support.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.7)
        support.fontSize = 50
        support.text = "Support"
        support.fontColor = SKColor.blackColor()
        
        supportEmail.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.65)
        supportEmail.fontSize = 30
        supportEmail.text = "help.treetopgames@gmail.com"
        supportEmail.fontColor = SKColor.blackColor()
        
        feedback.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.55)
        feedback.fontSize = 50
        feedback.text = "Feedback"
        feedback.fontColor = SKColor.blackColor()
        
        feedbackEmail.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        feedbackEmail.fontSize = 30
        feedbackEmail.text = "feedback.cratedodger@gmail.com"
        feedbackEmail.fontColor = SKColor.blackColor()
        
        followUs.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.37)
        followUs.fontSize = 70
        followUs.text = "Follow Us"
        followUs.fontColor = SKColor.blackColor()
        
        instagram.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.25)
        instagram.fontSize = 50
        instagram.text = "Instagram"
        instagram.fontColor = SKColor.blackColor()
        
        twitter.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.15)
        twitter.fontSize = 50
        twitter.text = "Twitter"
        twitter.fontColor = SKColor.blackColor()
        
        facebook.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.05)
        facebook.fontSize = 50
        facebook.text = "Facebook"
        facebook.fontColor = SKColor.blackColor()
        
        contactLabel.zPosition = 100
        backButton.zPosition = 100
        
        self.addChild(redStatusBar)
        self.addChild(backButton)
        self.addChild(contactLabel)
        self.addChild(emailUs)
        self.addChild(support)
        self.addChild(supportEmail)
        self.addChild(feedback)
        self.addChild(feedbackEmail)
        self.addChild(followUs)
        self.addChild(instagram)
        self.addChild(twitter)
        self.addChild(facebook)
        
        soundEffectsBool = NSUserDefaults.standardUserDefaults().boolForKey("Effects")
        
        highScore = NSUserDefaults.standardUserDefaults().integerForKey("HighScore")
        roundsPlayed = NSUserDefaults.standardUserDefaults().integerForKey("Rounds")
        coins = NSUserDefaults.standardUserDefaults().integerForKey("Coins")
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
            
            if facebook.containsPoint(location) {
                playTapSound()
                UIApplication.sharedApplication().openURL(NSURL(string:"https://www.facebook.com/pages/TreeTop-Games/540085209461056")!)
            }
            
            if twitter.containsPoint(location) {
                playTapSound()
                UIApplication.sharedApplication().openURL(NSURL(string: "http://www.twitter.com/GamesTreeTop")!)
            }
            
            if instagram.containsPoint(location) {
                playTapSound()
                UIApplication.sharedApplication().openURL(NSURL(string:"http://instagram.com/treetopgames/")!)
            }
            
            if supportEmail.containsPoint(location) || support.containsPoint(location) {
                playTapSound()
                emailSupport()
            }
            
            if feedbackEmail.containsPoint(location) || feedback.containsPoint(location) {
                playTapSound()
                emailFeedback()
            }
        }

    }
}