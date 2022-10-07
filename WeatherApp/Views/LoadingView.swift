//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Alexandre Souto on 07/10/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white)) // progress view circular on display
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
