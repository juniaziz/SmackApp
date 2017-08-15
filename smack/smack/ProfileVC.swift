//
//  ProfileVC.swift
//  smack
//
//  Created by Aziz Ur Rehman on 8/14/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: CircleImage!
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var emailTxt: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
        
    }

    
    func setUpView() {
        
        userName.text = UserDataService.instance.name
        emailTxt.text = UserDataService.instance.email
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
    }
    
    func closeTap(_ recognize: UITapGestureRecognizer) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func closeModalBtnPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        
        UserDataService.instance.logOutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
        
    }
}
