//
//  UIImageExtension.swift
//  YogiyoCodingTest
//
//  Created by 민경준 on 2020/07/15.
//  Copyright © 2020 Yogiyo. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func resized(to aspect: CGFloat) -> UIImage {
        let newSize = CGSize(width: aspect, height: aspect)
        
        if #available(iOS 10, *) {
            return UIGraphicsImageRenderer(size: newSize).image { _ in
                draw(in: CGRect(origin: .zero, size: newSize))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
            
            defer { UIGraphicsEndImageContext() }
            
            self.draw(in: CGRect(origin: .zero, size: newSize))
            return UIGraphicsGetImageFromCurrentImageContext()!
        }
    }
}
