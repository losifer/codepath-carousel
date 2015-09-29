//
//  FeedViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/28/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = feedImage.image!.size
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 36
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 36
        
        scrollView.sendSubviewToBack(feedImage)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("SettingsSegue", sender: self)
    }

    @IBAction func chatButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("ConversationsSegue", sender: self)
    }

}
