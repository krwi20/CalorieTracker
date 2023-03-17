//
//  MainView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct MainView: View {
    var body: some View {
        VStack {
            
            Header()
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
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
            
        }
        .background(Color("Background"))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
