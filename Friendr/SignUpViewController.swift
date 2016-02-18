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
    override func viewDidLoad() {
        super.viewDidLoad()
        applyStyle()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
