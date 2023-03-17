//
//  CustomTabBar.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    var body: some View {
        HStack {
            
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Button {
                    currentTab = tab
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: tab.iconName)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("Purple") : .gray)
                        Text(tab.rawValue)
                            .foregroundColor(currentTab == tab ? Color("Purple") : .gray)
                    }
                }
                
            }
            .padding(.top)
            
        }
        .frame(maxWidth: .infinity)
        .background(Color("Background"))
        .shadow(radius: 15)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
