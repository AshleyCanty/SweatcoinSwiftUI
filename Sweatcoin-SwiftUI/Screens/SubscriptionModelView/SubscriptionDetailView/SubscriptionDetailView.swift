//
//  SubscriptionDetailView.swift
//  Sweatcoin-SwiftUI
//
//  Created by ashley canty on 6/6/24.
//

import SwiftUI

struct SubscriptionDetailView: View {
    var isPremium: Bool
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading) {
                VStack (alignment: .leading, spacing: 5) {
                    Image(isPremium ? .premiumStep : .freeStep)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Text((isPremium ? SubscriptionText.PremiumFirstTitle.rawValue : SubscriptionText.FreeTitle.rawValue))
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.leading, 9)
                    
                    Text((isPremium ? SubscriptionText.PremiumFirstSummary.rawValue : SubscriptionText.FreeSummary.rawValue))
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundStyle(.white)
                        .padding(.leading, 9)
                }
                .padding([.top, .bottom], 12)
                .padding([.leading, .trailing], 5)
                
                
                if isPremium {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 1)
                        .foregroundStyle(.white.opacity(0.15))
                    
                   VStack (alignment: .leading, spacing: 5) {
                       Text(SubscriptionText.PremiumSecondTitle.rawValue)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundStyle(.white)
                        
                       Text(SubscriptionText.PremiumSecondSummary.rawValue)
                            .font(.system(size: 14, weight: .regular, design: .rounded))
                            .foregroundStyle(.white.opacity(0.5))
                    }
                   .padding(.bottom, 12)
                   .padding([.leading, .trailing], 12)
                }
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.1))
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    SubscriptionDetailView(isPremium: true)
}
