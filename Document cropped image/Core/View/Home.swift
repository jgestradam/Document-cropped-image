//
//  Home.swift
//  Document cropped image
//
//  Created by Joseph Estrada on 12/9/22.
//

import SwiftUI

struct Home: View {
    
    @State private var showScannerSheet = false
    @State private var texts: [ScanData] = []
    
    var body: some View {
        NavigationView {
            VStack {
                if texts.count > 0 {
                    List {
                        ForEach(texts){text in
                            NavigationLink {
                                ScrollView {
                                    Text(text.content)
                                }
                            } label: {
                                Text(text.content).lineLimit(1)
                            }

                        }
                    }
                } else {
                    Text("No scan yet")
                        .font(.title)
                }
            }
            .navigationTitle("Scan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showScannerSheet = true
                    } label: {
                        Image(systemName: "doc.viewfinder")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $showScannerSheet) {
                makeScannerView()
            }
        }
    }
    
    private func makeScannerView()-> ScannerView {
         ScannerView(completion: {
             textPerPage in
             if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                 let newScanData = ScanData(content: outputText)
                 self.texts.append(newScanData)
             }
             self.showScannerSheet = false
         })
     }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
