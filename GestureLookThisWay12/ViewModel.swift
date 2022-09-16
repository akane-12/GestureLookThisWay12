//
//  ViewModel.swift
//  GestureLookThisWay12
//
//  Created by cmStudent on 2022/08/26.
//

import Foundation

class ViewModel: ObservableObject {
    
    var motionManager = MotionManager.shared
    
    // MARK: プロパティ
    // 回転
    @Published var roX = 0.0
    @Published var roY = 0.0
    @Published var roZ = 0.0
    
    // ゲーム画面遷移フラグ
    // ひとり
    @Published var isShowSingleGameView = false
    // ふたり
    @Published var isShowDoubleGameView = false
    // ふたり説明
    @Published var isShowExplainDoubleView = false
    
    // ゲームの進行管理
    @Published var nowGame = 0
    
    // 選んでいる手
    @Published var choiceHand = -1
    // 選んでいる方向
    @Published var choiceWay = -1
    
    // あいこフラグ
    @Published var isAiko = false
    
    
    // CPU
    // 選んでいる手
    @Published var choiceOpponentHand = -1
    // 選んでいる方向
    @Published var choiceOpponentWay = -1
    
    // じゃんけん勝敗
    @Published var isUserWin = false
    
    // かちまけ
    @Published var totalUserWin = 0
    
    
    // 相手の手未選択
    @Published var imgCHnadCount = 0
    @Published var cHandImages = ["hc_gu_un", "hc_choki_un","hc_pa_un"]
    var timerCHnad: Timer?
    
    // じゃんけん説明画像用
    @Published var imgGyanCount = 0
    @Published var gyanImages = ["img_gyan_a", "img_gyan_b", "img_gyan_c","img_gyan_c", "img_gyan_c","img_gyan_c", "img_gyan_c"]
    var timerGyan: Timer?
    
    @Published var selectSize = 1.0
    
    // あいての方向未選択
    @Published var imgCWayCount = 0
    @Published var cWayImages = ["yc_top_un","yc_right_un","yc_bottom_un","yc_left_un"]
    var timerCWay: Timer?
    
    // 方向説明画像
    @Published var imgHoiCount = 0
    @Published var hoiImages = ["img_way_b","img_way_t","img_way_b","img_way_r","img_way_b","img_way_bo","img_way_b","img_way_l"]
    var timerHoi: Timer?
    
    // タイトル動かし
    @Published var titleX = 0.0
    @Published var titleY = 0.0
    
    // 設定・クレジット画面
    @Published var isShowMenuView = false
    
    // 音
    @Published var isSound = true
    
    
    // MARK: メソッド
    // センサーの開始
    func start() {
        
        // センサー値の更新クロージャ
        motionManager.startQueueUpdates { getX, getY, getZ in
            
            self.roX = getX
            self.roY = getY
            self.roZ = getZ
            
            
            if !self.isShowDoubleGameView && !self.isShowSingleGameView {
                // タイトルなら
                if self.roZ > 2 {
                    // 左
                    self.titleX = -50.0
                    
                } else if self.roZ < -2 {
                    // 右
                    self.titleX = 50.0
                    
                } else if self.roX > 1.8 {
                    // 上
                    self.titleY = -50.0
                    
                } else if self.roX < -1.9 {
                    // 下
                    self.titleY = 50.0
                } else {
                    self.titleX = 0.0
                    self.titleY = 0.0
                }

            }
            
            
            if self.choiceOpponentWay == -1 && self.choiceOpponentHand == -1 {
                
                // CPUの決定
                    self.selectOpponentHand()
                    print("CPUhand: \(self.choiceOpponentHand)")
                    
                    self.selectOpponentWay()
                    print("CPUway: \(self.choiceOpponentWay)")
            }
            
            // ゲームの進行チェック
            if self.nowGame == 1 && self.roX < -2 {
                // CPUの勝敗判定
                self.checkWin()
                
                self.nowGame = 2
                
            } else if self.nowGame == 3 {
                
                
                if self.roZ > 2 {
                                        
                    // 左
                    self.choiceWay = 3
                    
                    // CPUの勝敗

                    self.checkWay()

                    self.nowGame = 4
                    
                } else if self.roZ < -2 {
                    
                    // 右
                    self.choiceWay = 1
                    
                    // CPUの勝敗
                    self.checkWay()

                    self.nowGame = 4
                    
                } else if self.roX > 1.8 {
                    
                    // 上
                    self.choiceWay = 0
                    
                    // CPUの勝敗
                    self.checkWay()

                    self.nowGame = 4
                    
                } else if self.roX < -1.9 {
 
                    // 下
                    self.choiceWay = 2
                    
                    // CPUの勝敗
                    self.checkWay()

                    self.nowGame = 4
                    
                }
            }
        }
        print("start")
    }
    
