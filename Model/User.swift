//
//  User.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String
    var userUID: String
    var userEmail: String
    
    enum CodingKeys: CodingKey {
        case id
        case username
        case userUID
        case userEmail
    }
    
}
