//
//  ContentView.swift
//  DesignCodeiOS16
//
//  Created by Daniel Yeboah on 12.4.2023.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @AppStorage("selectedMenu") var selectedMenu: Menu = .compass
    @GestureState var press = false
    
    var body: some View {
        ZStack { // zstack uses the minimum child view size
            Color(.systemBackground).ignoresSafeArea()
            
            switch selectedMenu {
            case .compass:
                CompassView()
            case .card:
                CardReflectionView()
            case .charts:
                DetailView()
            case .radial:
                RadialLayoutView()
            case .halfsheet:
                MenuView()
            case .gooey:
                MessageView()
            case .actionbutton:
                ActionButtonView()
            }
        }
        .overlay(MessageView())
        .onTapGesture { }
        .gesture(longPress) // happens only within the borders the child view size or the extended size of the parent view
        .sheet(isPresented: $showMenu) {
            MenuView()
                .presentationDetents([.medium, .large])
        }
    }
    
    var longPress: some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState // once the currentState module determines that there is along press, it changes the state and ends the long press // this is when we change our state
            }
            .onEnded { value in // it's ended when the currentState detects a long press
                showMenu = true
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
