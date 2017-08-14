//
//  CircleImage.swift
//  smack
//
//  Created by Aziz Ur Rehman on 8/14/17.
//  Copyright © 2017 JAZIZ. All rights reserved.
//

import UIKit


@IBDesignable
class CircleImage: UIImageView {

    
    override func awakeFromNib() {
        setupView()
    }
    
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    

}
