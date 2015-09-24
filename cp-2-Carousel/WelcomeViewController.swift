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
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        pageControl.currentPage = page
        
    }

}
