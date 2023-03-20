//
//  PlansView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct PlansView: View {
    
    @State var meals: [Meal] = []
    @State var selectedDate = Date()
    @State var addMeal: Bool = false
    @State private var scannedBarcode = ""
    @State var liveScan = false
    
    var body: some View {
        VStack {
            // Go back and forwards between days days
            HStack(spacing: 50) {
                Button(action: {
                    selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? Date()
                    fetchMeals(for: selectedDate)
                }, label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                })
                Text(dateToString(date: selectedDate, format: "E d MMMM"))
                    .foregroundColor(.white)
                Button(action: {
                    selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)!
                    fetchMeals(for: selectedDate)
                }, label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                })
            }
            NavigationStack {
                ZStack {
                    Color("Background").ignoresSafeArea()
                    List {
                        // Breakfast Section
                        Section {
                            Text("Breakfast")
                                .font(.headline.bold())
                                .foregroundColor(.white)
                                .listRowBackground(Color("Background"))
                            // If there are no elements in the filtered array then show there are no meals
                            if meals.filter { $0.type == "Breakfast" }.isEmpty {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("No Meals!")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple"))
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(Color("Background")),
                                        alignment: .bottom
                                    ))
                                .foregroundColor(.white)
                                .frame(height: 40)
                                .listRowSeparator(.hidden)
                            } else {
                                // Filter creates a new array including the elements where type property equals breakfast
                                // The closure is { $0.type == "Breakfast" }
                                // $0 shorthand represents the current meal object being passed by the closure
                                // $0.type accesses the type property of the current Meal object
                                ForEach(meals.filter { $0.type == "Breakfast" }) { meal in
                                    // For each element in the filtered array create new row for the meal
                                    MealRow(meal: meal)
                                }
                                // Add a Meal
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("Need to log?")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple")))
                                .foregroundColor(.white)
                                .frame(height: 40)
                            }
                        }
                        // Lunch Section
                        Section {
                            Text("Lunch")
                                .foregroundColor(.white)
                                .listRowBackground(Color("Background"))
                                .font(.headline.bold())
                            if meals.filter { $0.type == "Lunch" }.isEmpty {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("No Meals!")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple"))
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(Color("Background")),
                                        alignment: .bottom
                                    ))
                                .foregroundColor(.white)
                                .frame(height: 40)
                            } else {
                                ForEach(meals.filter { $0.type == "Lunch" }) { meal in
                                    MealRow(meal: meal)
                                }
                                // Add a Meal
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("Need to log?")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple")))
                                .foregroundColor(.white)
                                .frame(height: 40)
                            }
                        }
                        // Dinner Section
                        Section {
                            Text("Dinner")
                                .foregroundColor(.white)
                                .listRowBackground(Color("Background"))
                                .font(.headline.bold())
                            // If the meal id
                            if meals.filter { $0.type == "Dinner" }.isEmpty {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("No Meals!")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple"))
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(Color("Background")),
                                        alignment: .bottom
                                    ))
                                .foregroundColor(.white)
                                .frame(height: 40)
                            } else {
                                ForEach(meals.filter { $0.type == "Dinner" }) { meal in
                                    MealRow(meal: meal)
                                }
                                // Add a Meal
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("Need to log?")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple")))
                                .foregroundColor(.white)
                                .frame(height: 40)
                            }
                        }
                        // Snack section
                        Section {
                            Text("Snack")
                                .foregroundColor(.white)
                                .listRowBackground(Color("Background"))
                                .font(.headline.bold())
                            if meals.filter { $0.type == "Snack" }.isEmpty {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("No Meals!")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple"))
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 1)
                                            .foregroundColor(Color("Background")),
                                        alignment: .bottom
                                    ))
                                .foregroundColor(.white)
                                .frame(height: 40)
                            } else {
                                ForEach(meals.filter { $0.type == "Snack" }) { meal in
                                    MealRow(meal: meal)
                                }
                                // Add a Meal
                                HStack {
                                    VStack(alignment: .leading) {
                                        Spacer()
                                        Text("Need to log?")
                                        Spacer()
                                    }
                                    Spacer()
                                    Button(action: { addMeal.toggle()}) {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Add a meal!")
                                        }
                                    }
                                }
                                .listRowBackground(Rectangle()
                                    .fill(Color("Purple")))
                                .foregroundColor(.white)
                                .frame(height: 40)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .onAppear {
            let date = selectedDate
            fetchMeals(for: date)
        }
        .fullScreenCover(isPresented: $addMeal) {
            AddMealView()
        }
    }
    
    // Fetch the meals for the current user for the Date
    func fetchMeals(for date: Date) {
        
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let calendar = Calendar.current
        // Get the year, month, week & day from the passed date
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let week = calendar.component(.weekOfYear, from: date)
        let day = calendar.component(.day, from: date)
        
        Firestore.firestore().collection("Users").document(userUID)
            .collection("Meals")
            .document("\(year)-\(month)-\(week)")
            .collection("\(day)")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching meals: \(error.localizedDescription)")
                } else {
                    // Decode the results into array of meal objects
                    meals = snapshot?.documents.compactMap { document in
                        try? document.data(as: Meal.self)
                    }
                    // Sort the array of meal objects by type
                    .sorted { $0.type < $1.type } ?? []
                }
            }
    }
    
    // Helper function to turn date to string, formatted depending on the value of String
    // TODO: Create helper group and move it there
    func dateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}

struct PlansView_Previews: PreviewProvider {
    static var previews: some View {
        PlansView()
    }
}
