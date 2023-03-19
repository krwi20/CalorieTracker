//
//  ProductDetailView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 19/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ProductDetailView: View {
    
    let product: Product
    // Default selected meal
    @State var selectedMealType = "Breakfast"
    
    var body: some View {
        VStack {
            Text("Product Name: \(product.name)")
                .font(.title2.bold())
                .foregroundColor(.black)
            Text("Product Calories: \(product.calories)")
                .font(.title2.bold())
                .foregroundColor(.black)
            Picker("Meal Type", selection: $selectedMealType) {
                Text("Breakfast").tag("Breakfast")
                Text("Lunch").tag("Lunch")
                Text("Dinner").tag("Dinner")
                Text("Snack").tag("Snack")
            }
            .pickerStyle(.segmented)
            Button("Add to \(selectedMealType)") {
                addProductToUserDatabase(mealType: selectedMealType)
            }
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color("Purple"))
            .cornerRadius(15.0)
            
        }
    }
    
    // Function to add the product to the user's database of meals
    func addProductToUserDatabase(mealType: String) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        // Get a reference to the user's document in Firestore
        let userDocRef = Firestore.firestore().collection("Users").document(userUID)
        
        // Get the date components for the meal being added
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let week = calendar.component(.weekOfYear, from: date)
        let day = calendar.component(.day, from: date)
        
        // Get a reference to the meal document in Firestore
        let mealDocRef = userDocRef
            .collection("Meals")
            .document("\(year)-\(month)-\(week)")
            .collection("\(day)")
            .document()
        
        // Set the data for the meal document
        let mealData: [String: Any] = [
            "type": mealType,
            "date": Timestamp(date: date),
            "product": [
                "name": product.name,
                "calories": product.calories
            ]
        ]
        
        // Add the meal data to the Firestore database
        mealDocRef.setData(mealData) { error in
            if let error = error {
                print("Error adding meal: \(error.localizedDescription)")
            } else {
                print("Meal added successfully!")
            }
        }
    }
    
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // ProductDetailView(product: Product(name: "Volvic", calories: 0))
        ContentView()
    }
}
