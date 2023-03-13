//
//  HomeView.swift
//  restart
//
//  Created by Ernestas Petkevičius on 3/1/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing:20) {
            
            // MARK: - Header
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .green, ShapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 25 : -55)
                .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
                
            }
            
            // MARK: - Center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - Footer
            
            Spacer()
            
            Button(action: {
                withAnimation{
                    isOnboardingViewActive = true
                }

            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                isAnimating = true
            })
        })
    }
}

// MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
