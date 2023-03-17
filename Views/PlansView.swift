//
//  PlansView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack {
            Text("Plans View")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}

struct PlansView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
