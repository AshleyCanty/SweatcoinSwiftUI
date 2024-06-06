//
//  SubscriptionScreen.swift
//  Sweatcoin-SwiftUI
//
//  Created by ashley canty on 6/4/24.
//

import SwiftUI


enum PremiumPaymentSelection {
    case monthly
    case yearly
}

struct SubscriptionScreen: View {
    
    @State private var isPremium = true
    
    var body: some View {
        ZStack(content: {
            AngularGradient(colors: isPremium ? Theme.PremiumGradientBackground : Theme.FreeGradientBackground,
                            center: .center,
                            angle: .degrees(180))
            .blur(radius: 50.0, opaque: true)
            .ignoresSafeArea()
            
            VStack(content: {
                Text("Subscriptions")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.bottom, 20)
                
                HStack(spacing: 5, content: {
                    Button(action: {
                        isPremium.toggle()
                    }, label: {
                        Text("Free")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundStyle((isPremium ? .white: Color(hex: 0x36499c)))
                            .frame(height: 25)
                            .padding([.top, .bottom], 9)
                            .padding([.leading, .trailing], 20)
                            .background((isPremium ? .white.opacity(0.2): .white))
                            .clipShape(.capsule)
                            .shadow(color: .black.opacity(0.1), radius: 10)
                    })
                    
                    Button(action: {
                        isPremium.toggle()
                    }, label: {
                        HStack {
                            Text("Premium")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundStyle((isPremium ? Color(hex: 0x36499c) : .white))
                                .frame(height: 25)
                                .padding(.leading, 5)
                            Spacer()
                        }
                        .overlay(alignment: .trailing) {
                            HStack {
                                Image(.premiumBtn)
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                    .scaledToFit()
                                Text("2X")
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundStyle(.white)
                            }
                            .padding([.leading, .trailing], 8)
                            .padding([.top, .bottom], 5)
                            .background(isPremium ? Theme.GoldBackground : .white.opacity(0.2))
                            .clipShape(.capsule)
                        }
                    })
                    .frame(maxWidth: 150)
                    .padding([.top, .bottom], 10)
                    .padding([.leading, .trailing], 10)
                    .background((isPremium ? .white : .white.opacity(0.2)))
                    .clipShape(.capsule)
                    .shadow(color: .black.opacity(0.1), radius: 10)
                    
                    Spacer()
                })
                
                SubscriptionHeaderView(isPremium: isPremium)
                    .padding(.top, 20)
                    .padding(.bottom, (isPremium ? 20 : 0))
                
                SubscriptionDetailView(isPremium: isPremium)
                
                Spacer()
            })
            .padding()
        })
    }
}

#Preview {
    SubscriptionScreen()
}


