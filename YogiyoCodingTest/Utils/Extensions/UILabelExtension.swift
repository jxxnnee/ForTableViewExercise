//
//  CategoryUILabel.swift
//  YogiyoCodingTest
//
//  Created by 민경준 on 2020/07/15.
//  Copyright © 2020 Yogiyo. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setGrayText(text: String) {
        self.text = text
        self.textColor = .gray
        self.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    func setYellowText(text: String) {
        self.text = text
        self.textColor = UIColor(named: "avg_color")
        self.font = UIFont.boldSystemFont(ofSize: 12)
    }
}
