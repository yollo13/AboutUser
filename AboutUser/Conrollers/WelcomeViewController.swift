//
//  WelcomeViewController.swift
//  AboutUser
//
//  Created by YolloArts on 30.08.2020.
//  Copyright © 2020 YolloArts. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var userName: String!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(userName)"
    }
}
