//
//  HomeView.swift
//  MotionAppSample12
//
//  Created by cmStudent on 2022/08/16.
//

import SwiftUI

struct HomeView: View {
    
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
                    Spacer()
                    
                    Button {
                        // サウンド
                        if viewModel.isSound {
                            viewModel.playSystem()
                        }
                        viewModel.isShowMenuView = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.size.width / 10)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    .fullScreenCover(isPresented: $viewModel.isShowMenuView) {
                        MenuView(viewModel: viewModel)
                    }
                }
                .padding()
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                Image("logo_title")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(x: viewModel.titleX, y: viewModel.titleY)
                    .animation(.interactiveSpring(dampingFraction: 0.25))
                    .padding()
                
                //Spacer()
                
                Button {
                    // サウンド
                    if viewModel.isSound {
                        viewModel.playSystem()
                    }
                    viewModel.isShowSingleGameView = true
                    
                } label: {
                    Image("start_s")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .padding()
                }
                .fullScreenCover(isPresented: $viewModel.isShowSingleGameView) {
                    SingleGameView(viewModel: viewModel)
                }
                
                
                Button {
                    // サウンド
                    if viewModel.isSound {
                        viewModel.playSystem()
                    }
                    viewModel.isShowDoubleGameView = true
                    
                } label: {
                    Image("start_d")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 1.5)
                        .padding()
                }
                .fullScreenCover(isPresented: $viewModel.isShowDoubleGameView) {
                    DoubleGameView(viewModel: viewModel)
                }
                
                // ヘルプ
                Button {
                    // サウンド
                    if viewModel.isSound {
                        viewModel.playSystem()
                    }
                    viewModel.isShowExplainDoubleView = true
                    
                } label: {
                    Image("btn_info")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width / 3)
                        .padding()
                }
                .fullScreenCover(isPresented: $viewModel.isShowExplainDoubleView) {
                    ExplainDoubleView(viewModel: viewModel)
                }
                
                
                Spacer()
                
                
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(viewModel: v)
//    }
//}
