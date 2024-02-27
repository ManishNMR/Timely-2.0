//
//  ContentView.swift
//  Timely
//
//  Created by user2 on 06/02/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                LandingView()
            }else{
                GetStartedView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
