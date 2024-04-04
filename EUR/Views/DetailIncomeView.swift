//
//  DetailIncomeView.swift
//  EUR
//
//  Created by Gianmarco on 21/03/24.
//

import SwiftUI

struct DetailIncomeView: View {
    
    let income: Income
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "eurosign.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.accent)
                Text("\(income.income, specifier: "%.2f")€")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .padding()
            VStack {
                Text(income.description)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("\(income.date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
            .padding()
            Spacer()
        }
    }
}

struct DetailIncomeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailIncomeView(income: MockData.sampleIncome)
    }
}
