//
//  SymbolCounter.swift
//  StateAndDataFlow
//
//  Created by Olga Tegza on 17.01.2023.
//

import Combine
import SwiftUI

class SymbolCounter: ObservableObject {
    
    @Published var counter = 0
    @Published var text = "" {
        didSet {
            counter = text.count
        }
    }
    
    func symbolColor(color: Int) -> Color {
        counter < 3 ? Color.red : Color.green
    }
    
    func textColor(color: Int) -> Color {
        counter < 3 ? Color.gray : Color.blue
    }
}
