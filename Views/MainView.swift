//
//  MainView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 0) {
            Header()
            ScrollView(.vertical, showsIndicators: false) {
                PanelOne()
                HStack {
                    FoodPanel()
                    WaterPanel()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        WeightProgress()
                        TempBarChart()
                    }
                }
            }
        }
        .background(Color("Background"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
