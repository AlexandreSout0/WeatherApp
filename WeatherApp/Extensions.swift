//
//  Extensions.swift
//  WeatherApp
//
//  Created by Alexandre Souto on 07/10/22.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
        
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
