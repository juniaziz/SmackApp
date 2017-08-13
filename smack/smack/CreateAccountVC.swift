//
//  CreateAccountVC.swift
//  smack
//
//  Created by Aziz Ur Rehman on 7/31/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closedBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickBgColorBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func pickAvaterBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
               AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                if success {
                    print("logged in user!", AuthService.instance.authToken)
                }
               })
            
            
            } else {
                print("registeration failed")
            }
        }
    }
    
    
}
