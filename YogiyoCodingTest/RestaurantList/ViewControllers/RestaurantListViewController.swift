//
//  RestaurantListViewController.swift
//  YogiyoCodingTest
//
//  Created by Jun on 2018. 2. 19..
//  Copyright © 2018년 Yogiyo. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantListViewController: UIViewController {
    var titles = [String()]
    var sections = Dictionary<String, Int>()
    var restaurants = Dictionary<Int, [Restaurant]>()
    
    @IBOutlet weak var RestaurantListTableView: UITableView!
}

// MARK: Life Cycle
extension RestaurantListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.decodeJSON()
        
        self.RestaurantListTableView.delegate = self
        self.RestaurantListTableView.dataSource = self
        let nibName = UINib(nibName: "RestaurantListTableCell", bundle: nil)
        self.RestaurantListTableView.register(nibName, forCellReuseIdentifier: "RestaurantListTableCell")
    }
}


// MARK: TableView Delegates
extension RestaurantListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return restaurants.count
    }

    // Set Title for Section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return restaurants[section]?[0].sectionTitle.rawValue
    }

    // Number of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants[section]?.count ?? 0
    }
    
    // Set Height For HeaderView
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    // Custom Section HeaderView
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 20, y: 10, width: 320, height: 20)
        myLabel.font = UIFont.boldSystemFont(ofSize: 18)
        myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

        let headerView = UIView()
        headerView.addSubview(myLabel)

        return headerView
    }

    // Set Height for Rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    // Set Which Cells to Use
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RestaurantListTableView.dequeueReusableCell(withIdentifier: "RestaurantListTableCell", for: indexPath) as! RestaurantListTableCell
        
        if let item = self.restaurants[indexPath.section]?[indexPath.row] {
            cell.setNameAndLogo(name: item.name, url: item.logoUrl)
            cell.appendOptions(avg: item.reviewAvg, review: item.reviewCount, reply: item.ownerReplyCount)
            cell.appendCategories(
                order: item.isPhoneOrderAvailable,
                yogiseo: item.payment.contains("yogiseo"),
                offline: item.payment.contains("offline"),
                pickUp: item.isAvailablePickup)
            

            return cell
        } else {
            
            return UITableViewCell()
        }
    }
}


// MARK: CUSTOM FUNCTION
extension RestaurantListViewController {
    func decodeJSON() {
        let decoder = JSONDecoder()
        let path = Bundle.main.path(forResource: "restaurants", ofType: "json")!
        let jsonStr = try! String(contentsOfFile: path)
        let data = jsonStr.data(using: .utf8)
        
        if let data = data,  let res = try? decoder.decode([Restaurant].self, from: data) {

            var section1: [Restaurant] = []
            var section2: [Restaurant] = []
            var section3: [Restaurant] = []
            
            for item in res {
                switch item.section {
                case .section1:
                    section1.append(item)
                    self.restaurants.updateValue(section1, forKey: 0)
                case .section2:
                    section2.append(item)
                    self.restaurants.updateValue(section2, forKey: 1)
                case .section3:
                    section3.append(item)
                    self.restaurants.updateValue(section3, forKey: 2)
                }
            }
        }
    }
}
