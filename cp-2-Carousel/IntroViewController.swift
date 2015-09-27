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
        
        
        /*
        photoImage04.transform = CGAffineTransformMakeRotation(CGFloat(10 * M_PI / 180))
        photoImage02.transform = CGAffineTransformMakeRotation(CGFloat(-20 * M_PI / 180))
        photoImage03.transform = CGAffineTransformMakeRotation(CGFloat(10 * M_PI / 180))
        photoImage05.transform = CGAffineTransformMakeRotation(CGFloat(14 * M_PI / 180))
        photoImage06.transform = CGAffineTransformMakeRotation(CGFloat(-10 * M_PI / 180))
        photoImage01.transform = CGAffineTransformMakeRotation(CGFloat(-10 * M_PI / 180))
        */
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = CGFloat(scrollView.contentOffset.y)
        
    
        
      
        
        
        photoImage01.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        
        print("content offset \(scrollView.contentOffset.y)")
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
    }
    
}
