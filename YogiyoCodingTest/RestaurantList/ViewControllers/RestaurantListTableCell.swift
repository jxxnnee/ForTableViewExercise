//
//  RestaurantListTableCell.swift
//  YogiyoCodingTest
//
//  Created by 민경준 on 2020/07/15.
//  Copyright © 2020 Yogiyo. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit

class RestaurantListTableCell: UITableViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var optionsStackView: UIStackView!
    @IBOutlet weak var categoryStackView: UIStackView!
    
    lazy var reviewAvg = UILabel()
    lazy var star = UIImageView()
    lazy var reviewImage = UIImageView()
    lazy var reviewCount = UILabel()
    lazy var ownerReview = UILabel()
    lazy var firstReview = UILabel()
    lazy var phoneOrderView = UIView()
    lazy var phoneOrderLabel = UILabel()
    lazy var yogiseoView = UIView()
    lazy var yogiseoLabel = UILabel()
    lazy var offlineView = UIView()
    lazy var offlineLabel = UILabel()
    lazy var pickUpView = UIView()
    lazy var pickUpLabel = UILabel()
    lazy var testView = UIView()
    lazy var testLabel = UILabel()
}


// MARK: Life Cycle
extension RestaurantListTableCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // 재사용 오류를 방지하기위해 StackView 초기화
        self.optionsStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        self.categoryStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
}


// MARK: Custom Function
extension RestaurantListTableCell {
    
    func appendOptions(avg: Double, review: Int, reply: Int) {
        
        if review != 0 {
            setReviews(avg: avg, count: review)
            self.optionsStackView.addArrangedSubview(self.star)
            self.optionsStackView.addArrangedSubview(self.reviewAvg)
            self.optionsStackView.addArrangedSubview(self.reviewImage)
            self.optionsStackView.addArrangedSubview(self.reviewCount)
            if reply != 0 {
                setReply(reply: reply)
                self.optionsStackView.addArrangedSubview(self.ownerReview)
            }
        } else {
            setFirstReview()
            self.optionsStackView.addArrangedSubview(self.firstReview)
        }
        
    }
    
    func appendCategories(order: Bool, yogiseo: Bool, offline: Bool, pickUp: Bool) {
        if order {
            self.phoneOrderLabel.setGrayText(text: "전화주문")
            self.phoneOrderView.setGrayBorderLayout()
            self.phoneOrderView.addLabel(&self.phoneOrderLabel)
            self.categoryStackView.addArrangedSubview(self.phoneOrderView)
        }

        if yogiseo {
            self.yogiseoLabel.setGrayText(text: "요기서결제")
            self.yogiseoView.setGrayBorderLayout()
            self.yogiseoView.addLabel(&self.yogiseoLabel)
            self.categoryStackView.addArrangedSubview(self.yogiseoView)
        }

        if offline {
            self.offlineLabel.setGrayText(text: "현장결제")
            self.offlineView.setGrayBorderLayout()
            self.offlineView.addLabel(&self.offlineLabel)
            self.categoryStackView.addArrangedSubview(self.offlineView)
        }

        if pickUp {
            self.pickUpLabel.setYellowText(text: "테이크아웃")
            self.pickUpView.setYellowBorderLayout()
            self.pickUpView.addLabel(&self.pickUpLabel)
            self.categoryStackView.addArrangedSubview(self.pickUpView)
        }
    }
    
    func setFirstReview() {
        self.firstReview.text = "첫번째 리뷰를 남겨주세요!"
        self.firstReview.font = UIFont.boldSystemFont(ofSize: 16)
        self.firstReview.textColor = .gray
    }
    
    func setReviews(avg: Double, count: Int) {
        self.star.image = UIImage(named: "icon_star1_full")?.resized(to: 20)
        self.reviewAvg.textColor = UIColor(named: "avg_color")
        self.reviewAvg.font = UIFont.boldSystemFont(ofSize: 14)
        self.reviewAvg.text = String(format: "%.2f", avg)
        self.reviewImage.image = UIImage(named: "ic_res_review")?.resized(to: 20)
        self.reviewCount.textColor = .gray
        self.reviewCount.font = UIFont.boldSystemFont(ofSize: 14)
        self.reviewCount.text = "・ 리뷰 " + String(count)
    }
    
    func setReply(reply: Int) {
        self.ownerReview.textColor = .gray
        self.ownerReview.font = UIFont.boldSystemFont(ofSize: 14)
        self.ownerReview.text = "・ 사장님댓글 " + String(reply)
    }
    
    func setNameAndLogo(name: String, url: URL) {
        self.name.text = name
        self.name.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.logo.kf.indicatorType = .activity
        self.logo.kf.setImage(with: url, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
}
