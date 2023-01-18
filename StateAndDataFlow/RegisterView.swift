//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Olga Tegza on 17.01.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject private var symbolCounter = SymbolCounter()
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $symbolCounter.text)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                
                Text("\(symbolCounter.counter)")
                    .foregroundColor(symbolCounter.symbolColor(color: symbolCounter.counter))
                    .font(.largeTitle)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 30))
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.largeTitle)
                    Text("OK")
                        .font(.largeTitle)
                    
                }
                .padding(.trailing,30)
                .foregroundColor(symbolCounter.textColor(color: symbolCounter.counter))
                .disabled(true)
                
            }
        }
    }
    
    private func registerUser() {
        if symbolCounter.text.count > 2 {
            userManager.user.name = symbolCounter.text
            userManager.user.isRegistered.toggle()
            StorageManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}
