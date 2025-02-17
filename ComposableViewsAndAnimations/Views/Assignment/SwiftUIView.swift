//
//  SwiftUIView.swift
//  ComposableViewsAndAnimations
//
//  Created by Suzanne Tian on 2022-04-27.
//

import SwiftUI

struct CustomComposableView2: View {
    
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    // Controls the size
    @State private var scaleFactor: CGFloat = 1.0
    
    @State private var scaleFactor2: CGFloat = 0.0
    
    @State private var phase: CGFloat = 0
    
    
    var body: some View {
        
        ZStack{
            
            Image (systemName: "heart.fill")
                
                .foregroundColor(Color(.systemGray))
                .scaleEffect(scaleFactor)
            
            Image (systemName: "heart")
    
                .foregroundColor(Color(.systemRed))
                .scaleEffect(scaleFactor2)
                .padding()
                .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.red, lineWidth: 5)
                    )
                    .shadow(color: .red, radius: 5, x: 20, y: 20)
               
            
                .onTapGesture {
                    if scaleFactor == 1.0 {
                        // decrease the size of the circle by a tenth
                        scaleFactor -= 1.0
                    }
                    
                    if scaleFactor2 == 0.0 {
                        // increase the size of the circle by a tenth
                        scaleFactor2 += 1.0
                    }
                }
            
                .animation(
                    Animation
                        .interpolatingSpring(stiffness: 5, damping: 2).speed(6)
                )
            
            
            
            
            
            
        }
    }
}

struct CustomComposableView2_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView2()
    }
}
