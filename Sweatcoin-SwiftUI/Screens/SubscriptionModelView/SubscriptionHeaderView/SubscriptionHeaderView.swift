//
//  SubscriptionHeaderView.swift
//  Sweatcoin-SwiftUI
//
//  Created by ashley canty on 6/6/24.
//

import SwiftUI

struct SubscriptionHeaderView: View {
    var isPremium: Bool
    @State private var selection: PremiumSubscription = .yearly
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
        let segmentedControllerAppearance = UISegmentedControl.appearance()
        segmentedControllerAppearance.tintColor = .white
        segmentedControllerAppearance.selectedSegmentTintColor = UIColor.white
        segmentedControllerAppearance.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        segmentedControllerAppearance.setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
        segmentedControllerAppearance.setTitleTextAttributes([.foregroundColor : UIColor.black], for: .selected)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Image((isPremium ? .premiumDiamond : .freeDiamond))
                .resizable()
                .scaledToFit()
                .frame(width: 190, height: 190)
                .padding([.top, .bottom], 3)
            
            Text((isPremium ? "Premium" : "Free"))
                .font(.system(size: 35, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            
            
            if isPremium && selection == .yearly {
                HStack (spacing: 0) {
                    Text("Save 58%")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundStyle(Theme.SecondaryTextColor)
                    Text(" vs our monthly plan ")
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundStyle(Theme.PrimaryTextColor)
                    Text("$47.88")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundStyle(Theme.PrimaryTextColor)
                        .strikethrough()
                        .padding([.leading, .trailing], 8)
                        .padding([.top, .bottom], 4)
                        .background(Theme.GoldBackground)
                        .clipShape(.capsule)
                }
                .padding(.top, 15)
            }
            
            HStack {
                Text((isPremium ? (selection == .yearly ? "$19.99" : "$47.88") : "$0.00"))
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                Text(isPremium ? "/ year" : "/ forever")
                    .font(.system(size: 23, weight: .regular, design: .rounded))
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.top, (isPremium && selection == .yearly ? 0 : 15))
            .padding(.bottom, 20)
            
            if isPremium {
                Picker("Which subscription plan would you like to choose?", selection: $selection) {
                    ForEach(PremiumSubscription.allCases, id: \.rawValue) { subscription in
                        Text(subscription.rawValue).tag(subscription)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                .frame(maxWidth: 200)
            }
        }
    }
}


#Preview {
    ZStack {
        LinearGradient(colors: Theme.PremiumGradientBackground, startPoint: .leading, endPoint: .trailing)
        SubscriptionHeaderView(isPremium: true)
    }
}
