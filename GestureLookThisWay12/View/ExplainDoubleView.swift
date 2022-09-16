//
//  ExplainDoubleView.swift
//  GestureLookThisWay12
//
//  Created by cmStudent on 2022/09/16.
//

import SwiftUI

struct ExplainDoubleView: View {
    
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
                        viewModel.isShowExplainDoubleView = false
                        
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
                Spacer()
            }
            
            
            VStack {
                Image("start_d")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 1.5)
                    .padding()
                
                Text("スマホを向けあって\n遊ぶモードです。")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                
                Image("img_double_ex")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 1.3)
                    .padding()
                
                Text("勝ち負けは画面をみて決めてください。")
                    .bold()
                    .font(.title)
                    .padding()
                
                
            }
            
            
        }
    }
}

//struct ExplainDoubleView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExplainDoubleView()
//    }
//}
