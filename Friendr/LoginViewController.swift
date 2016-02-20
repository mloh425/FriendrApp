//
//  LoginViewController.swift
//  Friendr
//
//  Created by Sau Chung Loh on 2/12/16.
//  Copyright © 2016 FriendrTeam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var signUpForFriendrButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signInWithTwitterButton: UIButton!
    @IBOutlet weak var signInWithFacebookButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var fieldsBackgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        let dismissKeyboardTap = UITapGestureRecognizer.init(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(dismissKeyboardTap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func unwindToLoginScreen(segue: UIStoryboardSegue) {
        
    }
    
    func applyStyle() {
        var backgroundImagePath: String?
        let bundle = NSBundle.mainBundle()
        
        backgroundImagePath = bundle.pathForResource("login_background", ofType: "JPG")
        
        if backgroundImagePath != nil {
            backgroundImageView?.image = UIImage(contentsOfFile: backgroundImagePath!)
        }
        
        fieldsBackgroundView?.layer.cornerRadius = 22.0
        
        if (fieldsBackgroundView != nil) {
            let fieldsHairline = UIView(frame: CGRect(x: 0, y: (fieldsBackgroundView!.frame.size.height - 1.0/UIScreen.mainScreen().scale)/2.0, width: (fieldsBackgroundView?.frame.size.width)!, height: 1.0/UIScreen.mainScreen().scale));
            fieldsHairline.backgroundColor = UIColor.lightGrayColor()
            fieldsBackgroundView?.alpha = 0.5
            fieldsBackgroundView?.addSubview(fieldsHairline)
        }
        
        signInButton?.backgroundColor = UIColor.friendrOrange()
        signInButton?.layer.cornerRadius = 22.0
        
        signInWithFacebookButton?.backgroundColor = UIColor.facebookBlue()
        signInWithFacebookButton?.layer.cornerRadius = 22.0
        
        signInWithTwitterButton?.backgroundColor = UIColor.twitterBlue()
        signInWithTwitterButton?.layer.cornerRadius = 22.0
        
        forgotPasswordButton?.layer.borderColor = UIColor.blackColor().CGColor
        forgotPasswordButton?.layer.borderWidth = 1.0/UIScreen.mainScreen().scale
        forgotPasswordButton?.layer.cornerRadius = 22.0
        
        signUpForFriendrButton?.layer.borderColor = UIColor.blackColor().CGColor
        signUpForFriendrButton?.layer.borderWidth = 1.0/UIScreen.mainScreen().scale
        signUpForFriendrButton?.layer.cornerRadius = 22.0

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
