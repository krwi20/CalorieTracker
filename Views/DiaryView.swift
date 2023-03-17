//
//  DiaryView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct DiaryView: View {
    var body: some View {
        VStack {
            Text("Diary View")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}