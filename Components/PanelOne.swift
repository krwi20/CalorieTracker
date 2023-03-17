//
//  PanelOne.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI

struct PanelOne: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: .infinity, height: 313.0)
                .foregroundColor(Color("Background"))
            VStack(spacing: 30) {
                ZStack {
                    Circle()
                        .stroke(
                            Color("Grey"),
                            style: StrokeStyle(
                                lineWidth: 10))
                        .frame(width: 130, height: 130)
                    Circle()
                        .trim(from: 0.0, to: 0.25)
                        .stroke(
                            Color("Purple"),
                            style: StrokeStyle(
                                lineWidth: 10,
                                lineCap: .round)
                        )
                        .frame(width: 130, height: 130)
                        .rotationEffect(.degrees(-90))
                    VStack {
                        Text("1,000")
                            .font(.title2)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        Text("Remaining")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                }
                HStack(spacing: 15) {
                    Spacer()
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(
                                    Color("Grey"),
                                    style: StrokeStyle(
                                        lineWidth: 8))
                                .frame(width: 70, height: 70)
                            Circle()
                                .trim(from: 0.0, to: 0.25)
                                .stroke(
                                    Color("Purple"),
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        lineCap: .round)
                                )
                                .frame(width: 70, height: 70)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "shoeprints.fill")
                                .foregroundColor(.white)
                        }
                        Text("Steps")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        Text("222")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(
                                    Color("Grey"),
                                    style: StrokeStyle(
                                        lineWidth: 8))
                                .frame(width: 70, height: 70)
                            Circle()
                                .trim(from: 0.0, to: 0.25)
                                .stroke(
                                    Color("Purple"),
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        lineCap: .round)
                                )
                                .frame(width: 70, height: 70)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "flame.fill")
                                .foregroundColor(.white)
                        }
                        Text("Cals")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        Text("222")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(
                                    Color("Grey"),
                                    style: StrokeStyle(
                                        lineWidth: 8))
                                .frame(width: 70, height: 70)
                            Circle()
                                .trim(from: 0.0, to: 0.25)
                                .stroke(
                                    Color("Purple"),
                                    style: StrokeStyle(
                                        lineWidth: 8,
                                        lineCap: .round)
                                )
                                .frame(width: 70, height: 70)
                                .rotationEffect(.degrees(-90))
                            Image(systemName: "location.fill")
                                .foregroundColor(.white)
                        }
                        Text("Km")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                        Text("222")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
            }
        }
        .shadow(radius: 15)
    }
}

struct PanelOne_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
