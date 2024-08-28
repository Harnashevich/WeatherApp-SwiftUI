//
//  DailyView.swift
//  WeatherAppSwiftUI
//
//  Created by Andrei Harnashevich on 28.08.24.
//

import SwiftUI

struct DailyView: View {
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            ForEach(viewModel.dailyData) { model in
                DayRowView(model: model)
                    .padding()
            }
        }
    }
}

struct DayRowView: View {
    var model: DayData
    var body: some View {
        HStack {
            Text(model.day)
                .bold()
                .font(.system(size: 26))
                .foregroundStyle(Color.white)
            
            Spacer()
            
            VStack {
                Text("H: \(model.high)")
                Text("L: \(model.low)")
            }
            .foregroundStyle(Color.white)
        }
    }
}


#Preview {
    DailyView()
}
