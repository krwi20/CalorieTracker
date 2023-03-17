//
//  FoodPanel.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct FoodPanel: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Background"))
                .cornerRadius(18)
                .frame(width: 130, height: 130)
            VStack {
                Image(systemName: "fork.knife")
                    .resizable()
                    .foregroundColor(Color("Purple"))
                    .frame(width: 30, height: 34)
                Text("Add Food")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.headline)
            }
        }
        .shadow(radius: 15)
    }
}

struct FoodPanel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
