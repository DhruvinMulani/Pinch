//
//  infoPanelView.swift
//  Pinch
//
//  Created by Dhruvin Mulani on 2024-02-13.
//

import SwiftUI

struct infoPanelView: View {

    var scale: CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack{
            //MARK: Hotspot
            
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30,height: 30)
                .onLongPressGesture(minimumDuration: 1){
                    isInfoPanelVisible.toggle()
                }
            Spacer()
            //MARK: Info Panel
            
            HStack(spacing: 2){
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)" )
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)" )

                Spacer()

            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            Spacer()
        }
    }
}

#Preview {
    infoPanelView(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
}
