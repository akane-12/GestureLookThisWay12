//
//  GameView.swift
//  MotionAppSample12
//
//  Created by cmStudent on 2022/08/16.
//

import SwiftUI

struct DoubleGameView: View {
    
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
                        viewModel.gameInit()
                        viewModel.isShowDoubleGameView = false
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
            
            if viewModel.nowGame == 0 {
                game0
                    .onAppear{
                        print("single game 0")
                        
                        viewModel.selectSize = 1.0
                        
                    }
            } else if viewModel.nowGame == 1 {
                game1
                    .onAppear{
                        print("single game 1")
                        
                        viewModel.gyamImgMove()
                        viewModel.selectSize = 1.0
                        
                    }
            } else if viewModel.nowGame == 2 {
                game2
                    .onAppear{
                        print("single game 2")
                        // サウンド
                        if viewModel.isSound {
                            viewModel.playCymbal()
                        }
                        self.viewModel.timerGyan?.invalidate()
                        viewModel.selectSize = 1.5
                        
                    }
            } else if viewModel.nowGame == 3 {
                game3
                    .onAppear{
                        print("single game 3")
                        
                        viewModel.hoiImgMove()
                        viewModel.selectSize = 1.0
                    }
            } else if viewModel.nowGame == 4 {
                game4
                    .onAppear{
                        print("single game 4")
                        // サウンド
                        if viewModel.isSound {
                            viewModel.playCymbal()
                        }
                        self.viewModel.timerHoi?.invalidate()
                        viewModel.selectSize = 1.5
                    }
            }
        }
    }
    
    var game0: some View {
        VStack {
            Spacer()
            
            Image("no_select")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 6)
                .padding()
            
            Spacer()
            
            Image("txt_select")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 12)
                .padding()
            
            Spacer()
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        // サウンド
                        if viewModel.isSound {
                            viewModel.playPoyo()
                        }
                        viewModel.choiceHand = 0
                    } label: {
                        Image("h_gu")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.size.width / 5)
                            .saturation(viewModel.choiceHand == 0 ? 1 : 0)
                            .scaleEffect(viewModel.choiceHand == 0 ? 1.5 : 1)
                            .animation(.interactiveSpring(dampingFraction: 0.25))
                    }
                    
                    Spacer()
                    
                    Button {
                        // サウンド
                        if viewModel.isSound {
                            viewModel.playPoyo()
                        }
                        viewModel.choiceHand = 1
                    } label: {
                        Image("h_choki")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.size.width / 5)
                            .saturation(viewModel.choiceHand == 1 ? 1 : 0)
                            .scaleEffect(viewModel.choiceHand == 1 ? 1.5 : 1)
                            .animation(.interactiveSpring(dampingFraction: 0.25))
                    }
                    
                    Spacer()
                    
                    Button {
                        // サウンド
                        if viewModel.isSound {
                            viewModel.playPoyo()
                        }
                        viewModel.choiceHand = 2
                    } label: {
                        Image("h_pa")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.size.width / 5)
                            .saturation(viewModel.choiceHand == 2 ? 1 : 0)
                            .scaleEffect(viewModel.choiceHand == 2 ? 1.5 : 1)
                            .animation(.interactiveSpring(dampingFraction: 0.25))
                    }
                    
                    Spacer()
                }
                .frame(height: UIScreen.main.bounds.size.height / 7)
                Spacer()
                
                Button {
                    // サウンド
                    if viewModel.isSound {
                        viewModel.playSystem()
                    }
                    if viewModel.choiceHand != -1 {
                        viewModel.nowGame = 1
                    }
                } label: {
                    Image("btn_next")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 14)
                        .saturation(viewModel.choiceHand != -1 ? 1 : 0)
                        .padding()
                }
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game1: some View {
        VStack {
            Spacer()
            
            Image("no_select")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 6)
                .padding()
            
            Spacer()
            
            Image(viewModel.isAiko ? "txt_aiko" : "txt_gyan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 18)
                .padding()
            
            Spacer()
            
            HStack {
                Spacer()
                Image(viewModel.gyanImages[viewModel.imgGyanCount])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width / 1.2)
                Spacer()
            }
            
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game2: some View {
        VStack {
            Spacer()
            
            VStack {
                Image(viewModel.choiceHandImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.size.height / 6)
                    .scaleEffect(viewModel.selectSize)
                    .animation(.interactiveSpring(dampingFraction: 0.25))
                
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            .padding()
            
            Spacer()
            
            Image("txt_pon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 16)
                .padding()
            
            Spacer()
            
            VStack {
                
                Button {
                    // サウンド
                    if viewModel.isSound {
                        viewModel.playSystem()
                    }
                    viewModel.nowGame = 0
                    viewModel.choiceHand = -1
                    viewModel.isAiko = true
                } label: {
                    Image("btn_aiko")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 14)
                        .padding()
                }
                
                
                Button {
                    // サウンド
                    if viewModel.isSound {
                        viewModel.playSystem()
                    }
                    viewModel.nowGame = 3
                    print("double game: 3")
                } label: {
                    Image("btn_next")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 14)
                        .padding()
                }
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game3: some View {
        VStack {
            Spacer()
            
            HStack {
                VStack {
                    Spacer()
                    Image("y_left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 8)
                    Spacer()
                }
                
                VStack {
                    Image("y_top")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 8)
                    
                    Image("y_bottom")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 8)
                }
                
                VStack {
                    Spacer()
                    Image("y_right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.size.height / 8)
                    Spacer()
                }
                
            }
            .frame(height: UIScreen.main.bounds.size.height / 3.5)
            
            Spacer()
            
            Image("txt_achi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 18)
                .padding()
            
            Spacer()
            
            HStack {
                Spacer()
                Image(viewModel.hoiImages[viewModel.imgHoiCount])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width / 1.2)
                Spacer()
            }
            .frame(height: UIScreen.main.bounds.size.height / 4)
            
            Spacer()
        }
    }
    
    var game4: some View {
        VStack {
            Spacer()
            
            Image(viewModel.choiceWayImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 7)
                .scaleEffect(viewModel.selectSize)
                .animation(.interactiveSpring(dampingFraction: 0.25))
            
            Spacer()
            
            Image("txt_hoi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: UIScreen.main.bounds.size.height / 20)
                .padding()
            
            Spacer()
            
            
            Button {
                // サウンド
                if viewModel.isSound {
                    viewModel.playSystem()
                }
                viewModel.gameInit()
            } label: {
                Image("btn_again")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.size.height / 14)
                    .padding()
            }
            
            Button {
                // サウンド
                if viewModel.isSound {
                    viewModel.playSystem()
                }
                viewModel.isShowDoubleGameView = false
                viewModel.gameInit()
                
            } label: {
                Image("btn_title")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.size.height / 14)
            }
            
            Spacer()
        }
        
    }
    
    
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(viewModel: MotionManager.shared)
//    }
//}
