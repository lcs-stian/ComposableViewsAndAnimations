//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var phrase: String = ""
    
    @State private var blurAmount: CGFloat = 0.0
    
    // MARK: Computed properties
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Description")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    My Composable View 1 is a star, this could be used to mark thing important in your app or to test vocabularies using blur.
                                       
                                       
                    My Composable View 2 is a heart with a broader that has a 3D effect, this could be used to like something.
                                       
                    """)
                
                TextField("Enter an input value", text: $phrase)
                
                Slider(value: $blurAmount, in: 0...20, step: 1.0) {
                    Text("Blur amount")
                }
                
            }
            .padding()
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView(message: phrase, blurAmount: blurAmount)) {
                    SimpleListItemView(title: "My Composable View 1",
                                       caption: "The animation will have a star and say: \(phrase)")
                }
                
                NavigationLink(destination: CustomComposableView2()) {
                    SimpleListItemView(title: "My Composable View 2",
                                       caption: "The animation will show a heart")
                }
            }
            
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}
}
