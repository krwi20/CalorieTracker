//
//  Meal.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 19/03/2023.
//

import Foundation
import Firebase

struct Meal: Identifiable, Decodable {
    var id: String?
    var type: String
    var date: Timestamp
    var product: Product
}

