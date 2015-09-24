//
//  IntroViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/23/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImage: UIImageView!
    @IBOutlet weak var photoImage01: UIImageView!
    @IBOutlet weak var photoImage02: UIImageView!
    @IBOutlet weak var photoImage03: UIImageView!
    @IBOutlet weak var photoImage04: UIImageView!
    @IBOutlet weak var photoImage05: UIImageView!
    @IBOutlet weak var photoImage06: UIImageView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        scrollView.contentSize = introImage.image!.size
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        photoImage01.center.y = photoImage01.center.y - 100
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
}
