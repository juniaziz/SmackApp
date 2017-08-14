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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //Variables
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
    

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }

    @IBAction func closedBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickBgColorBtnPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userImage.backgroundColor = self.bgColor
        }
    
    }
    
    
    @IBAction func pickAvaterBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
        
    }
    
    func setUpView() {
        
        spinner.isHidden = true
        
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        
        emailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        
        view.addGestureRecognizer(tap)
    }
    
    func handleTap(){
        view.endEditing(true)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let name = userNameTxt.text , userNameTxt.text != "" else {return}
        guard let email = emailTxt.text , emailTxt.text != "" else {return}
        guard let pass = passwordTxt.text , passwordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
               AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                if success {
                    AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                       
                        if success {
                            self.spinner.isHidden = true
                            self.spinner.stopAnimating()
                            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                        }
                    })
                }
               })
            
            
            } else {
                print("registeration failed")
            }
        }
    }
    
    
}
