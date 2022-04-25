//
//  ExerciseTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseTwoView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
        
    // Whether to apply the animation
    @State private var useAnimation = false

    
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"

    // MARK: Computed properties

    var body: some View {
        
        NavigationView {
            
            VStack {

                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                
            }
            .navigationTitle("Exercise 2")
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

struct ExerciseTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwoView(showThisView: .constant(true))
    }
}
