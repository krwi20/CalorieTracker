//
//  Tab.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case search = "Search"
    case diary = "Diary"
    case plans = "Plans"
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .diary:
            return "book"
        case .plans:
            return "calendar"
        }
    }
}
