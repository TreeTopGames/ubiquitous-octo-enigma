//
//  CrateDodger.swift
//  Crate Dodger
//
//  Created by Ben Loan on 4/4/15.
//  Copyright (c) 2015 TreeTop Games. All rights reserved.
//

import SpriteKit
import AVFoundation
import GameKit
import MobileCoreServices
import AudioToolbox
import iAd

class CrateDodger: SKScene, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GKGameCenterControllerDelegate {
    
    //MARK: Objects
    
    let grass = SKSpriteNode(imageNamed: "grassSunny")
    let crate = SKSpriteNode(imageNamed: "Crate")
    let crate2 = SKSpriteNode(imageNamed: "Crate")
    
    let background = SKSpriteNode(imageNamed: "CDCity")
    
    let tapToTakePhoto = SKLabelNode(fontNamed: "Spaceship Bullet")
    let tapToTakePhoto2 = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let pauseButton = SKSpriteNode(imageNamed: "Pause")
    let resumeLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let pauseRestartLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let pauseHomeLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let coin = SKSpriteNode(imageNamed: "coin")
    let armor = SKSpriteNode(imageNamed: "CDArmor")
    let coinIcon = SKSpriteNode(imageNamed: "coin")
    let megaCoin = SKSpriteNode(imageNamed: "MegaCoin")
    let coinMagnet = SKSpriteNode(imageNamed: "CDMagnet")
    let powerUpIcon = SKSpriteNode(imageNamed: "CDMagnet")
    let bigCoinMagnet = SKSpriteNode(imageNamed: "CDMagnet")
    
    let powerUpCountDownLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let dodger = SKSpriteNode()
    
    let cloud = SKSpriteNode(imageNamed: "RainCloud")
    let cloud2 = SKSpriteNode(imageNamed: "RainCloud")
    let moon = SKSpriteNode(imageNamed: "fullMoon")
    let sun = SKSpriteNode(imageNamed: "sun")
    
    let rainLeft = SKEmitterNode(fileNamed: "Rain Left.sks")
    let rainLeft2 = SKEmitterNode(fileNamed: "Rain Left.sks")
    let rainRight = SKEmitterNode(fileNamed: "Rain Right.sks")
    let rainRight2 = SKEmitterNode(fileNamed: "Rain Right.sks")
    let snow = SKEmitterNode(fileNamed: "Snow.sks")
    let snow2 = SKEmitterNode(fileNamed: "Snow.sks")
    
    let countDownLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let coinCount = SKLabelNode(fontNamed: "Spaceship Bullet")
    let scoreLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let gameOverLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let gameOverScoreLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let gameOverHighScoreLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let gameOverRoundsPlayedLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let reviveRect = SKSpriteNode(imageNamed: "reviveRect")
    let revive = SKLabelNode(fontNamed: "Spaceship Bullet")
    let reviveByCoins = SKLabelNode(fontNamed: "Spaceship Bullet")
    let reviveByRevives = SKLabelNode(fontNamed: "Spaceship Bullet")
    let reviveCountDown = SKLabelNode(fontNamed: "Spaceship Bullet")
    let reviveCancel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let retry = SKSpriteNode(imageNamed: "playButton")
    let gameCenter = SKSpriteNode(imageNamed: "gameCenterButton")
    let home = SKSpriteNode(imageNamed: "home")
    let share = SKSpriteNode(imageNamed: "share")
    let gameOverRect = SKSpriteNode(imageNamed: "gameOverRect")
    
    //MARK: Varibles
    
    var score = 0
    var highScore = 0
    var coins = 0
    var pointForCoinToFall = 5
    var roundsPlayed = 0
    var timeLeftForRevive = 5
    var roundsPlayedSinceCoinMagnet = 0
    var pointForMegaCoinToFall = 0
    var pointForCoinMagnetToFall = 0
    var pointForArmorToFall = 0
    var timeLeftForPowerUp = 10
    var revives = 0
    var megaCoinValue = 5
    var coinValue = 1
    var scoreBoosters = 0
    
    var coinMagnetLevel = 0
    var megaCoinLevel = 0
    var armorLevel = 0
    
    var collectedCoin = false
    var collectedArmor = false
    var collectedCoinMagnet = false
    var collectedMegaCoin = false
    var collectedSlowMo = false
    
    var shouldTakePhoto = true
    var canTakePhoto = false
    var gameOverBool = false
    var shouldDrag = false
    var gamePlay = false
    var inPaused = false
    
    var isInRevive = false
    var revived = false
    
    var doubleCoins = false
    var adsRemoved = false
    
    var fallingSpeed: NSTimeInterval = 1.6
    var timeForPowerUps: NSTimeInterval = 10
    
    var timeToMoveCrateUp = NSTimer()
    
    var audioPlayer = AVAudioPlayer()
    
    var weatherType = 0
    var direction = 0
    var cloudGeneration = 0
    
    var timeLeftForGamePlay = 3
    
    var isSnowing = false
    var isRaining = false
    var playingSound = false
    var playingThunder = false
    
    var weatherBool = true
    var backgroundMusicBool = true
    var soundEffectBool = true
    
    var backgroundTheme = String()
    var leaderboardID = String()
    
    var rainPlayer = AVAudioPlayer()
    var thunderPlayer = AVAudioPlayer()
    
    var imagePicker = UIImagePickerController()
    
    var addMoreClouds = NSTimer()
    var addLightingTimer = NSTimer()
    var waitForSecondCrate = NSTimer()
    var countDownForRevive = NSTimer()
    var countDownForPowerUps = NSTimer()
    var countDownForGameTimer = NSTimer()
    var checkingForGameOverTimer = NSTimer()
    
    var retryPosition = CGPoint()
    var gameCenterPosition = CGPoint()
    var homePosition = CGPoint()
    var sharePosition = CGPoint()
    var gameOverRectPosition = CGPoint()
    var gameOverPosition = CGPoint()
    var gameOverScorePosition = CGPoint()
    var gameOverHighScorePosition = CGPoint()
    var gameOverRoundsPlayedPosition = CGPoint()
    
    var quickActions: String = "Nothing"
    
    var gameArea = CGRect()
    
