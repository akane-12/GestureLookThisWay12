//
//  UITest.swift
//  GestureLookThisWay12
//
//  Created by cmStudent on 2022/09/08.
//

import SwiftUI

struct UITest: View {
    var body: some View {
        game0
    }
    
    var game0: some View {
    
            VStack {
                Spacer()
                
                // TODO: 切り替え
                Image("hc_choki_un")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.size.height / 8)
                    .padding()
                
                Image("no_select")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.size.height / 8)
                    .padding()
                
                Spacer()
                
                Image("txt_select")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.size.height / 8)
                    .padding()
                
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        // TODO: アニメーション
                        Button {
//                            viewModel.choiceHand = 0
                        } label: {
                            Image("h_gu")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
//                                .saturation(viewModel.choiceHand == 0 ? 1 : 0)
                        }
                        
                        Spacer()
                        
                        Button {
//                            viewModel.choiceHand = 1
                        } label: {
                            Image("h_choki")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
//                                .saturation(viewModel.choiceHand == 1 ? 1 : 0)
                        }
                        
                        Spacer()
                        
                        Button {
//                            viewModel.choiceHand = 2
                        } label: {
                            Image("h_pa")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
//                                .saturation(viewModel.choiceHand == 2 ? 1 : 0)
                        }
                        
                        Spacer()
                    }
                    Spacer()
                    
                    Button {
//                        if viewModel.choiceHand != -1 {
//                            viewModel.nowGame = 1
//                        }
                    } label: {
                        Text("OK！")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
//                            .background(viewModel.choiceHand != -1 ? Color.orange : Color.gray)
                            .clipShape(Capsule())
                            .padding()
                    }
                }
                .frame(height: UIScreen.main.bounds.size.height / 4)
                
                Spacer()
            }
            
        }
}

struct UITest_Previews: PreviewProvider {
    static var previews: some View {
        UITest()
    }
}
