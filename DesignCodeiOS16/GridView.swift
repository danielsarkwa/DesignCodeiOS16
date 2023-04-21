//
//  GridView.swift
//  DesignCodeiOS16
//
//  Created by Daniel Yeboah on 13.4.2023.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        Grid(alignment: .leading, horizontalSpacing: 12, verticalSpacing: 12) {
            GridRow {
                Text("Votes")
                    .gridColumnAlignment(.trailing)
                    .gridCellColumns(2)
                Text("Rating")
                    .gridColumnAlignment(.trailing)
            }
            .font(.footnote)
            .foregroundColor(.secondary)
            
            Divider()
                .gridCellUnsizedAxes(.horizontal)
            
            GridRow {
                Text("4")
                    .frame(width: 30, alignment: .trailing)
                ProgressView(value: 0.1)
                    .frame(maxWidth: 250)
                RatingView(rating: 1)
            }
            GridRow {
                Text("21")
                ProgressView(value: 0.2)
                    .frame(maxWidth: 250)
                RatingView(rating: 2)
            }
            GridRow {
                Text("5")
                ProgressView(value: 0.1)
                    .frame(maxWidth: 250)
                RatingView(rating: 3)
            }
            GridRow {
                Text("52")
                ProgressView(value: 0.5)
                    .frame(maxWidth: 250)
                RatingView(rating: 4)
            }
            GridRow {
                Text("67")
                ProgressView(value: 0.6)
                    .frame(maxWidth: 250)
                RatingView(rating: 5)
            }
        }
        .padding(20)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}

struct RatingView: View {
    var rating = 3
    let list = [1, 2, 3, 4, 5]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(list, id: \.self) { item in
                Image(systemName: rating >= item ? "star.fill" : "star")
            }
        }
    }
}
