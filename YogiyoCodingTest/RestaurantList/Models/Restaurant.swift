//
//  RestaurantModel.swift
//  YogiyoCodingTest
//
//  Created by 민경준 on 2020/07/15.
//  Copyright © 2020 Yogiyo. All rights reserved.
//

import Foundation
import Alamofire

struct Restaurant: Codable {
    let isAvailablePickup: Bool
    let logoUrl: URL
    let isLong: Bool
    let name: String
    let ownerReplyCount: Int
    let reviewAvg: Double
    let reviewCount: Int
    let section: Section
    let sectionTitle: SectionTitle
    let isPhoneOrderAvailable: Bool
    let payment: [String]

//    "isAvailablePickup": true,
//    "logoUrl": "https://dl.dropboxusercontent.com/sh/s7ftuu3ljh68ip1/AACLmHWdHjP57HSp5EebC4xca/BBQ.jpg?dl=0",
//    "isLong": false,
//    "name": "BBQ-김포마송점",
//    "ownerReplyCount": 10,
//    "reviewAvg": 4.53225806451613,
//    "reviewCount": 124,
//    "section": "section1",
//    "sectionTitle": "슈퍼레드위크",
//    "isPhoneOrderAvailable": true,
//    "payment": [
//        "yogiseo",
//        "offline"
//    ]
}

enum Section: String, Codable {
    case section1 = "section1"
    case section2 = "section2"
    case section3 = "section3"
}

enum SectionTitle: String, Codable {
    case red = "슈퍼레드위크"
    case plus = "우리동네플러스"
    case yogiyo = "요기요 등록 음식점"
}