    override init(size: CGSize) {
        let maxAspectRatio:CGFloat = 16.0 / 9.0
        let playableWidth = size.height / maxAspectRatio
        let playableMargin = (size.width - playableWidth) / 2.0
        gameArea = CGRect(x: playableMargin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Ads
    
    func popUpAds() {
        adsRemoved = NSUserDefaults.standardUserDefaults().boolForKey("Removed Ads")
        if roundsPlayed % 5 == 0 && adsRemoved == false {

        }
    }
    
    func showBannerAds() {
        adsRemoved = NSUserDefaults.standardUserDefaults().boolForKey("Removed Ads")
        if adsRemoved == false {
            NSNotificationCenter.defaultCenter().postNotificationName("showadsID", object: nil)
        }
    }
    
    func hideBannerAds() {
        NSNotificationCenter.defaultCenter().postNotificationName("hideadsID", object: nil)
    }
    
    //MARK: Game Center
    
    func chooseLeaderboard() {
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
            popUpVC.sourceRect = CGRect(x: self.frame.size.width * 0.495, y: self.frame.size.height * 0.8, width: 1, height: 1)
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
    
    func saveRoundsPlayed(rounds:Int) {
        if GKLocalPlayer.localPlayer().authenticated {
            let roundsPlayedReporter = GKScore(leaderboardIdentifier: "net.treetopgames.cratedodger.leaderboard.roundsplayed")
            roundsPlayedReporter.value = Int64(roundsPlayed)
            let roundsPlayedArray: [GKScore] = [roundsPlayedReporter]
            GKScore.reportScores(roundsPlayedArray, withCompletionHandler: { (error: NSError?) -> Void in
                if error != nil {
                    print("error")
                }
            })
        }
    }
    
    func saveCoins(coin:Int) {
        if GKLocalPlayer.localPlayer().authenticated {
            let coinsReporter = GKScore(leaderboardIdentifier: "net.treetopgames.cratedodger.leaderboard.wealth")
            coinsReporter.value = Int64(coins)
            let coinsArray: [GKScore] = [coinsReporter]
            GKScore.reportScores(coinsArray, withCompletionHandler: { (error: NSError?) -> Void in
                if error != nil {
                    print("error")
                }
            })
        }
    }
    
    func saveHighscore(score:Int) {
        if GKLocalPlayer.localPlayer().authenticated {
            let scoreReporter = GKScore(leaderboardIdentifier: "net.treetopgames.cratedodger.leaderboard")
            scoreReporter.value = Int64(highScore)
            let scoreArray: [GKScore] = [scoreReporter]
            GKScore.reportScores(scoreArray, withCompletionHandler: { (error: NSError?) -> Void in
                if error != nil {
                    print("error")
                }
            })
        }
    }
    
    //MARK: Game Over
    
    func restart() {
        score = 0
        scoreLabel.text = "0"
        
        choosePowerUp()
        showBannerAds()
        
        gameOverLabel.removeAllActions()
        gameOverLabel.runAction(SKAction.scaleTo(1, duration: 0.5))
        
        reviveCountDown.text = "5"
        
        pointForCoinToFall = 5
        
        crate2.hidden = true
        
        gameOverBool = false
        
        let cratePosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + crate.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - crate.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - crate.frame.size.height * 0.5)
        
        crate.position = cratePosition
        crate2.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height - crate2.frame.size.height * 0.5)
        
        let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.5)
        
        gameOverLabel.runAction(fadeOut)
        gameOverScoreLabel.runAction(fadeOut)
        gameOverHighScoreLabel.runAction(fadeOut)
        gameOverRoundsPlayedLabel.runAction(fadeOut)

        retry.runAction(fadeOut)
        gameCenter.runAction(fadeOut)
        home.runAction(fadeOut)
        share.runAction(fadeOut)
        gameOverRect.runAction(fadeOut)
        
        checkingForGameOverTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(CrateDodger.checkForGameOver), userInfo: nil, repeats: true)

