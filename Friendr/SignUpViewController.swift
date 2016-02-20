//
//  SignUpViewController.swift
//  Friendr
//
//  Created by Sau Chung Loh on 2/12/16.
//  Copyright © 2016 FriendrTeam. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var fieldsBackgroundView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        validateFields()
    }
    
    func validateFields() {
        let email = self.emailTextField.text
        let confirmEmail = self.confirmEmailTextField.text
        let password = self.passwordTextField.text
        let confirmPassword = self.confirmPasswordTextField.text
        let username = self.usernameTextField.text
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
        
        //Ensure all fields are entered
        if email == "" || confirmEmail == "" || password == "" || confirmPassword == "" || username == ""  {
            let alert = UIAlertController(title: "Sorry!", message: "Please fill out all fields.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(dismissAction)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        //Confirm email address
        guard email == confirmEmail else {
            print("Your email addresses does not match")
            
            let alert = UIAlertController(title: "Sorry!", message: "Your email addresses do not match!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(dismissAction)
            self.presentViewController(alert, animated: true, completion: nil)
            
            self.confirmEmailTextField.text = ""
            return
        }
        
        guard password == confirmPassword else {
            print("Your passwords do not match!")
            
            let alert = UIAlertController(title: "Sorry!", message: "Your passwords do not match!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(dismissAction)
            self.presentViewController(alert, animated: true, completion: nil)
            
            self.passwordTextField.text = ""
            self.confirmPasswordTextField.text = ""
            return
        }
        
        //Checks for a valid password
        guard password?.isValidPassword == true else {
            let alert = UIAlertController(title: "Sorry!", message: "Your password must be at least 8 characters long and have at least one lowercase letter, one uppercase letter, and one number.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(dismissAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
        print("Valid Password")
        
        //Check username for special characters and spaces. Should we allow '.' and numbers?
        guard username?.isValidUsername == true else {
            let alert = UIAlertController(title: "Sorry!", message: "No special characters allowed", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(dismissAction)
            self.presentViewController(alert, animated: true, completion: nil)
            return
        }
        
    }
    
    func applyStyle() {
        
        var backgroundImagePath: String?
        let bundle = NSBundle.mainBundle()
        
        backgroundImagePath = bundle.pathForResource("login_background", ofType: "JPG")
        
        if backgroundImagePath != nil {
            backgroundImageView?.image = UIImage(contentsOfFile: backgroundImagePath!)
        }
        
        fieldsBackgroundView?.layer.cornerRadius = 22.0
        fieldsBackgroundView?.alpha = 0.7
        
        submitButton?.backgroundColor = UIColor.friendrOrange()
        submitButton?.layer.cornerRadius = 22.0

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension String {
    var isValidPassword: Bool {
        if characters.count < 8 { return false }
        if rangeOfCharacterFromSet(.uppercaseLetterCharacterSet(), options: .LiteralSearch, range: nil) == nil { return false }
        if rangeOfCharacterFromSet(.letterCharacterSet(), options: .LiteralSearch, range: nil) == nil { return false }
        if rangeOfCharacterFromSet(.decimalDigitCharacterSet(), options: .LiteralSearch, range: nil) == nil { return false }
        return true
    }
    
    var isValidUsername: Bool {
        var characterSet:NSCharacterSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        if rangeOfCharacterFromSet(characterSet.invertedSet, options:  .LiteralSearch, range: nil) != nil { return false }
        return true
    }
}

