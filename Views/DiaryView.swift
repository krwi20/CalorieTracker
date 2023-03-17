//
//  DiaryView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

import SwiftUI

struct DiaryView: View {
    // Initalise an instance of HealthKitManager class
    @StateObject private var healthKitManager = HealthKitManager()
    var body: some View {
        VStack {
            Header()
            Spacer()
            Text("Diary View")
                .foregroundColor(.white)
            Text("Total Steps: \(healthKitManager.stepCount)")
                .foregroundColor(.white)
            ZStack {
                Circle()
                    .stroke(
                        Color("Grey"),
                        style: StrokeStyle(
                            lineWidth: 8))
                    .frame(width: 70, height: 70)
                Circle()
                    .trim(from: 0.0, to: min(1,CGFloat(healthKitManager.stepCount) / 175.0))
                    .stroke(
                        Color("Purple"),
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round)
                    )
                    .frame(width: 70, height: 70)
                    .rotationEffect(.degrees(-90))
                Image(systemName: "shoeprints.fill")
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .onAppear {
            healthKitManager.requestAuthorization()
        }
    }
}



struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
