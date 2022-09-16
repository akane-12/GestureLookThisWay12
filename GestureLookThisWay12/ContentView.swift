//
//  ContentView.swift
//  GestureLookThisWay12
//
//  Created by cmStudent on 2022/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        HomeView(viewModel: viewModel)
            .onAppear {
                viewModel.start()
            }
        
//        TestView()
//
        
//        VStack {
//            Text("x:\(viewModel.roX)")
//            Text("y:\(viewModel.roY)")
//            Text("z:\(viewModel.roZ)")
//        }
//        .onAppear {
//            viewModel.start()
//        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
