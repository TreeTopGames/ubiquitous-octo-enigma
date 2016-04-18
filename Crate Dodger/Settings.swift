//
//  Settings.swift
//  Crate Dodger
//
//  Created by Ben Loan on 4/4/15.
//  Copyright (c) 2015 TreeTop Games. All rights reserved.
//

import SpriteKit
import StoreKit

class Settings: SKScene, SKProductsRequestDelegate, SKPaymentTransactionObserver {

    //MARK: Objects
    
    let backButton = SKSpriteNode(imageNamed: "backButton")
    let redStatusBar = SKSpriteNode(imageNamed: "logoRed")
    
    let settingsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let removeAds = SKLabelNode(fontNamed: "Spaceship Bullet")
    let restorePurchases = SKLabelNode(fontNamed: "Spaceship Bullet")
    let weather = SKLabelNode(fontNamed: "Spaceship Bullet")
    let backgroundMusic = SKLabelNode(fontNamed: "Spaceship Bullet")
    let soundEffects = SKLabelNode(fontNamed: "Spaceship Bullet")
    let credits = SKLabelNode(fontNamed: "Spaceship Bullet")
    let howToPlay = SKLabelNode(fontNamed: "Spaceship Bullet")
    let contact = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let weatherSwitch = SKLabelNode(fontNamed: "Spaceship Bullet")
    let backgroundSwitch = SKLabelNode(fontNamed: "Spaceship Bullet")
    let soundEffectSwitch = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    var loadingAlert = UIAlertController()

    //MARK: Varibles
    
    var weatherBool = true
    var backgroundMusicBool = true
    var soundEffectBool = true
    
    var loadingIAP = false
    var removedAds = false
    
    //MARK: Remove Ads
    
    var p = SKProduct()
    var list = [SKProduct]()
    
