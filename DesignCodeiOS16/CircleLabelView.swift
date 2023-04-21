//
//  CircleLabel.swift
//  DesignCodeiOS16
//
//  Created by Daniel Yeboah on 16.4.2023.
//

import SwiftUI

struct CircleLabelView: View {
    var text = "Latitude 35.08587 E • Longitude 21.43673 W • Elevation 64M • Incline 12 •".uppercased()
    var diameter: Double = 300
    var textWidth: Double = 4.9
    
    var body: some View {
        ZStack {
            ForEach(Array(text.enumerated()), id: \.offset) { index, letter in
                VStack {
                    Text(String(letter))
                    Spacer()
                }
                .rotationEffect(.degrees(textWidth * Double(index)))
            }
        }
        .frame(width: diameter, height: diameter)
        .font(.system(size: 13, design: .monospaced)).bold()
    }
}

struct CircleLabelView_Previews: PreviewProvider {
    static var previews: some View {
        CircleLabelView()
    }
}
