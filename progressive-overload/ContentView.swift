//
//  ContentView.swift
//  progressive-overload
//
//  Created by justin lee on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .top) {
                NavigationLink("new workout", destination: NewWorkout())
                
            }
        }
        .padding()
    }
}

struct NewWorkout: View {
    var body: some View {
        Text("new workout page");
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
