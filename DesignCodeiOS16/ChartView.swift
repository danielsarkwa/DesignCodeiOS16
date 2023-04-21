//
//  ChartView.swift
//  DesignCodeiOS16
//
//  Created by Daniel Yeboah on 13.4.2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        VStack {
            Chart {
                ForEach(data) { item in
                    LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2023"))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(by: .value("Year", "2023"))
                        .symbol(by: .value("Year", "2023"))
                }
                ForEach(data2) { item in
                    LineMark(x: .value("Day", item.day), y: .value("Value", item.value), series: .value("Year", "2022"))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(by: .value("Year", "2022"))
                        .symbol(by: .value("Year", "2022"))
                }
            }
            .frame(height: 300)
            .padding(20)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct Value: Identifiable {
    var id = UUID()
    var day: String
    var value: Double
}

let data = [
    Value(day: "Jun 1", value: 200),
    Value(day: "Jun 2", value: 96),
    Value(day: "Jun 3", value: 312),
    Value(day: "Jun 4", value: 256),
    Value(day: "Jun 5", value: 505),
]

let data2 = [
    Value(day: "Jun 1", value: 151),
    Value(day: "Jun 2", value: 192),
    Value(day: "Jun 3", value: 176),
    Value(day: "Jun 4", value: 158),
    Value(day: "Jun 5", value: 401),
]
