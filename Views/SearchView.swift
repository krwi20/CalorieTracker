//
//  SearchView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack {
            Text("Search View")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
