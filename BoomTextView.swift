//
//  Trecina.swift
//  SwiftUIDojo
//
//  Created by Milan Maksimovic on 9.12.21..
//

import SwiftUI

struct BoomView : View {
    @State var animateText : Bool = false
    var body: some View {
        
        VStack {
            Spacer()
            Boom(animate: $animateText)
            Spacer()
            Button("Go") {
                animateText.toggle()
            }
        }
    }
}

struct Boom : View {
    var sentence = "The quick brown fox jumps over the lorem ipsum"
    @Binding var animate : Bool
    @Namespace var animation
    var body: some View {
        VStack {
            if( !animate ) {
                HStack {
                    ForEach(sentence.split(separator: " "), id:\.self) { word in
                        Text(word).matchedGeometryEffect(id: word, in: animation)
                    }
                }
            } else {
                ForEach(sentence.split(separator: " "), id:\.self) { word in
                    Text(word).matchedGeometryEffect(id: word, in: animation)
                        .rotationEffect(.degrees( animate ? Double(Int.random(in: -270...270)) : 0))
                        .offset(
                            x: animate ? CGFloat(Int.random(in: -300...300)) : 0,
                            y: animate ? CGFloat(Int.random(in: -300...300)) : 0)
                        .scaleEffect( animate ? CGFloat(Float.random(in: 0.2...2)): 1.0 )
                        
                }.zIndex(2)
            }
        }.font(.body)
            .animation(.spring().speed(0.7), value: animate)
    }
}
    
struct BoomView_Previews: PreviewProvider {
    static var previews: some View {
        BoomView( animateText: false)
    }
}
