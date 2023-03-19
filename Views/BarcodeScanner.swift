//
//  BarcodeScanner.swift
//  CalorieTracker
//
//  Created by Kris Wittwer on 18/03/2023.
//

import SwiftUI
import VisionKit

// UIViewControllerRepresentable used to create a SwiftUI view that represents a UIKit view controller
// Scans barcodes and returns the recognized data
struct BarcodeScanner: UIViewControllerRepresentable {
    
    // To keep track of the scanned barcode and the status of the live scan
    @Binding var scannedBarcode: String
    @Binding var liveScan: Bool

    // Creates a DataScannerViewController with settings for recognized data types, quality level, and highlighting
    func makeUIViewController (context: Context) -> DataScannerViewController {
        let viewController = DataScannerViewController(recognizedDataTypes: [.barcode()],
                                                       qualityLevel: .balanced,
                                                       isHighlightingEnabled: true)
        // Set the delegate to the Coordinator class
        viewController.delegate = context.coordinator
        return viewController
    }
    
    // Starts or stops scanning based on the value of liveScan
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if liveScan {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }
    
    // Implementation of the DataScannerViewControllerDelegate protocol that handles the recognized data.
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        
        var parent: BarcodeScanner
        // Initialize with a reference to the parent BarcodeScanner instance
        init(parent: BarcodeScanner) {
            self.parent = parent
        }
        
        // Handles recognized data from the scanner
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            switch addedItems[0] {
            case .barcode(let barcode):
                print("Barcode: \(barcode.payloadStringValue ?? "Unknown Barcode ❌") ✅")
                // It sets the scanned barcode value
                parent.scannedBarcode = barcode.payloadStringValue ?? "Unknown Barcode"
                // Stops the live scan
                parent.liveScan = false
                
            default:
                break
            }
        }
        
    }
    
    // Creates an instance of the Coordinator class
    func makeCoordinator() -> Coordinator {
        // Set the parent to the current BarcodeScanner instance
        Coordinator(parent: self)
    }
    
}



