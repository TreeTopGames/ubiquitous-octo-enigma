//
//  Store.swift
//  Crate Dodger
//
//  Created by Ben Loan on 4/19/15.
//  Copyright (c) 2015 TreeTop Games. All rights reserved.
//

import SpriteKit
import StoreKit
import GameKit
import MessageUI

class Store: SKScene, SKProductsRequestDelegate, SKPaymentTransactionObserver, MFMailComposeViewControllerDelegate {
    
    let backButton = SKSpriteNode(imageNamed: "backButton")
    let redStatusBar = SKSpriteNode(imageNamed: "logoRed")
    let coinMagnet = SKSpriteNode(imageNamed: "CDMagnet")
    let megaCoin = SKSpriteNode(imageNamed: "MegaCoin")
    let armor = SKSpriteNode(imageNamed: "CDArmor")
    let slowMo = SKSpriteNode(imageNamed: "CDSlowMo")
    let dock = SKSpriteNode(imageNamed: "logoRed")
    let coinIcon = SKSpriteNode(imageNamed: "coin")
    let upgradesOnDock = SKSpriteNode(imageNamed: "CDUpgradesBlue")
    let utilitesOnDock = SKSpriteNode(imageNamed: "CDUtilites")
    let globeOnDock = SKSpriteNode(imageNamed: "CDGlobe")
    let moreCoinsOnDock = SKSpriteNode(imageNamed: "CDMoney")
    let freeCoinsOnDock = SKSpriteNode(imageNamed: "CDFreeMoney")
    let coinMagnetlvl1 = SKSpriteNode(imageNamed: "CDLevelDisplayerYellow")
    let coinMagnetlvl2 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let coinMagnetlvl3 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let coinMagnetlvl4 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let coinMagnetlvl5 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let megaCoinlvl1 = SKSpriteNode(imageNamed: "CDLevelDisplayerYellow")
    let megaCoinlvl2 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let megaCoinlvl3 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let megaCoinlvl4 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let megaCoinlvl5 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let armorlvl1 = SKSpriteNode(imageNamed: "CDLevelDisplayerYellow")
    let armorlvl2 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let armorlvl3 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let armorlvl4 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let armorlvl5 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let slowMolvl1 = SKSpriteNode(imageNamed: "CDLevelDisplayerYellow")
    let slowMolvl2 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let slowMolvl3 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let slowMolvl4 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    let slowMolvl5 = SKSpriteNode(imageNamed: "CDLevelDisplayer")
    
    let coinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let DayTimePreview = SKSpriteNode(imageNamed: "DayTime")
    let NightTimePreview = SKSpriteNode(imageNamed: "NightTime")
    let DesertPreview = SKSpriteNode(imageNamed: "Desert")
    let CityPreview = SKSpriteNode(imageNamed: "City")
    let BeachPreview = SKSpriteNode(imageNamed: "Beach")
    
    let DayTimeLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let DayTimePriceLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let DayTimeSelectLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let NightTimeLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let NightTimePriceLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let NightTimeSelectLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let DesertLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let DesertPriceLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let DesertSelectLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let CityLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let CityPriceLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let CitySelectLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let BeachLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let BeachPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let BeachSelectLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let RevivesImage = SKSpriteNode(imageNamed: "CDRevive")
    let ScoreBoosterImage = SKSpriteNode(imageNamed: "ScoreBooster")
    
    let RevivesLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let RevivesBuyLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let RevivesPriceLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let RevivesCountLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let RevivesDescriptionLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let ScoreBoosterLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let ScoreBoosterBuyLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let ScoreBoosterPriceLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let ScoreBoosterCountLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let ScoreBoosterDescriptionLabel  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let ScoreBoosterDescriptionLabel2 = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let twitter  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let twitter10  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let facebook  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let facebook10  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let instagram  = SKLabelNode(fontNamed: "Spaceship Bullet")
    let instagram10 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let feedback = SKLabelNode(fontNamed: "Spaceship Bullet")
    let feedback10 = SKLabelNode(fontNamed: "Spaceship Bullet")
    let Review = SKLabelNode(fontNamed: "Spaceship Bullet")
    let Review10 = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let upgradesOnDockLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let utilitesOnDockLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let globeOnDockLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let moreCoinsOnDockLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let freeCoinsOnDockLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let storeLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let doubleCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let doubleCoinsDescriptionLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let doubleCoinsPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let pileOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let pileOfCoinsAmountOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let pileOfCoinsPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let bagOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let bagOfCoinsAmountOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let bagOfCoinsPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let crateOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let crateOfCoinsAmountOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let crateOfCoinsPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let chestOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let chestOfCoinsAmountOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let chestOfCoinsPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let shipOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let shipOfCoinsAmountOfCoinsLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let shipOfCoinsPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    let coinMagnetLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let coinMagnetUpgradeLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let coinMagnetDescriptionLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let coinMagnetPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let megaCoinLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let megaCoinUpgradeLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let megaCoinDescriptionLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let megaCoinPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let armorLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let armorUpgradeLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let armorDescriptionLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let armorPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let slowMoLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let slowMoUpgradeLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let slowMoDescriptionLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    let slowMoPriceLabel = SKLabelNode(fontNamed: "Spaceship Bullet")
    
    var loadingAlert = UIAlertController()
    
    var doubleCoinsRect = CGRect()
    var pileOfCoinsRect = CGRect()
    var bagOfCoinsRect = CGRect()
    var crateOfCoinsRect = CGRect()
    var chestOfCoinsRect = CGRect()
    var shipOfCoinsRect = CGRect()
    
    var twitterRect = CGRect()
    var facebookRect = CGRect()
    var instagramRect = CGRect()
    var feedbackRect = CGRect()
    var rateRect = CGRect()
    
    //MARK: Varibles
    
    var coins = 0
    
    var coinMagnetLevel = 1
    var megaCoinLevel = 1
    var armorLevel = 1
    
    var RevivesCount = 0
    var ScoreBoosterCount = 0
    
    var lvl2Cost = 25
    var lvl3Cost = 100
    var lvl4Cost = 2500
    var lvl5Cost = 5000
    
    var inUpgrades = true
    var inGetMoreCoins = false
    var inGetFreeCoins = false
    var inMaps = false
    var inUtilities = false
    
    var boughtNight = false
    var boughtDesert = false
    var boughtCity = false
    
    var didTwitter = false
    var didFacebook = false
    var didInstagram = false
    var didFeedback = false
    var didRate = false
    
    var isDaySelected = false
    var isNightSelected = false
    var isDesertSelected = false
    var isCitySelected = false
    
    var doubledCoins = false
    
    var loadingIAP = false
    var scrolled = false
    
    var soundEffectsBool = false
    
    var distanceFromTouches = CGFloat()
    
    var firstTouchPosition = CGPoint()
    var movedTouchPosition = CGPoint()
    
    var maxPositionForMaps = CGFloat()
    var minPositionForMaps = CGFloat()
    
    var maxPositionForUpgrades = CGFloat()
    var minPositionForUpgrades = CGFloat()
    
    var backgroundTheme = String()
    
    var list = [SKProduct]()
    var p = SKProduct()
    
    //MARK: Leaderboard
    
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
    
    //MARK: IAPs
    
    func setUpIAPS() {
        if(SKPaymentQueue.canMakePayments()) {
            print("IAP is enabled, loading")
            let productID:NSSet = NSSet(objects: "net.treetopgames.double", "net.treetopgames.coins.pile", "net.treetopgames.coins.bag", "net.treetopgames.coins.crate", "net.treetopgames.coins.chest", "net.treetopgames.coins.ship")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        } else {
            print("please enable IAPS")
        }
    }
    
