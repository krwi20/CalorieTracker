//
//  WeightProgress.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import Charts

struct WeightProgress: View {
    
    struct ToyShape: Identifiable {
        var type: String
        var count: Double
        var id = UUID()
    }
    
    var data: [ToyShape] = [
        .init(type: "Jan", count: 80),
        .init(type: "Feb", count: 65),
        .init(type: "Mar", count: 59)
    ]
    
    var body: some View {
        VStack {
            Text("Weight")
                .foregroundColor(.white)
            Text("Last 3 Months")
                .foregroundColor(.white)
            ZStack {
                Chart {
                    ForEach(data) { shape in
                        LineMark(
                            x: .value("Category Name", shape.type),
                            y: .value("Total Count", shape.count)
                        )
                        .foregroundStyle(Color("Purple"))
                    }
                }
                .chartXAxis {
                    AxisMarks {
                        AxisValueLabel()
                            .foregroundStyle(Color(.white))
                        AxisGridLine()
                            .foregroundStyle(Color(.white))
                    }
                }
                .chartYAxis {
                    AxisMarks {
                        AxisValueLabel()
                            .foregroundStyle(Color(.white))
                        AxisGridLine()
                            .foregroundStyle(Color(.white))
                    }
                }
            }
        }
        .padding()
        .background(Color("Background"))
        .cornerRadius(10)
        .shadow(radius: 15)
        .frame(width: 340, height: 400)
    }
}

struct WeightProgress_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
