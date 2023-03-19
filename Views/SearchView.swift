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
    @State var product: Product?
    @State var productList: [Product] = []
    
    var body: some View {
        VStack(spacing: 0) {
            Header()
            NavigationStack {
                ZStack {
                    Color("Background").ignoresSafeArea()
                    List {
                        Section {
                            ForEach(productList) { product in
                                NavigationLink(destination: ProductDetailView(product: product)) {
                                    HStack {
                                        Text("Product Name: \(product.name)")
                                            .font(.subheadline.bold())
                                            .foregroundColor(.white)
                                        Spacer()
                                        Text("Product Calories: \(product.calories)")
                                            .font(.subheadline.bold())
                                            .foregroundColor(.white)
                                    }
                                    .frame(height: 40)
                                }
                            }
                        }
                        .listRowBackground(Rectangle()
                            .fill(Color("Purple"))
                            .cornerRadius(15)
                            .padding(5))
                    }
                    .listStyle(.plain)
                }
            }
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
        .onChange(of: scannedBarcode) { barcode in
            if !barcode.isEmpty {
                fetchProduct()
            }
        }
    }
    
    // Triggers the async fetch of a Product from Firestore when a barcode is scanned by the user
    // TODO: better error handling
    func fetchProduct() {
        Task {
            do {
                try await fetchProductData()
            } catch {
                print("Error!")
            }
        }
    }
    
    // Fetch the product data
    func fetchProductData() async throws {
        let fetchedProduct = try await
        Firestore.firestore().collection("Barcodes").document(scannedBarcode).getDocument(as: Product.self)
        
        product = fetchedProduct
        
        // If there is a product, assign it to product and add it to the product list array
        if let product = product {
            productList.append(product)
        }
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        // SearchView(liveScan: .constant(false), scannedBarcode: .constant(""))
        ContentView()
    }
}
