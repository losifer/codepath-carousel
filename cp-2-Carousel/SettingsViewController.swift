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
        // scrollView.contentInset.top = 0
        // scrollView.contentInset.bottom = 36
        // scrollView.scrollIndicatorInsets.top = 0
        // scrollView.scrollIndicatorInsets.bottom = 36
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func settingsBackButtonDidTouch(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func signOutButtonDidTouch(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
