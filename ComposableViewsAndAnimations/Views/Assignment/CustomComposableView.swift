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
    
    // Controls the size
    @State private var scaleFactor: CGFloat = 1.0
    
    //control offset
    @State var yoffset = 50.0
    
    
    
    // Opacity of each part of the view
    @State private var opacityWhite = 1.0
    @State private var opacityYellow = 0.0
    
    
    
    
    
    let timer1 = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    let timer2 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    //MARK: Computed properties
    var body: some View {
        
        
        ZStack{
            
            Image(systemName: "star.fill")
                .foregroundColor(Color(.systemGray))
                .opacity(opacityWhite)
                .scaleEffect(scaleFactor)
            
            Image(systemName: "star.fill")
                .foregroundColor(Color(.systemYellow))
                .opacity(opacityYellow)
                .scaleEffect(scaleFactor)
            
            
            
                .onReceive(timer1) { input in
                    
                    withAnimation(Animation.easeIn(duration: 0.5).delay(0.0)) {
                        opacityWhite = 0.0
                    }
                    
                    withAnimation(Animation.easeIn(duration: 0.5).delay(0.25)) {
                        opacityYellow = 1.0
                    }
                    
                    
                    timer1.upstream.connect().cancel()
                    
                }
            
            
            
        }
        
    }
    
    
}


struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
