//
//  SearchView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 17/03/2023.
//

import SwiftUI
import VisionKit
import Firebase

struct SearchView: View {
    @Binding var liveScan: Bool
    @Binding var scannedBarcode: String
    @State var scanBarcode: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            Header()
            Text(scannedBarcode)
                .font(.title3.bold())
                .foregroundColor(.white)
            if DataScannerViewController.isSupported {
                Button("Scan") {
                    scanBarcode.toggle()
                    liveScan.toggle()
                }
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color("Purple"))
                .cornerRadius(15.0)
            } else {
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        .fullScreenCover(isPresented: $scanBarcode) {
            CameraView(scannedBarcode: $scannedBarcode, liveScan: $liveScan)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
//        SearchView(liveScan: .constant(false), scannedBarcode: .constant(""))
        ContentView()
    }
}
