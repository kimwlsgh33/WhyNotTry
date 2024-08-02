//
//  ContentView.swift
//  WhyNotTry
//
//  Created by xxxx on 7/31/24.
//

import SwiftUI

struct ContentView: View {
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

    // mark that this is mutable -> you can change this.
    // this is called `property wrapper`.
    // @State property wrapper allow us to change view state freely.
    // private means that the selected variable cannot accessed by another files.
    @State private var selected = "Baseball"
    @State private var id = 1
    
    var body: some View {
        Text("Why not try...")
            .font(.largeTitle.bold())
        
        Spacer()
        
        // VStack is identified as a single group.
        VStack {
            Circle()
                .fill(colors.randomElement() ?? .blue)
                .padding()
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size:144))
                        .foregroundColor(.white)
                )
            
            Text("\(selected)!")
                .font(.title)
        }
        .transition(.slide)
        .id(id) // SwiftUI consider the whole VStack as new.
        
        Spacer()
        
        Button("Try again") {
            // change activity
            // animation: replace the old view with new view.
            withAnimation(.easeInOut(duration: 1)) {
                // there's no way for Swift to be sure there's anything in that array.
                // you can use `??` for default value.
                selected = activities.randomElement() ?? "Archery"
                id += 1
            }
        }
        .buttonStyle(.borderedProminent)
        
    }
}

#Preview {
    ContentView()
}
