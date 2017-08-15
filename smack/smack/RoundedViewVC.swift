//
//  RoundedViewVC.swift
//  smack
//
//  Created by Aziz Ur Rehman on 8/14/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import UIKit

@IBDesignable

class RoundedViewVC: UIView {

    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true;
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true;
    }

    
   

}
