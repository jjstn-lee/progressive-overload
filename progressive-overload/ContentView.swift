//
//  ContentView.swift
//  progressive-overload
//
//  Created by justin lee on 2/7/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        VStack {
            WorkoutPanel()
        }
        .padding()
    }
}

struct WorkoutPanel: View {
    
    var body: some View {
        HStack {
            setColumn(setNum: 2);
        }
    }
}


struct setColumn: View {
    @State private var setNum: Int;
    init(setNum: Int) {
        self.setNum = setNum;
    }
    
    var body: some View {
        VStack {
            var currSet = 1;
            while currSet <= setNum {
                Text("set");
                currSet+=1;
            }
        }
    }
}

struct NumberBox: View {
    @State private var numericInput: String = "";
    @State private var isReps: Bool;
    init(isReps: Bool) {
            self.isReps = isReps
        }
    var body: some View {
        TextField(isReps ? "reps" : "weight", text: $numericInput)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.trailing)
            .frame(width: 75)
        // only allows decimal numbers
            .onReceive(Just(numericInput)) { newNumericInput in
                let filtered = newNumericInput.filter {"0123456789".contains($0) }
                if filtered != newNumericInput {
                    self.numericInput = filtered
                }
            }
    }
}



//struct NavigationBar: View {
//    var body: some View {
//        
//    }
//}


#Preview {
    ContentView()
}
