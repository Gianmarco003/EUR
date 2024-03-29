//
//  CompactIncomeView.swift
//  EUR
//
//  Created by Gianmarco on 21/03/24.
//

import SwiftUI

struct CompactIncomeView: View {
    
    let income: Income
    
    var body: some View {
        HStack() {
            Image(systemName: "eurosign.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.green)
            VStack(alignment: .leading) {
                Text(income.description)
                    .font(.body)
                    .fontWeight(.semibold)
                Text("\(income.date.formatted(date: .abbreviated, time: .omitted))")
                    .font(.callout)
            }
            .padding(.leading, 10)
            Spacer()
                Text("\(income.income, specifier: "%.2f")€")
                    .font(.title3)
                .fontWeight(.semibold)
        }
    }
}

struct CompactIncomeView_Previews: PreviewProvider {
    static var previews: some View {
        CompactIncomeView(income: MockData.sampleIncome)
    }
}
