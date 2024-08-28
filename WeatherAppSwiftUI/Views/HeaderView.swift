//
//  HeaderView.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwURL
import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: -15) {
            Text(viewModel.headerViewModel.location)
                .bold()
                .foregroundStyle(Color.white)
                .font(.system(size: 36))
                .padding()
            
            SwURLImage(
                url: URL(string: viewModel.headerViewModel.iconURLString)!,
                placeholderImage: Image(systemName: "cloud.sun.fill"),
                transition: .none
            )
            .imageProcessing { image in
                return image
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
            }

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
