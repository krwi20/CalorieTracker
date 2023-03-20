//
//  AddMealView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 20/03/2023.
//

import SwiftUI

struct AddMealView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Add Meal View")
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}

struct AddMealView_Previews: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
}
