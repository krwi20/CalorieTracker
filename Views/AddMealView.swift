//
//  AddMealView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 20/03/2023.
//

import SwiftUI

struct AddMealView: View {
    // Property wrapper to dismiss view
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Spacer()
            Text("Add Meal View")
                .foregroundColor(.white)
            Button(action: {
                dismiss()
            }) {
                Text("Go Back")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color("Purple"))
                    .cornerRadius(15.0)
            }
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
