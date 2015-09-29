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
    @IBOutlet weak var photoImage01Couple: UIImageView!
    @IBOutlet weak var photoImage02Lake: UIImageView!
    @IBOutlet weak var photoImage03Deer: UIImageView!
    @IBOutlet weak var photoImage04Cabin: UIImageView!
    @IBOutlet weak var photoImage05Dog: UIImageView!
    @IBOutlet weak var photoImage06Fishing: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        scrollView.contentSize = introImage.image!.size
        scrollView.sendSubviewToBack(introImage)
        scrollView.contentOffset.y = -20
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    // MARK: Actions
    
    @IBAction func createDropboxButtonDidPress(sender: AnyObject) {
        
        performSegueWithIdentifier("CreateSegue", sender: self)
        
    }
    
    @IBAction func signInButtonDidPress(sender: AnyObject) {
        
        performSegueWithIdentifier("SignInSegue", sender: self)
        
    }
    
    // MARK: scrollViewDidScroll
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = CGFloat(scrollView.contentOffset.y)
        
        // Couple
        
        let tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -55, r2Max: 0)
        let ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -295, r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        photoImage01Couple.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        photoImage01Couple.transform = CGAffineTransformScale(photoImage01Couple.transform, CGFloat(scale), CGFloat(scale))
        photoImage01Couple.transform = CGAffineTransformRotate(photoImage01Couple.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        let tx02 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 95, r2Max: 0)
        let ty02 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        let scale02 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation02 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
            
        photoImage02Lake.transform = CGAffineTransformMakeTranslation(CGFloat(tx02), CGFloat(ty02))
        photoImage02Lake.transform = CGAffineTransformScale(photoImage02Lake.transform, CGFloat(scale02), CGFloat(scale02))
        photoImage02Lake.transform = CGAffineTransformRotate(photoImage02Lake.transform, CGFloat(Double(rotation02) * M_PI / 180))
        
        let tx03 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min:45, r2Max: 0)
        let ty03 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -280, r2Max: 0)
        let scale03 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        let rotation03 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        photoImage03Deer.transform = CGAffineTransformMakeTranslation(CGFloat(tx03), CGFloat(ty03))
        photoImage03Deer.transform = CGAffineTransformScale(photoImage03Deer.transform, CGFloat(scale03), CGFloat(scale03))
        photoImage03Deer.transform = CGAffineTransformRotate(photoImage03Deer.transform, CGFloat(Double(rotation03) * M_PI / 180))
        
        let tx04 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -110, r2Max: 0)
        let ty04 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -520, r2Max: 0)
        let scale04 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        let rotation04 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        photoImage04Cabin.transform = CGAffineTransformMakeTranslation(CGFloat(tx04), CGFloat(ty04))
        photoImage04Cabin.transform = CGAffineTransformScale(photoImage04Cabin.transform, CGFloat(scale04), CGFloat(scale04))
        photoImage04Cabin.transform = CGAffineTransformRotate(photoImage04Cabin.transform, CGFloat(Double(rotation04) * M_PI / 180))
        
        let tx05 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -90, r2Max: 0)
        let ty05 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -505, r2Max: 0)
        let scale05 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation05 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        photoImage05Dog.transform = CGAffineTransformMakeTranslation(CGFloat(tx05), CGFloat(ty05))
        photoImage05Dog.transform = CGAffineTransformScale(photoImage05Dog.transform, CGFloat(scale05), CGFloat(scale05))
        photoImage05Dog.transform = CGAffineTransformRotate(photoImage05Dog.transform, CGFloat(Double(rotation05) * M_PI / 180))
        
        let tx06 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 20, r2Max: 0)
        let ty06 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -440, r2Max: 0)
        let scale06 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        let rotation06 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        photoImage06Fishing.transform = CGAffineTransformMakeTranslation(CGFloat(tx06), CGFloat(ty06))
        photoImage06Fishing.transform = CGAffineTransformScale(photoImage06Fishing.transform, CGFloat(scale06), CGFloat(scale06))
        photoImage06Fishing.transform = CGAffineTransformRotate(photoImage06Fishing.transform, CGFloat(Double(rotation06) * M_PI / 180))
       
        

       // print("content offset \(scrollView.contentOffset.y)")
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
