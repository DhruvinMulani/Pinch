//
//  ControllImageView.swift
//  Pinch
//
//  Created by Dhruvin Mulani on 2024-02-18.
//

import SwiftUI

struct ControlImageView: View {
    
    let icon: String
    var body: some View {
     
        
        Image(systemName: icon)
        .font(.system(size: 36))
    }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
}
