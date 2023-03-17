//
//  HealthKitManager.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import Foundation
import HealthKit

class HealthKitManager: ObservableObject {
    // Create an instance of HKHealthStore to interact with HealthKit
    let healthStore = HKHealthStore()
    // Property that holds user's step count
    @Published var stepCount = 0
    // Request auth to read step count data from the HealthKit store
    func requestAuthorization() {
        // Define the type of data to read -> .stepCount
        let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        // Set of data type to read from the user's HealthKit store
        let typesToRead: Set = [stepCount]
        // Request auth to read the step count from the user
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if success {
                print("Authorized to read step count! ✅")
                // Called after app receieves authentication to read step count
                self.getStepsToday()
            } else {
                print("Not authorized to read step count! ❌")
            }
        }
    }
    
    // Retrieve the user's step count for the current day
    func getStepsToday() {
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        // Create query to retrieev the SUM of the user's step count data for the current day
        let query = HKStatisticsQuery(quantityType: HKQuantityType.quantityType(forIdentifier: .stepCount)!, quantitySamplePredicate: predicate, options: .cumulativeSum) { (query, result, error) in
            //
            guard let result = result else {
                // Handle the error
                return
            }
            // Checks if the query contains a valid quantity sum, if yes assign it to sum
            if let sum = result.sumQuantity() {
                // Calculate the number of steps by convering the quantity sum to double then to Int
                let steps = Int(sum.doubleValue(for: HKUnit.count()))
                // Update the stepcount with steps value on main thread, ensures ui updates occur on main thread
                DispatchQueue.main.async {
                    self.stepCount = steps
                }
            }
        }
        
        healthStore.execute(query)
    }
    
}
