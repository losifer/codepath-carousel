//
//  WelcomeViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/24/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backupSpinButtonContainer: UIView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func spinButtonDidTouch(sender: AnyObject) {
        
        performSegueWithIdentifier("SpinSegue", sender: self)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.x
        
        let finalOffset = scrollView.contentSize.width - scrollView.frame.width
        
        // print("Current Offset \(currentOffset) Final Offset \(finalOffset)")
        
        if scrollView == finalOffset {
             pageControl.alpha = 0
        }
       
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        pageControl.currentPage = page
        
        if pageControl.currentPage == 3 {
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.pageControl.alpha = 0
                
                self.backupSpinButtonContainer.alpha = 1
            })
            
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.pageControl.alpha = 1
                self.backupSpinButtonContainer.alpha = 0
            })
        }

        
    }

}
