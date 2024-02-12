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
            WorkoutRow(setID: 4);
        }
    }
}

struct WorkoutRow: View {
    @State private var setID: Int;
    init(setID: Int) {
        self.setID = setID;
    }
    
    var body: some View {
        HStack {
            Text("\(setID)");
            NumberBox(isReps: true);
            NumberBox(isReps: false);
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
            .frame(width: 50)
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
