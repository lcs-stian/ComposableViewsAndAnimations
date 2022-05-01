//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Whether to apply the animation 
    @State private var useAnimation = true
    
    
    // Controls the size of the circle
    @State private var scaleFactor: CGFloat = 1.0
    
    //initial state
    @State private var yOffset: CGFloat = 50.0
    
    // Controls the hue of the circle
    @State private var hue: Color = .green
    

    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            VStack {

                Circle()
                    .foregroundColor(hue)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y: yOffset)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2)) {
                            
                            hue = Color(hue: Double.random(in: 1...360) / 360.0,
                                        saturation: 0.8,
                                        brightness: 0.8)
                            
                            yOffset -= 50
                            
                            if scaleFactor > 0.5 {
                               
                                scaleFactor -= 0.25
                            } else {
                                
                                scaleFactor = 1
                            }
                            
                            
                        }
                    }
            
                
                
            }
            .navigationTitle("Exercise 1")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseOneView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOneView(showThisView: .constant(true))
    }
}
