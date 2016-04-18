

//
//  GameScene.swift
//  Crate Dodger
//
//  Created by Ben Loan on 3/25/15.
//  Copyright (c) 2015 TreeTop Games. All rights reserved.
//

import SpriteKit
import GameKit
import StoreKit
import AVFoundation
import AudioToolbox

class GameScene: SKScene, GKGameCenterControllerDelegate, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    //MARK: Objects
    
    let playButton = SKSpriteNode(imageNamed: "playButton")
    let grass = SKSpriteNode(imageNamed: "grassSunny")
    let settingsButton = SKSpriteNode(imageNamed: "settingsButton")
    let gameCenterButton = SKSpriteNode(imageNamed: "gameCenterButton")
    let storeButton = SKSpriteNode(imageNamed: "StoreButton")
    let cloud = SKSpriteNode(imageNamed: "RainCloud")
    let cloud2 = SKSpriteNode(imageNamed: "RainCloud")
    let moon = SKSpriteNode(imageNamed: "fullMoon")
    let sun = SKSpriteNode(imageNamed: "sun")
    
    let background = SKSpriteNode(imageNamed: "CDCity")
    
    let rainLeft = SKEmitterNode(fileNamed: "Rain Left.sks")
    let rainLeft2 = SKEmitterNode(fileNamed: "Rain Left.sks")
    let rainRight = SKEmitterNode(fileNamed: "Rain Right.sks")
    let rainRight2 = SKEmitterNode(fileNamed: "Rain Right.sks")
    let snow = SKEmitterNode(fileNamed: "Snow.sks")
    let snow2 = SKEmitterNode(fileNamed: "Snow.sks")
    
    let removeAds = SKLabelNode(fontNamed: "Spaceship Bullet")
    let crateDodgerLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    var loadingAlert1 = UIAlertController()
    
    //MARK: Varibles
    
    var weatherType = 0
    var direction = 0
    var cloudGeneration = 0
    
    var appLaunched = false
    
    var loadingIAP = false
    var removedAds = false
    
    var isSnowing = false
    var isRaining = false
    var playingSound = false
    var playingThunder = false
    
    var weatherBool = true
    var backgroundMusicBool = true
    var soundEffectBool = true
    
    var backgroundTheme: String = ""
    var quickActions: String = "Nothing"
    
    var audioPlayer = AVAudioPlayer()
    var thunderplayer = AVAudioPlayer()
    var backgroundMusicPlayer = AVAudioPlayer()
    
    var addMoreClouds = NSTimer()
    var addLightingTimer = NSTimer()
    
    var leaderboardID = NSString()
    
    //MARK: Remove Ads
    
    var p = SKProduct()
    var list = [SKProduct]()
    
    func startRemovingAds() {
        if loadingIAP == false && removedAds == false {
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
        loadingAlert1.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        let myProduct = response.products
        
        for product in myProduct {
            list.append(product )
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
        removedAds = true
        NSUserDefaults.standardUserDefaults().setBool(removedAds, forKey: "Removed Ads")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func finishTransaction(trans:SKPaymentTransaction) {
        print("finish trans")
    }
    
    
    func loading() {
        loadingAlert1 = UIAlertController(title: "Loading...", message: nil, preferredStyle: UIAlertControllerStyle.Alert)

        self.scene?.view?.window?.rootViewController?.presentViewController(loadingAlert1, animated: true, completion: nil)
    }
    
    
    func buyError() {
        let alert = UIAlertController(title: "Error", message: "There was an error with your purchase. Please try again later.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK: Leaderboard
    
    func choseLeaderboard() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "High Score Leaderboard", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction) -> Void in
            self.leaderboardID = "net.treetopgames.cratedodger.leaderboard"
            self.showLeaderboard()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Wealth Leaderboard", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction) -> Void in
            self.leaderboardID = "net.treetopgames.cratedodger.leaderboard.wealth"
            self.showLeaderboard()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Rounds Played Leaderboard", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction) -> Void in
            self.leaderboardID = "net.treetopgames.cratedodger.leaderboard.roundsplayed"
            self.showLeaderboard()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        if let popUpVC = actionSheet.popoverPresentationController {
            popUpVC.permittedArrowDirections = .Down
            popUpVC.sourceView = self.view
            popUpVC.sourceRect = CGRect(x: self.frame.size.width * 0.495, y: self.frame.size.height * 0.65, width: 1, height: 1)
        }
        
        
        self.self.view!.window!.rootViewController!.presentViewController(actionSheet, animated: true, completion: nil)
        
    }
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showLeaderboard() {
        let vc = self.view?.window?.rootViewController
        let gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        gc.leaderboardIdentifier = leaderboardID as String
        vc?.presentViewController(gc, animated: true, completion: nil)
    }
    
    func authenticateLocalPlayer() {
        
        let localPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            
            if (viewController != nil) {
                print("Player not Signed In")
            }
        }
    }
    
    //MARK: Weather
    
    func thunder() {
        if soundEffectBool == true {
            let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Thunder", ofType: "wav")!)
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            } catch _ {
            }
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch _ {
                print("error")
            }

            do {
                thunderplayer = try AVAudioPlayer(contentsOfURL: alertSound)
            } catch _{
                print("error")
            }
            thunderplayer.numberOfLoops = 1
            thunderplayer.prepareToPlay()
            thunderplayer.play()
            playingThunder = true
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    func lighting() {
        let flash = SKSpriteNode()
        flash.color = SKColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
        flash.size = CGSize(width: 5000, height: 5000)
        flash.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        flash.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        flash.zPosition = 100
        flash.alpha = 0
        
        let flashIn = SKAction.fadeAlphaTo(1, duration: 0.5)
        let flashOut = SKAction.fadeAlphaTo(0, duration: 0.5)
        let flashes = SKAction.sequence([flashIn, flashOut])
        
        self.addChild(flash)
        
        flash.runAction(flashes)
        
        thunder()
    }
    
    func addLightingAndThunder() {
        addRain()
        
        var flashTime = Int(arc4random_uniform(UInt32(20)))
        flashTime += 10
        
        let time = NSTimeInterval(flashTime)
        
        addLightingTimer = NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: #selector(GameScene.lighting), userInfo: nil, repeats: true)
    }
    
    func addSecondSnow() {
        snow2!.position = CGPoint(x: CGRectGetMidX(cloud2.frame), y: CGRectGetMidY(cloud2.frame))
        self.addChild(snow2!)
    }
    
    func addSnow() {
        snow!.position = CGPoint(x: CGRectGetMidX(cloud.frame), y: CGRectGetMidY(cloud.frame))
        self.addChild(snow!)
    }
    
    func addSecondRain() {
        if direction == 1 {
            rainLeft2!.position = CGPoint(x: CGRectGetMidX(cloud2.frame), y: self.frame.size.height * 0.8)
            self.addChild(rainLeft2!)
        } else {
            rainRight2!.position = CGPoint(x: CGRectGetMidX(cloud2.frame), y: self.frame.size.height * 0.8)
            self.addChild(rainRight2!)
        }
        
    }
    
    func addRain() {
        
        isRaining = true
        
        if direction == 1 {
            rainLeft!.position = CGPoint(x: CGRectGetMidX(cloud.frame), y: self.frame.size.height * 0.8)
            self.addChild(rainLeft!)
        } else {
            rainRight!.position = CGPoint(x: CGRectGetMidX(cloud.frame), y: self.frame.size.height * 0.8)
            self.addChild(rainRight!)
        }
        
        if soundEffectBool == true {
            let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Rain", ofType: "wav")!)
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            } catch _ {
            }
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch _ {
            }

            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: alertSound)
            } catch _ {
                print("error")
            }
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            playingSound = true
        }
    }
    
    func moveSecondCloudBack() {
        cloud2.removeAllActions()
        rainRight2!.removeAllActions()
        rainLeft2!.removeAllActions()
        snow2!.removeAllActions()
        
        addMoreClouds.invalidate()
        addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.moveFirstCloudBack), userInfo: nil, repeats: false)
        
        if direction == 1 {
            cloud2.position = CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8)
            rainLeft2!.position = CGPoint(x: CGRectGetMidX(cloud2.frame), y: CGRectGetMidY(cloud2.frame))
            snow2!.position = CGPoint(x: CGRectGetMidX(cloud2.frame), y: CGRectGetMidY(cloud2.frame))
            let moveLeft = SKAction.moveTo(CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud2.runAction(moveLeft)
            rainLeft2!.runAction(moveLeft)
            snow2!.runAction(moveLeft)
        } else {
            cloud2.position = CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8)
            rainRight2!.position = CGPoint(x: CGRectGetMidX(cloud2.frame), y: CGRectGetMidY(cloud2.frame))
            snow2!.position = CGPoint(x: CGRectGetMidX(cloud2.frame), y: CGRectGetMidY(cloud2.frame))
            let moveRight = SKAction.moveTo(CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud2.runAction(moveRight)
            rainRight2!.runAction(moveRight)
            snow2!.runAction(moveRight)
        }
        
    }
    
    func moveFirstCloudBack() {
        cloud.removeAllActions()
        rainRight!.removeAllActions()
        rainLeft!.removeAllActions()
        snow!.removeAllActions()
        
        addMoreClouds.invalidate()
        addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.moveSecondCloudBack), userInfo: nil, repeats: false)
        
        if direction == 1 {
            cloud.position = CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8)
            rainLeft!.position = CGPoint(x: CGRectGetMidX(cloud.frame), y: CGRectGetMidY(cloud.frame))
            snow!.position = CGPoint(x: CGRectGetMidX(cloud.frame), y: CGRectGetMidY(cloud.frame))
            let moveLeft = SKAction.moveTo(CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud.runAction(moveLeft)
            rainLeft!.runAction(moveLeft)
            snow!.runAction(moveLeft)
        } else {
            cloud.position = CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8)
            rainRight!.position = CGPoint(x: CGRectGetMidX(cloud.frame), y: CGRectGetMidY(cloud.frame))
            snow!.position = CGPoint(x: CGRectGetMidX(cloud.frame), y: CGRectGetMidY(cloud.frame))
            let moveRight = SKAction.moveTo(CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud.runAction(moveRight)
            rainRight!.runAction(moveRight)
            snow!.runAction(moveRight)
        }
    }
    
    func addSecondCloud() {
        
        cloud2.size = CGSize(width: 299, height: 179)
        cloud2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(cloud2)
        
        cloud2.zPosition = 10
        rainLeft2!.zPosition = 1
        rainRight2!.zPosition = 1
        snow2!.zPosition = 1
        
        if direction == 1 {
            //Move Left
            cloud2.position = CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8)
            let moveLeft = SKAction.moveTo(CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud2.runAction(moveLeft)
            rainLeft2!.runAction(moveLeft)
            snow2!.runAction(moveLeft)
        } else {
            //Move Right
            cloud2.position = CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8)
            let moveRight = SKAction.moveTo(CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud2.runAction(moveRight)
            rainRight2!.runAction(moveRight)
            snow2!.runAction(moveRight)
        }
    }
    
    func addCloud() {
        direction = Int(arc4random_uniform(UInt32(2)))
        direction += 1
        
        cloud.size = CGSize(width: 299, height: 179)
        cloud.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(cloud)
        
        cloud.zPosition = 10
        rainLeft!.zPosition = 1
        rainRight!.zPosition = 1
        snow!.zPosition = 1
        
        if direction == 1 {
            //Moving Left
            cloud.position = CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8)
            let moveLeft = SKAction.moveTo(CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud.runAction(moveLeft)
            rainLeft!.runAction(moveLeft)
            snow!.runAction(moveLeft)
        } else {
            //Moving Right
            cloud.position = CGPoint(x: CGRectGetMinX(self.frame), y: self.frame.size.height * 0.8)
            let moveRight = SKAction.moveTo(CGPoint(x: CGRectGetMaxX(self.frame), y: self.frame.size.height * 0.8), duration: 20)
            cloud.runAction(moveRight)
            rainRight!.runAction(moveRight)
            snow!.runAction(moveRight)
        }
    }
    
    func addSun() {
        sun.size = CGSize(width: 200, height: 200)
        sun.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            sun.position = CGPoint(x: self.frame.size.width * 0.29, y: self.frame.size.height)
        } else {
            sun.position = CGPoint(x: self.frame.size.width * 0.22, y: self.frame.size.height)
        }
        
        self.addChild(sun)
    }
    
    func addMoon() {
        var moonType = Int(arc4random_uniform(UInt32(5)))
        moonType += 1
        
        if moonType == 1 {
            moon.texture = SKTexture(imageNamed: "fullMoon")
        } else if moonType == 2 {
            moon.texture = SKTexture(imageNamed: "moon2")
        } else if moonType == 3 {
            moon.texture = SKTexture(imageNamed: "moon3")
        } else if moonType == 4 {
            moon.texture = SKTexture(imageNamed: "moon4")
        } else if moonType == 5 {
            moon.texture = SKTexture(imageNamed: "moon5")
        }
        
        moon.size = CGSize(width: 100, height: 100)
        moon.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        moon.position = CGPoint(x: self.frame.size.width * 0.375, y: self.frame.size.height * 0.85)
        self.addChild(moon)
    }
    
    func createSecondWeather() {
        if weatherType == 1 {
            //Rain
            addSecondCloud()
            addSecondRain()
            cloud2.texture = SKTexture(imageNamed: "RainCloud")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.moveFirstCloudBack), userInfo: nil, repeats: false)
        } else if weatherType == 2 {
            //Snow
            addSecondCloud()
            addSecondSnow()
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.moveFirstCloudBack), userInfo: nil, repeats: false)
        } else if weatherType == 3 {
            //Storm
            addSecondCloud()
            addSecondRain()
            cloud2.texture = SKTexture(imageNamed: "StormCloud")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.moveFirstCloudBack), userInfo: nil, repeats: false)
        } else if weatherType == 4 {
            //Sunny Day
        }
    }
    
    func createWeather() {
        weatherType = Int(arc4random_uniform(UInt32(4)))
        weatherType += 1
        
        cloudGeneration = Int(arc4random_uniform(UInt32(10)))
        cloudGeneration += 10
        
        if weatherType == 1 {
            //Rain
            addCloud()
            addRain()
            cloud.texture = SKTexture(imageNamed: "RainCloud")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.createSecondWeather), userInfo: nil, repeats: false)
        } else if weatherType == 2 {
            //Snow
            addCloud()
            addSnow()
            grass.texture = SKTexture(imageNamed: "grassSnow")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.createSecondWeather), userInfo: nil, repeats: false)
        } else if weatherType == 3 {
            //Storm
            addCloud()
            addLightingAndThunder()
            cloud.texture = SKTexture(imageNamed: "StormCloud")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(GameScene.createSecondWeather), userInfo: nil, repeats: false)
        } else if weatherType == 4 {
            //Sunny Day
        }
        
        if backgroundTheme == "Day" || backgroundTheme == "City" {
            if weatherType == 1 {
                self.backgroundColor = SKColor(red: 163 / 255, green: 174 / 255, blue: 186 / 255, alpha: 1)
            } else if weatherType == 2 {
                self.backgroundColor = SKColor(red: 168 / 255, green: 241 / 255, blue: 240 / 255, alpha: 1)
            } else if weatherType == 3 {
                self.backgroundColor = SKColor(red: 74 / 255, green: 78 / 255, blue: 83 / 255, alpha: 1)
            } else if weatherType == 4 {
                addSun()
            }
        }
    }
    
    func cityBackground() {
        background.size = CGSize(width: UIScreen.mainScreen().bounds.size.width, height: self.frame.size.height)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        self.addChild(background)
    }
    
    //MARK: Override Functions
    
    func stopAudio() {
        if playingSound == true {
            audioPlayer.stop()
        }
        
        if playingThunder == true {
            thunderplayer.stop()
        }
    }
    
    func playTapSound() {
        if soundEffectBool == true {
            let tapSound = SKAction.playSoundFileNamed("TapSound.wav", waitForCompletion: false)
            runAction(tapSound)
        }
    }
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor(red: 50 / 255, green: 203 / 255, blue: 212 / 255, alpha: 1)
        
        grass.size = CGSize(width: 640, height: 150)
        grass.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        grass.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.075)
        
        playButton.size = CGSize(width: 174.15, height: 90.675)
        playButton.anchorPoint = CGPoint(x: 0, y: 0.5)
        playButton.position = CGPoint(x: self.frame.size.width * 0.31, y: self.frame.size.height * 0.43)
        
        gameCenterButton.size = CGSize(width: 174.15, height: 90.675)
        gameCenterButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gameCenterButton.position = CGPoint(x: self.frame.size.width * 0.59, y: self.frame.size.height * 0.43)
        
        settingsButton.size = CGSize(width: 174.15, height: 90.675)
        settingsButton.anchorPoint = CGPoint(x: 0, y: 0.5)
        settingsButton.position = CGPoint(x: self.frame.size.width * 0.31, y: self.frame.size.height * 0.25)
        
        storeButton.size = CGSize(width: 174.15, height: 90.675)
        storeButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        storeButton.position = CGPoint(x: self.frame.size.width * 0.59, y: self.frame.size.height * 0.25)
        
        crateDodgerLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.77)
        crateDodgerLabel.fontSize = 83
        crateDodgerLabel.text = "Crate Dodger"
        crateDodgerLabel.fontColor = SKColor.blackColor()
        
        removeAds.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.04)
        removeAds.fontSize = 83
        removeAds.text = "Remove Ads"
        removeAds.fontColor = SKColor.blackColor()
        
        
        if(SKPaymentQueue.canMakePayments()) {
            
            let productID: NSSet = NSSet(object: "net.treetopgames.cratedodger.removeads")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
            
            /*
            let productID:NSSet = NSSet(objects: "net.treetopgames.cratedodger.removeads")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<NSString>)
            request.delegate = self
            request.start()
            */
        }
        
        appLaunched = NSUserDefaults.standardUserDefaults().boolForKey("Launched")
        
        if appLaunched == false {
            NSUserDefaults.standardUserDefaults().setBool(weatherBool, forKey: "Weather")
            NSUserDefaults.standardUserDefaults().setBool(backgroundMusicBool, forKey: "Background")
            NSUserDefaults.standardUserDefaults().setBool(soundEffectBool, forKey: "Effects")
            appLaunched = true
            NSUserDefaults.standardUserDefaults().setBool(appLaunched, forKey: "Launched")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            backgroundTheme = "Day"
            NSUserDefaults.standardUserDefaults().setObject(backgroundTheme, forKey: "Background Theme")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        weatherBool = NSUserDefaults.standardUserDefaults().boolForKey("Weather")
        backgroundMusicBool = NSUserDefaults.standardUserDefaults().boolForKey("Background")
        soundEffectBool = NSUserDefaults.standardUserDefaults().boolForKey("Effects")
        
        authenticateLocalPlayer()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("Quick Actions") != nil {
            quickActions = NSUserDefaults.standardUserDefaults().objectForKey("Quick Actions") as! String
        }
        quickActions = "Nothing"
        NSUserDefaults.standardUserDefaults().setObject(quickActions, forKey: "Quick Actions")
        
        if quickActions == "Camera" {
            let crateDodger = CrateDodger(size: self.size)
            crateDodger.scaleMode = self.scaleMode
            self.view?.presentScene(crateDodger)
        } else if quickActions == "Photos" {
            let crateDodger = CrateDodger(size: self.size)
            crateDodger.scaleMode = self.scaleMode
            self.view?.presentScene(crateDodger)
        }
        
        backgroundTheme = (NSUserDefaults.standardUserDefaults().objectForKey("Background Theme") as? String)!
        
        
        if backgroundTheme == "Day" {
            if weatherBool == true {
                createWeather()
            }
        } else if backgroundTheme == "Night" {
            addMoon()
            grass.texture = SKTexture(imageNamed: "grassNight")
            crateDodgerLabel.fontColor = SKColor.whiteColor()
            if weatherBool == true {
                createWeather()
            }
            self.view?.scene?.backgroundColor = SKColor(red: 6 / 255, green: 6 / 255, blue: 6 / 255, alpha: 1)
        } else if backgroundTheme == "City" {
            cityBackground()
            if weatherBool == true {
                createWeather()
            }
        } else if backgroundTheme == "Desert" {
            self.view?.scene?.backgroundColor = SKColor(red: 16 / 255, green: 182 / 255, blue: 218 / 255, alpha: 1)
            addSun()
            grass.texture = SKTexture(imageNamed: "sand")
            grass.size = CGSize(width: 640, height: 360)
            grass.position.y = grass.frame.size.height * 0.5
        }
        
        removedAds = NSUserDefaults.standardUserDefaults().boolForKey("Removed Ads")
        
        if removedAds == true {
            removeAds.text = "Ads Removed"
        }
        
        crateDodgerLabel.zPosition = 99
        playButton.zPosition = 98
        gameCenterButton.zPosition = 98
        settingsButton.zPosition = 98
        storeButton.zPosition = 98
        removeAds.zPosition = 98
        grass.zPosition = 96
        
        self.addChild(grass)
        self.addChild(playButton)
        self.addChild(gameCenterButton)
        self.addChild(settingsButton)
        self.addChild(storeButton)
        self.addChild(crateDodgerLabel)
        self.addChild(removeAds)
        
        let scaleUp = SKAction.scaleBy(0.8, duration: 1)
        let sequence = SKAction.sequence([scaleUp, scaleUp.reversedAction()])
        crateDodgerLabel.runAction(SKAction.repeatActionForever(sequence))
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if playButton.containsPoint(location) {
                playTapSound()
                stopAudio()
                addLightingTimer.invalidate()
                let crateDodger = CrateDodger(size: self.size)
                crateDodger.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
                self.view?.presentScene(crateDodger, transition: reveal)
            } else if gameCenterButton.containsPoint(location) {
                playTapSound()
                choseLeaderboard()
            } else if settingsButton.containsPoint(location) {
                playTapSound()
                stopAudio()
                let settings = Settings(size: self.size)
                settings.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
                addLightingTimer.invalidate()
                self.view?.presentScene(settings, transition: reveal)
            } else if storeButton.containsPoint(location) {
                playTapSound()
                stopAudio()
                let store = Store(size: self.size)
                store.scaleMode = self.scaleMode
                let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
                self.view?.presentScene(store, transition: reveal)
                addLightingTimer.invalidate()
            } else if removeAds.containsPoint(location) {
                playTapSound()
                startRemovingAds()
            }
        }
    }
}
