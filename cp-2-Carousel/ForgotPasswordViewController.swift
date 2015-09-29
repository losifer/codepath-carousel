//
//  ForgotPasswordViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/28/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButtonViewContainer: UIView!
    @IBOutlet weak var emailTextFieldViewContainer: UIView!
    
    var btnInitialY: CGFloat!
    let offsetBtn: CGFloat = -200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnInitialY = sendButtonViewContainer.frame.origin.y
        
        emailTextField.delegate = self

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.emailTextFieldViewContainer.alpha = 1
            self.emailTextFieldViewContainer.transform = CGAffineTransformMakeScale(CGFloat(1), CGFloat(1))
            }, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        emailTextFieldViewContainer.alpha = 0
        emailTextFieldViewContainer.transform = CGAffineTransformMakeScale(CGFloat(0.6), CGFloat(0.6))
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonDidTouch(sender: AnyObject) {
        
        
        if self.emailTextField.text == "los@gmail.com" {
            
            
            let alertController = UIAlertController(title: "Password reset.", message: "Please check your email for a link to reset your password.", preferredStyle: .Alert)
            
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                
                delay(2, closure: { () -> () in
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.navigationController!.popViewControllerAnimated(true)
                    // self.performSegueWithIdentifier("ReturnToLogin", sender: self)
                    
                })
                
            }
            
            
        } else if self.emailTextField.text == "" {
           
            let alertView = UIAlertController(title: "Email field was blank", message: "Please enter a valid email.", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                
                // ...
                
            }
            alertView.addAction(okAction)
            
            self.presentViewController(alertView, animated: true) {
                // ...
                
            }
            
            
        } else {
            
            
            let alertController = UIAlertController(title: "Retrieving password", message: nil, preferredStyle: .Alert)
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                
                delay(2, closure: { () -> () in
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                    let alertView = UIAlertController(title: "Email not found", message: "Email entered was not found. Please try again.", preferredStyle: .Alert)
                    
                    let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                        
                        // ...
                        
                    }
                    alertView.addAction(okAction)
                    
                    self.presentViewController(alertView, animated: true) {
                        // ...
                        
                    }
                    
                })
                
            }
            
        }
        
    }
    
    @IBAction func backButtonDidTouch(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func onTapOut(sender: AnyObject) {
        emailTextField.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        
        sendButtonViewContainer.frame.origin = CGPoint(x: sendButtonViewContainer.frame.origin.x, y: btnInitialY + offsetBtn)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        sendButtonViewContainer.frame.origin = CGPoint(x: sendButtonViewContainer.frame.origin.x, y: btnInitialY)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        
        return true
    }

    
}
