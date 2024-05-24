//
//  ContentView.swift
//  progressive-overload
//
//  Created by justin lee on 2/7/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var numOfWorkouts = 0;
    var body: some View {
        VStack {
            ForEach(0..<numOfWorkouts, id: \.self) { index in
                WorkoutPanel()
            }
        }
        .padding()
        
        Button("add new workout") {
            numOfWorkouts += 1;
        }
    }
}

struct WorkoutPanel: View {
    @State var workoutCount: Int = 4;
    @State private var numberOfComponents = 1
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(red: 0.424, green: 0.678, blue: 0.788)) // Change color as needed
               .frame(height: 10)
               .edgesIgnoringSafeArea(.top)
            
            Button("add another set") {
                self.numberOfComponents += 1
            }
            // Dynamically generate components based on the number of clicks
            ForEach(0..<numberOfComponents, id: \.self) { index in
                WorkoutRow(setCount: numberOfComponents)
            }
            
            Button("remove set") {
                if (numberOfComponents > 1) {
                    self.numberOfComponents -= 1
                }
            }
            
        }
    }
}
 
struct WorkoutRow: View {
    var setCount: Int;
    
    var body: some View {
        HStack {
            SetBox(setCount: setCount);
            InputBox(isReps: false);
            InputBox(isReps: true);
        }
    }
}

struct SetBox: View {
    @State var setCount: Int
    
    var body: some View {
        Text(String(setCount));
    }
}



/**
  * View allowing users to enter  number of reps/amount of weight for a given exercise.
 */
struct InputBox: View {
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
