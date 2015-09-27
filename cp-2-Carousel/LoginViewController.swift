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
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButtonContainer: UIView!
    
    var fieldsInitialY: CGFloat!
    var btnInitialY: CGFloat!
    let offset: CGFloat = -100
    let offsetBtn: CGFloat = -220
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fieldsInitialY = textFieldViewContainer.frame.origin.y
        btnInitialY = loginButtonContainer.frame.origin.y
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signInButtonDidTouch(sender: AnyObject) {
        
       if self.userNameTextField.text == "x" && self.passwordTextField.text == "x" {
        
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
       
        
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
            
            delay(2, closure: { () -> () in
                
                self.dismissViewControllerAnimated(true, completion: nil)
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
                
                
            })
            
            
            
        }

        
      } else {
        
        
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .Alert)
        
        
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

}
