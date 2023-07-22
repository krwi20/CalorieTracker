//
//  PanelOne.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct PanelOne: View {
    // Initalise an instance of HealthKitManager class
    @StateObject private var healthKitManager = HealthKitManager()
    @State private var goals: Goals = Goals(stepGoal: 0, weightGoal: 0, calorieGoal: 0)
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .infinity, height: 313.0)
                .foregroundColor(Color("Background"))
            VStack(spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(
                            Color("Grey"),
                            style: StrokeStyle(
                                lineWidth: 10))
                        .frame(width: 130, height: 130)
                    Circle()
                        .trim(from: 0.0, to: min(1,CGFloat(goals.calorieGoal) / 3000.0))
                        .stroke(
                            Color("Purple"),
                            style: StrokeStyle(
                                lineWidth: 10,
                                lineCap: .round)
                        )
                        .frame(width: 130, height: 130)
                        .rotationEffect(.degrees(-90))
                    VStack {
                        Text("\(3000 - goals.calorieGoal)")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Text("Remaining")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                }
                HStack(spacing: 15) {
                    Spacer()
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(
                                    Color("Grey"),
                                    style: StrokeStyle(
                                        lineWidth: 8))
                                .frame(width: 70, height: 70)
                            Circle()
                                .trim(from: 0.0, to: min(1,CGFloat(healthKitManager.stepCount) / CGFloat(goals.stepGoal)))
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
                        Text("Steps")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        Text("\(healthKitManager.stepCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(
                                    Color("Grey"),
                                    style: StrokeStyle(
                                        lineWidth: 8))
                                .frame(width: 70, height: 70)
                            Circle()
                                .trim(from: 0.0, to: min(1,CGFloat(healthKitManager.calorieCount) / 2000.0))
                                .stroke(
                                    Color("Purple"),
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        lineCap: .round)
                                )
                                .frame(width: 70, height: 70)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "flame.fill")
                                .foregroundColor(.white)
                        }
                        Text("Cals")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        Text("\(healthKitManager.calorieCount)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(
                                    Color("Grey"),
                                    style: StrokeStyle(
                                        lineWidth: 8))
                                .frame(width: 70, height: 70)
                            Circle()
                                .trim(from: 0.0, to: min(1,CGFloat(healthKitManager.distanceCount) / 0.15))
                                .stroke(
                                    Color("Purple"),
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        lineCap: .round)
                                )
                                .frame(width: 70, height: 70)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                        }
                        Text("Km")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        Text("\(String(format: "%.2f", healthKitManager.distanceCount))")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
            }
        }
        .shadow(radius: 15)
        .onAppear {
            healthKitManager.requestAuthorization()
            fetchGoals()
        }
    }
    
    func fetchGoals() {
        
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("Users").document(userUID).collection("Goals").document("StepGoal").getDocument() { snapshot, error in
            if let error = error {
                print("Error getting step goal: \(error.localizedDescription)")
            } else if let stepGoal = snapshot?.data()?["stepGoal"] as? Int {
                goals.stepGoal = stepGoal
            }
        }
        
        Firestore.firestore().collection("Users").document(userUID).collection("Goals").document("WeightGoal").getDocument() { snapshot, error in
            if let error = error {
                print("Error getting weight goal: \(error.localizedDescription)")
            } else if let weightGoal = snapshot?.data()?["weightGoal"] as? Int {
                goals.weightGoal = weightGoal
            }
            
            Firestore.firestore().collection("Users").document(userUID).collection("Goals").document("CalorieGoal").getDocument() { snapshot, error in
                if let error = error {
                    print("Error getting step goal: \(error.localizedDescription)")
                } else if let calorieGoal = snapshot?.data()?["calorieGoal"] as? Int {
                    goals.calorieGoal = calorieGoal
                }
                
            }
        }
    }
}

struct PanelOne_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
