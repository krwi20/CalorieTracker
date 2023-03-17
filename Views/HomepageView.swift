//
//  HomepageView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct HomepageView: View {
    // Hiding Native Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                MainView()
                    .tag(Tab.home)
                
                SearchView()
                    .tag(Tab.search)
                
                DiaryView()
                    .tag(Tab.diary)
                
                PlansView()
                    .tag(Tab.plans)
                
                SettingsView()
                    .tag(Tab.settings)
                
            }
            
            // Custom Tab Bar
            CustomTabBar(currentTab: $currentTab)
            
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
