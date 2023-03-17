//
//  Header.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack {
            HStack {
                Circle()
                    .frame(width: 38, height: 38)
                    .padding(.leading, 20)
                Text("John Smith ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                Spacer()
                Image(systemName: "bell.fill")
                    .foregroundColor(.white)
                    .padding(.trailing, 8)
                    .padding(.trailing, 20)
            }
        }
        .ignoresSafeArea(edges: .top)
        .frame(height: 50)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("HeaderOne"), Color("HeaderTwo")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .shadow(radius: 15)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
