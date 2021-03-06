//
//  WelcomeViewController.swift
//  AboutUser
//
//  Created by YolloArts on 30.08.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: DataUserLogin!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName.login)"
    }
}