    func startDoubleCoins() {
        if loadingIAP == false && doubledCoins == false {
            loadingIAP = true
            loading()
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "net.treetopgames.double") {
                    p = product
                    buyProduct()
                    break
                }
            }
        }
    }
    
    func startPileOfCoins() {
        if loadingIAP == false {
            loadingIAP = true
            loading()
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "net.treetopgames.coins.pile") {
                    p = product
                    buyProduct()
                    break
                }
            }
        }
    }
    
    func startBagOfCoins() {
        if loadingIAP == false {
            loadingIAP = true
            loading()
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "net.treetopgames.coins.bag") {
                    p = product
                    buyProduct()
                    break
                }
            }
        }
    }
    
    func startCrateOfCoins() {
        if loadingIAP == false {
            loadingIAP = true
            loading()
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "net.treetopgames.coins.crate") {
                    p = product
                    buyProduct()
                    break
                }
            }
        }
    }
    
    func startChestOfCoins() {
        if loadingIAP == false {
            loadingIAP = true
            loading()
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "net.treetopgames.coins.chest") {
                    p = product
                    buyProduct()
                    break
                }
            }
        }
    }
    
    func startShipOfCoins() {
        if loadingIAP == false {
            loadingIAP = true
            loading()
            for product in list {
                let prodID = product.productIdentifier
                if(prodID == "net.treetopgames.coins.ship") {
                    p = product
                    buyProduct()
                    break
                }
            }
        }
    }
    
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.defaultQueue().addTransactionObserver(self)
        SKPaymentQueue.defaultQueue().addPayment(pay as SKPayment)
        loadingAlert.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func productsRequest(request: SKProductsRequest, didReceiveResponse response: SKProductsResponse) {
        print("product request")
        let myProduct = response.products
        
        for product in myProduct {
            print("product added")
            print(product.productIdentifier)
            print(product.localizedTitle)
            print(product.localizedDescription)
            print(product.price)
            
            list.append(product )
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(queue: SKPaymentQueue) {
        print("transactions restored")
        
        //let purchasedItemIDS = []
        for transaction in queue.transactions {
            let t: SKPaymentTransaction = transaction 
            
            let prodID = t.payment.productIdentifier as String
            
            switch prodID {
            case "net.treetopgames.double":
                print("Double Coins")
                addDoubleCoins()
            default:
                print("IAP not setup")
            }
            
        }
    }
    
    
    func paymentQueue(queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add paymnet")
        
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            print(trans.error)
            
            switch trans.transactionState {
                
            case .Purchased:
                print("buy, ok unlock iap here")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier as String
                switch prodID {
                case "net.treetopgames.double":
                    print("Double Coins")
                    addDoubleCoins()
                    break
                case "net.treetopgames.coins.pile":
                    print("Pile of Coins")
                    addPileOfCoins()
                    break
                case "net.treetopgames.coins.bag":
                    print("Bag of Coins")
                    addBagOfCoins()
                    break
                case "net.treetopgames.coins.crate":
                    print("Crate of Coins")
                    addCrateOfCoins()
                    break
                    
                case "net.treetopgames.coins.chest":
                    print("Chest of Coins")
                    addChestOfCoins()
                    break
                case "net.treetopgames.coins.ship":
                    print("Ship of Coins")
                    addShipOfCoins()
                    break
                default:
                    print("IAP not setup")
                    break
                }
                
                queue.finishTransaction(trans)
                break
            case .Failed:
                print("buy error")
                queue.finishTransaction(trans)
                buyError()
                loadingIAP = false
                break
            default:
                print("default")
                break
                
            }
        }
    }
    
    func finishTransaction(trans:SKPaymentTransaction) {
        print("finish trans")
        SKPaymentQueue.defaultQueue().finishTransaction(trans)
    }
    func paymentQueue(queue: SKPaymentQueue, removedTransactions transactions: [SKPaymentTransaction]) {
        print("remove trans")
    }
    
    func addDoubleCoins() {
        doubledCoins = true
        NSUserDefaults.standardUserDefaults().setBool(doubledCoins, forKey: "Double Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        loadingIAP = false
        
        doubleCoinsPriceLabel.hidden = true
        doubleCoinsLabel.position.x = self.frame.size.width * 0.5
        doubleCoinsLabel.text = "Coins Doubled"
    }
    
    func addPileOfCoins() {
        coins += 100
        coinsLabel.text = "\(coins)"
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        saveCoins(coins)
        loadingIAP = false
    }
    
    func addBagOfCoins() {
        coins += 500
        coinsLabel.text = "\(coins)"
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        saveCoins(coins)
        loadingIAP = false
    }
    
    func addCrateOfCoins() {
        coins += 1250
        coinsLabel.text = "\(coins)"
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        saveCoins(coins)
        loadingIAP = false
    }
    
    func addChestOfCoins() {
        coins += 2500
        coinsLabel.text = "\(coins)"
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        saveCoins(coins)
        loadingIAP = false
    }
    
    func addShipOfCoins() {
        coins += 5000
        coinsLabel.text = "\(coins)"
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        saveCoins(coins)
        loadingIAP = false
    }
    
    func loading() {
        loadingAlert = UIAlertController(title: "Loading...", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        self.scene?.view?.window?.rootViewController?.presentViewController(loadingAlert, animated: true, completion: nil)
    }
    
    //MARK: Scroll Views
    
    func upgradesScrollView() {
        scrolled = true
        
        if slowMoLabel.position.y > minPositionForUpgrades && firstTouchPosition.y > movedTouchPosition.y {
            //Up
            distanceFromTouches = firstTouchPosition.y - movedTouchPosition.y
            
            coinMagnet.position.y -= distanceFromTouches
            coinMagnetLabel.position.y -= distanceFromTouches
            coinMagnetPriceLabel.position.y -= distanceFromTouches
            coinMagnetUpgradeLabel.position.y -= distanceFromTouches
            coinMagnetDescriptionLabel.position.y -= distanceFromTouches
            
            coinMagnetlvl1.position.y -= distanceFromTouches
            coinMagnetlvl2.position.y -= distanceFromTouches
            coinMagnetlvl3.position.y -= distanceFromTouches
            coinMagnetlvl4.position.y -= distanceFromTouches
            coinMagnetlvl5.position.y -= distanceFromTouches
            
            megaCoin.position.y -= distanceFromTouches
            megaCoinLabel.position.y -= distanceFromTouches
            megaCoinPriceLabel.position.y -= distanceFromTouches
            megaCoinUpgradeLabel.position.y -= distanceFromTouches
            megaCoinDescriptionLabel.position.y -= distanceFromTouches
            
            megaCoinlvl1.position.y -= distanceFromTouches
            megaCoinlvl2.position.y -= distanceFromTouches
            megaCoinlvl3.position.y -= distanceFromTouches
            megaCoinlvl4.position.y -= distanceFromTouches
            megaCoinlvl5.position.y -= distanceFromTouches
            
            armor.position.y -= distanceFromTouches
            armorLabel.position.y -= distanceFromTouches
            armorPriceLabel.position.y -= distanceFromTouches
            armorUpgradeLabel.position.y -= distanceFromTouches
            armorDescriptionLabel.position.y -= distanceFromTouches
            
            armorlvl1.position.y -= distanceFromTouches
            armorlvl2.position.y -= distanceFromTouches
            armorlvl3.position.y -= distanceFromTouches
            armorlvl4.position.y -= distanceFromTouches
            armorlvl5.position.y -= distanceFromTouches
            
            slowMo.position.y -= distanceFromTouches
            slowMoLabel.position.y -= distanceFromTouches
            slowMoPriceLabel.position.y -= distanceFromTouches
            slowMoUpgradeLabel.position.y -= distanceFromTouches
            slowMoDescriptionLabel.position.y -= distanceFromTouches
            
            slowMolvl1.position.y -= distanceFromTouches
            slowMolvl2.position.y -= distanceFromTouches
            slowMolvl3.position.y -= distanceFromTouches
            slowMolvl4.position.y -= distanceFromTouches
            slowMolvl5.position.y -= distanceFromTouches
        }
        
        if slowMoLabel.position.y < maxPositionForUpgrades && firstTouchPosition.y < movedTouchPosition.y {
            //Down
            distanceFromTouches = movedTouchPosition.y - firstTouchPosition.y
            
            coinMagnet.position.y += distanceFromTouches
            coinMagnetLabel.position.y += distanceFromTouches
            coinMagnetPriceLabel.position.y += distanceFromTouches
            coinMagnetUpgradeLabel.position.y += distanceFromTouches
            coinMagnetDescriptionLabel.position.y += distanceFromTouches
            
            coinMagnetlvl1.position.y += distanceFromTouches
            coinMagnetlvl2.position.y += distanceFromTouches
            coinMagnetlvl3.position.y += distanceFromTouches
            coinMagnetlvl4.position.y += distanceFromTouches
            coinMagnetlvl5.position.y += distanceFromTouches
            
            megaCoin.position.y += distanceFromTouches
            megaCoinLabel.position.y += distanceFromTouches
            megaCoinPriceLabel.position.y += distanceFromTouches
            megaCoinUpgradeLabel.position.y += distanceFromTouches
            megaCoinDescriptionLabel.position.y += distanceFromTouches
            
            megaCoinlvl1.position.y += distanceFromTouches
            megaCoinlvl2.position.y += distanceFromTouches
            megaCoinlvl3.position.y += distanceFromTouches
            megaCoinlvl4.position.y += distanceFromTouches
            megaCoinlvl5.position.y += distanceFromTouches
            
            armor.position.y += distanceFromTouches
            armorLabel.position.y += distanceFromTouches
            armorPriceLabel.position.y += distanceFromTouches
            armorUpgradeLabel.position.y += distanceFromTouches
            armorDescriptionLabel.position.y += distanceFromTouches
            
            armorlvl1.position.y += distanceFromTouches
            armorlvl2.position.y += distanceFromTouches
            armorlvl3.position.y += distanceFromTouches
            armorlvl4.position.y += distanceFromTouches
            armorlvl5.position.y += distanceFromTouches
            
            slowMo.position.y += distanceFromTouches
            slowMoLabel.position.y += distanceFromTouches
            slowMoPriceLabel.position.y += distanceFromTouches
            slowMoUpgradeLabel.position.y += distanceFromTouches
            slowMoDescriptionLabel.position.y += distanceFromTouches
            
            slowMolvl1.position.y += distanceFromTouches
            slowMolvl2.position.y += distanceFromTouches
            slowMolvl3.position.y += distanceFromTouches
            slowMolvl4.position.y += distanceFromTouches
            slowMolvl5.position.y += distanceFromTouches

        }

    }
    
    func utilitiesScrollVeiw() {
        
    }
    
    func mapsScrollView() {
        scrolled = true
        
        if BeachLabel.position.y > minPositionForMaps && firstTouchPosition.y > movedTouchPosition.y {
            //Up
            distanceFromTouches = firstTouchPosition.y - movedTouchPosition.y
            
            DayTimeLabel.position.y -= distanceFromTouches
            DayTimePriceLabel.position.y -= distanceFromTouches
            DayTimeSelectLabel.position.y -= distanceFromTouches
            DayTimePreview.position.y -= distanceFromTouches
            
            NightTimeLabel.position.y -= distanceFromTouches
            NightTimePriceLabel.position.y -= distanceFromTouches
            NightTimeSelectLabel.position.y -= distanceFromTouches
            NightTimePreview.position.y -= distanceFromTouches
            
            DesertLabel.position.y -= distanceFromTouches
            DesertPriceLabel.position.y -= distanceFromTouches
            DesertSelectLabel.position.y -= distanceFromTouches
            DesertPreview.position.y -= distanceFromTouches
            
            CityLabel.position.y -= distanceFromTouches
            CityPriceLabel.position.y -= distanceFromTouches
            CitySelectLabel.position.y -= distanceFromTouches
            CityPreview.position.y -= distanceFromTouches
            
            BeachLabel.position.y -= distanceFromTouches
            BeachPriceLabel.position.y -= distanceFromTouches
            BeachSelectLabel.position.y -= distanceFromTouches
            BeachPreview.position.y -= distanceFromTouches
        }
        
        if BeachLabel.position.y < maxPositionForMaps && firstTouchPosition.y < movedTouchPosition.y {
            //Down
            distanceFromTouches = movedTouchPosition.y - firstTouchPosition.y
            
            DayTimeLabel.position.y += distanceFromTouches
            DayTimePriceLabel.position.y += distanceFromTouches
            DayTimeSelectLabel.position.y += distanceFromTouches
            DayTimePreview.position.y += distanceFromTouches
            
            NightTimeLabel.position.y += distanceFromTouches
            NightTimePriceLabel.position.y += distanceFromTouches
            NightTimeSelectLabel.position.y += distanceFromTouches
            NightTimePreview.position.y += distanceFromTouches
            
            DesertLabel.position.y += distanceFromTouches
            DesertPriceLabel.position.y += distanceFromTouches
            DesertSelectLabel.position.y += distanceFromTouches
            DesertPreview.position.y += distanceFromTouches
            
            CityLabel.position.y += distanceFromTouches
            CityPriceLabel.position.y += distanceFromTouches
            CitySelectLabel.position.y += distanceFromTouches
            CityPreview.position.y += distanceFromTouches
            
            BeachLabel.position.y += distanceFromTouches
            BeachPriceLabel.position.y += distanceFromTouches
            BeachSelectLabel.position.y += distanceFromTouches
            BeachPreview.position.y += distanceFromTouches
        }

    }
    
    func moreCoinsScrollView() {
        
    }
    
    func freeCoinsScrollView() {
        
    }
    
    //MARK: FreeCoins
    
    func displayFreeCoins() {
        inUpgrades = false
        inGetMoreCoins = false
        inGetFreeCoins = true
        inMaps = false
        inUtilities = false
        
        storeLabel.text = "Free Coins"
        
        upgradesOnDock.texture = SKTexture(imageNamed: "CDUpgrades")
        upgradesOnDockLabel.fontColor = SKColor.blackColor()
        
        utilitesOnDock.texture = SKTexture(imageNamed: "CDUtilites")
        utilitesOnDockLabel.fontColor = SKColor.blackColor()
        
        globeOnDock.texture = SKTexture(imageNamed: "CDGlobe")
        globeOnDockLabel.fontColor = SKColor.blackColor()
        
        moreCoinsOnDock.texture = SKTexture(imageNamed: "CDMoney")
        moreCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        freeCoinsOnDock.texture = SKTexture(imageNamed: "CDFreeMoneyBlue")
        freeCoinsOnDockLabel.fontColor = SKColor(red: 24 / 255, green: 124 / 255, blue: 251 / 255, alpha: 1)
        
        coinMagnet.alpha = 0
        coinMagnetLabel.alpha = 0
        coinMagnetDescriptionLabel.alpha = 0
        coinMagnetUpgradeLabel.alpha = 0
        coinMagnetlvl1.alpha = 0
        coinMagnetlvl2.alpha = 0
        coinMagnetlvl3.alpha = 0
        coinMagnetlvl4.alpha = 0
        coinMagnetlvl5.alpha = 0
        
        megaCoin.alpha = 0
        megaCoinLabel.alpha = 0
        megaCoinDescriptionLabel.alpha = 0
        megaCoinUpgradeLabel.alpha = 0
        megaCoinlvl1.alpha = 0
        megaCoinlvl2.alpha = 0
        megaCoinlvl3.alpha = 0
        megaCoinlvl4.alpha = 0
        megaCoinlvl5.alpha = 0
        
        armor.alpha = 0
        armorLabel.alpha = 0
        armorDescriptionLabel.alpha = 0
        armorUpgradeLabel.alpha = 0
        armorlvl1.alpha = 0
        armorlvl2.alpha = 0
        armorlvl3.alpha = 0
        armorlvl4.alpha = 0
        armorlvl5.alpha = 0
        
        doubleCoinsLabel.alpha = 0
        doubleCoinsDescriptionLabel.alpha = 0
        doubleCoinsPriceLabel.alpha = 0
        pileOfCoinsLabel.alpha = 0
        pileOfCoinsAmountOfCoinsLabel.alpha = 0
        pileOfCoinsPriceLabel.alpha = 0
        bagOfCoinsLabel.alpha = 0
        bagOfCoinsAmountOfCoinsLabel.alpha = 0
        bagOfCoinsPriceLabel.alpha = 0
        crateOfCoinsLabel.alpha = 0
        crateOfCoinsAmountOfCoinsLabel.alpha = 0
        crateOfCoinsPriceLabel.alpha = 0
        chestOfCoinsLabel.alpha = 0
        chestOfCoinsAmountOfCoinsLabel.alpha = 0
        chestOfCoinsPriceLabel.alpha = 0
        shipOfCoinsLabel.alpha = 0
        shipOfCoinsAmountOfCoinsLabel.alpha = 0
        shipOfCoinsPriceLabel.alpha = 0
        
        facebook.alpha = 1
        facebook10.alpha = 1
        twitter.alpha = 1
        twitter10.alpha = 1
        instagram.alpha = 1
        instagram10.alpha = 1
        feedback.alpha = 1
        feedback10.alpha = 1
        Review.alpha = 1
        Review10.alpha = 1
        
        DayTimePreview.alpha = 0
        DayTimeLabel.alpha = 0
        DayTimePriceLabel.alpha = 0
        DayTimeSelectLabel.alpha = 0
        NightTimePreview.alpha = 0
        NightTimeLabel.alpha = 0
        NightTimePriceLabel.alpha = 0
        NightTimeSelectLabel.alpha = 0
        DesertPreview.alpha = 0
        DesertLabel.alpha = 0
        DesertPriceLabel.alpha = 0
        DesertSelectLabel.alpha = 0
        CityPreview.alpha = 0
        CityLabel.alpha = 0
        CityPriceLabel.alpha = 0
        CitySelectLabel.alpha = 0
        BeachPreview.alpha = 0
        BeachLabel.alpha = 0
        BeachPriceLabel.alpha = 0
        BeachSelectLabel.alpha = 0
        
        RevivesImage.alpha = 0
        RevivesLabel.alpha = 0
        RevivesBuyLabel.alpha = 0
        RevivesPriceLabel.alpha = 0
        RevivesCountLabel.alpha = 0
        ScoreBoosterImage.alpha = 0
        ScoreBoosterLabel.alpha = 0
        ScoreBoosterBuyLabel.alpha = 0
        ScoreBoosterPriceLabel.alpha = 0
        ScoreBoosterCountLabel.alpha = 0
        ScoreBoosterDescriptionLabel.alpha = 0
        ScoreBoosterDescriptionLabel2.alpha = 0
        RevivesDescriptionLabel.alpha = 0
        
        coinMagnetPriceLabel.alpha = 0
        megaCoinPriceLabel.alpha = 0
        armorPriceLabel.alpha = 0
        
        checkFreeCoins()
    }
    
    func showFacebook() {
        if didFacebook == false {
            UIApplication.sharedApplication().openURL(NSURL(string:"https://www.facebook.com/pages/TreeTop-Games/540085209461056")!)
            coins += 10
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            coinsLabel.text = "\(coins)"
            saveCoins(coins)
            
            didFacebook = true
            NSUserDefaults.standardUserDefaults().setBool(didFacebook, forKey: "Facebook")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            completedFreeCoins()
            
            facebook.alpha = 0.5
            facebook10.alpha = 0.5
        }
    }
    
    func showTwitter() {
        if didTwitter == false {
            UIApplication.sharedApplication().openURL(NSURL(string: "http://www.twitter.com/GamesTreeTop")!)
            coins += 10
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            coinsLabel.text = "\(coins)"
            saveCoins(coins)
            
            didTwitter = true
            NSUserDefaults.standardUserDefaults().setBool(didTwitter, forKey: "Twitter")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            completedFreeCoins()
            
            twitter.alpha = 0.5
            twitter10.alpha = 0.5
        }
    }
    
    func showInstagram() {
        if didInstagram == false {
            UIApplication.sharedApplication().openURL(NSURL(string:"http://instagram.com/treetopgames/")!)
            coins += 10
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            coinsLabel.text = "\(coins)"
            saveCoins(coins)
            
            didInstagram = true
            NSUserDefaults.standardUserDefaults().setBool(didInstagram, forKey: "Instagram")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            completedFreeCoins()
            
            instagram.alpha = 0.5
            instagram10.alpha = 0.5
        }
    }
    
    func showFeedback() {
        if didFeedback == false {
            emailFeedback()
        }
    }
    
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
    
    func showRate() {
        if didRate == false {
            UIApplication.sharedApplication().openURL(NSURL(string:"http://www.appstore.com/cratedodger")!)
            coins += 10
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            coinsLabel.text = "\(coins)"
            saveCoins(coins)
            
            didRate = true
            NSUserDefaults.standardUserDefaults().setBool(didRate, forKey: "Rate")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            completedFreeCoins()
            
            Review.alpha = 0.5
            Review10.alpha = 0.5
        }
    }
    
    func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError?) {
        
        var completed = false
        
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail Sent")
            completed = true
            coins += 10
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            coinsLabel.text = "\(coins)"
            saveCoins(coins)
            
            didFeedback = true
            NSUserDefaults.standardUserDefaults().setBool(didFeedback, forKey: "Feedback")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            feedback.alpha = 0.5
            feedback10.alpha = 0.5
        case MFMailComposeResultFailed.rawValue:
            print("Mail sent failure: \(error!.localizedDescription)")
        default:
            break
        }
        
        controller.dismissViewControllerAnimated(true, completion: nil)
        
        if completed == true {
            completedFreeCoins()
        }
        
    }
    
    func checkFreeCoins() {
        didTwitter = NSUserDefaults.standardUserDefaults().boolForKey("Twitter")
        didFacebook = NSUserDefaults.standardUserDefaults().boolForKey("Facebook")
        didInstagram = NSUserDefaults.standardUserDefaults().boolForKey("Instagram")
        didFeedback = NSUserDefaults.standardUserDefaults().boolForKey("Feedback")
        didRate = NSUserDefaults.standardUserDefaults().boolForKey("Rate")
        
        if didTwitter == true {
            twitter.alpha = 0.5
            twitter10.alpha = 0.5
        }
        
        if didFacebook == true {
            facebook.alpha = 0.5
            facebook10.alpha = 0.5
        }
        
        if didInstagram == true {
            instagram.alpha = 0.5
            instagram10.alpha = 0.5
        }
        
        if didFeedback == true {
            feedback.alpha = 0.5
            feedback10.alpha = 0.5
        }
        
        if didRate == true {
            Review.alpha = 0.5
            Review10.alpha = 0.5
        }
    }
    
    func completedFreeCoins() {
        let alert = UIAlertController(title: "Thank You", message: "You have earned 10 Coins.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        self.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK: More Coins
    
    func displayMoreCoins() {
        inUpgrades = false
        inGetMoreCoins = true
        inGetFreeCoins = false
        inMaps = false
        inUtilities = false
        
        storeLabel.text = "More Coins"
        
        upgradesOnDock.texture = SKTexture(imageNamed: "CDUpgrades")
        upgradesOnDockLabel.fontColor = SKColor.blackColor()
        
        utilitesOnDock.texture = SKTexture(imageNamed: "CDUtilites")
        utilitesOnDockLabel.fontColor = SKColor.blackColor()
        
        globeOnDock.texture = SKTexture(imageNamed: "CDGlobe")
        globeOnDockLabel.fontColor = SKColor.blackColor()
        
        moreCoinsOnDock.texture = SKTexture(imageNamed: "CDMoneyBlue")
        moreCoinsOnDockLabel.fontColor = SKColor(red: 24 / 255, green: 124 / 255, blue: 251 / 255, alpha: 1)
        
        freeCoinsOnDock.texture = SKTexture(imageNamed: "CDFreeMoney")
        freeCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        coinMagnet.alpha = 0
        coinMagnetLabel.alpha = 0
        coinMagnetDescriptionLabel.alpha = 0
        coinMagnetUpgradeLabel.alpha = 0
        coinMagnetlvl1.alpha = 0
        coinMagnetlvl2.alpha = 0
        coinMagnetlvl3.alpha = 0
        coinMagnetlvl4.alpha = 0
        coinMagnetlvl5.alpha = 0
        
        megaCoin.alpha = 0
        megaCoinLabel.alpha = 0
        megaCoinDescriptionLabel.alpha = 0
        megaCoinUpgradeLabel.alpha = 0
        megaCoinlvl1.alpha = 0
        megaCoinlvl2.alpha = 0
        megaCoinlvl3.alpha = 0
        megaCoinlvl4.alpha = 0
        megaCoinlvl5.alpha = 0
        
        armor.alpha = 0
        armorLabel.alpha = 0
        armorDescriptionLabel.alpha = 0
        armorUpgradeLabel.alpha = 0
        armorlvl1.alpha = 0
        armorlvl2.alpha = 0
        armorlvl3.alpha = 0
        armorlvl4.alpha = 0
        armorlvl5.alpha = 0
        
        doubleCoinsLabel.alpha = 1
        doubleCoinsDescriptionLabel.alpha = 1
        doubleCoinsPriceLabel.alpha = 1
        pileOfCoinsLabel.alpha = 1
        pileOfCoinsAmountOfCoinsLabel.alpha = 1
        pileOfCoinsPriceLabel.alpha = 1
        bagOfCoinsLabel.alpha = 1
        bagOfCoinsAmountOfCoinsLabel.alpha = 1
        bagOfCoinsPriceLabel.alpha = 1
        crateOfCoinsLabel.alpha = 1
        crateOfCoinsAmountOfCoinsLabel.alpha = 1
        crateOfCoinsPriceLabel.alpha = 1
        chestOfCoinsLabel.alpha = 1
        chestOfCoinsAmountOfCoinsLabel.alpha = 1
        chestOfCoinsPriceLabel.alpha = 1
        shipOfCoinsLabel.alpha = 1
        shipOfCoinsAmountOfCoinsLabel.alpha = 1
        shipOfCoinsPriceLabel.alpha = 1
        
        facebook.alpha = 0
        facebook10.alpha = 0
        twitter.alpha = 0
        twitter10.alpha = 0
        instagram.alpha = 0
        instagram10.alpha = 0
        feedback.alpha = 0
        feedback10.alpha = 0
        Review.alpha = 0
        Review10.alpha = 0
        
        DayTimePreview.alpha = 0
        DayTimeLabel.alpha = 0
        DayTimePriceLabel.alpha = 0
        DayTimeSelectLabel.alpha = 0
        NightTimePreview.alpha = 0
        NightTimeLabel.alpha = 0
        NightTimePriceLabel.alpha = 0
        NightTimeSelectLabel.alpha = 0
        DesertPreview.alpha = 0
        DesertLabel.alpha = 0
        DesertPriceLabel.alpha = 0
        DesertSelectLabel.alpha = 0
        CityPreview.alpha = 0
        CityLabel.alpha = 0
        CityPriceLabel.alpha = 0
        CitySelectLabel.alpha = 0
        BeachPreview.alpha = 0
        BeachLabel.alpha = 0
        BeachPriceLabel.alpha = 0
        BeachSelectLabel.alpha = 0
        
        RevivesImage.alpha = 0
        RevivesLabel.alpha = 0
        RevivesBuyLabel.alpha = 0
        RevivesPriceLabel.alpha = 0
        RevivesCountLabel.alpha = 0
        ScoreBoosterImage.alpha = 0
        ScoreBoosterLabel.alpha = 0
        ScoreBoosterBuyLabel.alpha = 0
        ScoreBoosterPriceLabel.alpha = 0
        ScoreBoosterCountLabel.alpha = 0
        ScoreBoosterDescriptionLabel.alpha = 0
        ScoreBoosterDescriptionLabel2.alpha = 0
        RevivesDescriptionLabel.alpha = 0
        
        coinMagnetPriceLabel.alpha = 0
        megaCoinPriceLabel.alpha = 0
        armorPriceLabel.alpha = 0
    }
    
    //MARK: Maps
    
    func displayMaps() {
        inUpgrades = false
        inGetMoreCoins = false
        inGetFreeCoins = false
        inMaps = true
        inUtilities = false
        
        storeLabel.text = "Maps"
        
        upgradesOnDock.texture = SKTexture(imageNamed: "CDUpgrades")
        upgradesOnDockLabel.fontColor = SKColor.blackColor()
        
        utilitesOnDock.texture = SKTexture(imageNamed: "CDUtilites")
        utilitesOnDockLabel.fontColor = SKColor.blackColor()
        
        globeOnDock.texture = SKTexture(imageNamed: "CDGlobeBlue")
        globeOnDockLabel.fontColor = SKColor(red: 24 / 255, green: 124 / 255, blue: 251 / 255, alpha: 1)
        
        moreCoinsOnDock.texture = SKTexture(imageNamed: "CDMoney")
        moreCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        freeCoinsOnDock.texture = SKTexture(imageNamed: "CDFreeMoney")
        freeCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        coinMagnet.alpha = 0
        coinMagnetLabel.alpha = 0
        coinMagnetDescriptionLabel.alpha = 0
        coinMagnetUpgradeLabel.alpha = 0
        coinMagnetlvl1.alpha = 0
        coinMagnetlvl2.alpha = 0
        coinMagnetlvl3.alpha = 0
        coinMagnetlvl4.alpha = 0
        coinMagnetlvl5.alpha = 0
        
        megaCoin.alpha = 0
        megaCoinLabel.alpha = 0
        megaCoinDescriptionLabel.alpha = 0
        megaCoinUpgradeLabel.alpha = 0
        megaCoinlvl1.alpha = 0
        megaCoinlvl2.alpha = 0
        megaCoinlvl3.alpha = 0
        megaCoinlvl4.alpha = 0
        megaCoinlvl5.alpha = 0
        
        armor.alpha = 0
        armorLabel.alpha = 0
        armorDescriptionLabel.alpha = 0
        armorUpgradeLabel.alpha = 0
        armorlvl1.alpha = 0
        armorlvl2.alpha = 0
        armorlvl3.alpha = 0
        armorlvl4.alpha = 0
        armorlvl5.alpha = 0
        
        doubleCoinsLabel.alpha = 0
        doubleCoinsDescriptionLabel.alpha = 0
        doubleCoinsPriceLabel.alpha = 0
        pileOfCoinsLabel.alpha = 0
        pileOfCoinsAmountOfCoinsLabel.alpha = 0
        pileOfCoinsPriceLabel.alpha = 0
        bagOfCoinsLabel.alpha = 0
        bagOfCoinsAmountOfCoinsLabel.alpha = 0
        bagOfCoinsPriceLabel.alpha = 0
        crateOfCoinsLabel.alpha = 0
        crateOfCoinsAmountOfCoinsLabel.alpha = 0
        crateOfCoinsPriceLabel.alpha = 0
        chestOfCoinsLabel.alpha = 0
        chestOfCoinsAmountOfCoinsLabel.alpha = 0
        chestOfCoinsPriceLabel.alpha = 0
        shipOfCoinsLabel.alpha = 0
        shipOfCoinsAmountOfCoinsLabel.alpha = 0
        shipOfCoinsPriceLabel.alpha = 0
        
        facebook.alpha = 0
        facebook10.alpha = 0
        twitter.alpha = 0
        twitter10.alpha = 0
        instagram.alpha = 0
        instagram10.alpha = 0
        feedback.alpha = 0
        feedback10.alpha = 0
        Review.alpha = 0
        Review10.alpha = 0
        
        DayTimePreview.alpha = 1
        DayTimeLabel.alpha = 1
        DayTimePriceLabel.alpha = 1
        DayTimeSelectLabel.alpha = 1
        NightTimePreview.alpha = 1
        NightTimeLabel.alpha = 1
        NightTimePriceLabel.alpha = 1
        NightTimeSelectLabel.alpha = 1
        DesertPreview.alpha = 1
        DesertLabel.alpha = 1
        DesertPriceLabel.alpha = 1
        DesertSelectLabel.alpha = 1
        CityPreview.alpha = 1
        CityLabel.alpha = 1
        CityPriceLabel.alpha = 1
        CitySelectLabel.alpha = 1
        BeachPreview.alpha = 1
        BeachLabel.alpha = 1
        BeachPriceLabel.alpha = 1
        BeachSelectLabel.alpha = 1
        
        RevivesImage.alpha = 0
        RevivesLabel.alpha = 0
        RevivesBuyLabel.alpha = 0
        RevivesPriceLabel.alpha = 0
        RevivesCountLabel.alpha = 0
        ScoreBoosterImage.alpha = 0
        ScoreBoosterLabel.alpha = 0
        ScoreBoosterBuyLabel.alpha = 0
        ScoreBoosterPriceLabel.alpha = 0
        ScoreBoosterCountLabel.alpha = 0
        ScoreBoosterDescriptionLabel.alpha = 0
        ScoreBoosterDescriptionLabel2.alpha = 0
        RevivesDescriptionLabel.alpha = 0
        
        coinMagnetPriceLabel.alpha = 0
        megaCoinPriceLabel.alpha = 0
        armorPriceLabel.alpha = 0
    }
    
    func dayTimeSelect() {
        if isDaySelected == false {
            isDaySelected = true
            isNightSelected = false
            isDesertSelected = false
            isCitySelected = false
            
            DayTimeSelectLabel.text = "Selected"
            DayTimeSelectLabel.fontColor = SKColor.greenColor()
            backgroundTheme = "Day"
            NSUserDefaults.standardUserDefaults().setObject(backgroundTheme, forKey: "Background Theme")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            if boughtNight == true {
                NightTimeSelectLabel.text = "Select"
                NightTimeSelectLabel.fontColor = SKColor.blackColor()
            }
            
            if boughtDesert == true {
                DesertSelectLabel.text = "Select"
                DesertSelectLabel.fontColor = SKColor.blackColor()
            }
            
            if boughtCity == true {
                CitySelectLabel.text = "Select"
                CitySelectLabel.fontColor = SKColor.blackColor()
            }
        }
    }
    
    func nightTimeSelect() {
        if boughtNight == false && coins >= 500 {
            coins -= 500
            coinsLabel.text = "\(coins)"
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            saveCoins(coins)
            boughtNight = true
            NSUserDefaults.standardUserDefaults().setBool(boughtNight, forKey: "Bought Night")
            NSUserDefaults.standardUserDefaults().synchronize()
            NightTimeSelectLabel.text = "Select"
        } else if coins < 500 && boughtNight == false {
            notEnoughCoins()
        } else if boughtNight == true && isNightSelected == false {
            isNightSelected = true
            isDaySelected = false
            isDesertSelected = false
            isCitySelected = false
            
            DayTimeSelectLabel.text = "Select"
            DayTimeSelectLabel.fontColor = SKColor.blackColor()
            
            NightTimeSelectLabel.text = "Selected"
            NightTimeSelectLabel.fontColor = SKColor.greenColor()
            backgroundTheme = "Night"
            NSUserDefaults.standardUserDefaults().setObject(backgroundTheme, forKey: "Background Theme")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            if boughtDesert == true {
                DesertSelectLabel.text = "Select"
                DesertSelectLabel.fontColor = SKColor.blackColor()
            }
            
            if boughtCity == true {
                CitySelectLabel.text = "Select"
                CitySelectLabel.fontColor = SKColor.blackColor()
            }
        }
    }
    
    func desertSelect() {
        if boughtDesert == false && coins >= 2500 {
            coins -= 2500
            coinsLabel.text = "\(coins)"
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            saveCoins(coins)
            boughtDesert = true
            NSUserDefaults.standardUserDefaults().setBool(boughtDesert, forKey: "Bought Desert")
            NSUserDefaults.standardUserDefaults().synchronize()
            DesertSelectLabel.text = "Select"
        } else if coins < 2500 && boughtDesert == false {
            notEnoughCoins()
        } else  if boughtDesert == true && isDesertSelected == false {
            isDesertSelected = true
            isDaySelected = false
            isNightSelected = false
            isCitySelected = false
            
            DayTimeSelectLabel.text = "Select"
            DayTimeSelectLabel.fontColor = SKColor.blackColor()
            
            DesertSelectLabel.text = "Selected"
            DesertSelectLabel.fontColor = SKColor.greenColor()
            backgroundTheme = "Desert"
            NSUserDefaults.standardUserDefaults().setObject(backgroundTheme, forKey: "Background Theme")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            if boughtNight == true {
                NightTimeSelectLabel.text = "Select"
                NightTimeSelectLabel.fontColor = SKColor.blackColor()
            }
            
            if boughtCity == true {
                CitySelectLabel.text = "Select"
                CitySelectLabel.fontColor = SKColor.blackColor()
            }
        }
    }
    
    func citySelect() {
        if boughtCity == false && coins >= 5000 {
            coins -= 5000
            coinsLabel.text = "\(coins)"
            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
            NSUserDefaults.standardUserDefaults().synchronize()
            saveCoins(coins)
            boughtCity = true
            NSUserDefaults.standardUserDefaults().setBool(boughtCity, forKey: "Bought City")
            NSUserDefaults.standardUserDefaults().synchronize()
            CitySelectLabel.text = "Select"
        } else if coins < 5000 && boughtCity == false {
            notEnoughCoins()
        } else if boughtCity == true && isCitySelected == false {
            isCitySelected = true
            isDaySelected = false
            isNightSelected = false
            isDesertSelected = false
            
            DayTimeSelectLabel.text = "Select"
            DayTimeSelectLabel.fontColor = SKColor.blackColor()
            
            CitySelectLabel.text = "Selected"
            CitySelectLabel.fontColor = SKColor.greenColor()
            backgroundTheme = "City"
            NSUserDefaults.standardUserDefaults().setObject(backgroundTheme, forKey: "Background Theme")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            if boughtNight == true {
                NightTimeSelectLabel.text = "Select"
                NightTimeSelectLabel.fontColor = SKColor.blackColor()
            }
            
            if boughtDesert == true {
                DesertSelectLabel.text = "Select"
                DesertSelectLabel.fontColor = SKColor.blackColor()
            }
        }
    }
    
    func checkBackgrounds() {
        
        backgroundTheme = NSUserDefaults.standardUserDefaults().objectForKey("Background Theme") as! String
        
        boughtNight = NSUserDefaults.standardUserDefaults().boolForKey("Bought Night")
        boughtDesert = NSUserDefaults.standardUserDefaults().boolForKey("Bought Desert")
        boughtCity = NSUserDefaults.standardUserDefaults().boolForKey("Bought City")
        
        if boughtNight == true {
            NightTimeSelectLabel.text = "Select"
        }
        
        if boughtCity == true {
            CitySelectLabel.text = "Select"
        }
        
        if boughtDesert == true {
            DesertSelectLabel.text = "Select"
        }
        
        if backgroundTheme == "Day" {
            isDaySelected = true
        } else if backgroundTheme == "Night" {
            isNightSelected = true
            NightTimeSelectLabel.text = "Selected"
            NightTimeSelectLabel.fontColor = SKColor.greenColor()
            DayTimeSelectLabel.text = "Select"
            DayTimeSelectLabel.fontColor = SKColor.blackColor()
        } else if backgroundTheme == "Desert" {
            isDesertSelected = true
            DesertSelectLabel.text = "Selected"
            DesertSelectLabel.fontColor = SKColor.greenColor()
            DayTimeSelectLabel.text = "Select"
            DayTimeSelectLabel.fontColor = SKColor.blackColor()
        } else if backgroundTheme == "City" {
            isCitySelected = true
            CitySelectLabel.text = "Selected"
            CitySelectLabel.fontColor = SKColor.greenColor()
            DayTimeSelectLabel.text = "Select"
            DayTimeSelectLabel.fontColor = SKColor.blackColor()
        }
    }
    
    //MARK: Utilities
    
    func displayUtilities() {
        inUpgrades = false
        inGetMoreCoins = false
        inGetFreeCoins = false
        inMaps = false
        inUtilities = true
        
        storeLabel.text = "Utilities"
        
        upgradesOnDock.texture = SKTexture(imageNamed: "CDUpgrades")
        upgradesOnDockLabel.fontColor = SKColor.blackColor()
        
        utilitesOnDock.texture = SKTexture(imageNamed: "CDUtilitesBlue")
        utilitesOnDockLabel.fontColor = SKColor(red: 24 / 255, green: 124 / 255, blue: 251 / 255, alpha: 1)
        
        globeOnDock.texture = SKTexture(imageNamed: "CDGlobe")
        globeOnDockLabel.fontColor = SKColor.blackColor()
        
        moreCoinsOnDock.texture = SKTexture(imageNamed: "CDMoney")
        moreCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        freeCoinsOnDock.texture = SKTexture(imageNamed: "CDFreeMoney")
        freeCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        coinMagnet.alpha = 0
        coinMagnetLabel.alpha = 0
        coinMagnetDescriptionLabel.alpha = 0
        coinMagnetUpgradeLabel.alpha = 0
        coinMagnetlvl1.alpha = 0
        coinMagnetlvl2.alpha = 0
        coinMagnetlvl3.alpha = 0
        coinMagnetlvl4.alpha = 0
        coinMagnetlvl5.alpha = 0
        
        megaCoin.alpha = 0
        megaCoinLabel.alpha = 0
        megaCoinDescriptionLabel.alpha = 0
        megaCoinUpgradeLabel.alpha = 0
        megaCoinlvl1.alpha = 0
        megaCoinlvl2.alpha = 0
        megaCoinlvl3.alpha = 0
        megaCoinlvl4.alpha = 0
        megaCoinlvl5.alpha = 0
        
        armor.alpha = 0
        armorLabel.alpha = 0
        armorDescriptionLabel.alpha = 0
        armorUpgradeLabel.alpha = 0
        armorlvl1.alpha = 0
        armorlvl2.alpha = 0
        armorlvl3.alpha = 0
        armorlvl4.alpha = 0
        armorlvl5.alpha = 0
        
        doubleCoinsLabel.alpha = 0
        doubleCoinsDescriptionLabel.alpha = 0
        doubleCoinsPriceLabel.alpha = 0
        pileOfCoinsLabel.alpha = 0
        pileOfCoinsAmountOfCoinsLabel.alpha = 0
        pileOfCoinsPriceLabel.alpha = 0
        bagOfCoinsLabel.alpha = 0
        bagOfCoinsAmountOfCoinsLabel.alpha = 0
        bagOfCoinsPriceLabel.alpha = 0
        crateOfCoinsLabel.alpha = 0
        crateOfCoinsAmountOfCoinsLabel.alpha = 0
        crateOfCoinsPriceLabel.alpha = 0
        chestOfCoinsLabel.alpha = 0
        chestOfCoinsAmountOfCoinsLabel.alpha = 0
        chestOfCoinsPriceLabel.alpha = 0
        shipOfCoinsLabel.alpha = 0
        shipOfCoinsAmountOfCoinsLabel.alpha = 0
        shipOfCoinsPriceLabel.alpha = 0
        
        facebook.alpha = 0
        facebook10.alpha = 0
        twitter.alpha = 0
        twitter10.alpha = 0
        instagram.alpha = 0
        instagram10.alpha = 0
        feedback.alpha = 0
        feedback10.alpha = 0
        Review.alpha = 0
        Review10.alpha = 0
        BeachPreview.alpha = 0
        BeachLabel.alpha = 0
        BeachPriceLabel.alpha = 0
        BeachSelectLabel.alpha = 0
        
        DayTimePreview.alpha = 0
        DayTimeLabel.alpha = 0
        DayTimePriceLabel.alpha = 0
        DayTimeSelectLabel.alpha = 0
        NightTimePreview.alpha = 0
        NightTimeLabel.alpha = 0
        NightTimePriceLabel.alpha = 0
        NightTimeSelectLabel.alpha = 0
        DesertPreview.alpha = 0
        DesertLabel.alpha = 0
        DesertPriceLabel.alpha = 0
        DesertSelectLabel.alpha = 0
        CityPreview.alpha = 0
        CityLabel.alpha = 0
        CityPriceLabel.alpha = 0
        CitySelectLabel.alpha = 0
        
        RevivesImage.alpha = 1
        RevivesLabel.alpha = 1
        RevivesBuyLabel.alpha = 1
        RevivesPriceLabel.alpha = 1
        RevivesCountLabel.alpha = 1
        ScoreBoosterImage.alpha = 1
        ScoreBoosterLabel.alpha = 1
        ScoreBoosterBuyLabel.alpha = 1
        ScoreBoosterPriceLabel.alpha = 1
        ScoreBoosterCountLabel.alpha = 1
        ScoreBoosterDescriptionLabel.alpha = 1
        ScoreBoosterDescriptionLabel2.alpha = 1
        RevivesDescriptionLabel.alpha = 1
        
        coinMagnetPriceLabel.alpha = 0
        megaCoinPriceLabel.alpha = 0
        armorPriceLabel.alpha = 0
        
    }
    
    //MARK: Upgrades
    
    func displayUpgrades() {
        inUpgrades = true
        inGetMoreCoins = false
        inGetFreeCoins = false
        inMaps = false
        inUtilities = false
        
        storeLabel.text = "Upgrades"
        
        inUpgrades = true
        
        
        upgradesOnDock.texture = SKTexture(imageNamed: "CDUpgradesBlue")
        upgradesOnDockLabel.fontColor = SKColor(red: 24 / 255, green: 124 / 255, blue: 251 / 255, alpha: 1)
        
        utilitesOnDock.texture = SKTexture(imageNamed: "CDUtilites")
        utilitesOnDockLabel.fontColor = SKColor.blackColor()
        
        globeOnDock.texture = SKTexture(imageNamed: "CDGlobe")
        globeOnDockLabel.fontColor = SKColor.blackColor()
        
        moreCoinsOnDock.texture = SKTexture(imageNamed: "CDMoney")
        moreCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        freeCoinsOnDock.texture = SKTexture(imageNamed: "CDFreeMoney")
        freeCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        coinMagnet.alpha = 1
        coinMagnetLabel.alpha = 1
        coinMagnetDescriptionLabel.alpha = 1
        coinMagnetUpgradeLabel.alpha = 1
        coinMagnetlvl1.alpha = 1
        coinMagnetlvl2.alpha = 1
        coinMagnetlvl3.alpha = 1
        coinMagnetlvl4.alpha = 1
        coinMagnetlvl5.alpha = 1
        
        megaCoin.alpha = 1
        megaCoinLabel.alpha = 1
        megaCoinDescriptionLabel.alpha = 1
        megaCoinUpgradeLabel.alpha = 1
        megaCoinlvl1.alpha = 1
        megaCoinlvl2.alpha = 1
        megaCoinlvl3.alpha = 1
        megaCoinlvl4.alpha = 1
        megaCoinlvl5.alpha = 1
        
        armor.alpha = 1
        armorLabel.alpha = 1
        armorDescriptionLabel.alpha = 1
        armorUpgradeLabel.alpha = 1
        armorlvl1.alpha = 1
        armorlvl2.alpha = 1
        armorlvl3.alpha = 1
        armorlvl4.alpha = 1
        armorlvl5.alpha = 1
        
        doubleCoinsLabel.alpha = 0
        doubleCoinsDescriptionLabel.alpha = 0
        doubleCoinsPriceLabel.alpha = 0
        pileOfCoinsLabel.alpha = 0
        pileOfCoinsAmountOfCoinsLabel.alpha = 0
        pileOfCoinsPriceLabel.alpha = 0
        bagOfCoinsLabel.alpha = 0
        bagOfCoinsAmountOfCoinsLabel.alpha = 0
        bagOfCoinsPriceLabel.alpha = 0
        crateOfCoinsLabel.alpha = 0
        crateOfCoinsAmountOfCoinsLabel.alpha = 0
        crateOfCoinsPriceLabel.alpha = 0
        chestOfCoinsLabel.alpha = 0
        chestOfCoinsAmountOfCoinsLabel.alpha = 0
        chestOfCoinsPriceLabel.alpha = 0
        shipOfCoinsLabel.alpha = 0
        shipOfCoinsAmountOfCoinsLabel.alpha = 0
        shipOfCoinsPriceLabel.alpha = 0
        
        facebook.alpha = 0
        facebook10.alpha = 0
        twitter.alpha = 0
        twitter10.alpha = 0
        instagram.alpha = 0
        instagram10.alpha = 0
        feedback.alpha = 0
        feedback10.alpha = 0
        Review.alpha = 0
        Review10.alpha = 0
        
        DayTimePreview.alpha = 0
        DayTimeLabel.alpha = 0
        DayTimePriceLabel.alpha = 0
        DayTimeSelectLabel.alpha = 0
        NightTimePreview.alpha = 0
        NightTimeLabel.alpha = 0
        NightTimePriceLabel.alpha = 0
        NightTimeSelectLabel.alpha = 0
        DesertPreview.alpha = 0
        DesertLabel.alpha = 0
        DesertPriceLabel.alpha = 0
        DesertSelectLabel.alpha = 0
        CityPreview.alpha = 0
        CityLabel.alpha = 0
        CityPriceLabel.alpha = 0
        CitySelectLabel.alpha = 0
        BeachPreview.alpha = 0
        BeachLabel.alpha = 0
        BeachPriceLabel.alpha = 0
        BeachSelectLabel.alpha = 0
        
        RevivesImage.alpha = 0
        RevivesLabel.alpha = 0
        RevivesBuyLabel.alpha = 0
        RevivesPriceLabel.alpha = 0
        RevivesCountLabel.alpha = 0
        ScoreBoosterImage.alpha = 0
        ScoreBoosterLabel.alpha = 0
        ScoreBoosterBuyLabel.alpha = 0
        ScoreBoosterPriceLabel.alpha = 0
        ScoreBoosterCountLabel.alpha = 0
        ScoreBoosterDescriptionLabel.alpha = 0
        ScoreBoosterDescriptionLabel2.alpha = 0
        RevivesDescriptionLabel.alpha = 0
        
        coinMagnetPriceLabel.alpha = 1
        megaCoinPriceLabel.alpha = 1
        armorPriceLabel.alpha = 1
        
        coinMagnetLevel = NSUserDefaults.standardUserDefaults().integerForKey("Coin Magnet Level")
        megaCoinLevel = NSUserDefaults.standardUserDefaults().integerForKey("Mega Coin Level")
        armorLevel = NSUserDefaults.standardUserDefaults().integerForKey("Armor Level")
        
        if coinMagnetLevel == 5 {
            coinMagnetUpgradeLabel.alpha = 0
        }
        
        if megaCoinLevel == 5 {
            megaCoinUpgradeLabel.alpha = 0
        }
        
        if armorLevel == 5 {
            armorUpgradeLabel.alpha = 0
        }
    }
    
    func upgradeCoinMagnet() {
        
        if coinMagnetLevel == 1 {
            if coins >= lvl2Cost {
                coins -= lvl2Cost
                coinMagnetLevel += 1
                coinMagnetlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                coinMagnetPriceLabel.text = "\(lvl3Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if coinMagnetLevel == 2 {
            if coins >= lvl3Cost {
                coins -= lvl3Cost
                coinMagnetLevel += 1
                coinMagnetlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                coinMagnetPriceLabel.text =  "\(lvl4Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if coinMagnetLevel == 3 {
            if coins >= lvl4Cost {
                coins -= lvl4Cost
                coinMagnetLevel += 1
                coinMagnetlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                coinMagnetPriceLabel.text = "\(lvl5Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if coinMagnetLevel == 4 {
            if coins >= lvl5Cost {
                coins -= lvl5Cost
                coinMagnetLevel += 1
                coinMagnetlvl5.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                coinMagnetPriceLabel.text = "Fully Upgraded"
                coinMagnetPriceLabel.position.x = self.frame.size.width * 0.5
                coinMagnetUpgradeLabel.alpha = 0
            } else {
                notEnoughCoins()
            }
        } else if coinMagnetLevel == 5 {
            //MAX
        }
        
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        coinsLabel.text = "\(coins)"
        saveCoins(coins)
        
        NSUserDefaults.standardUserDefaults().setInteger(coinMagnetLevel, forKey: "Coin Magnet Level")
    }
    
    func upgradeMegaCoin() {
        
        if megaCoinLevel == 1 {
            if coins >= lvl2Cost {
                coins -= lvl2Cost
                megaCoinLevel += 1
                megaCoinlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                megaCoinPriceLabel.text = "\(lvl3Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if megaCoinLevel == 2 {
            if coins >= lvl3Cost {
                coins -= lvl3Cost
                megaCoinLevel += 1
                megaCoinlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                megaCoinPriceLabel.text = "\(lvl4Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if megaCoinLevel == 3 {
            if coins >= lvl4Cost {
                coins -= lvl4Cost
                megaCoinLevel += 1
                megaCoinlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                megaCoinPriceLabel.text = "\(lvl5Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if megaCoinLevel == 4 {
            if coins >= lvl5Cost {
                coins -= lvl5Cost
                megaCoinLevel += 1
                megaCoinlvl5.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                megaCoinPriceLabel.text = "Fully Upgraded"
                megaCoinPriceLabel.position.x = self.frame.size.width * 0.5
                megaCoinUpgradeLabel.alpha = 0
            } else {
                notEnoughCoins()
            }
        } else if megaCoinLevel == 5 {
            //MAX
        }
        
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        coinsLabel.text = "\(coins)"
        saveCoins(coins)
        
        NSUserDefaults.standardUserDefaults().setInteger(megaCoinLevel, forKey: "Mega Coin Level")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func upgradeArmor() {
        
        if armorLevel == 1 {
            if coins >= lvl2Cost {
                coins -= lvl2Cost
                armorLevel += 1
                armorlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                armorPriceLabel.text = "\(lvl3Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if armorLevel == 2 {
            if coins >= lvl3Cost {
                coins -= lvl3Cost
                armorLevel += 1
                armorlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                armorPriceLabel.text = "\(lvl4Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if armorLevel == 3 {
            if coins >= lvl4Cost {
                coins -= lvl4Cost
                armorLevel += 1
                armorlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                armorPriceLabel.text = "\(lvl5Cost) Coins"
            } else {
                notEnoughCoins()
            }
        } else if armorLevel == 4 {
            if coins >= lvl5Cost {
                coins -= lvl5Cost
                armorLevel += 1
                armorlvl5.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
                armorPriceLabel.text = "Fully Upgraded"
                armorPriceLabel.position.x = self.frame.size.width * 0.5
                armorUpgradeLabel.alpha = 0
            } else {
                notEnoughCoins()
            }
        } else if armorLevel == 5 {
            //MAX
        }
        
        NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
        NSUserDefaults.standardUserDefaults().synchronize()
        coinsLabel.text = "\(coins)"
        saveCoins(coins)
        
        NSUserDefaults.standardUserDefaults().setInteger(armorLevel, forKey: "Armor Level")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func checkUpgrades() {
        coinMagnetLevel = NSUserDefaults.standardUserDefaults().integerForKey("Coin Magnet Level")
        megaCoinLevel = NSUserDefaults.standardUserDefaults().integerForKey("Mega Coin Level")
        armorLevel = NSUserDefaults.standardUserDefaults().integerForKey("Armor Level")
        
        if coinMagnetLevel == 2 {
            coinMagnetlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetPriceLabel.text = "\(lvl3Cost) Coins"
        } else if coinMagnetLevel == 3 {
            coinMagnetlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetPriceLabel.text = "\(lvl4Cost) Coins"
        } else if coinMagnetLevel == 4 {
            coinMagnetlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetPriceLabel.text = "\(lvl5Cost) Coins"
        } else if coinMagnetLevel == 5 {
            coinMagnetlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetlvl5.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetPriceLabel.text = "Fully Upgraded"
            coinMagnetPriceLabel.position.x = self.frame.size.width * 0.5
        }
        
        if megaCoinLevel == 2 {
            megaCoinlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinPriceLabel.text = "\(lvl3Cost) Coins"
        } else if megaCoinLevel == 3 {
            megaCoinlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinPriceLabel.text = "\(lvl4Cost) Coins"
        } else if megaCoinLevel == 4 {
            megaCoinlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            coinMagnetlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinPriceLabel.text = "\(lvl5Cost) Coins"
        } else if megaCoinLevel == 5 {
            megaCoinlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinlvl5.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            megaCoinPriceLabel.text = "Fully Upgraded"
            megaCoinPriceLabel.position.x = self.frame.size.width * 0.5
        }
        
        if armorLevel == 2 {
            armorlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorPriceLabel.text = "\(lvl3Cost) Coins"
        } else if armorLevel == 3 {
            armorlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorPriceLabel.text = "\(lvl4Cost) Coins"
        } else if armorLevel == 4 {
            armorlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorPriceLabel.text = "\(lvl5Cost) Coins"
        } else if armorLevel == 5 {
            armorlvl2.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorlvl3.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorlvl4.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorlvl5.texture = SKTexture(imageNamed: "CDLevelDisplayerYellow")
            armorPriceLabel.text = "Fully Upgraded"
            armorPriceLabel.position.x = self.frame.size.width * 0.5
        }
    }
    
    func buyError() {
        let alert = UIAlertController(title: "Error", message: "There was an error with your purchase. Please try again later.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    func notEnoughCoins() {
        let alert = UIAlertController(title: "Not Enough Coins", message: "You do not have enough coins to buy this item. Would you like to get more?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler:  nil))
        
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction) -> Void in
            
            self.displayMoreCoins()
            
        }))
        
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tooManyScoreBoosters() {
        let alert = UIAlertController(title: "You have the maximun Score Boosters", message: "You have the maximum number of Score Boosters.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tooManyRevives() {
        let alert = UIAlertController(title: "You have the maximum Revives", message: "You have the maximum number of Revives.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:  nil))
        
        self.scene?.view?.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
    }
    
    func makeRect() {
        doubleCoinsRect = CGRect(x: 0, y: self.frame.size.height * 0.75, width: self.frame.size.width, height: 90)
        pileOfCoinsRect = CGRect(x: 0, y: self.frame.size.height * 0.625, width: self.frame.size.width, height: 85)
        bagOfCoinsRect = CGRect(x: 0, y: self.frame.size.height * 0.51, width: self.frame.size.width, height: 85)
        crateOfCoinsRect = CGRect(x: 0, y: self.frame.height * 0.395, width: self.frame.size.width, height: 85)
        chestOfCoinsRect = CGRect(x: 0, y: self.frame.size.height * 0.27, width: self.frame.size.width, height: 90)
        shipOfCoinsRect = CGRect(x: 0, y: self.frame.size.height * 0.14, width: self.frame.size.width, height: 95)
        
        twitterRect = CGRect(x: 0, y: self.frame.size.height * 0.73, width: self.frame.size.width, height: 90)
        facebookRect = CGRect(x: 0, y: self.frame.size.height * 0.59, width: self.frame.size.width, height: 90)
        instagramRect = CGRect(x: 0, y: self.frame.size.height * 0.45, width: self.frame.size.width, height: 90)
        feedbackRect = CGRect(x: 0, y: self.frame.size.height * 0.31, width: self.frame.size.width, height: 90)
        rateRect = CGRect(x: 0, y: self.frame.size.height * 0.17, width: self.frame.size.width, height: 90)
    }
    
    //MARK: Override Function
    
    override func didMoveToView(view: SKView) {
        
        self.backgroundColor = SKColor(red: 7 / 255, green: 88 / 255, blue: 255 / 255, alpha: 1)
        
        redStatusBar.size = CGSize(width: self.frame.size.width, height: 100)
        redStatusBar.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        redStatusBar.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.95)
        
        backButton.size = CGSize(width: 70, height: 70)
        backButton.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backButton.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.945)
        
        dock.size = CGSize(width: self.frame.size.width, height: 100)
        dock.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        dock.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.05)
        
        storeLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.922)
        storeLabel.fontSize = 50
        storeLabel.text = "Upgrades"
        storeLabel.fontColor = SKColor.blackColor()
        
        coinIcon.size = CGSize(width: 40, height: 40)
        coinIcon.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinIcon.position = CGPoint(x: self.frame.size.width * 0.65, y: self.frame.size.height * 0.965)
        
        coinsLabel.position = CGPoint(x: self.frame.size.width * 0.65, y: self.frame.size.height * 0.9)
        coinsLabel.fontSize = 25
        coinsLabel.text = "0"
        coinsLabel.fontColor = SKColor.blackColor()
        
        //Free Coins
        
        twitter.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.8)
        twitter.fontSize = 40
        twitter.text = "Follow us on Twitter"
        twitter.fontColor = SKColor.blackColor()
        
        twitter10.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.74)
        twitter10.fontSize = 35
        twitter10.text = "Get 10 Coins"
        twitter10.fontColor = SKColor.blackColor()
        
        facebook.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.66)
        facebook.fontSize = 40
        facebook.text = "Like us on Facebook"
        facebook.fontColor = SKColor.blackColor()
        
        facebook10.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.6)
        facebook10.fontSize = 35
        facebook10.text = "Get 10 Coins"
        facebook10.fontColor = SKColor.blackColor()
        
        instagram.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.52)
        instagram.fontSize = 40
        instagram.text = "Folow us on Instagram"
        instagram.fontColor = SKColor.blackColor()
        
        instagram10.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.46)
        instagram10.fontSize = 35
        instagram10.text = "Get 10 Coins"
        instagram10.fontColor = SKColor.blackColor()
        
        feedback.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.38)
        feedback.fontSize = 40
        feedback.text = "Tell us What You Think"
        feedback.fontColor = SKColor.blackColor()
        
        feedback10.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.32)
        feedback10.fontSize = 35
        feedback10.text = "Get 10 Coins"
        feedback10.fontColor = SKColor.blackColor()
        
        Review.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.24)
        Review.fontSize = 40
        Review.text = "Write a Review"
        Review.fontColor = SKColor.blackColor()
        
        Review10.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.18)
        Review10.fontSize = 35
        Review10.text = "Get 10 Coins"
        Review10.fontColor = SKColor.blackColor()
        
        //Upgrades
        
        coinMagnet.size = CGSize(width: 100, height: 100)
        coinMagnet.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinMagnet.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.75)
        
        coinMagnetLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.82)
        coinMagnetLabel.fontSize = 60
        coinMagnetLabel.text = "Coin Magnet"
        coinMagnetLabel.fontColor = SKColor.blackColor()
        
        coinMagnetUpgradeLabel.position = CGPoint(x: self.frame.size.width * 0.63, y: self.frame.size.height * 0.71)
        coinMagnetUpgradeLabel.fontSize = 35
        coinMagnetUpgradeLabel.text = "Upgrade"
        coinMagnetUpgradeLabel.fontColor = SKColor.blackColor()
        
        coinMagnetPriceLabel.position = CGPoint(x: self.frame.size.width * 0.46, y: self.frame.size.height * 0.71)
        coinMagnetPriceLabel.fontSize = 35
        coinMagnetPriceLabel.text = "\(lvl2Cost) Coins"
        coinMagnetPriceLabel.fontColor = SKColor.blackColor()
        
        coinMagnetDescriptionLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.65)
        coinMagnetDescriptionLabel.fontSize = 20
        coinMagnetDescriptionLabel.text = "The Coin Magnet attracts coins during gameplay"
        coinMagnetDescriptionLabel.fontColor = SKColor.blackColor()
        
        megaCoin.size = CGSize(width: 100, height: 100)
        megaCoin.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        megaCoin.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.5)
        
        megaCoinLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: self.frame.size.height * 0.57)
        megaCoinLabel.fontSize = 60
        megaCoinLabel.text = "Mega Coin"
        megaCoinLabel.fontColor = SKColor.blackColor()
        
        megaCoinUpgradeLabel.position = CGPoint(x: self.frame.size.width * 0.63, y: self.frame.size.height * 0.46)
        megaCoinUpgradeLabel.fontSize = 35
        megaCoinUpgradeLabel.text = "Upgrade"
        megaCoinUpgradeLabel.fontColor = SKColor.blackColor()
        
        megaCoinPriceLabel.position = CGPoint(x: self.frame.size.width * 0.46, y: self.frame.size.height * 0.46)
        megaCoinPriceLabel.fontSize = 35
        megaCoinPriceLabel.text = "\(lvl2Cost) Coins"
        megaCoinPriceLabel.fontColor = SKColor.blackColor()
        
        megaCoinDescriptionLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.41)
        megaCoinDescriptionLabel.fontSize = 20
        megaCoinDescriptionLabel.text = "The Mega Coin is a coin worth - coins"
        megaCoinDescriptionLabel.fontColor = SKColor.blackColor()
        
        armor.size = CGSize(width: 100, height: 100)
        armor.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        armor.position = CGPoint(x: self.frame.size.width * 0.34, y: self.frame.size.height * 0.25)
        
        armorLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.32)
        armorLabel.fontSize = 60
        armorLabel.text = "Armor"
        armorLabel.fontColor = SKColor.blackColor()
        
        armorUpgradeLabel.position = CGPoint(x: self.frame.size.width * 0.63, y: self.frame.size.height * 0.21)
        armorUpgradeLabel.fontSize = 35
        armorUpgradeLabel.text = "Upgrade"
        armorUpgradeLabel.fontColor = SKColor.blackColor()
        
        armorPriceLabel.position = CGPoint(x: self.frame.size.width * 0.46, y: self.frame.size.height * 0.21)
        armorPriceLabel.fontSize = 35
        armorPriceLabel.text = "\(lvl2Cost) Coins"
        armorPriceLabel.fontColor = SKColor.blackColor()
        
        armorDescriptionLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.15)
        armorDescriptionLabel.fontSize = 20
        armorDescriptionLabel.text = "The armor protects you from crates"
        armorDescriptionLabel.fontColor = SKColor.blackColor()
        
        slowMo.size = CGSize(width: 100, height: 100)
        slowMo.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        slowMo.position = CGPoint(x: self.frame.size.width * 0.34, y: 0)
        
        slowMoLabel.position = CGPoint(x: self.frame.size.width * 0.46, y: self.frame.size.height * 0.07)
        slowMoLabel.fontSize = 60
        slowMoLabel.text = "Slow-Mo"
        slowMoLabel.fontColor = SKColor.blackColor()
        
        slowMoUpgradeLabel.position = CGPoint(x: self.frame.size.width * 0.64, y: self.frame.size.height * -0.04)
        slowMoUpgradeLabel.fontSize = 35
        slowMoUpgradeLabel.text = "Upgrade"
        slowMoUpgradeLabel.fontColor = SKColor.blackColor()
        
        slowMoPriceLabel.position = CGPoint(x: self.frame.size.width * 0.46, y: self.frame.size.height * -0.04)
        slowMoPriceLabel.fontSize = 35
        slowMoPriceLabel.text = "\(lvl2Cost) Coins"
        slowMoPriceLabel.fontColor = SKColor.blackColor()
        
        slowMoDescriptionLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * -0.11)
        slowMoDescriptionLabel.fontSize = 20
        slowMoDescriptionLabel.text = "Slow-Mo slows down falling crates and coins during gameplay"
        slowMoDescriptionLabel.fontColor = SKColor.blackColor()
        
        coinMagnetlvl1.size = CGSize(width: 31.7, height: 13.65)
        coinMagnetlvl1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinMagnetlvl1.position = CGPoint(x: self.frame.size.width * 0.43, y: self.frame.size.height * 0.78)
        
        coinMagnetlvl2.size = CGSize(width: 31.7, height: 13.65)
        coinMagnetlvl2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinMagnetlvl2.position = CGPoint(x: self.frame.size.width * 0.465, y: self.frame.size.height * 0.78)
        
        coinMagnetlvl3.size = CGSize(width: 31.7, height: 13.65)
        coinMagnetlvl3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinMagnetlvl3.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.78)
        
        coinMagnetlvl4.size = CGSize(width: 31.7, height: 13.65)
        coinMagnetlvl4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinMagnetlvl4.position = CGPoint(x: self.frame.size.width * 0.535, y: self.frame.size.height * 0.78)
        
        coinMagnetlvl5.size = CGSize(width: 31.7, height: 13.65)
        coinMagnetlvl5.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        coinMagnetlvl5.position = CGPoint(x: self.frame.size.width * 0.57, y: self.frame.size.height * 0.78)
        
        megaCoinlvl1.size = CGSize(width: 31.7, height: 13.65)
        megaCoinlvl1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        megaCoinlvl1.position = CGPoint(x: self.frame.size.width * 0.43, y: self.frame.size.height * 0.53)
        
        megaCoinlvl2.size = CGSize(width: 31.7, height: 13.65)
        megaCoinlvl2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        megaCoinlvl2.position = CGPoint(x: self.frame.size.width * 0.465, y: self.frame.size.height * 0.53)
        
        megaCoinlvl3.size = CGSize(width: 31.7, height: 13.65)
        megaCoinlvl3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        megaCoinlvl3.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.53)
        
        megaCoinlvl4.size = CGSize(width: 31.7, height: 13.65)
        megaCoinlvl4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        megaCoinlvl4.position = CGPoint(x: self.frame.size.width * 0.535, y: self.frame.size.height * 0.53)
        
        megaCoinlvl5.size = CGSize(width: 31.7, height: 13.65)
        megaCoinlvl5.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        megaCoinlvl5.position = CGPoint(x: self.frame.size.width * 0.57, y: self.frame.size.height * 0.53)
        
        armorlvl1.size = CGSize(width: 31.7, height: 13.65)
        armorlvl1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        armorlvl1.position = CGPoint(x: self.frame.size.width * 0.43, y: self.frame.size.height * 0.28)
        
        armorlvl2.size = CGSize(width: 31.7, height: 13.65)
        armorlvl2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        armorlvl2.position = CGPoint(x: self.frame.size.width * 0.465, y: self.frame.size.height * 0.28)
        
        armorlvl3.size = CGSize(width: 31.7, height: 13.65)
        armorlvl3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        armorlvl3.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.28)
        
        armorlvl4.size = CGSize(width: 31.7, height: 13.65)
        armorlvl4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        armorlvl4.position = CGPoint(x: self.frame.size.width * 0.535, y: self.frame.size.height * 0.28)
        
        armorlvl5.size = CGSize(width: 31.7, height: 13.65)
        armorlvl5.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        armorlvl5.position = CGPoint(x: self.frame.size.width * 0.57, y: self.frame.size.height * 0.28)
        
        slowMolvl1.size = CGSize(width: 31.7, height: 13.65)
        slowMolvl1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        slowMolvl1.position = CGPoint(x: self.frame.size.width * 0.43, y: self.frame.size.height * 0.03)
        
        slowMolvl2.size = CGSize(width: 31.7, height: 13.65)
        slowMolvl2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        slowMolvl2.position = CGPoint(x: self.frame.size.width * 0.465, y: self.frame.size.height * 0.03)
        
        slowMolvl3.size = CGSize(width: 31.7, height: 13.65)
        slowMolvl3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        slowMolvl3.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.03)
        
        slowMolvl4.size = CGSize(width: 31.7, height: 13.65)
        slowMolvl4.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        slowMolvl4.position = CGPoint(x: self.frame.size.width * 0.535, y: self.frame.size.height * 0.03)
        
        slowMolvl5.size = CGSize(width: 31.7, height: 13.65)
        slowMolvl5.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        slowMolvl5.position = CGPoint(x: self.frame.size.width * 0.57, y: self.frame.size.height * 0.03)
        
        //More Coins
        
        doubleCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.83)
        doubleCoinsLabel.fontSize = 35
        doubleCoinsLabel.text = "Double Coins"
        doubleCoinsLabel.fontColor = SKColor.blackColor()
        
        doubleCoinsPriceLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.83)
        doubleCoinsPriceLabel.fontSize = 35
        doubleCoinsPriceLabel.text = "$2.99"
        doubleCoinsPriceLabel.fontColor = SKColor.blackColor()
        
        doubleCoinsDescriptionLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.78)
        doubleCoinsDescriptionLabel.fontSize = 25
        doubleCoinsDescriptionLabel.text = "Double Coins Will Double Every Coin You earn"
        doubleCoinsDescriptionLabel.fontColor = SKColor.blackColor()
        
        pileOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.7)
        pileOfCoinsLabel.fontSize = 35
        pileOfCoinsLabel.text = "Pile of Coins"
        pileOfCoinsLabel.fontColor = SKColor.blackColor()
        
        pileOfCoinsAmountOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.65)
        pileOfCoinsAmountOfCoinsLabel.fontSize = 35
        pileOfCoinsAmountOfCoinsLabel.text = "100 Coins"
        pileOfCoinsAmountOfCoinsLabel.fontColor = SKColor.blackColor()
        
        pileOfCoinsPriceLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.65)
        pileOfCoinsPriceLabel.fontSize = 35
        pileOfCoinsPriceLabel.text = "$0.99"
        pileOfCoinsPriceLabel.fontColor = SKColor.blackColor()
        
        bagOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.57)
        bagOfCoinsLabel.fontSize = 35
        bagOfCoinsLabel.text = "Bag of Coins"
        bagOfCoinsLabel.fontColor = SKColor.blackColor()
        
        bagOfCoinsAmountOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.52)
        bagOfCoinsAmountOfCoinsLabel.fontSize = 35
        bagOfCoinsAmountOfCoinsLabel.text = "500 Coins"
        bagOfCoinsAmountOfCoinsLabel.fontColor = SKColor.blackColor()
        
        bagOfCoinsPriceLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.52)
        bagOfCoinsPriceLabel.fontSize = 35
        bagOfCoinsPriceLabel.text = "$4.99"
        bagOfCoinsPriceLabel.fontColor = SKColor.blackColor()
        
        crateOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.46)
        crateOfCoinsLabel.fontSize = 35
        crateOfCoinsLabel.text = "Crate of Coins"
        crateOfCoinsLabel.fontColor = SKColor.blackColor()
        
        crateOfCoinsAmountOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.41)
        crateOfCoinsAmountOfCoinsLabel.fontSize = 35
        crateOfCoinsAmountOfCoinsLabel.text = "1250 Coins"
        crateOfCoinsAmountOfCoinsLabel.fontColor = SKColor.blackColor()
        
        crateOfCoinsPriceLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.41)
        crateOfCoinsPriceLabel.fontSize = 35
        crateOfCoinsPriceLabel.text = "$9.99"
        crateOfCoinsPriceLabel.fontColor = SKColor.blackColor()
        
        chestOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.33)
        chestOfCoinsLabel.fontSize = 35
        chestOfCoinsLabel.text = "Chest of Coins"
        chestOfCoinsLabel.fontColor = SKColor.blackColor()
        
        chestOfCoinsAmountOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.28)
        chestOfCoinsAmountOfCoinsLabel.fontSize = 35
        chestOfCoinsAmountOfCoinsLabel.text = "2500 Coins"
        chestOfCoinsAmountOfCoinsLabel.fontColor = SKColor.blackColor()
        
        chestOfCoinsPriceLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.28)
        chestOfCoinsPriceLabel.fontSize = 35
        chestOfCoinsPriceLabel.text = "$14.99"
        chestOfCoinsPriceLabel.fontColor = SKColor.blackColor()
        
        shipOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.2)
        shipOfCoinsLabel.fontSize = 35
        shipOfCoinsLabel.text = "Ship of Coins"
        shipOfCoinsLabel.fontColor = SKColor.blackColor()
        
        shipOfCoinsAmountOfCoinsLabel.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.15)
        shipOfCoinsAmountOfCoinsLabel.fontSize = 35
        shipOfCoinsAmountOfCoinsLabel.text = "5000 Coins"
        shipOfCoinsAmountOfCoinsLabel.fontColor = SKColor.blackColor()
        
        shipOfCoinsPriceLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.15)
        shipOfCoinsPriceLabel.fontSize = 35
        shipOfCoinsPriceLabel.text = "$19.99"
        shipOfCoinsPriceLabel.fontColor = SKColor.blackColor()
        
        //Dock
        
        moreCoinsOnDock.size = CGSize(width: 65, height: 65)
        moreCoinsOnDock.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        moreCoinsOnDock.position = CGPoint(x: self.frame.size.width * 0.58, y: self.frame.size.height * 0.068)
        
        freeCoinsOnDock.size = CGSize(width: 65, height: 65)
        freeCoinsOnDock.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        freeCoinsOnDock.position = CGPoint(x: self.frame.size.width * 0.67, y: self.frame.size.height * 0.068)
        
        globeOnDock.size = CGSize(width: 65, height: 65)
        globeOnDock.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        globeOnDock.position = CGPoint(x: self.frame.size.width * 0.49, y: self.frame.size.height * 0.068)
        
        upgradesOnDock.size = CGSize(width: 65, height: 65)
        upgradesOnDock.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        upgradesOnDock.position = CGPoint(x: self.frame.size.width * 0.32, y: self.frame.size.height * 0.068)
        
        utilitesOnDock.size = CGSize(width: 65, height: 65)
        utilitesOnDock.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        utilitesOnDock.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.068)
        
        moreCoinsOnDockLabel.position = CGPoint(x: self.frame.size.width * 0.58, y: self.frame.size.height * 0.01)
        moreCoinsOnDockLabel.fontSize = 15
        moreCoinsOnDockLabel.text = "More Coins"
        moreCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        freeCoinsOnDockLabel.position = CGPoint(x: self.frame.size.width * 0.67, y: self.frame.size.height * 0.01)
        freeCoinsOnDockLabel.fontSize = 15
        freeCoinsOnDockLabel.text = "Free Coins"
        freeCoinsOnDockLabel.fontColor = SKColor.blackColor()
        
        globeOnDockLabel.position = CGPoint(x: self.frame.size.width * 0.49, y: self.frame.size.height * 0.01)
        globeOnDockLabel.fontSize = 15
        globeOnDockLabel.text = "Maps"
        globeOnDockLabel.fontColor = SKColor.blackColor()
        
        upgradesOnDockLabel.position = CGPoint(x: self.frame.size.width * 0.32, y: self.frame.size.height * 0.01)
        upgradesOnDockLabel.fontSize = 15
        upgradesOnDockLabel.text = "Upgrades"
        upgradesOnDockLabel.fontColor = SKColor(red: 24 / 255, green: 124 / 255, blue: 251 / 255, alpha: 1)
        
        utilitesOnDockLabel.position = CGPoint(x: self.frame.size.width * 0.4, y: self.frame.size.height * 0.01)
        utilitesOnDockLabel.fontSize = 15
        utilitesOnDockLabel.text = "Utilities"
        utilitesOnDockLabel.fontColor = SKColor.blackColor()
        
        //Maps
        
        DayTimePreview.size = CGSize(width: 48, height: 85.2)
        DayTimePreview.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        DayTimePreview.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.75)
        
        DayTimeLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.83)
        DayTimeLabel.fontSize = 45
        DayTimeLabel.text = "Day Time Background"
        DayTimeLabel.fontColor = SKColor.blackColor()
        
        DayTimePriceLabel.position = CGPoint(x: self.frame.size.width * 0.45, y: self.frame.size.height * 0.74)
        DayTimePriceLabel.fontSize = 30
        DayTimePriceLabel.text = "Free"
        DayTimePriceLabel.fontColor = SKColor.blackColor()
        
        DayTimeSelectLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.74)
        DayTimeSelectLabel.fontSize = 30
        DayTimeSelectLabel.text = "Selected"
        DayTimeSelectLabel.fontColor = SKColor.greenColor()
        
        NightTimePreview.size = CGSize(width: 48, height: 85.2)
        NightTimePreview.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        NightTimePreview.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.56)
        
        NightTimeLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.64)
        NightTimeLabel.fontSize = 45
        NightTimeLabel.text = "Night Time Background"
        NightTimeLabel.fontColor = SKColor.blackColor()
        
        NightTimePriceLabel.position = CGPoint(x: self.frame.size.width * 0.45, y: self.frame.size.height * 0.55)
        NightTimePriceLabel.fontSize = 30
        NightTimePriceLabel.text = "500 Coins"
        NightTimePriceLabel.fontColor = SKColor.blackColor()
        
        NightTimeSelectLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.55)
        NightTimeSelectLabel.fontSize = 30
        NightTimeSelectLabel.text = "Buy"
        NightTimeSelectLabel.fontColor = SKColor.blackColor()
        
        DesertPreview.size = CGSize(width: 48, height: 85.2)
        DesertPreview.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        DesertPreview.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.37)
        
        DesertLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.45)
        DesertLabel.fontSize = 45
        DesertLabel.text = "Desert Background"
        DesertLabel.fontColor = SKColor.blackColor()
        
        DesertPriceLabel.position = CGPoint(x: self.frame.size.width * 0.45, y: self.frame.size.height * 0.36)
        DesertPriceLabel.fontSize = 30
        DesertPriceLabel.text = "2500 Coins"
        DesertPriceLabel.fontColor = SKColor.blackColor()
        
        DesertSelectLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.36)
        DesertSelectLabel.fontSize = 30
        DesertSelectLabel.text = "Buy"
        DesertSelectLabel.fontColor = SKColor.blackColor()
        
        CityPreview.size = CGSize(width: 48, height: 85.2)
        CityPreview.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        CityPreview.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.18)
        
        CityLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.26)
        CityLabel.fontSize = 45
        CityLabel.text = "City Background"
        CityLabel.fontColor = SKColor.blackColor()
        
        CityPriceLabel.position = CGPoint(x: self.frame.size.width * 0.45, y: self.frame.size.height * 0.17)
        CityPriceLabel.fontSize = 30
        CityPriceLabel.text = "5000 Coins"
        CityPriceLabel.fontColor = SKColor.blackColor()
        
        CitySelectLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * 0.17)
        CitySelectLabel.fontSize = 30
        CitySelectLabel.text = "Buy"
        CitySelectLabel.fontColor = SKColor.blackColor()
        
        BeachPreview.size = CGSize(width: 48, height: 85.2)
        BeachPreview.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        BeachPreview.position = CGPoint(x: self.frame.size.width * 0.35, y: 0)
        
        BeachLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.07)
        BeachLabel.fontSize = 45
        BeachLabel.text = "Beach Background"
        BeachLabel.fontColor = SKColor.blackColor()
        
        BeachPriceLabel.position = CGPoint(x: self.frame.size.width * 0.45, y: self.frame.size.height * -0.02)
        BeachPriceLabel.fontSize = 30
        BeachPriceLabel.text = "# Coins"
        BeachPriceLabel.fontColor = SKColor.blackColor()
        
        BeachSelectLabel.position = CGPoint(x: self.frame.size.width * 0.6, y: self.frame.size.height * -0.02)
        BeachSelectLabel.fontSize = 30
        BeachSelectLabel.text = "Buy"
        BeachSelectLabel.fontColor = SKColor.blackColor()
        
        //Utilities
        
        RevivesImage.size = CGSize(width: 100, height: 100)
        RevivesImage.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        RevivesImage.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.7)
        
        RevivesLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.8)
        RevivesLabel.fontSize = 65
        RevivesLabel.text = "Revives"
        RevivesLabel.fontColor = SKColor.blackColor()
        
        RevivesBuyLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.66)
        RevivesBuyLabel.fontSize = 34
        RevivesBuyLabel.text = "Buy"
        RevivesBuyLabel.fontColor = SKColor.blackColor()
        
        RevivesPriceLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.73)
        RevivesPriceLabel.fontSize = 35
        RevivesPriceLabel.text = "15 Coins"
        RevivesPriceLabel.fontColor = SKColor.blackColor()
        
        RevivesCountLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.58)
        RevivesCountLabel.fontSize = 35
        RevivesCountLabel.text = "Revives: \(RevivesCount)"
        RevivesCountLabel.fontColor = SKColor.blackColor()
        
        RevivesDescriptionLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.53)
        RevivesDescriptionLabel.fontSize = 20
        RevivesDescriptionLabel.text = "Revives allow you to continue playing after dying."
        RevivesDescriptionLabel.fontColor = SKColor.blackColor()
        
        ScoreBoosterImage.size = CGSize(width: 111.5, height: 74)
        ScoreBoosterImage.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ScoreBoosterImage.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.32)
        
        ScoreBoosterLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.42)
        ScoreBoosterLabel.fontSize = 65
        ScoreBoosterLabel.text = "Score Boosters"
        ScoreBoosterLabel.fontColor = SKColor.blackColor()
        
        ScoreBoosterBuyLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.28)
        ScoreBoosterBuyLabel.fontSize = 34
        ScoreBoosterBuyLabel.text = "Buy"
        ScoreBoosterBuyLabel.fontColor = SKColor.blackColor()
        
        ScoreBoosterPriceLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.35)
        ScoreBoosterPriceLabel.fontSize = 35
        ScoreBoosterPriceLabel.text = "15 Coins"
        ScoreBoosterPriceLabel.fontColor = SKColor.blackColor()
        
        ScoreBoosterCountLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.2)
        ScoreBoosterCountLabel.fontSize = 35
        ScoreBoosterCountLabel.text = "Score Boosters: \(ScoreBoosterCount)"
        ScoreBoosterCountLabel.fontColor = SKColor.blackColor()
        
        ScoreBoosterDescriptionLabel.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.165)
        ScoreBoosterDescriptionLabel.fontSize = 20
        ScoreBoosterDescriptionLabel.text = "Score Boosters add 5 points to"
        ScoreBoosterDescriptionLabel.fontColor = SKColor.blackColor()
        
        ScoreBoosterDescriptionLabel2.position = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.145)
        ScoreBoosterDescriptionLabel2.fontSize = 20
        ScoreBoosterDescriptionLabel2.text = "your score at the end of a game."
        ScoreBoosterDescriptionLabel2.fontColor = SKColor.blackColor()
        
        storeLabel.zPosition = 101
        backButton.zPosition = 101
        redStatusBar.zPosition = 100
        coinIcon.zPosition = 100
        coinsLabel.zPosition = 100
        upgradesOnDock.zPosition = 99
        upgradesOnDockLabel.zPosition = 99
        utilitesOnDock.zPosition = 99
        utilitesOnDockLabel.zPosition = 99
        globeOnDock.zPosition = 99
        globeOnDockLabel.zPosition = 99
        moreCoinsOnDock.zPosition = 99
        moreCoinsOnDockLabel.zPosition = 99
        freeCoinsOnDock.zPosition = 99
        freeCoinsOnDockLabel.zPosition = 99
        dock.zPosition = 98
        
        self.addChild(dock)
        self.addChild(redStatusBar)
        self.addChild(backButton)
        self.addChild(storeLabel)
        self.addChild(coinIcon)
        self.addChild(coinsLabel)
        self.addChild(coinMagnet)
        self.addChild(coinMagnetLabel)
        self.addChild(coinMagnetUpgradeLabel)
        self.addChild(coinMagnetDescriptionLabel)
        self.addChild(coinMagnetPriceLabel)
        self.addChild(megaCoin)
        self.addChild(megaCoinLabel)
        self.addChild(megaCoinUpgradeLabel)
        self.addChild(megaCoinDescriptionLabel)
        self.addChild(megaCoinPriceLabel)
        self.addChild(armor)
        self.addChild(armorLabel)
        self.addChild(armorUpgradeLabel)
        self.addChild(armorDescriptionLabel)
        self.addChild(armorPriceLabel)
        //self.addChild(slowMo)
        //self.addChild(slowMoLabel)
        //self.addChild(slowMoUpgradeLabel)
        //self.addChild(slowMoDescriptionLabel)
        //self.addChild(slowMoPriceLabel)
        self.addChild(upgradesOnDock)
        self.addChild(globeOnDock)
        self.addChild(moreCoinsOnDock)
        self.addChild(freeCoinsOnDock)
        self.addChild(utilitesOnDock)
        self.addChild(upgradesOnDockLabel)
        self.addChild(globeOnDockLabel)
        self.addChild(moreCoinsOnDockLabel)
        self.addChild(freeCoinsOnDockLabel)
        self.addChild(utilitesOnDockLabel)
        self.addChild(doubleCoinsLabel)
        self.addChild(doubleCoinsDescriptionLabel)
        self.addChild(doubleCoinsPriceLabel)
        self.addChild(pileOfCoinsLabel)
        self.addChild(pileOfCoinsAmountOfCoinsLabel)
        self.addChild(pileOfCoinsPriceLabel)
        self.addChild(bagOfCoinsLabel)
        self.addChild(bagOfCoinsAmountOfCoinsLabel)
        self.addChild(bagOfCoinsPriceLabel)
        self.addChild(crateOfCoinsLabel)
        self.addChild(crateOfCoinsAmountOfCoinsLabel)
        self.addChild(crateOfCoinsPriceLabel)
        self.addChild(chestOfCoinsLabel)
        self.addChild(chestOfCoinsAmountOfCoinsLabel)
        self.addChild(chestOfCoinsPriceLabel)
        self.addChild(shipOfCoinsLabel)
        self.addChild(shipOfCoinsAmountOfCoinsLabel)
        self.addChild(shipOfCoinsPriceLabel)
        self.addChild(coinMagnetlvl1)
        self.addChild(coinMagnetlvl2)
        self.addChild(coinMagnetlvl3)
        self.addChild(coinMagnetlvl4)
        self.addChild(coinMagnetlvl5)
        self.addChild(megaCoinlvl1)
        self.addChild(megaCoinlvl2)
        self.addChild(megaCoinlvl3)
        self.addChild(megaCoinlvl4)
        self.addChild(megaCoinlvl5)
        self.addChild(armorlvl1)
        self.addChild(armorlvl2)
        self.addChild(armorlvl3)
        self.addChild(armorlvl4)
        self.addChild(armorlvl5)
        //self.addChild(slowMolvl1)
        //self.addChild(slowMolvl2)
        //self.addChild(slowMolvl3)
        //self.addChild(slowMolvl4)
        //self.addChild(slowMolvl5)
        self.addChild(twitter)
        self.addChild(twitter10)
        self.addChild(facebook)
        self.addChild(facebook10)
        self.addChild(instagram)
        self.addChild(instagram10)
        self.addChild(feedback)
        self.addChild(feedback10)
        self.addChild(Review)
        self.addChild(Review10)
        self.addChild(DayTimePreview)
        self.addChild(DayTimeLabel)
        self.addChild(DayTimePriceLabel)
        self.addChild(DayTimeSelectLabel)
        self.addChild(NightTimePreview)
        self.addChild(NightTimeLabel)
        self.addChild(NightTimePriceLabel)
        self.addChild(NightTimeSelectLabel)
        self.addChild(DesertPreview)
        self.addChild(DesertLabel)
        self.addChild(DesertPriceLabel)
        self.addChild(DesertSelectLabel)
        self.addChild(CityPreview)
        self.addChild(CityLabel)
        self.addChild(CityPriceLabel)
        self.addChild(CitySelectLabel)
        //self.addChild(BeachPreview)
        //self.addChild(BeachLabel)
        //self.addChild(BeachPriceLabel)
        //self.addChild(BeachSelectLabel)
        self.addChild(RevivesLabel)
        self.addChild(RevivesImage)
        self.addChild(RevivesBuyLabel)
        self.addChild(RevivesPriceLabel)
        self.addChild(RevivesCountLabel)
        self.addChild(RevivesDescriptionLabel)
        self.addChild(ScoreBoosterLabel)
        self.addChild(ScoreBoosterImage)
        self.addChild(ScoreBoosterBuyLabel)
        self.addChild(ScoreBoosterPriceLabel)
        self.addChild(ScoreBoosterCountLabel)
        self.addChild(ScoreBoosterDescriptionLabel)
        self.addChild(ScoreBoosterDescriptionLabel2)
        
        coins += 5000
        
        displayUpgrades()
        checkBackgrounds()
        checkUpgrades()
        setUpIAPS()
        makeRect()
        
        maxPositionForMaps = CityLabel.position.y
        minPositionForMaps = BeachLabel.position.y
        
        maxPositionForUpgrades = armorLabel.position.y
        minPositionForUpgrades = slowMoLabel.position.y
        
        soundEffectsBool = NSUserDefaults.standardUserDefaults().boolForKey("Effects")
        
        coins = NSUserDefaults.standardUserDefaults().integerForKey("Coins")
        coinsLabel.text = "\(coins)"
        
        RevivesCount = NSUserDefaults.standardUserDefaults().integerForKey("Revives")
        RevivesCountLabel.text = "Revives: \(RevivesCount)"
        
        ScoreBoosterCount = NSUserDefaults.standardUserDefaults().integerForKey("Score Boosters")
        ScoreBoosterCountLabel.text = "Score Boosters: \(ScoreBoosterCount)"
        
        doubledCoins = NSUserDefaults.standardUserDefaults().boolForKey("Double Coins")
        if doubledCoins == true {
            doubleCoinsPriceLabel.hidden = true
            doubleCoinsLabel.position.x = self.frame.size.width * 0.5
            doubleCoinsLabel.text = "Coins Doubled"
        }
    }
    
    func playTapSound() {
        if soundEffectsBool == true {
            let tapSound = SKAction.playSoundFileNamed("TapSound.wav", waitForCompletion: false)
            runAction(tapSound)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            firstTouchPosition = location
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            movedTouchPosition = location
            
            if inUpgrades == true {
                //upgradesScrollView()
            }
            
            if inUtilities == true {
                //utilitiesScrollVeiw()
            }
            
            if inMaps == true {
                //mapsScrollView()
            }
            
            if inGetMoreCoins == true {
                //moreCoinsScrollView()
            }
            
            if inGetFreeCoins == true {
                //freeCoinsScrollView()
            }
            
            firstTouchPosition = location
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if scrolled == false {
            for touch: AnyObject in touches {
                let location = touch.locationInNode(self)
                if backButton.containsPoint(location) {
                    playTapSound()
                    let home = GameScene(size: self.size)
                    home.scaleMode = self.scaleMode
                    let reveal = SKTransition.doorsCloseVerticalWithDuration(1)
                    self.view?.presentScene(home, transition: reveal)
                }
            
                if inUpgrades == true {
                    if coinMagnetUpgradeLabel.containsPoint(location) {
                        playTapSound()
                        upgradeCoinMagnet()
                    }
                
                    if megaCoinUpgradeLabel.containsPoint(location) {
                        playTapSound()
                        upgradeMegaCoin()
                    }
                
                    if armorUpgradeLabel.containsPoint(location) {
                        playTapSound()
                        upgradeArmor()
                    }
                }
            
                if inGetFreeCoins == true {
                    if facebookRect.contains(location) {
                        playTapSound()
                        showFacebook()
                    }
                
                    if twitterRect.contains(location) {
                        playTapSound()
                        showTwitter()
                    }
                
                    if instagramRect.contains(location) {
                        playTapSound()
                        showInstagram()
                    }
                
                    if feedbackRect.contains(location) {
                        playTapSound()
                        showFeedback()
                    }
                
                    if rateRect.contains(location) {
                        playTapSound()
                        showRate()
                    }
                }
            
                if inMaps == true {
                    if DayTimeSelectLabel.containsPoint(location) {
                        playTapSound()
                        dayTimeSelect()
                    }
                
                    if NightTimeSelectLabel.containsPoint(location) {
                        playTapSound()
                        nightTimeSelect()
                    }
                
                    if DesertSelectLabel.containsPoint(location) {
                        playTapSound()
                        desertSelect()
                    }
                
                    if CitySelectLabel.containsPoint(location) {
                        playTapSound()
                        citySelect()
                    }
                }
            
                if inUtilities == true {
                    if RevivesBuyLabel.containsPoint(location) {
                        playTapSound()
                        if coins >= 15 && RevivesCount < 100 {
                            coins -= 15
                            coinsLabel.text = "\(coins)"
                            saveCoins(coins)
                            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
                            NSUserDefaults.standardUserDefaults().synchronize()
                            RevivesCount += 1
                            RevivesCountLabel.text = "Revives: \(RevivesCount)"
                            NSUserDefaults.standardUserDefaults().setInteger(RevivesCount, forKey: "Revives")
                            NSUserDefaults.standardUserDefaults().synchronize()
                        } else if coins < 15 {
                            notEnoughCoins()
                        } else {
                            tooManyRevives()
                        }
                    }
                
                    if ScoreBoosterBuyLabel.containsPoint(location) {
                        playTapSound()
                        if coins >= 15 && ScoreBoosterCount < 100 {
                            coins -= 15
                            coinsLabel.text = "\(coins)"
                            saveCoins(coins)
                            NSUserDefaults.standardUserDefaults().setInteger(coins, forKey: "Coins")
                            NSUserDefaults.standardUserDefaults().synchronize()
                            ScoreBoosterCount += 1
                            ScoreBoosterCountLabel.text = "Score Boosters: \(ScoreBoosterCount)"
                            NSUserDefaults.standardUserDefaults().setInteger(ScoreBoosterCount, forKey: "Score Boosters")
                            NSUserDefaults.standardUserDefaults().synchronize()
                        } else if coins < 15 {
                            notEnoughCoins()
                        } else {
                            tooManyScoreBoosters()
                        }
                    }
                }
            
                if inGetMoreCoins == true {
                    if doubleCoinsRect.contains(location) {
                        playTapSound()
                        startDoubleCoins()
                    }
                
                    if pileOfCoinsRect.contains(location) {
                        playTapSound()
                        startPileOfCoins()
                    }
                
                    if bagOfCoinsRect.contains(location) {
                        playTapSound()
                        startBagOfCoins()
                    }
                
                    if crateOfCoinsRect.contains(location) {
                        playTapSound()
                        startCrateOfCoins()
                    }
                
                    if chestOfCoinsRect.contains(location) {
                    playTapSound()
                    startChestOfCoins()
                    }
                
                    if shipOfCoinsRect.contains(location) {
                        playTapSound()
                        startShipOfCoins()
                    }
                }
            
                if upgradesOnDock.containsPoint(location) {
                    playTapSound()
                    displayUpgrades()
                }
            
                if utilitesOnDock.containsPoint(location) {
                    playTapSound()
                    displayUtilities()
                }
            
                if globeOnDock.containsPoint(location) {
                    playTapSound()
                    displayMaps()
                }
            
                if moreCoinsOnDock.containsPoint(location) {
                    playTapSound()
                    displayMoreCoins()
                }
            
                if freeCoinsOnDock.containsPoint(location) {
                    playTapSound()
                    displayFreeCoins()
                }
            }
        }
        scrolled = false
    }
}