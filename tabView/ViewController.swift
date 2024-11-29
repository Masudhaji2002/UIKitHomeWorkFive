//
//  ViewController.swift
//  tabView
//
//  Created by Масуд Гаджиев on 28.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var userTable = TableItem.usersData()
    var groupTable = TableItem.groupData()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame, style: .grouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        view.addSubview(tableView)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return userTable.count
        } else {
            return groupTable.count
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator // используем всегла
        var config = cell.defaultContentConfiguration()
        var localArray: [TableItem] = []
        
        switch indexPath.section {
        case 0:
            localArray = userTable
        default :
            localArray = groupTable
        }
        
        config.text = localArray[indexPath.row].text
        config.image = UIImage(systemName: localArray[indexPath.row].image)
        config.secondaryText = localArray[indexPath.row].secondText
        
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Users"
        default: return "Group"
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            let item = userTable[indexPath.row].text
            print(item)
        default:
            let item = groupTable[indexPath.row].text
            print(item)
            
        }
    
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
}

