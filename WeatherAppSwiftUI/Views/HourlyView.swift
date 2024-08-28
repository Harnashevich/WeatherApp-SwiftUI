//
//  HourlyView.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 27.08.24.
//

import SwURL
import SwiftUI

struct HourlyView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.hourlyData) { model in
                    HoursView(model: model)
                }
            }
        }
    }
}

struct HoursView: View {
    var model: HourData
    
    var body: some View {
        VStack {
            // image, temp, hour
            SwURLImage(
                url: URL(string: model.imageURL)!,
                placeholderImage: Image(systemName: "cloud.sun.fill"),
                transition: .none
            )
            .imageProcessing({ image in
                return image
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35, alignment: .center)
                
            })
            
            Text(model.temp)
                .bold()
                .foregroundStyle(Color.white)
            
            
            Text(model.hour)
                .foregroundStyle(Color.white)
        }
        .padding()
    }
}

#Preview {
    HourlyView()
}
