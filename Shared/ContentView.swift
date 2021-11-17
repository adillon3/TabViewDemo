//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 11/9/21.
//

import SwiftUI

struct ContentView: View
{
    /* VARIABLES */
    @State private var selection = 1
    @State private var isButtonVisible: Bool = true
    @State private var isSpinning: Bool = true
    @State private var rotation: Double = 0
    @State private var scale: CGFloat = 1
    @State private var visibility = false
    @State private var capsuleColorOne = Color.purple
    @State private var capsuleColorTwo = Color.red
  
    
    var body: some View
    {
        TabView(selection: $selection)
        {
            //TAB 1
            VStack
            {
                Toggle(isOn:$isButtonVisible.animation( .linear(duration: 2)))
                {
                    Text("Show/Hide Circle")
                }.padding()

                if isButtonVisible {
                    Circle()
                        .fill(Color.cyan)
                        .overlay(Circle().stroke(Color.blue, lineWidth: 10))
                        .frame(width: 250, height: 250)
                }
            }.tabItem
            {
                Image(systemName: "1.circle")
                Text("Screen One")
            }.tag(1)
            //TAB 2
            VStack
            {
                Rectangle()
                    .fill(Color.green)
                    .overlay(Rectangle().stroke(Color.yellow , lineWidth: 10))
                    .frame(width: 250, height: 250)
                    .rotationEffect(.degrees(isSpinning ? 0 : 360))
                    .animation(Animation.linear(duration: 5)
                    .repeatForever(autoreverses: false))
                    .onAppear()
                {
                    self.isSpinning.toggle()
                    
                }
            }.tabItem
            {
                Image(systemName: "2.circle")
                Text("Screen Two")
            }.tag(2)
            //TAB 3
            VStack
            {
                
                Toggle(isOn: $visibility)
                {
                    Text("Click to invert the colors")
                }
                .padding()
                if !visibility
                {
                    Capsule()
                        .fill(capsuleColorOne)
                        .overlay(Capsule().stroke(capsuleColorTwo , lineWidth: 10))
                        .frame(width: 250, height: 150)
                    Text("Oooh!")
                        .font(.largeTitle)
                }//END if !visibility
                if visibility
                {
                    Capsule()
                        .fill(capsuleColorTwo)
                        .overlay(Capsule().stroke(capsuleColorOne , lineWidth: 10))
                        .frame(width: 250, height: 150)
                    Text("Ahhh!")
                        .font(.largeTitle)
                }//END if visibility
            }.tabItem
            {
    
                Image(systemName: "3.circle")
                Text("Screen Three")
            }.tag(3)
        }//TabView(selection: $selection)
        .font(.largeTitle)
    }//END var body: some View
}//END struct ContentView: View



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
