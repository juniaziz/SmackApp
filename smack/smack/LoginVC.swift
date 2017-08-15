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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpView(){
        
        spinner.isHidden = true
        
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
    }
    
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    
    @IBAction func closeBtnPress(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onLoginBtnPressed(_ sender: Any) {
        
        spinner.isHidden = false
        spinner.startAnimating()
        guard let email = userNameTxt.text , userNameTxt.text != "" else {return}
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmai(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            } else {
                print("login successful")
            }
        }
    }
}
