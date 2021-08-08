//
//  Category.swift
//  Todoey
//
//  Created by Jochum Wilen on 8/4/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
   
}
