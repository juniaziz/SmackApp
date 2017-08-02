//
//  CreateAccountVC.swift
//  smack
//
//  Created by Aziz Ur Rehman on 7/31/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closedBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    
}
