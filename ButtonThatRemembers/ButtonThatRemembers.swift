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
    
    var body: some View 
    {
        VStack
        {
            VStack
            {
                Text("Button")
                    .font(.custom("Helvetica", size: 32))
                    .foregroundStyle(.white)
            }
            .frame(width: 292, height: 96)
            
            .background(Color("Dark Light"))
            .cornerRadius(16)
            
            .scaleEffect(isPressed ? 0.9 : 1)
            .animation(.spring(), value: isPressed)
            .onTapGesture
            {
                location in
                print("Tapped at \(location)")
            }
        }
        .simultaneousGesture(DragGesture(minimumDistance: 0)
        .onChanged
        { _ in
            if (!isPressed)
            {
                print("Down")
                isPressed = true
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
    ButtonThatRemembers()
}
