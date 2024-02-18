//
//  ContentView.swift
//  Pinch
//
//  Created by Dhruvin Mulani on 2024-02-12.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTY
    @State private var isAnimating : Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    
    
    // MARK: FUNCTION
    func resetImageState(){
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero

        }
    }
    
    // MARK: CONTENT
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.clear
                //. page image
                
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color:.black.opacity(0.9), radius: 12, x:2, y:2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                //MARK: tap gesture
                
                    .onTapGesture(count:2, perform:  {
                        if imageScale == 1{
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        }
                        else{
                            resetImageState()
                        }
                    })
                //MARK: Drag gesture
                    .gesture(DragGesture()
                        .onChanged{ value in
                            withAnimation(.linear(duration: 1 )){
                                imageOffset  = value.translation }
                            
                        
                    }
                        .onEnded{_ in
                            if imageScale <= 1{
                               resetImageState()
                        }
                        }
                             )
                
            }//.Zstack
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimating = true
            }
                      
            )
            //MARK: Info Panel
            .overlay(
                infoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top,30)
                , alignment: .top
            )
            //MARK: - controls
            
            .overlay(
                Group{
                    HStack{
                        //scal down
                        Button{
                            withAnimation(.spring()){
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()                                 }
                                }
                            }
                        }label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        //reset
                        Button{
resetImageState()
                        }label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        //scal up
                        
                        Button{
                            withAnimation(.spring){
                                if imageScale < 5 {
                                    imageScale += 1
                                }
                                
                                if imageScale > 5 {
                                     imageScale = 5
                                }
                                
                            }
                        }label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                        
                    }//: controls
                    .padding(EdgeInsets(top:12, leading:20, bottom:12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    }
                    .padding(.bottom, 30)
                , alignment: .bottom
                )
        }//: Navigation
        .navigationViewStyle(.stack)
    }
}
 //MARK: Preview
#Preview {
    ContentView()
}