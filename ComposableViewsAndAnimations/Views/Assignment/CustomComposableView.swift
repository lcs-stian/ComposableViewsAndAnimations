//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    //MARK: Stored properties
    
    // What to say?
    let message: String
    
    let blurAmount: CGFloat
    
   
   
    // Whether to apply the animation
    @State private var useAnimation = true
    
    // Controls the size
    @State private var scaleFactor: CGFloat = 2.0
   
    
    // Opacity of each part of the view
    @State private var opacity1 = 1.0
    @State private var opacity2 = 0.0
    
    //change the scale effect value
    @State private var animationAmount = 1.0
    
  
    
    //MARK: Computed properties
    var body: some View {
        
        
        HStack (spacing:20){
            
            ZStack{
                
                Image(systemName: "star.fill")
                    .foregroundColor(Color(.systemYellow))
                    .opacity(opacity2)
                    .scaleEffect(scaleFactor)
                    
                    
                
                Image(systemName: "star.fill")
                    .foregroundColor(Color(.systemGray))
                    .opacity(opacity1)
                    .scaleEffect(scaleFactor)
                
            }
            
            Text("\(message)")
                .font(Font.custom("Chalkduster", size: 18.0, relativeTo: .largeTitle))
                .opacity(opacity2)
                .blur(radius: blurAmount)
                
        }
        
        
        
        .onTapGesture {
            print ("inside")
            
            withAnimation(Animation.easeIn(duration: 0.5).delay(0.0)) {
                opacity1 = 0.0
            }
            
            withAnimation(Animation.easeIn(duration: 0.5).delay(0.25)) {
                opacity2 = 1.0
            }
            
        }
        
        
    }
    
    
}


struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "massage", blurAmount: 20.0)
    }
}
