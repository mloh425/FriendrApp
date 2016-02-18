//
//  ViewController.swift
//  Friendr
//
//  Created by Sau Chung Loh on 2/11/16.
//  Copyright © 2016 FriendrTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backendless = Backendless.sharedInstance()
        let user: BackendlessUser = BackendlessUser()
        user.email = "matty@backendless.com"
        user.password = "my_super_password"
        backendless.userService.registering(user)
        
        let activity = ActivityModel()
        activity.address = "8111 111th Ave SE Bluecastle, WA 98059"
        activity.owner = user.email
        backendless.persistenceService.of(ActivityModel.ofClass()).save(activity)
        
        if(backendless.userService.currentUser != nil) {
            print("There is a user")
        } else {
            print("There is no user")
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

