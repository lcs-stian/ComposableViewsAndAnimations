//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    //MARK: Stored properties
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    // Controls the size of the circle
    @State private var scaleFactor: CGFloat = 5.0
    
    //Control tehretation angle
    @State var currentRotationAngle = Angle.degrees(120)


    // Opacity of each part of the view
    @State private var opacityWhite = 1.0
    @State private var opacityYellow = 0.0
    @State private var opacityOuter1 = 0.0
    @State private var opacityOuter2 = 0.0
    
    
    let timer = Timer.publish(every: 1.00, on: .main, in: .common).autoconnect()
    
    //MARK: Computed properties
    var body: some View {
        
        
        ZStack{
            
            Image(systemName: "star.fill")
                .foregroundColor(Color(.systemGray))
                .opacity(opacityWhite)
                .scaleEffect(scaleFactor)
           
            
            Image(systemName: "sun.max.fill")
                .foregroundColor(Color(.systemYellow))
                .opacity(opacityOuter1)
                .scaleEffect(scaleFactor)
                .rotationEffect(currentRotationAngle, anchor: .center)


            
            Image(systemName: "star.fill")
                .foregroundColor(Color(.systemYellow))
                .opacity(opacityYellow)
                .scaleEffect(scaleFactor)
        
            
            
                .onReceive(timer) { input in
                    
        
                    withAnimation(Animation.easeIn(duration: 0.5).delay(0.0)) {
                        opacityWhite = 0.0
                    }
                    
                    withAnimation(Animation.easeIn(duration: 0.5).delay(0.25)) {
                        opacityYellow = 1.0
                    }
                    
                    withAnimation(Animation.easeIn(duration: 0.5).delay(0.5)) {
                        opacityOuter1 = 1.0
                    }
                    
                    // Stop the timer
                    timer.upstream.connect().cancel()
                    
                }
            
        }
        
        
        
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
