//
//  ScanData.swift
//  Document cropped image
//
//  Created by Joseph Estrada on 12/9/22.
//

import Foundation

struct ScanData: Identifiable {
    //let id = UUID().uuidString
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
