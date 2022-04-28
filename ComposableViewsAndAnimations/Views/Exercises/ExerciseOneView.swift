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
    
    //Starting postion for the star (initial state)
    @State var yOffset = 0
    
    // Controls the hue of the circle
    @State private var hue: Color = .red
    

    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            VStack {

                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .scaleEffect(scaleFactor)
                    .offset(x: 0, y:CGFloat(yOffset) )
                
                .animation(
                    Animation
                        .easeInOut(duration: 2)
                        .repeatCount(5,autoreverses: true)
                )
                    .onTapGesture {
                        //change the scaleFactor
                         scaleFactor = 2.0
                    }
                
                    // This is an implicit animation.
                    // The change in state (scaleFactor) is animated since the .animation view
                    // modifier is listed AFTER the view modifier where scaleFactor is changed.
                    //
                    // NOTE: A ternary conditional operator is used to control whether the state
                    // change is animated or not.
                    // When useAnimation is true, the default animation effect will be used.
                    // When useAnimation is false, there will be no animation.
                   .animation(useAnimation ? .default : .none)
                
                
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
