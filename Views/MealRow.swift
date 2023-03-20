//
//  MealRow.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 19/03/2023.
//

import SwiftUI

struct MealRow: View {
    
    let meal: Meal
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(meal.product.name)
                Text("\(meal.product.calories) Cals")
            }
            Spacer()
            Text(meal.date.dateValue(), style: .time)
        }
        .listRowBackground(Rectangle()
            .fill(Color("Purple")))
        .foregroundColor(.white)
        .frame(height: 40)
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
