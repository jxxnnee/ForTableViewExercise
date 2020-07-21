//
//  UIViewExtension.swift
//  YogiyoCodingTest
//
//  Created by OODDY MAC on 2020/07/17.
//  Copyright © 2020 Yogiyo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addLabel(_ label:inout UILabel) {
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
    func setGrayBorderLayout() {
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func setYellowBorderLayout() {
        self.layer.borderColor = UIColor(named: "avg_color")?.cgColor
        self.layer.borderWidth = 1.0
    }
}
