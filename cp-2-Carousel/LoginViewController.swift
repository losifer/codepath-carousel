//
//  LoginViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/24/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldViewContainer: UIView!
    @IBOutlet weak var signInButtonView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonContainer: UIView!
    @IBOutlet weak var justTheFormFieldsView: UIView!
    
    var fieldsInitialY: CGFloat!
    var btnInitialY: CGFloat!
    let offset: CGFloat = -100
    let offsetBtn: CGFloat = -220
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fieldsInitialY = textFieldViewContainer.frame.origin.y
        btnInitialY = loginButtonContainer.frame.origin.y
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            self.justTheFormFieldsView.alpha = 1
            self.justTheFormFieldsView.transform = CGAffineTransformMakeScale(CGFloat(1), CGFloat(1))
            }, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        justTheFormFieldsView.alpha = 0
        justTheFormFieldsView.transform = CGAffineTransformMakeScale(CGFloat(0.6), CGFloat(0.6))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forgotPasswordDidTouch(sender: AnyObject) {
        
        performSegueWithIdentifier("ForgotPasswordSegue", sender: self)
        
    }
    
    @IBAction func backButtonDidTouch(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func signInButtonDidTouch(sender: AnyObject) {
        
       if self.userNameTextField.text == "los@gmail.com" && self.passwordTextField.text == "password" {
        
        
        let alertController = UIAlertController(title: "Logging in", message: nil, preferredStyle: .Alert)
       
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
            delay(2, closure: { () -> () in
                
                self.dismissViewControllerAnimated(true, completion: nil)
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
                
                
            })
            
        }

        
       } else if self.userNameTextField.text == "" || self.passwordTextField.text == "" {
        
        
        let alertView = UIAlertController(title: "Login Error", message: "Email and/or password field empty.", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
            
            // ...
            
        }
        alertView.addAction(okAction)
        
        self.presentViewController(alertView, animated: true) {
            // ...
            
        }
        
        
       } else {
        
        
    let alertController = UIAlertController(title: "Logging in", message: nil, preferredStyle: .Alert)
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
                delay(2, closure: { () -> () in
                
                    self.dismissViewControllerAnimated(true, completion: nil)
                    let alertView = UIAlertController(title: "Login Error", message: "Wrong login info. Please try again.", preferredStyle: .Alert)
                
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
    
    @IBAction func onTapOut(sender: AnyObject) {
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        
        textFieldViewContainer.frame.origin = CGPoint(x: textFieldViewContainer.frame.origin.x, y: fieldsInitialY + self.offset)
        loginButtonContainer.frame.origin = CGPoint(x: loginButtonContainer.frame.origin.x, y: btnInitialY + offsetBtn)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        textFieldViewContainer.frame.origin = CGPoint(x: textFieldViewContainer.frame.origin.x, y: fieldsInitialY)
        loginButtonContainer.frame.origin = CGPoint(x: loginButtonContainer.frame.origin.x, y: btnInitialY)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        return true
    }

}
