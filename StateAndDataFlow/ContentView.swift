//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Olga Tegza on 17.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(StorageManager.shared.savedName)")
                .font(.largeTitle)
                .padding(.top, 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .padding(.top, 90)
            
            Spacer()
            
            ButtonView(
                title: timer.buttonTitle,
                color: .red) {
                    timer.startTimer()
                }
            
            Spacer()
            
            ButtonView(
                title: "LogOut",
                color: .blue,
                action: logOuted
            )
            .padding()
        }
    }
    private func logOuted() {
        StorageManager.shared.savedReg.toggle()
        StorageManager.shared.deleteUser(userManager: user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4)
        }
    }
}
