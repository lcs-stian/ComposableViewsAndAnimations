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
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    // Controls the size
    @State private var scaleFactor: CGFloat = 5.0
    
    //control offset
    @State var xOffset = 50.0
    

    // Opacity of each part of the view
    @State private var opacityWhite = 1.0
    @State private var opacityYellow = 0.0
    

    
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
            
            Text("\(message)")
                .font(Font.custom("Chalkduster", size: 18.0, relativeTo: .largeTitle))
                .offset(x: xOffset, y: 0)
                .opacity(opacityYellow)
            
            onTapGesture {
                
                withAnimation(Animation.easeIn(duration: 0.5).delay(0.0)) {
                    opacityWhite = 0.0
                }
                
                withAnimation(Animation.easeIn(duration: 0.5).delay(0.25)) {
                    opacityYellow = 1.0
                }
                
            }
                    
                  
                    
                }
            
        }
        
        
    }

 
struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView(message: "massage")
    }
}