    func startRemovingAds() {
        if loadingIAP == false && removeAds == false {
            loading()
            loadingIAP = true
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "net.treetopgames.cratedodger.removeads") {
                    p = product
                    buyProduct()
                    break
                }
            }
        }
    }
    
    func buyProduct() {
        let pay = SKPayment(product: p)
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        SKPaymentQueue.defaultQueue().addPayment(pay as SKPayment)
        loadingAlert.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        let myProduct = response.products
        
        for product in myProduct {
            list.append(product )
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue) {
        print("transactions restored")
        
        //var purchasedItemIDS = []
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction 
            
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "net.treetopgames.double":
                print("Double Coins")
                addDoubleCoins()
            case "net.treetopgames.cratedodger.removeads":
                print("Remove Ads")
                finishRemovingAds()
            default:
                print("IAP not setup")
            }
            
        }
    }

    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            
            switch trans.transactionState {
                
            case .Purchased:
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier as String
                switch prodID {
                case "net.treetopgames.cratedodger.removeads":
                    finishRemovingAds()
                default:
                    print("IAP not setup")
                }
                break
            case .Failed:
                queue.finishTransaction(trans)
                buyError()
                loadingIAP = false
                break
            default:
                break
                
            }
        }
    }
    
    func finishRemovingAds() {
        loadingIAP = false
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "Removed Ads")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func addDoubleCoins() {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "Double Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        loadingIAP = false
    }

    
    func finishTransaction(trans:SKPaymentTransaction) {
        print("finish trans")
    }
    
    
    func loading() {
        loadingAlert = UIAlertController(title: "Loading...", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        self.scene?.view?.window?.rootViewController?.presentViewController(loadingAlert, animated: true, completion: nil)
    }
    
    
    func buyError() {
        let alert = UIAlertController(title: "Error", message: "There was an error with your purchase. Please try again later.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK: Override Function
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor(red: 7 / 255, green: 88 / 255, blue: 255 / 255, alpha: 1)
        
        backButton.size = CGSize(width: 70, height: 70)
        backButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backButton.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.945)
        
        settingsLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.922)
        settingsLabel.fontSize = 60
        settingsLabel.text = "Settings"
        settingsLabel.fontColor = SKColor.blackColor()
        
        redStatusBar.size = CGSize(width: self.frame.size.width, height: 100)
        redStatusBar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        redStatusBar.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.95)
        
        weather.position = CGPoint(x: self.frame.size.width * 0.37, y: self.frame.size.height * 0.8)
        weather.fontSize = 45
        weather.text = "Weather"
        weather.fontColor = SKColor.blackColor()
        
        weatherSwitch.position = CGPoint(x: self.frame.size.height * 0.875, y: weather.position.y)
        weatherSwitch.fontSize = 50
        weatherSwitch.text = "On"
        weatherSwitch.fontColor = SKColor.greenColor()
        
        backgroundMusic.position = CGPoint(x: self.frame.size.width * 0.45, y: self.frame.size.height * 0.7)
        backgroundMusic.fontSize = 45
        backgroundMusic.text = "Background Music"
        backgroundMusic.fontColor = SKColor.blackColor()
        
        backgroundSwitch.position = CGPoint(x: self.frame.size.height * 0.875, y: backgroundMusic.position.y)
        backgroundSwitch.fontSize = 50
        backgroundSwitch.text = "On"
        backgroundSwitch.fontColor = SKColor.greenColor()
        
        soundEffects.position = CGPoint(x: self.frame.size.width * 0.414, y: self.frame.size.height * 0.6)
        soundEffects.fontSize = 45
        soundEffects.text = "Sound Effects"
        soundEffects.fontColor = SKColor.blackColor()
        
        soundEffectSwitch.position = CGPoint(x: self.frame.size.height * 0.875, y: soundEffects.position.y)
        soundEffectSwitch.fontSize = 50
        soundEffectSwitch.text = "On"
        soundEffectSwitch.fontColor = SKColor.greenColor()
        
        credits.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        credits.fontSize = 80
        credits.text = "Credits"
        credits.fontColor = SKColor.blackColor()
        
        contact.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.385)
        contact.fontSize = 80
        contact.text = "Contact"
        contact.fontColor = SKColor.blackColor()
        
        howToPlay.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.275)
        howToPlay.fontSize = 80
        howToPlay.text = "How To Play"
        howToPlay.fontColor = SKColor.blackColor()
        
        removeAds.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.162)
        removeAds.fontSize = 80
        removeAds.text = "Remove Ads"
        removeAds.fontColor = SKColor.blackColor()
        
        restorePurchases.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.055)
        restorePurchases.fontSize = 57
        restorePurchases.text = "Restore Purchases"
        restorePurchases.fontColor = SKColor.blackColor()
        
        weatherBool = NSUserDefaults.standardUserDefaults().boolForKey("Weather")
        backgroundMusicBool = NSUserDefaults.standardUserDefaults().boolForKey("Background")
        soundEffectBool = NSUserDefaults.standardUserDefaults().boolForKey("Effects")
        
        if weatherBool == false {
            weatherSwitch.fontColor = SKColor.redColor()
            weatherSwitch.text = "off"
        }
        
        if backgroundMusicBool == false {
            backgroundSwitch.fontColor = SKColor.redColor()
            backgroundSwitch.text = "off"
        }
        
        if soundEffectBool == false {
            soundEffectSwitch.fontColor = SKColor.redColor()
            soundEffectSwitch.text = "off"
        }
        
        removedAds = NSUserDefaults.standardUserDefaults().boolForKey("Removed Ads")
        
        if removedAds == true {
            removeAds.text = "Ads Removed"
        }
        
        settingsLabel.zPosition = 100
        backButton.zPosition = 100
        
        self.addChild(redStatusBar)
        self.addChild(backButton)
        self.addChild(settingsLabel)
        self.addChild(weather)
        self.addChild(backgroundMusic)
        self.addChild(soundEffects)
        self.addChild(removeAds)
        self.addChild(restorePurchases)
        self.addChild(credits)
        self.addChild(howToPlay)
        self.addChild(contact)
        
        self.addChild(weatherSwitch)
        self.addChild(backgroundSwitch)
        self.addChild(soundEffectSwitch)
    }

    func playTapSound() {
        if soundEffectBool == true {
            let tapSound = SKAction.playSoundFileNamed("TapSound.wav", waitForCompletion: false)
            runAction(tapSound)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if backButton.containsPoint(location) {
                playTapSound()
                let home = GameScene(size: self.size)
                home.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsCloseVerticalWithDuration(1)
                self.view?.presentScene(home, transition: reveal)
            }
            
            if contact.containsPoint(location) {
                playTapSound()
                let contact = Contact(size: self.size)
                contact.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
                self.view?.presentScene(contact, transition: reveal)
            }
            
            if weatherSwitch.containsPoint(location) {
                playTapSound()
                if weatherBool == true {
                    weatherBool = false
                    weatherSwitch.fontColor = SKColor.redColor()
                    weatherSwitch.text = "off"
                } else {
                    weatherBool = true
                    weatherSwitch.fontColor = SKColor.greenColor()
                    weatherSwitch.text = "On"
                }
                NSUserDefaults.standardUserDefaults().setBool(weatherBool, forKey: "Weather")
                NSUserDefaults.standardUserDefaults().synchronize()
            } else if backgroundSwitch.containsPoint(location) {
                playTapSound()
                if backgroundMusicBool == true {
                    backgroundMusicBool = false
                    backgroundSwitch.fontColor = SKColor.redColor()
                    backgroundSwitch.text = "off"
                } else {
                    backgroundMusicBool = true
                    backgroundSwitch.fontColor = SKColor.greenColor()
                    backgroundSwitch.text = "On"
                }
                NSUserDefaults.standardUserDefaults().setBool(backgroundMusicBool, forKey: "Background")
                NSUserDefaults.standardUserDefaults().synchronize()
            } else if soundEffectSwitch.containsPoint(location) {
                if soundEffectBool == true {
                    playTapSound()
                    soundEffectBool = false
                    soundEffectSwitch.fontColor = SKColor.redColor()
                    soundEffectSwitch.text = "off"
                } else {
                    soundEffectBool = true
                    soundEffectSwitch.fontColor = SKColor.greenColor()
                    soundEffectSwitch.text = "On"
                }
                NSUserDefaults.standardUserDefaults().setBool(soundEffectBool, forKey: "Effects")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
            
            if removeAds.containsPoint(location) {
                playTapSound()
                startRemovingAds()
            } else if restorePurchases.containsPoint(location) {
                playTapSound()
                SKPaymentQueue.defaultQueue().addTransactionObserver(self)
                SKPaymentQueue.defaultQueue().restoreCompletedTransactions()
            } else if credits.containsPoint(location) {
                playTapSound()
                let credits = Credits(size: self.size)
                credits.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
                self.view?.presentScene(credits, transition: reveal)
            } else if howToPlay.containsPoint(location) {
                playTapSound()
                let howToPlay = HowToPlay(size: self.size)
                howToPlay.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
                self.view?.presentScene(howToPlay, transition: reveal)
            }
        }
    }
}