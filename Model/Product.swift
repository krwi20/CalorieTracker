//
//  Product.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 19/03/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var calories: Int
}
