//
//  HeaderView.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwiftUI

struct HeaderView: View {
    var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack(spacing: -15) {
            Text(viewModel.headerViewModel.location)
                .bold()
                .foregroundStyle(Color.white)
                .font(.system(size: 36))
                .padding()
            
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150, alignment: .center)
            
            Text(viewModel.headerViewModel.currentTemp)
                .bold()
                .foregroundStyle(Color.white)
                .font(.system(size: 90))
                .padding()
            
            Text(viewModel.headerViewModel.currentConditions)
                .bold()
                .foregroundStyle(Color.white)
                .font(.system(size: 45))
                .padding()
        }
    }
}

#Preview {
    HeaderView()
}
