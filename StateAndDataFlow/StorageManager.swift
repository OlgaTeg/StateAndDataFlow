//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Olga Tegza on 17.01.2023.
//

import SwiftUI

class StorageManager {
    
    static let shared = StorageManager()
    
    @AppStorage("nameKey") var savedName = ""
    @AppStorage("regKey") var savedReg = false
    
    private init() {}
    
    func saveUser(user: User) {
        savedName = user.name
        savedReg = user.isRegistered
    }
    
    func deleteUser(userManager: UserManager) {
        userManager.user.name = ""
        userManager.user.isRegistered = false
    }
}
