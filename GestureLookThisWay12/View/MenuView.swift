//
//  MenuView.swift
//  GestureLookThisWay12
//
//  Created by cmStudent on 2022/09/10.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            // 背景
            Image("gyan_back")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        // サウンド
                        if viewModel.isSound {
                            viewModel.playBack()
                        }
                        viewModel.isShowMenuView = false
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.size.width / 10)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    Spacer()
                }
                .padding(.top, UIScreen.main.bounds.size.width / 8)
                
                HStack {
                    Spacer()
                    Image("txt_setting")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 18)
                        .padding()
                    Spacer()
                }
                
                
                HStack {
                    Spacer()
                    Toggle(isOn: $viewModel.isSound) {
                        Text("効果音")
                            .bold()
                            .font(.title)
                    }
                    .padding()
                    
                    Spacer()
                }
                .background(Color.white.opacity(0.5))
                .padding(.bottom)
                
                HStack {
                    Spacer()
                    Image("txt_credit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 18)
                        .padding()
                    Spacer()
                }
                
                HStack {
                    Text("・効果音：魔王魂")
                        .bold()
                        .font(.title)
                        .padding()
                    
                    Spacer()
                }
                .background(Color.white.opacity(0.5))
                
                
                Spacer()
                
                
            }
        }
    }
}

//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