        startCountDown()
    }
    
    func homePressed() {
        addLightingTimer.invalidate()
        
        let home = GameScene(size: self.size)
        home.scaleMode = self.scaleMode
        let reveal = SKTransition.doorsCloseVerticalWithDuration(1)
        self.view?.presentScene(home, transition: reveal)
        
        if playingSound == true {
            rainPlayer.stop()
        }
        
        if playingThunder == true {
            thunderPlayer.stop()
        }
    }
    
    func sharePressed() {
        var points = "points"
        if score == 1 {
            points = "point"
        }
        let textToShare = "Wow! I just scored \(score) \(points) in Crate Dodger."
        
        if let myWebsite = NSURL(string: "http://www.appstore.com/cratedodger/") {
            
            let activityViewController = UIActivityViewController(activityItems: [textToShare, myWebsite], applicationActivities: nil)
            
            if activityViewController.respondsToSelector(Selector("popoverPresentationController")) {
                activityViewController.popoverPresentationController?.sourceView = view
                activityViewController.popoverPresentationController?.sourceRect = CGRect(x: self.frame.size.width * 0.495, y: self.frame.size.height * 1.1, width: 1, height: 1)
                self.view?.window?.rootViewController?.presentViewController(activityViewController, animated: true, completion: nil)
            } else {
                self.view?.window?.rootViewController?.presentViewController(activityViewController, animated: true, completion: nil)
            }
        }
    }
    
    func askForScoreBoosters() {
        let alert = UIAlertController(title: "Do You Want To Use a Score Booster?", message: "The Score Booster will add 5 point to your score. You have \(scoreBoosters) left.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler:  nil))
        
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction) -> Void in
            self.scoreBoosters -= 1
            NSUserDefaults.standardUserDefaults().setInteger(self.scoreBoosters, forKey: "Score Boosters")
            NSUserDefaults.standardUserDefaults().synchronize()
            self.score += 5
            self.gameOverScoreLabel.text = "Score: \(self.score)"
            
            if self.score > self.highScore {
                self.highScore = self.score
                self.gameOverHighScoreLabel.text = "High Score: \(self.highScore)"
                NSUserDefaults.standardUserDefaults().setInteger(self.highScore, forKey: "HighScore")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }))
        
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    func displayGameOver() {
        
        if gamePlay == false && gameOverBool == false {
            hideBannerAds()
            
            scoreBoosters = NSUserDefaults.standardUserDefaults().integerForKey("Score Boosters")
            
            if scoreBoosters >= 1 {
                askForScoreBoosters()
            }
            
            if backgroundMusicBool == true {
                audioPlayer.stop()
            }
            
            countDownForPowerUps.invalidate()
            
            collectedCoinMagnet = false
            collectedArmor = false
            
            bigCoinMagnet.hidden = true
            
            isInRevive = false
            revived = false
            gameOverBool = true
        
            fallingSpeed = 1.6
            timeLeftForRevive = 5
            timeLeftForPowerUp = 10
            
            powerUpIcon.hidden = true
            powerUpCountDownLabel.hidden = true
            powerUpCountDownLabel.text = "10"
        
            roundsPlayed += 1
            NSUserDefaults.standardUserDefaults().setInteger(roundsPlayed, forKey: "Rounds")
            gameOverRoundsPlayedLabel.text = "Rounds Played: \(roundsPlayed)"
            saveRoundsPlayed(roundsPlayed)
        
            popUpAds()
            
            retry.alpha = 1
            home.alpha = 1
            gameCenter.alpha = 1
            share.alpha = 1
            gameOverRect.alpha = 1
            gameOverLabel.alpha = 1
            gameOverScoreLabel.alpha = 1
            gameOverHighScoreLabel.alpha = 1
            gameOverRoundsPlayedLabel.alpha = 1
        
            let retryMove = SKAction.moveTo(retryPosition, duration: 1)
            let homeMove = SKAction.moveTo(homePosition, duration: 1)
            let gameCenterMove = SKAction.moveTo(gameCenterPosition, duration: 1)
            let shareMove = SKAction.moveTo(sharePosition, duration: 1)
            let gameOverRectMove = SKAction.moveTo(gameOverRectPosition, duration: 1)
            let gameOverMove = SKAction.moveTo(gameOverPosition, duration: 1)
            let gameOverScoreMove = SKAction.moveTo(gameOverScorePosition, duration: 1)
            let gameOverHighScoreMove = SKAction.moveTo(gameOverHighScorePosition, duration: 1)
            let gameOverRoundsPlayedMove = SKAction.moveTo(gameOverRoundsPlayedPosition, duration: 1)
            
            let scaleUp = SKAction.scaleBy(0.8, duration: 1)
            let sequence = SKAction.sequence([scaleUp, scaleUp.reversedAction()])
        
            retry.runAction(retryMove)
            home.runAction(homeMove)
            gameCenter.runAction(gameCenterMove)
            share.runAction(shareMove)
            gameOverRect.runAction(gameOverRectMove)
            gameOverLabel.runAction(SKAction.sequence([gameOverMove, SKAction.repeatActionForever(sequence)]))
            gameOverScoreLabel.runAction(gameOverScoreMove)
            gameOverHighScoreLabel.runAction(gameOverHighScoreMove)
            gameOverRoundsPlayedLabel.runAction(gameOverRoundsPlayedMove)
        }
        
        let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.5)
        
        revive.runAction(fadeOut)
        reviveRect.runAction(fadeOut)
        reviveCancel.runAction(fadeOut)
        reviveByCoins.runAction(fadeOut)
        reviveByRevives.runAction(fadeOut)
        reviveCountDown.runAction(fadeOut)
    }
    
    func continueGamePlay() {
        gameOverBool = false
        isInRevive = false
        
        let cratePosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + crate.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - crate.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - crate.frame.size.height * 0.5)
        
        crate.position = cratePosition
        
        crate2.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height - crate2.frame.size.height * 0.5)
        
        let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.5)
        
        revive.runAction(fadeOut)
        reviveRect.runAction(fadeOut)
        reviveCancel.runAction(fadeOut)
        reviveByCoins.runAction(fadeOut)
        reviveByRevives.runAction(fadeOut)
        reviveCountDown.runAction(fadeOut)
        
        showBannerAds()
        
        checkingForGameOverTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(CrateDodger.checkForGameOver), userInfo: nil, repeats: true)
        startCountDown()
    }
    
    func countDownForGameOverScreen() {
        if timeLeftForRevive > 0 {
            timeLeftForRevive -= 1
            reviveCountDown.text = "\(timeLeftForRevive)"
        } else {
            displayGameOver()
            countDownForRevive.invalidate()
        }
    }
    
    func gameOver() {
        gamePlay = false
        
        crate.removeAllActions()
        crate2.removeAllActions()
        coin.removeAllActions()
        coinMagnet.removeAllActions()
        megaCoin.removeAllActions()
        armor.removeAllActions()
        shouldDrag = false
        checkingForGameOverTimer.invalidate()
        timeToMoveCrateUp.invalidate()
        
        
        coin.hidden = true
        pauseButton.hidden = true
        coinMagnet.hidden = true
        megaCoin.hidden = true
        armor.hidden = true
        
        coin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        coinMagnet.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        megaCoin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        armor.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        
        retry.position.x = CGRectGetMinX(self.frame)
        home.position.x = CGRectGetMinX(self.frame)
        gameCenter.position.x = CGRectGetMaxX(self.frame)
        share.position.x = CGRectGetMaxX(self.frame)
        
        gameOverLabel.position.y = CGRectGetMaxY(self.frame)
        gameOverRect.position.y = CGRectGetMinY(self.frame)
        gameOverScoreLabel.position.y = CGRectGetMinY(self.frame)
        gameOverHighScoreLabel.position.y = CGRectGetMinY(self.frame)
        gameOverRoundsPlayedLabel.position.y = CGRectGetMinY(self.frame)
        
        highScore = NSUserDefaults.standardUserDefaults().integerForKey("HighScore")
        
        if score > highScore {
            highScore = score
            NSUserDefaults.standardUserDefaults().setInteger(highScore, forKey: "HighScore")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        saveHighscore(highScore)
        
        gameOverScoreLabel.text = "Score: \(score)"
        gameOverHighScoreLabel.text = "High Score: \(highScore)"
        
        if backgroundMusicBool == true {
            audioPlayer.pause()
        }
        
        let fadeIn = SKAction.fadeAlphaTo(1.0, duration: 0.5)
        
        scoreLabel.hidden = true
        
        reviveByRevives.text = "Revives(x\(revives))"
        
        if revived == false && isInRevive == false {
            revive.runAction(fadeIn)
            reviveRect.runAction(fadeIn)
            reviveCancel.runAction(fadeIn)
            reviveByCoins.runAction(fadeIn)
            reviveByRevives.runAction(fadeIn)
            reviveCountDown.runAction(fadeIn)
            isInRevive = true
            revived = true
            countDownForRevive = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(CrateDodger.countDownForGameOverScreen), userInfo: nil, repeats: true)
        } else {
            displayGameOver()
        }
    }
    
    //MARK: Photo
    
    func getSavedPhoto() {
        
    }
    
    func photoLibary() {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = true
        
        print("Choose Photo Library")
        
        self.view?.window?.rootViewController?.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func chooseCamera() {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Front) != nil && canTakePhoto == true {
            canTakePhoto = false
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.Front
            imagePicker.allowsEditing = false
            imagePicker.mediaTypes = [kUTTypeImage as String]
            self.view?.window?.rootViewController?.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    func choosePhoto() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction) -> Void in
            self.canTakePhoto = true
            self.chooseCamera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Camera Roll", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction) -> Void in
            self.photoLibary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        if let popUpVC = actionSheet.popoverPresentationController {
            popUpVC.permittedArrowDirections = .Up
            popUpVC.sourceView = self.view
            popUpVC.sourceRect = CGRect(x: self.frame.size.width * 0.375, y: self.frame.size.height * 0.5, width: 1, height: 1)
        }
        
        self.view!.window!.rootViewController!.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage

        dodger.texture = SKTexture(image: image)
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        tapToTakePhoto.removeAllActions()
        tapToTakePhoto2.removeAllActions()
        
        crate.hidden = false
        shouldTakePhoto = false
        tapToTakePhoto.hidden = true
        tapToTakePhoto2.hidden = true
        
        checkingForGameOverTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(CrateDodger.checkForGameOver), userInfo: nil, repeats: true)
        
        startCountDown()
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        showBannerAds()
    }
    
    func savePhoto() {
        
    }
    
    //MARK: Game Play
    
    func endSlowMo() {
        fallingSpeed *= 0.5
        
        crate.removeAllActions()
        crate2.removeAllActions()
        
        let cratePosition = crate.position.y / self.frame.size.height
        let distanceLeft = cratePosition - 0.15
        var timeLeftForFalling = CGFloat(fallingSpeed)
        timeLeftForFalling *= distanceLeft
        
        if score > 100 {
            let crate2Position = crate2.position.y / self.frame.size.height
            let distanceLeft2 = crate2Position - 0.15
            var timeLeftForFalling2 = CGFloat(fallingSpeed)
            timeLeftForFalling2 *= distanceLeft2
            let falling2 = SKAction.moveTo(CGPoint(x: crate2.position.x, y: self.frame.size.height * 0.15), duration: NSTimeInterval(timeLeftForFalling2))
            crate2.runAction(falling2)
        }
        
        let falling = SKAction.moveTo(CGPoint(x: crate.position.x, y: self.frame.size.height * 0.15), duration: NSTimeInterval(timeLeftForFalling))
        crate.runAction(falling)
    }
    
    func startSlowMo() {
        crate.removeAllActions()
        
        let cratePosition = crate.position.y / self.frame.size.height
        let distanceLeft = cratePosition - 0.15
        var timeLeftForFalling = CGFloat(fallingSpeed)
        timeLeftForFalling *= distanceLeft
        
        let falling = SKAction.moveTo(CGPoint(x: crate.position.x, y: self.frame.size.height * 0.15), duration: NSTimeInterval(timeLeftForFalling))
        crate.runAction(falling)
    }
    
    func startCrateAfterPause() {
        let cratePosition = crate.position.y / self.frame.size.height
        let distanceLeft = cratePosition - 0.15
        var timeLeftForFalling = CGFloat(fallingSpeed)
        timeLeftForFalling *= distanceLeft
        
        if score > 100 {
            let crate2Position = crate2.position.y / self.frame.size.height
            let distanceLeft2 = crate2Position - 0.15
            var timeLeftForFalling2 = CGFloat(fallingSpeed)
            timeLeftForFalling2 *= distanceLeft2
            let falling2 = SKAction.moveTo(CGPoint(x: crate2.position.x, y: self.frame.size.height * 0.15), duration: NSTimeInterval(timeLeftForFalling2))
            crate2.runAction(falling2)
        }
        
        let falling = SKAction.moveTo(CGPoint(x: crate.position.x, y: self.frame.size.height * 0.15), duration: NSTimeInterval(timeLeftForFalling))
        crate.runAction(falling)
    }
    
    func pauseRestart() {
        score = 0
        scoreLabel.text = "0"
        
        choosePowerUp()
        
        pointForCoinToFall = 5
        
        crate2.hidden = true
        
        let cratePosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + crate.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - crate.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - crate.frame.size.height * 0.5)
        
        crate.position = cratePosition
        crate2.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height - crate2.frame.size.height * 0.5)
        
        checkingForGameOverTimer.invalidate()
        checkingForGameOverTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(CrateDodger.checkForGameOver), userInfo: nil, repeats: true)
        
        startCountDown()

    }
    
    func resume() {
        inPaused = false
        resumeLabel.hidden = true
        pauseHomeLabel.hidden = true
        pauseRestartLabel.hidden = true
        scoreLabel.hidden = false
        reviveRect.alpha = 0
        
        if collectedCoinMagnet == true || collectedMegaCoin == true || collectedArmor == true || collectedSlowMo == true {
            countDownForPowerUps = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(CrateDodger.powerUpCountDown), userInfo: nil, repeats: true)
        }
        
        if backgroundMusicBool == true {
            audioPlayer.play()
        }
        
        if isRaining == true {
            rainPlayer.play()
        }
        
        startCrateAfterPause()
    }
    
    func pause() {
        crate.removeAllActions()
        crate2.removeAllActions()
        shouldDrag = false
        inPaused = true
        resumeLabel.hidden = false
        pauseHomeLabel.hidden = false
        pauseRestartLabel.hidden = false
        scoreLabel.hidden = true
        reviveRect.alpha = 1
        
        countDownForPowerUps.invalidate()
        
        if backgroundMusicBool == true {
            audioPlayer.pause()
        }
        
        if isRaining == true {
            rainPlayer.pause()
        }
    }
    
    func startCountDown() {
        let fadeOut = SKAction.fadeAlphaTo(0, duration: 0.5)
        let fadeIn = SKAction.fadeAlphaTo(1, duration: 0.5)
        let sequence = SKAction.sequence([fadeIn, fadeOut])
        
        let shrink = SKAction.scaleBy(0.8, duration: 0.5)
        let sequence2 = SKAction.sequence([shrink.reversedAction(), shrink])
        
        countDownLabel.runAction(SKAction.repeatActionForever(sequence))
        countDownLabel.runAction(SKAction.repeatActionForever(sequence2))
        
        countDownForGameTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(CrateDodger.countDownForGame), userInfo: nil, repeats: true)
    }
    
    func countDownForGame() {
        if timeLeftForGamePlay > 1 {
            timeLeftForGamePlay -= 1
            countDownLabel.text = "\(timeLeftForGamePlay)"
        } else {
            countDownForGameTimer.invalidate()
            countDownLabel.removeAllActions()
            countDownLabel.alpha = 0
            timeLeftForGamePlay = 3
            countDownLabel.text = "3"
            startFalling()
            gamePlay = true
            shouldDrag = true
            scoreLabel.hidden = false
            pauseButton.hidden = false
            if score >= 100 {
                waitForSecondCrate = NSTimer.scheduledTimerWithTimeInterval(fallingSpeed / 2, target: self, selector: #selector(CrateDodger.startSecondCrate), userInfo: nil, repeats: false)
            }
            
            if revived == true {
                if backgroundMusicBool == true {
                    audioPlayer.play()
                }
            } else {
                playBackgroundMusic()
            }
            
        }
    }
    
    func playBackgroundMusic() {
        if backgroundMusicBool == true {
            let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("CDMusic", ofType: "wav")!)
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
        }
    }
    
    func checkDodgerPosition() {
        
        if dodger.position.x >= CGRectGetMaxY(gameArea) {
            dodger.position.x = CGRectGetMaxY(gameArea)
        }
            
        if dodger.position.x <= CGRectGetMinX(gameArea) {
            dodger.position.x = CGRectGetMinX(gameArea)
        }
    }
    
    func powerUpCountDown() {
        if timeLeftForPowerUp > 0 {
            timeLeftForPowerUp -= 1
            powerUpCountDownLabel.text = "\(timeLeftForPowerUp)"
        } else {
            collectedArmor = false
            collectedCoinMagnet = false
            powerUpIcon.hidden = true
            powerUpCountDownLabel.hidden = true
            bigCoinMagnet.hidden = true
            countDownForPowerUps.invalidate()
            timeLeftForPowerUp = 10
            powerUpCountDownLabel.text = "10"
        }
    }
    
    func choosePowerUp() {
        var item = Int(arc4random_uniform(UInt32(100)))
        item += 1
        
        var point = Int(arc4random_uniform(UInt32(25)))
        point += 1
        
        print("\(point)")
        
        pointForCoinMagnetToFall = 0
        pointForMegaCoinToFall = 0
        pointForArmorToFall = 0
        
        coinMagnetLevel = NSUserDefaults.standardUserDefaults().integerForKey("Coin Magnet Level")
        megaCoinLevel = NSUserDefaults.standardUserDefaults().integerForKey("Mega Coin Level")
        armorLevel = NSUserDefaults.standardUserDefaults().integerForKey("Armor Level")
        
        if coinMagnetLevel == 0 {
            coinMagnetLevel = 1
            NSUserDefaults.standardUserDefaults().setInteger(coinMagnetLevel, forKey: "Coin Magnet Level")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        if megaCoinLevel == 0 {
            megaCoinLevel = 1
            NSUserDefaults.standardUserDefaults().setInteger(megaCoinLevel, forKey: "Mega Coin Level")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        if armorLevel == 0 {
            armorLevel = 1
            NSUserDefaults.standardUserDefaults().setInteger(armorLevel, forKey: "Armor Level")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        var coinMagnetNumbers:[Range<Int>] = []
        var megaCoinNumbers:[Range<Int>] = []
        var armorNumbers:[Range<Int>] = []
        
        if coinMagnetLevel == 1 {
            coinMagnetNumbers = [1...4]
        } else if coinMagnetLevel == 2 {
            coinMagnetNumbers = [1...8]
        } else if coinMagnetLevel == 3 {
            coinMagnetNumbers = [1...15]
        } else if coinMagnetLevel == 4 {
            coinMagnetNumbers = [1...25]
        } else if coinMagnetLevel == 5 {
            coinMagnetNumbers = [1...33]
        }
    
        if megaCoinLevel == 1 {
            megaCoinNumbers = [34...38]
        } else if coinMagnetLevel == 2 {
            megaCoinNumbers = [34...42]
        } else if coinMagnetLevel == 3 {
            megaCoinNumbers = [34...49]
        } else if coinMagnetLevel == 4 {
            megaCoinNumbers = [34...59]
        } else if coinMagnetLevel == 5 {
            megaCoinNumbers = [34...66]
        }
        
        if armorLevel == 1 {
            armorNumbers = [67...71]
        } else if armorLevel == 2 {
            armorNumbers = [67...75]
        } else if armorLevel == 3 {
            armorNumbers = [67...82]
        } else if armorLevel == 4 {
            armorNumbers = [67...92]
        } else if armorLevel == 5 {
            armorNumbers = [67...100]
        }
        
        for select in coinMagnetNumbers {
            if select.contains(item){
                pointForCoinMagnetToFall = point
                print("Coin Magnet")
                
                if coinMagnetLevel == 1 {
                    timeLeftForPowerUp = 10
                } else if coinMagnetLevel == 2 {
                    timeLeftForPowerUp = 25
                } else if coinMagnetLevel == 3 {
                    timeLeftForPowerUp = 50
                } else if coinMagnetLevel == 4 {
                    timeLeftForPowerUp = 75
                } else if coinMagnetLevel == 5 {
                    timeLeftForPowerUp = 100
                }
            }
        }
        
        for select in megaCoinNumbers {
            if select.contains(item) {
                pointForMegaCoinToFall = point
                print("Mega Coin")
                
                if megaCoinLevel == 1 {
                    megaCoinValue = 5
                } else if megaCoinLevel == 2 {
                    megaCoinValue = 10
                } else if megaCoinLevel == 3 {
                    megaCoinValue = 25
                } else if megaCoinLevel == 4 {
                    megaCoinValue = 50
                } else if megaCoinLevel == 5 {
                    megaCoinValue = 100
                }
            }
        }
        
        for select in armorNumbers {
            if select.contains(item) {
                pointForArmorToFall = point
                print("Armor")
                
                if armorLevel == 1 {
                    timeLeftForPowerUp = 10
                } else if armorLevel == 2 {
                    timeLeftForPowerUp = 25
                } else if armorLevel == 3 {
                    timeLeftForPowerUp = 50
                } else if armorLevel == 4 {
                    timeLeftForPowerUp = 75
                } else if armorLevel == 5 {
                    timeLeftForPowerUp = 100
                }
            }
        }
        
        if doubleCoins == true {
            megaCoinValue *= 2
        }
        
        powerUpCountDownLabel.text = "\(timeLeftForPowerUp)"
    }
    
    func whenToHaveCoinFall() {
        var pointAmount = Int(arc4random_uniform(UInt32(4)))
        pointAmount += 3
        
        pointForCoinToFall = score + pointAmount
    }
    
    func armorFall() {
        collectedArmor = false
        
        let armorPosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + armor.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - armor.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - armor.frame.size.height * 0.5)
        
        armor.position = armorPosition
        
        armor.hidden = false
        
        let falling = SKAction.moveTo(CGPoint(x: armor.position.x, y: self.frame.size.height * 0.15), duration: 1)
        armor.runAction(falling)

    }
    
    func megaCoinFall() {
        collectedMegaCoin = false
        
        let megaCoinPosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + megaCoin.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - megaCoin.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - megaCoin.frame.size.height * 0.5)
        
        megaCoin.position = megaCoinPosition
        
        megaCoin.hidden = false
        
        let falling = SKAction.moveTo(CGPoint(x: megaCoin.position.x, y: self.frame.size.height * 0.15), duration: 1)
        megaCoin.runAction(falling)

    }
    
    func coinMagnetFall() {
        collectedCoinMagnet = false
        
        let coinMagnetPosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + coinMagnet.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - coinMagnet.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - coinMagnet.frame.size.height * 0.5)
        
        coinMagnet.position = coinMagnetPosition
        
        coinMagnet.hidden = false
    
        let falling = SKAction.moveTo(CGPoint(x: coinMagnet.position.x, y: self.frame.size.height * 0.15), duration: 1)
        coinMagnet.runAction(falling)
    }
    
    func coinFall() {
        collectedCoin = false
        
        let coinPosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + coin.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - coin.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - coin.frame.size.height * 0.5)
        
        coin.position = coinPosition
        
        coin.hidden = false
    
        let runCode = SKAction.runBlock({
            if self.collectedCoin == false {
                if self.coin.position.y < self.frame.size.height * 0.75 {
                    let falling = SKAction.moveTo(CGPoint(x: self.coin.position.x, y: self.frame.size.height * 0.15), duration: 0.5)
                    self.coin.runAction(falling)
                }
            }
        })
        
        if collectedCoinMagnet == false {
            let falling = SKAction.moveTo(CGPoint(x: coin.position.x, y: self.frame.size.height * 0.15), duration: 1)
            coin.runAction(falling)
        } else {
            let falling = SKAction.moveTo(bigCoinMagnet.position, duration: 1)
            coin.runAction(SKAction.sequence([falling, runCode]))
        }
        
    }
    
    func startFallingForCrate2() {
        if isInRevive == false || gameOverBool == false {
            crate2.hidden = false
            let falling = SKAction.moveTo(CGPoint(x: crate2.position.x, y: self.frame.size.height * 0.15), duration: fallingSpeed)
            crate2.runAction(falling)
        }
    }
    
    func startFalling() {
        if isInRevive == false || gameOverBool == false {
            crate.hidden = false
            let falling = SKAction.moveTo(CGPoint(x: crate.position.x, y: self.frame.size.height * 0.15), duration: fallingSpeed)
            crate.runAction(falling)
            timeToMoveCrateUp.invalidate()
            timeToMoveCrateUp = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(CrateDodger.checkToMoveCrateUp), userInfo: nil, repeats: true)
        }
    }
    
    func checkForGameOver() {
        if collectedArmor == false {
            if CGRectIntersectsRect(crate.frame, dodger.frame) {
                timeToMoveCrateUp.invalidate()
                gameOver()
            }
        
            if CGRectIntersectsRect(crate2.frame, dodger.frame) {
                timeToMoveCrateUp.invalidate()
                gameOver()
            }
        } else {
            if CGRectIntersectsRect(crate.frame, dodger.frame) {
                crate.hidden = true
            }
            
            if CGRectIntersectsRect(crate2.frame, dodger.frame) {
                crate2.hidden = true
            }
        }
        
        if CGRectIntersectsRect(coin.frame, dodger.frame) && collectedCoin == false {
            collectedCoin = true
            coins += coinValue
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            coinCount.text = "\(coins)"
            saveCoins(coins)
            coin.removeAllActions()
            coin.hidden = true
            coin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        }
        
        if CGRectIntersectsRect(coin.frame, bigCoinMagnet.frame) && collectedCoinMagnet == true && collectedCoin == false {
            collectedCoin = true
            coins += coinValue
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            coinCount.text = "\(coins)"
            saveCoins(coins)
            coin.removeAllActions()
            coin.hidden = true
            coin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        }
        
        if CGRectIntersectsRect(coinMagnet.frame, dodger.frame) && collectedCoinMagnet == false {
            collectedCoinMagnet = true
            coinMagnet.removeAllActions()
            powerUpIcon.texture = SKTexture(imageNamed: "CDMagnet")
            powerUpIcon.hidden = false
            powerUpCountDownLabel.hidden = false
            bigCoinMagnet.hidden = false
            coinMagnet.hidden = true
            coinMagnet.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
            countDownForPowerUps = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(CrateDodger.powerUpCountDown), userInfo: nil, repeats: true)
        }
        
        if CGRectIntersectsRect(megaCoin.frame, dodger.frame) && collectedMegaCoin == false {
            collectedMegaCoin = true
            megaCoin.removeAllActions()
            megaCoin.hidden = true
            megaCoin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
            coins += megaCoinValue
            coinCount.text = "\(coins)"
            saveCoins(coins)
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        if CGRectIntersectsRect(armor.frame, dodger.frame) && collectedArmor == false {
            collectedArmor = true
            armor.removeAllActions()
            armor.hidden = true
            powerUpIcon.texture = SKTexture(imageNamed: "CDArmor")
            powerUpIcon.hidden = false
            powerUpCountDownLabel.hidden = false
            armor.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
            countDownForPowerUps = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(CrateDodger.powerUpCountDown), userInfo: nil, repeats: true)
        }
    }
    
    func checkToMoveCrateUp() {
        
        if crate.position.y <= self.frame.size.height * 0.15 {
            moveCrateUp()
        }
        
        if crate2.position.y <= self.frame.size.height * 0.15 {
            moveCrate2Up()
        }
        
        if coin.position.y <= self.frame.size.height * 0.15 {
            coin.hidden = true
            coin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        }
        
        if coinMagnet.position.y <= self.frame.size.height * 0.15 {
            coinMagnet.hidden = true
            coinMagnet.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        }
        
        if megaCoin.position.y <= self.frame.size.height * 0.15 {
            megaCoin.hidden = true
            megaCoin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        }
        
        if armor.position.y <= self.frame.size.height * 0.15 {
            armor.hidden = true
            armor.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        }
    }
    
    func moveCrate2Up() {
        crate2.removeAllActions()
        
        score += 1
        scoreLabel.text = "\(score)"
        
        if score == pointForCoinToFall {
            coinFall()
            whenToHaveCoinFall()
        }
        
        if score == pointForCoinMagnetToFall {
            coinMagnetFall()
        }
        
        let cratePosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + crate2.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - crate2.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - crate2.frame.size.height * 0.5)
        
        crate2.position = cratePosition
        startFallingForCrate2()
    }
    
    func moveCrateUp() {
        
        crate.removeAllActions()
        
        score += 1
        scoreLabel.text = "\(score)"
        
        if fallingSpeed > 0.75 {
            fallingSpeed -= 0.01
        }
        
        if score == 100 {
            waitForSecondCrate = NSTimer.scheduledTimerWithTimeInterval(fallingSpeed / 2, target: self, selector: #selector(CrateDodger.startSecondCrate), userInfo: nil, repeats: false)
        }

        if score == pointForCoinToFall {
            coinFall()
            whenToHaveCoinFall()
        }
        
        if score == pointForCoinMagnetToFall {
            coinMagnetFall()
        }
        
        if score == pointForMegaCoinToFall {
            megaCoinFall()
        }
        
        if score == pointForArmorToFall {
            armorFall()
        }
        
        let cratePosition = CGPoint(x: random(min: CGRectGetMinX(gameArea) + crate.frame.size.width * 0.5, max: CGRectGetMaxX(gameArea) - crate.frame.size.width * 0.5), y: CGRectGetMaxY(self.frame) - crate.frame.size.height * 0.5)

        crate.position = cratePosition
        startFalling()
    }
    
    func startSecondCrate() {
        crate2.hidden = false
        startFallingForCrate2()
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
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
            }
            
            do {
                thunderPlayer = try AVAudioPlayer(contentsOfURL: alertSound)
            } catch _ {
                print("error")
            }
            thunderPlayer.numberOfLoops = 1
            thunderPlayer.prepareToPlay()
            thunderPlayer.play()
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
        flash.zPosition = 101
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
        
        addLightingTimer = NSTimer.scheduledTimerWithTimeInterval(time, target: self, selector: #selector(CrateDodger.lighting), userInfo: nil, repeats: true)
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
        
        if soundEffectBool == true  && playingSound == false {
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
                rainPlayer = try AVAudioPlayer(contentsOfURL: alertSound)
            } catch _{
                print("error")
            }
            rainPlayer.numberOfLoops = -1
            rainPlayer.prepareToPlay()
            rainPlayer.play()
            playingSound = true
        }
    }
    
    func moveSecondCloudBack() {
        cloud2.removeAllActions()
        rainRight2!.removeAllActions()
        rainLeft2!.removeAllActions()
        snow2!.removeAllActions()
        
        addMoreClouds.invalidate()
        addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.moveFirstCloudBack), userInfo: nil, repeats: false)
        
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
        addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.moveSecondCloudBack), userInfo: nil, repeats: false)
        
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
        cloud2.zPosition = 98
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
        cloud.zPosition = 98
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
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.moveFirstCloudBack), userInfo: nil, repeats: false)
        } else if weatherType == 2 {
            //Snow
            addSecondCloud()
            addSecondSnow()
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.moveFirstCloudBack), userInfo: nil, repeats: false)
        } else if weatherType == 3 {
            //Storm
            addSecondCloud()
            addSecondRain()
            cloud2.texture = SKTexture(imageNamed: "StormCloud")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.moveFirstCloudBack), userInfo: nil, repeats: false)
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
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.createSecondWeather), userInfo: nil, repeats: false)
        } else if weatherType == 2 {
            //Snow
            addCloud()
            addSnow()
            grass.texture = SKTexture(imageNamed: "grassSnow")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.createSecondWeather), userInfo: nil, repeats: false)
        } else if weatherType == 3 {
            //Storm
            addCloud()
            addLightingAndThunder()
            cloud.texture = SKTexture(imageNamed: "StormCloud")
            addMoreClouds = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(cloudGeneration), target: self, selector: #selector(CrateDodger.createSecondWeather), userInfo: nil, repeats: false)
        } else if weatherType == 4 {
            //Sunny Day
        }
        
        if backgroundTheme == "Day" || backgroundTheme == "City"{
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
        background.xScale = 4.1
        background.yScale = 4.1
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        background.zPosition = 1
        self.addChild(background)
    }
    
    //MARK: Override Functions
    
    func notEnoughCoins() {
        let alert = UIAlertController(title: "Not Enough Coins", message: "You do not have enough coins to continue.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    func notEnoughRevives() {
        let alert = UIAlertController(title: "Not Enough Revives", message: "You do not have enough revives to continue.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    func firstLaunch() {
        let alert = UIAlertController(title: "Welcome to Crate Dodger!", message: "Would you like to see How to Play?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler:  nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction) -> Void in
            self.hideBannerAds()
            let howToPlay = HowToPlay(size: self.size)
            howToPlay.scaleMode = self.scaleMode
            let reveal = SKTransition.doorsOpenVerticalWithDuration(1)
            self.view?.presentScene(howToPlay, transition: reveal)
        }))
        
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor(red: 50 / 255, green: 203 / 255, blue: 212 / 255, alpha: 1)
        revives = NSUserDefaults.standardUserDefaults().integerForKey("Revives")
        
        grass.size = CGSize(width: 640, height: 150)
        grass.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        grass.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.075)
        
        tapToTakePhoto.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.75)
        tapToTakePhoto.fontSize = 90
        tapToTakePhoto.text = "Tap to Take"
        tapToTakePhoto.fontColor = SKColor.blackColor()
        
        tapToTakePhoto2.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.65)
        tapToTakePhoto2.fontSize = 90
        tapToTakePhoto2.text = "a Selfie"
        tapToTakePhoto2.fontColor = SKColor.blackColor()
        
        crate.size = CGSize(width: 80, height: 80)
        crate.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        crate.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height - crate.frame.size.height * 0.5)
        
        crate2.size = CGSize(width: 80, height: 80)
        crate2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        crate2.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height - crate.frame.size.height * 0.5)
        
        coin.size = CGSize(width: 60, height: 60)
        coin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        
        pauseButton.size = CGSize(width: 60, height: 60)
        pauseButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pauseButton.position = CGPoint(x: self.frame.size.width * 0.335, y: self.frame.size.height * 0.935)
        
        resumeLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.65)
        resumeLabel.fontSize = 60
        resumeLabel.text = "Resume"
        resumeLabel.fontColor = SKColor.blackColor()
        
        pauseRestartLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        pauseRestartLabel.fontSize = 60
        pauseRestartLabel.text = "Restart"
        pauseRestartLabel.fontColor = SKColor.blackColor()
        
        pauseHomeLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.35)
        pauseHomeLabel.fontSize = 60
        pauseHomeLabel.text = "Home"
        pauseHomeLabel.fontColor = SKColor.blackColor()
        
        armor.size = CGSize(width: 80, height: 80)
        armor.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        armor.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        
        megaCoin.size = CGSize(width: 80, height: 80)
        megaCoin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        megaCoin.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        
        coinMagnet.size = CGSize(width: 100, height: 100)
        coinMagnet.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinMagnet.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame))
        
        bigCoinMagnet.size = CGSize(width: 120, height: 120)
        bigCoinMagnet.zRotation = CGFloat(M_PI / 1.0)
        bigCoinMagnet.anchorPoint =  CGPoint(x: 0.5, y: 0.5)
        bigCoinMagnet.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        coinIcon.size = CGSize(width: 40, height: 40)
        coinIcon.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinIcon.position = CGPoint(x: self.frame.size.width * 0.6175, y: self.frame.size.height * 0.95)
        
        powerUpIcon.size = CGSize(width: 50, height: 50)
        powerUpIcon.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        powerUpIcon.position = CGPoint(x: self.frame.size.width * 0.6175, y: self.frame.size.height * 0.875)
        
        powerUpCountDownLabel.position = CGPoint(x: self.frame.size.width * 0.675, y: self.frame.size.height * 0.8625)
        powerUpCountDownLabel.fontSize = 30
        powerUpCountDownLabel.text = "10"
        powerUpCountDownLabel.fontColor = SKColor.blackColor()
        
        coinCount.position = CGPoint(x: self.frame.size.width * 0.675, y: self.frame.size.height * 0.9375)
        coinCount.fontSize = 30
        coinCount.text = "0"
        coinCount.fontColor = SKColor.blackColor()
        
        dodger.size = CGSize(width: 134, height: 134)
        dodger.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.2)
        
        scoreLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.75)
        scoreLabel.fontSize = 75
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.blackColor()
        
        countDownLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        countDownLabel.fontSize = 100
        countDownLabel.text = "3"
        countDownLabel.fontColor = SKColor.blackColor()
        
        //Revive
        
        reviveRect.size = CGSize(width: 312, height: 500)
        reviveRect.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        reviveRect.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        
        revive.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) + reviveRect.frame.size.height * 0.2)
        revive.fontSize = 60
        revive.text = "Continue By:"
        revive.fontColor = SKColor.blackColor()
        
        reviveByCoins.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        reviveByCoins.fontSize = 60
        reviveByCoins.text = "25 Coins"
        reviveByCoins.fontColor = SKColor.blackColor()
        
        reviveByRevives.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - reviveRect.frame.size.height * 0.2)
        reviveByRevives.fontSize = 55
        reviveByRevives.text = "Revives(x\(revives))"
        reviveByRevives.fontColor = SKColor.blackColor()
        
        reviveCountDown.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) + reviveRect.frame.size.height * 0.325)
        reviveCountDown.fontSize = 70
        reviveCountDown.text = "5"
        reviveCountDown.fontColor = SKColor.blackColor()
        
        reviveCancel.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - reviveRect.frame.size.height * 0.4)
        reviveCancel.fontSize = 70
        reviveCancel.text = "Cancel"
        reviveCancel.fontColor = SKColor.blackColor()
        
        //Game Over
        
        gameOverLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.85)
        gameOverLabel.fontSize = 90
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontColor = SKColor.blackColor()
        
        gameOverScoreLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.675)
        gameOverScoreLabel.fontSize = 50
        gameOverScoreLabel.text = "Score: 0"
        gameOverScoreLabel.fontColor = SKColor.blackColor()

        gameOverHighScoreLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.55)
        gameOverHighScoreLabel.fontSize = 50
        gameOverHighScoreLabel.text = "High Score: 0"
        gameOverHighScoreLabel.fontColor = SKColor.blackColor()
        
        gameOverRoundsPlayedLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.475)
        gameOverRoundsPlayedLabel.fontSize = 30
        gameOverRoundsPlayedLabel.text = "Rounds Played: 0"
        gameOverRoundsPlayedLabel.fontColor = SKColor.blackColor()
        
        gameOverRect.size = CGSize(width: 400, height: 250)
        gameOverRect.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gameOverRect.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.6)
        
        retry.size = CGSize(width: 174.15, height: 90.675)
        retry.anchorPoint = CGPoint(x: 0, y: 0.5)
        retry.position = CGPoint(x: self.frame.size.width * 0.31, y: self.frame.size.height * 0.3)
        
        gameCenter.size = CGSize(width: 174.15, height: 90.675)
        gameCenter.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gameCenter.position = CGPoint(x: self.frame.size.width * 0.59, y: self.frame.size.height * 0.3)
        
        home.size = CGSize(width: 174.15, height: 90.675)
        home.anchorPoint = CGPoint(x: 0, y: 0.5)
        home.position = CGPoint(x: self.frame.size.width * 0.31, y: self.frame.size.height * 0.1)
        
        share.size = CGSize(width: 174.15, height: 90.675)
        share.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        share.position = CGPoint(x: self.frame.size.width * 0.59, y: self.frame.size.height * 0.1)
        
        gameOverScoreLabel.zPosition = 100
        gameOverHighScoreLabel.zPosition = 100
        gameOverRoundsPlayedLabel.zPosition = 100
        revive.zPosition = 100
        reviveByCoins.zPosition = 100
        reviveByRevives.zPosition = 100
        reviveCancel.zPosition = 100
        reviveCountDown.zPosition = 100
        resumeLabel.zPosition = 100
        pauseRestartLabel.zPosition = 100
        pauseHomeLabel.zPosition = 100
        tapToTakePhoto.zPosition = 99
        tapToTakePhoto2.zPosition = 99
        gameOverLabel.zPosition = 99
        retry.zPosition = 99
        gameCenter.zPosition = 99
        home.zPosition = 99
        share.zPosition = 99
        gameOverRect.zPosition = 99
        reviveRect.zPosition = 99
        scoreLabel.zPosition = 99
        powerUpIcon.zPosition = 99
        powerUpCountDownLabel.zPosition = 99
        dodger.zPosition = 97
        grass.zPosition = 96
        pauseButton.zPosition = 96
        crate.zPosition = 5
        crate2.zPosition = 5
        coin.zPosition = 5
        coinMagnet.zPosition = 5
        megaCoin.zPosition = 5
        armor.zPosition = 5
        
        weatherBool = NSUserDefaults.standardUserDefaults().boolForKey("Weather")
        backgroundMusicBool = NSUserDefaults.standardUserDefaults().boolForKey("Background")
        soundEffectBool = NSUserDefaults.standardUserDefaults().boolForKey("Effects")
        
        roundsPlayed = NSUserDefaults.standardUserDefaults().integerForKey("Rounds")
        gameOverRoundsPlayedLabel.text = "Rounds Played: \(roundsPlayed)"
        
        if roundsPlayed == 0 {
            firstLaunch()
        }
        
        backgroundTheme = NSUserDefaults.standardUserDefaults().objectForKey("Background Theme") as! String
        
        if backgroundTheme == "Day" {
            if weatherBool == true {
                createWeather()
            }
        } else if backgroundTheme == "Night" {
            addMoon()
            grass.texture = SKTexture(imageNamed: "grassNight")
            countDownLabel.fontColor = SKColor.whiteColor()
            powerUpCountDownLabel.fontColor = SKColor.whiteColor()
            tapToTakePhoto.fontColor = SKColor.whiteColor()
            tapToTakePhoto2.fontColor = SKColor.whiteColor()
            coinCount.fontColor = SKColor.whiteColor()
            scoreLabel.fontColor = SKColor.whiteColor()
            gameOverLabel.fontColor = SKColor.whiteColor()
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

        coins = NSUserDefaults.standardUserDefaults().integerForKey("Coins")
        coinCount.text = "\(coins)"
        
        doubleCoins = NSUserDefaults.standardUserDefaults().boolForKey("Double Coins")
        
        if doubleCoins == true {
            coinValue = 2
        }
        
        choosePowerUp()
        showBannerAds()
        
        self.addChild(coin)
        self.addChild(grass)
        self.addChild(armor)
        self.addChild(crate)
        self.addChild(crate2)
        self.addChild(dodger)
        self.addChild(megaCoin)
        self.addChild(coinIcon)
        self.addChild(coinCount)
        self.addChild(coinMagnet)
        self.addChild(scoreLabel)
        self.addChild(pauseButton)
        self.addChild(resumeLabel)
        self.addChild(pauseHomeLabel)
        self.addChild(pauseRestartLabel)

        self.addChild(powerUpIcon)
        self.addChild(bigCoinMagnet)
        self.addChild(tapToTakePhoto)
        self.addChild(tapToTakePhoto2)
        self.addChild(powerUpCountDownLabel)
        
        self.addChild(countDownLabel)
        
        self.addChild(retry)
        self.addChild(gameCenter)
        self.addChild(home)
        self.addChild(share)
        self.addChild(gameOverLabel)
        self.addChild(gameOverRect)
        self.addChild(gameOverScoreLabel)
        self.addChild(gameOverHighScoreLabel)
        self.addChild(gameOverRoundsPlayedLabel)
        
        self.addChild(revive)
        self.addChild(reviveRect)
        self.addChild(reviveCancel)
        self.addChild(reviveByCoins)
        self.addChild(reviveByRevives)
        self.addChild(reviveCountDown)
        
        let scaleUp = SKAction.scaleBy(0.8, duration: 1)
        let sequence = SKAction.sequence([scaleUp, scaleUp.reversedAction()])
        tapToTakePhoto.runAction(SKAction.repeatActionForever(sequence))
        tapToTakePhoto2.runAction(SKAction.repeatActionForever(sequence))
        
        countDownLabel.alpha = 0
        
        retryPosition = retry.position
        gameCenterPosition = gameCenter.position
        homePosition = home.position
        sharePosition = share.position
        gameOverRectPosition = gameOverRect.position
        gameOverPosition = gameOverLabel.position
        gameOverScorePosition = gameOverScoreLabel.position
        gameOverHighScorePosition = gameOverHighScoreLabel.position
        gameOverRoundsPlayedPosition = gameOverRoundsPlayedLabel.position
        
        scoreLabel.hidden = true
        
        gameOverLabel.alpha = 0
        gameOverScoreLabel.alpha = 0
        gameOverHighScoreLabel.alpha = 0
        gameOverRoundsPlayedLabel.alpha = 0

        gameOverRect.alpha = 0
        retry.alpha = 0
        gameCenter.alpha = 0
        home.alpha = 0
        share.alpha = 0
        
        crate.hidden = true
        crate2.hidden = true
        coin.hidden = true
        armor.hidden = true
        megaCoin.hidden = true
        coinMagnet.hidden = true
        powerUpIcon.hidden = true
        pauseButton.hidden = true
        bigCoinMagnet.hidden = true
        resumeLabel.hidden = true
        pauseHomeLabel.hidden = true
        pauseRestartLabel.hidden = true
        powerUpCountDownLabel.hidden = true
        
        revive.alpha = 0
        reviveRect.alpha = 0
        reviveCancel.alpha = 0
        reviveByCoins.alpha = 0
        reviveByRevives.alpha = 0
        reviveCountDown.alpha = 0
        
        quickActionsFunction()
        
    }
    
    func quickActionsFunction() {
        
        if NSUserDefaults.standardUserDefaults().objectForKey("Quick Actions") != nil {
            quickActions = NSUserDefaults.standardUserDefaults().objectForKey("Quick Actions") as! String
        }
        
        quickActions = "Photos"
        
        if quickActions == "Camera" {
            chooseCamera()
        } else if quickActions == "Photos" {
            photoLibary()
        }

    }
    
    func playTapSound() {
        if soundEffectBool == true {
            let tapSound = SKAction.playSoundFileNamed("TapSound.wav", waitForCompletion: false)
            runAction(tapSound)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if dodger.containsPoint(location) && gamePlay == true && inPaused == false {
                shouldDrag = true
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if shouldDrag == true {
                dodger.position.x = location.x
                checkDodgerPosition()
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        shouldDrag = false
        
        print(inPaused)
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if shouldTakePhoto == true {
                playTapSound()
                choosePhoto()
            }
            
            if gameOverBool == true {
                if retry.containsPoint(location) {
                    playTapSound()
                    restart()
                } else if gameCenter.containsPoint(location) {
                    playTapSound()
                    chooseLeaderboard()
                } else if home.containsPoint(location) {
                    playTapSound()
                    homePressed()
                } else if share.containsPoint(location) {
                    playTapSound()
                    sharePressed()
                }
            }
            
            if inPaused == true {
                if resumeLabel.containsPoint(location) {
                    resume()
                } else if pauseRestartLabel.containsPoint(location) {
                    inPaused = false
                    
                    reviveRect.alpha = 0
                    resumeLabel.hidden = true
                    pauseHomeLabel.hidden = true
                    pauseRestartLabel.hidden = true
                    pauseRestart()
                } else if pauseHomeLabel.containsPoint(location) {
                    homePressed()
                }
            }
            
            if gamePlay == true {
                if pauseButton.containsPoint(location) {
                    pause()
                }
            }
            
            if isInRevive == true {
                if reviveByCoins.containsPoint(location) {
                    playTapSound()
                    if coins >= 25 {
                        coins -= 25
                        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
                        saveCoins(coins)
                        coinCount.text = "\(coins)"
                        continueGamePlay()
                        countDownForRevive.invalidate()
                    } else if coins < 25 {
                        notEnoughCoins()
                    }
                } else if reviveByRevives.containsPoint(location) {
                    playTapSound()
                    if revives >= 1 {
                        revives -= 1
                        NSUserDefaults.standardUserDefaults().setInteger(revives, forKey: "Revives")
                        continueGamePlay()
                        countDownForRevive.invalidate()
                    } else {
                        notEnoughRevives()
                    }
                } else if reviveCancel.containsPoint(location) {
                    playTapSound()
                    displayGameOver()
                    countDownForRevive.invalidate()
                }
            }
        }
    }
}