//
//  HomeViewController.swift
//  evelynpa
//
//  Created by Tomas Paronai on 12/10/18.
//  Copyright © 2018 Tomas Paronai. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindFromScreen(unwindSegue: UIStoryboardSegue) {
        print("Welcome back on HOME")
    }

}
