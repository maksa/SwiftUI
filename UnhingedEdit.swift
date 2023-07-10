//
//  UnhingedEdit.swift
//  CrazyShit
//
//  Created by Milan Maksimovic on 22.6.23..
//

import SwiftUI

struct UnhingedEdit: View {
    @State var text : String
    @State var rotationAngle : Angle = .degrees(0)
    var body: some View {
        VStack {
            TextField(text: $text) {
                Text("")
            }
            .overlay(alignment: .topTrailing, content: {
                Image(systemName: "circle.circle").scaleEffect(0.7)
                    .offset(x:5,y:-5)
            })

            .textFieldStyle(.roundedBorder).frame(width: 180)
            .rotationEffect(rotationAngle, anchor: .topTrailing)
            .onChange(of: text) { newValue in
                withAnimation(
                    .interpolatingSpring(mass: 0.05, stiffness: 0.9, damping: 2.0, initialVelocity: 20))
                {
                    rotationAngle = .degrees( max( -90,  -Double(newValue.count * 8)))
                }
            }
        }
    }
}

struct TestView : View {
    @State var text : String
    var body: some View {
        ZStack {
            Color.orange
            VStack {
                UnhingedEdit(text: text)
            }
        }.ignoresSafeArea()
    }
}

struct UnhingedEdit_Previews: PreviewProvider {
    @State static var text : String = ""
    static var previews: some View {
        TestView(text: text)
    }
}
