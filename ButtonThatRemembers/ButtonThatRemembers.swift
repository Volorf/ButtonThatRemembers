//
//  Button.swift
//  ButtonThatRemembers
//
//  Created by Oleg Frolov on 15/12/2023.
//

import SwiftUI

struct FingerTipPrint: View
{
    var position: Coords
    @State private var angleOffset: Double = 0
    @State private var opacityOffset: Double = 0
    @State private var imageName: String = "Finger Print 5"
    
    var body: some View
    {
        ZStack()
        {
            Image(imageName)
                .resizable()
                .rotationEffect(.degrees(angleOffset))
                .opacity(opacityOffset)
                .scaleEffect(0.75)
                .offset(y: 16)
   
        }
        .blendMode(.lighten)
        .frame(width: 128, height: 128)
        .cornerRadius(8)
//        .background(.red)
        .position(x: position.x, y: position.y)
        .onAppear()
        {
            angleOffset = Double.random(in: -20...20)
            opacityOffset = Double.random(in: 0.4...0.6)
            imageName = "Finger Print \(Int.random(in: 1..<5))"
        }
        

    }
}

struct Coords: Hashable
{
    var x: Double
    var y: Double
}

struct ButtonThatRemembers: View
{
    
    @State private var isPressed: Bool = false
    @State private var fingerPrints: [Coords] = []
    
    var body: some View 
    {
        VStack
        {
            ZStack
            {
                Text("Touch Me")
                    .font(.custom("Helvetica", size: 24))
                    .foregroundStyle(.white)
                
                ForEach(fingerPrints, id: \.self) { fingerPrint in
                    FingerTipPrint(position: fingerPrint)
                }
            }
            .frame(width: 240, height: 72)
            
            .background(Color("Dark Light"))
            .cornerRadius(16)
            
            .scaleEffect(isPressed ? 0.9 : 1)
            .animation(.spring(), value: isPressed)
            .onTapGesture
            {
                location in
//                print("Tapped at \(location)")
//                fingerPrints.append(Coords(x: location.x, y: location.y))
            }
        }
        .simultaneousGesture(DragGesture(minimumDistance: 0)
        .onChanged
        { touchData in
            if (!isPressed)
            {
                print("Down")
                isPressed = true
                print(touchData.location)
                fingerPrints.append(Coords(x: touchData.location.x, y: touchData.location.y))
            }
        }
        .onEnded
        { _ in
            if (isPressed)
            {
                print("Up")
                isPressed = false
            }
        })
    }
}

#Preview {
    VStack()
    {
        ButtonThatRemembers()
        FingerTipPrint(position: Coords(x: 100, y: 100))
    }
    
}
