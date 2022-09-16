//
//  TestView.swift
//  GestureLookThisWay12
//
//  Created by cmStudent on 2022/09/08.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            
            Spacer()
            // 背景
            Image("gyan_back")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
            
            Button {
                
            } label: {
            Image("txt_gyan")
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
            
            Spacer()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
