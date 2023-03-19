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
                    .font(.headline)
                Text("\(meal.product.calories) Cals")
                    .font(.subheadline)
            }
            Spacer()
            Text(meal.date.dateValue(), style: .time)
        }
        .listRowBackground(Rectangle()
            .fill(Color("Purple"))
            .cornerRadius(15)
            .padding(5))
        .foregroundColor(.white)
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
