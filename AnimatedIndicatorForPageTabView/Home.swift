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
    
    //offset...
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        //tabview has problem in ignoring top and bottom edge...
        //fix use scrollview
        ScrollView(.init()) {
            TabView {
                ForEach(colors.indices, id:\.self) { index in
                    
                    if index == 1 {
                        colors[index]
                            .overlay(
                                
                                //getometry Reader
                                GeometryReader{ proxy -> Color in
                                    
                                    let minX = proxy.frame(in: .global).minX
                                    
                                    DispatchQueue.main.async {
                                        withAnimation(.default) {
                                            self.offset = -minX
                                            print(offset)
                                        }
                                    }
                                    
                                    return Color.clear
                                }
                                .frame(width: 0, height: 0)
                                ,alignment: .leading
                            )
                    } else {
                        colors[index]
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay (
                
                //Animated Indicators...
                HStack(spacing: 15) {
                    ForEach(colors.indices, id: \.self){ index in
                        Capsule()
                            .fill(Color.white)
                            .frame(width: 7, height: 7)
                    }
                }
                    .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .padding(.bottom, 10)
                ,alignment: .bottom
            )
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
