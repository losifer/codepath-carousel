//
//  LoginViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/24/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldViewContainer: UIView!
    @IBOutlet weak var signInButtonView: UIImageView!
    @IBOutlet weak var userNameTexrField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var fieldsInitialY: CGFloat!
    var btnInitialY: CGFloat!
    let offset: CGFloat = -100
    let offsetBtn: CGFloat = -180
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fieldsInitialY = textFieldViewContainer.frame.origin.y
        btnInitialY = signInButtonView.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapOut(sender: AnyObject) {
        userNameTexrField.endEditing(true)
        passwordTextField.endEditing(true)
    }

    func keyboardWillShow(notification: NSNotification!) {
        
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        let kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.textFieldViewContainer.frame.origin = CGPoint(x: self.textFieldViewContainer.frame.origin.x, y: self.fieldsInitialY + self.offset)
            
            self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: self.btnInitialY + self.offsetBtn)
            
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        let kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        let animationDuration = durationValue.doubleValue
        let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        let animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            self.textFieldViewContainer.frame.origin = CGPoint(x: self.textFieldViewContainer.frame.origin.x, y: self.fieldsInitialY)
            self.signInButtonView.frame.origin = CGPoint(x: self.signInButtonView.frame.origin.x, y: self.btnInitialY)
            
            }, completion: nil)
        
    }

}
