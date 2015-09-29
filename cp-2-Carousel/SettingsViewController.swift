//
//  SettingsViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/28/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var settingsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = settingsImage.image!.size
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsBackButtonDidTouch(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func signOutButtonDidTouch(sender: AnyObject) {
       
        // ...
        
    }

}
