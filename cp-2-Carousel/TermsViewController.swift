//
//  TermsViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/28/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var termsWebView: UIWebView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = "https://www.dropbox.com/terms?mobile=1"
        let targetURL = NSURL(string: url)
        let request = NSURLRequest(URL: targetURL!)
        termsWebView.loadRequest(request)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
