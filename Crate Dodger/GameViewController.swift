//
//  GameViewController.swift
//  Crate Dodger
//
//  Created by Ben Loan on 9/6/15.
//  Copyright (c) 2015 Ben Loan. All rights reserved.
//

import UIKit
import SpriteKit
import iAd

class GameViewController: UIViewController, ADBannerViewDelegate {
    var height = UIScreen.mainScreen().bounds.height
    let transition = SKTransition.fadeWithDuration(1)
    var Ad: ADBannerView = ADBannerView()
    
    override func viewWillAppear(animated: Bool) {
        let BV = Ad.bounds.height
        Ad.delegate = self
        Ad.frame = CGRectMake(0, height + BV, 0, 0)
        self.view.addSubview(Ad)
    }
    
    override func viewWillDisappear(animated: Bool) {
        Ad.delegate = nil
        Ad.removeFromSuperview()
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        //var BV = Ad.bounds.height
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        Ad.alpha = 1
        UIView.commitAnimations()
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        Ad.alpha = 0
        UIView.commitAnimations()
    }
    
    func showBannerAd() {
        Ad.hidden = false
        let BV = Ad.bounds.height
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        Ad.frame = CGRectMake(0, height - BV, 0, 0)
        UIView.commitAnimations()
    }
    
    func hideBannerAd() {
        Ad.hidden = true
        let BV = Ad.bounds.height
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        Ad.frame = CGRectMake(0, height + BV, 0, 0)
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Ad.hidden = true
        Ad.alpha = 0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.hideBannerAd), name: "hideadsID", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(GameViewController.showBannerAd), name: "showadsID", object: nil)
            if let scene = GameScene(fileNamed:"GameScene") {
                // Configure the view.
                let skView = self.view as! SKView
                skView.showsFPS = false
                skView.showsNodeCount = false
            
                /* Sprite Kit applies additional optimizations to improve rendering performance */
                skView.ignoresSiblingOrder = true
            
                /* Set the scale mode to scale to fit the window */
                scene.scaleMode = .AspectFill
            
                skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .Portrait
        } else {
            return .Portrait
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
