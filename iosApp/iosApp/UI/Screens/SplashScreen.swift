//
//  SplashScreen.swift
//  Infiniti News IOS
//
//  Created by Hassaan Raza on 13/01/2025.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var showSplash: Bool = true
    
    var body: some View {
        ZStack {
            if self.showSplash {
                // splash screen content
                Color.white
                    .ignoresSafeArea()
                Image("Main")
                    .font(.title)
                    .foregroundColor(.white)
                
            } else {
                MainScreen()
            }
        }
        
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    self.showSplash = false
                }
            }
        }
    }
    
}


#Preview {
    SplashScreen()
}
