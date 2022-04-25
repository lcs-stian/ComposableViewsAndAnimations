//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    //MARK: Stored properties
    //control the horizontal offset
    @State var offset = 0.0
    //MARK: Computed properties
    
    var body: some View {
        ZStack{
            
            Circle()
                .frame(width: 50, height: 50)
                
            
            Text("OK")
                .foregroundColor(.white)
        }
       .offset(x: offset, y: 0)
        onTapGesture {
            //move to the right
            offset = 100.0
        }
        .animation(
            Animation.easeInOut(duration: 2.0)
        )
      
    }
}

struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}
