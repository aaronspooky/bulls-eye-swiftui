//
//  ContentView.swift
//  BullsEye
//
//  Created by Aaron Sykes on 13/11/19.
//  Copyright © 2019 Aaron Sykes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let target = Int.random(in: 1...100)
    @State var targetState: Double
    @State var showAlert = false
    
    func getPoints() -> Int {
        let difference = abs(target - Int(targetState * 100))
        return 100 - difference
    }
    
    var body: some View {
        VStack {
            Text("Put the Bull's Eye as close as you can to: \(target)")
            .multilineTextAlignment(.center)
            
            ExtractedView(targetValue: $targetState)
            Button(action: { self.showAlert = true }) {
                Text("Hit Me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your score"), message: Text(String(getPoints())))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(targetState: 0.5).previewLayout(.fixed(width: 568, height: 320))
    }
}

struct ExtractedView: View {
    @Binding var targetValue: Double
    var body: some View {
        HStack {
            Text("1")
            Slider(value: $targetValue)
            Text("100")
        }
    }
}
