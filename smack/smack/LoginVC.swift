//
//  LoginVC.swift
//  smack
//
//  Created by Aziz Ur Rehman on 7/31/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var userNameTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createAccountBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
        
    }
    @IBAction func closeBtnPress(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func onLoginBtnPressed(_ sender: Any) {
        
        guard let email = userNameTxt.text , userNameTxt.text != "" else {return}
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                print("login successful!")
            } else {
                print("login succesful")
            }
        }

        
    }
    
    
}