    // 手の画像名取得
    func choiceHandImage() -> String {
        
        switch choiceHand {
        case 0:
            return "h_gu"
        case 1:
            return "h_choki"
        case 2:
            return "h_pa"
        default:
            return ""
        }
    }
    // 方向の画像名取得
    func choiceWayImage() -> String {
        
        switch choiceWay {
        case 0:
            return "y_top"
        case 1:
            return "y_right"
        case 2:
            return "y_bottom"
        case 3:
            return "y_left"
        default:
            return ""
        }
    }
    
    // ゲーム状態のリセット
    func gameInit() {
        nowGame = 0
        
        choiceHand = -1
        choiceWay = -1
        isAiko = false
        
        choiceOpponentHand = -1
        choiceOpponentWay = -1
        isUserWin = false
        totalUserWin = 0
        
        selectSize = 1.0
        
        
        timerGyan?.invalidate()
        timerCHnad?.invalidate()
        timerCWay?.invalidate()
        timerHoi?.invalidate()
    }
    
    // MARK: メソッド-Single
    
    // CPUの手選択
    func selectOpponentHand() {
        choiceOpponentHand = Int.random(in: 0...2)
        print("opphand: \(choiceOpponentHand)")
    }
    // CPUの手画像
    func selectOpponentHandImage() -> String {
        switch choiceOpponentHand {
        case 0:
            return "hc_gu"
        case 1:
            return "hc_choki"
        case 2:
            return "hc_pa"
        default:
            return ""
        }
    }
    
    // じゃんけん勝敗
    func checkWin() {
        
        if(choiceHand == choiceOpponentHand) {
            print("あいこ")
            isAiko = true
            
        } else if (choiceHand < choiceOpponentHand) {
            if(choiceHand == 0 && choiceOpponentHand == 2) {
                print("まけ")
                isUserWin = false
            } else {
                print("かち")
                isUserWin = true
            }
        } else if (choiceHand == 2 && choiceOpponentHand == 0) {
            print("かち")
            isUserWin = true
        } else {
            print("まけ")
            isUserWin = false
        }
    }
    
    // 勝ち負け表示画像（じゃんけん）
    func winLoseTextImage() -> String {
        let text: String
        if(isAiko) {
            text = "logo_aiko"
        } else if (isUserWin) {
            text = "txt_win"
        } else {
            text = "txt_lose"
        }
        
        return text
    }
    
    // CPUの方向設定
    func selectOpponentWay() {
        choiceOpponentWay = Int.random(in: 0...3)
        print("oppWay: \(choiceOpponentWay)")
    }
    
    // CPUの方向画像表示
    func selectOpponentWayImage() -> String {
        switch choiceOpponentWay {
        case 0:
            return "yc_top"
        case 1:
            return "yc_right"
        case 2:
            return "yc_bottom"
        case 3:
            return "yc_left"
        default:
            return ""
        }
    }
    
    // ホイ　勝敗判定
    func checkWay() {
        print("\(choiceWay) : \(choiceOpponentWay)")
        
        if(choiceWay == choiceOpponentWay) {
            if(isUserWin) {
                // ユーザーの勝ち
                totalUserWin = 1
            } else {
                // ユーザーの負け
                totalUserWin = -1
            }
        }
    }

    
    // MARK: 画像動作メソッド
    
    func cHandImgMove() {
        timerCHnad = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            
            self.imgCHnadCount += 1
            
            if(self.imgCHnadCount >= self.cHandImages.count) {
                self.imgCHnadCount = 0
            }
        }
    }
    
    func gyamImgMove() {

        timerGyan = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            
            self.imgGyanCount += 1
            
            if(self.imgGyanCount >= self.gyanImages.count) {
                self.imgGyanCount = 0
            }
        }
    }
    
    func cWayImgMove() {
        timerCWay = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
            
            self.imgCWayCount += 1
            
            if(self.imgCWayCount >= self.cWayImages.count) {
                self.imgCWayCount = 0
            }
        }
    }
    
    func hoiImgMove() {
        timerHoi = Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { _ in
            
            self.imgHoiCount += 1
            
            if(self.imgHoiCount >= self.hoiImages.count) {
                self.imgHoiCount = 0
            }
            
        }
    }
    
    // MARK: サウンド
    var audio = AudioManager()
    
    func playSystem() {
        audio.systemSound.play()
    }
    
    func playBack() {
        audio.backSound.play()
    }
    
    func playPoyo() {
        audio.poyoSound.stop()
        audio.poyoSound.currentTime = 0.0
        audio.poyoSound.play()
        
    }
    
    func playWin() {
        audio.winSound.play()
    }
    
    func playLose() {
        audio.loseSound.play()
    }
    func playCymbal() {
        audio.cymbalSaund.play()
    }
    
}
