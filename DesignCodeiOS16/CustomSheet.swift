//
//  CustomSheet.swift
//  DesignCodeiOS16
//
//  Created by Daniel Yeboah on 16.4.2023.
//

import SwiftUI

struct CustomSheet: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 30) {
                Text("INCLINE\n").font(.caption) + Text("20°")
                Text("ELEVATION\n").font(.caption) + Text("64M")
                Text("LATITUDE\n").font(.caption) + Text("35.08587 E")
                Text("LONGITUDE\n").font(.caption) + Text("48.1255 W")
                arrow
                Spacer()
            }
            .fontWeight(.medium)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(40)
        .background(.black.opacity(0.5))
        .background(.ultraThinMaterial)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white.opacity(0.2))
                .frame(width: 40, height: 5)
                .frame(maxHeight: .infinity, alignment: .top)
                .offset(y: 20)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .strokeBorder(.linearGradient(colors: [.white.opacity(0.2), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .preferredColorScheme(.dark)
    }
    
    var arrow: some View {
        ZStack {
            Circle().strokeBorder(.primary.opacity(0.4), style: StrokeStyle(lineWidth: 5, dash: [1, 2]))
            Circle().strokeBorder(.primary.opacity(0.4), style: StrokeStyle(lineWidth: 15, dash: [1, 60]))
            Image("Arrow")
        }
        .frame(width: 93, height: 93)
    }
}

struct CustomSheet_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheet()
    }
}
