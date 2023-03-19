//
//  CameraView.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 18/03/2023.
//

import SwiftUI

struct CameraView: View {
    @Binding var scannedBarcode: String
    @Binding var liveScan: Bool
    // Property wrapper to dismiss view
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                Spacer()
                Image(systemName: "multiply")
                    .foregroundColor(.white)
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            .padding(.bottom, 15)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("HeaderOne"), Color("HeaderTwo")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            BarcodeScanner(scannedBarcode: $scannedBarcode, liveScan: $liveScan)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .onChange(of: scannedBarcode) { barcode in
            if !barcode.isEmpty {
                dismiss()
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
