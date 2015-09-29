//
//  CreateAccountViewController.swift
//  cp-2-Carousel
//
//  Created by Sebastian Drew on 9/28/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var textFieldViewContainer: UIView!
    @IBOutlet weak var createButtonViewContainer: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkboxUnchecked: UIButton!
    @IBOutlet weak var checkboxChecked: UIButton!
    
    var fieldsInitialY: CGFloat!
    var btnInitialY: CGFloat!
    let offset: CGFloat = -110
    let offsetBtn: CGFloat = -190


    override func viewDidLoad() {
        super.viewDidLoad()

        fieldsInitialY = textFieldViewContainer.frame.origin.y
        btnInitialY = createButtonViewContainer.frame.origin.y
        
        checkboxChecked.alpha = 0
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonDidPress(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func checkboxUncheckedDidPress(sender: AnyObject) {
        checkboxChecked.alpha = 1
        checkboxUnchecked.alpha = 0
    }
    
  
    @IBAction func checkboxCheckedDidPress(sender: AnyObject) {
        checkboxChecked.alpha = 0
        checkboxUnchecked.alpha = 1
    }
    
    @IBAction func termsButtonDidPRess(sender: AnyObject) {
        
       var termsController: TermsViewController
        
        termsController = self.storyboard?.instantiateViewControllerWithIdentifier("TermsViewController") as! TermsViewController
        
        self.presentViewController(termsController, animated: true, completion: nil)

    }
    
    @IBAction func createButtonDidPress(sender: AnyObject) {
        
        
        if self.firstNameTextField.text != "" && self.lastNameTextField.text != "" && self.emailTextField.text != "" && self.passwordTextField.text != "" && checkboxUnchecked.alpha != 1 {
            
            
            let alertController = UIAlertController(title: "Creating Your Account", message: nil, preferredStyle: .Alert)
            
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
                
                delay(2, closure: { () -> () in
                    
                    self.dismissViewControllerAnimated(true, completion: nil)
                    self.performSegueWithIdentifier("CreatedToIntroSegue", sender: self)
                    
                    
                })
                
            }
            
        } else {
            
            
            let alertController = UIAlertController(title: "All fields required", message: "Please fill out all fields and agree to the terms.", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                
                // ...
                
            }
            alertController.addAction(okAction)
            
            presentViewController(alertController, animated: true) {
                
                // ...
                
            }
            
        }

    }
    
    @IBAction func onTapOut(sender: AnyObject) {
        firstNameTextField.endEditing(true)
        lastNameTextField.endEditing(true)
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        
        textFieldViewContainer.frame.origin = CGPoint(x: textFieldViewContainer.frame.origin.x, y: fieldsInitialY + self.offset)
       createButtonViewContainer.frame.origin = CGPoint(x: createButtonViewContainer.frame.origin.x, y: btnInitialY + offsetBtn)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        textFieldViewContainer.frame.origin = CGPoint(x: textFieldViewContainer.frame.origin.x, y: fieldsInitialY)
        createButtonViewContainer.frame.origin = CGPoint(x: createButtonViewContainer.frame.origin.x, y: btnInitialY)
    }

}
