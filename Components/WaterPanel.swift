//
//  WaterPanel.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct WaterPanel: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Background"))
                .cornerRadius(18)
                .frame(width: 130, height: 130)
            VStack {
                Image(systemName: "drop")
                    .resizable()
                    .foregroundColor(Color("Purple"))
                    .frame(width: 28, height: 38)
                Text("Add Water")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.headline)
            }
        }
        .shadow(radius: 15)
    }
}

struct WaterPanel_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
