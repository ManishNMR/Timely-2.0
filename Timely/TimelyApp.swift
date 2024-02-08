//
//  TimelyApp.swift
//  Timely
//
//  Created by user2 on 06/02/24.
//

import SwiftUI
import Firebase

@main
struct TimelyApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
