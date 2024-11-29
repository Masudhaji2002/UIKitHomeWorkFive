//
//  Model.swift
//  tabView
//
//  Created by Масуд Гаджиев on 28.11.2024.
//

import Foundation

struct TableItem {
    var image: String
    var text: String
    var secondText: String? = nil
   
    
    static func usersData() -> [TableItem] {
        [
            TableItem(image: "person", text: "User 1"),
            TableItem(image: "person.fill", text: "User 2"),
            TableItem(image: "person.circle", text: "User 3"),
            TableItem(image: "person.circle.fill", text: "User 4")
        ]
    }
    
    static func groupData() -> [TableItem] {
        [
            TableItem(image: "person.2", text: "Group 1", secondText: "some Text"),
            TableItem(image: "person.2.fill", text: "Group 2", secondText: "some Text"),
            TableItem(image: "person.2.circle", text: "Group 3", secondText: "some Text"),
            TableItem(image: "person.2.circle.fill", text: "Group 4", secondText: "some Text")
        ]
    }
}
