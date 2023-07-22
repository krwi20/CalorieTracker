//
//  GoalsView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 22/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct GoalsView: View {
    @State private var showSetStepGoal: Bool = false
    @State private var goals: Goals = Goals(stepGoal: 0, weightGoal: 0, calorieGoal: 0)
    var body: some View {
        VStack {
            // View Title
            HStack {
                Text("Goals")
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            // Step Goal
            HStack {
                Text("Step Goal:")
                    .foregroundColor(.white)
                Spacer()
                Button(action: setStepGoal) {
                    Text("\(goals.stepGoal)")
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
            .background(Color("Purple"))
            // Weight Goal
            HStack {
                Text("Weight Goal:")
                    .foregroundColor(.white)
                Spacer()
                Button(action: {}) {
                    Text("\(goals.weightGoal)")
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
            .background(Color("Purple"))
            
            Spacer()
            if showSetStepGoal {
                ZStack {
                    HStack {
                        Text("Update Step Goal")
                            .foregroundColor(.white)
                        Spacer()
                        //                        TextField("Email", value: 0, format: .number)
                        //                            .background(.white)
                        //                            .cornerRadius(5)
                        //                            .frame(width: 40)
                        //                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 150)
                .background(Color("Purple"))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .onAppear {
            fetchGoals()
        }
    }
    
    func setStepGoal() {
        showSetStepGoal = true
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

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
