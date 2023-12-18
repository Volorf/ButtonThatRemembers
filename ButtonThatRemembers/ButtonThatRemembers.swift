//
//  Button.swift
//  ButtonThatRemembers
//
//  Created by Oleg Frolov on 15/12/2023.
//

import SwiftUI

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
                    FingerPrint(position: fingerPrint)
                }
            }
            .frame(width: 240, height: 72)
            .background(Color("Dark Light"))
            .cornerRadius(16)
            .scaleEffect(isPressed ? 0.9 : 1)
            .animation(.spring(), value: isPressed)
        }
        .simultaneousGesture(DragGesture(minimumDistance: 0)
        .onChanged
        { 
            touchData in
            if (!isPressed)
            {
                print("Down")
                isPressed = true
                print(touchData.location)
                fingerPrints.append(Coords(x: touchData.location.x, y: touchData.location.y))
            }
        }
        .onEnded
        { 
            _ in
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
        FingerPrint(position: Coords(x: 100, y: 100))
    }
    
}
