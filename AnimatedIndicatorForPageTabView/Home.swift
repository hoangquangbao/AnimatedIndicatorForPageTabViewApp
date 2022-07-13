//
//  Home.swift
//  AnimatedIndicatorForPageTabView
//
//  Created by Quang Bao on 13/07/2022.
//

import SwiftUI

struct Home: View {
    
    //colors as Tabs...
    //use your own tabs here...
    var colors : [Color] = [.red, .blue, .pink, .purple]
    
    var body: some View {
        
        //tabview has problem in ignoring top and bottom edge...
        //fix use scrollview
        ScrollView(.init()) {
            TabView {
                ForEach(colors.indices, id:\.self) { index in
                    
                    colors[index]
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
