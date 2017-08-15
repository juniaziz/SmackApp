//
//  ChannelVC.swift
//  smack
//
//  Created by Aziz Ur Rehman on 7/31/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    
    
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var logInBtn: UIButton!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    @IBAction func logInBtnPressed(_ sender: Any) {
        
        if AuthService.instance.isLoggedIn {
            
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
            
        }
        
        else {
            
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
            
        }
    }
    
    func userDataDidChange(_ notif: Notification) {
        setUpUserData()
    }
    
    func setUpUserData() {
        if AuthService.instance.isLoggedIn {
            logInBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            logInBtn.setTitle("Log In", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
            
        }
    }
   
    
    
}
