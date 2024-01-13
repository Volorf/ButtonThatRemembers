//  Keypad.swift
//  Created by Oleg Frolov on 11/01/2024.

import SwiftUI

struct Keypad: View 
{
    @State private var text: String = ""
    @State private var displayText: String = ""
    @State private var isEmpty: Bool = true
    @State private var isFull: Bool = false
    
    private let spacing: Double = 16
    
    func processTextInput(sign: String)
    {
        text = text + sign
        
        switch (text.count)
        {
        case 0:
            displayText = "••••"
            isEmpty = true
            isFull = false
        case 1:
            displayText = text + "•••"
            isEmpty = false
        case 2:
            displayText = text + "••"
        case 3:
            displayText = text + "•"
            isFull = false
        case 4:
            displayText = text
            isEmpty = false
            isFull = true
        
        default:
            text.removeLast()
        }
        
        print(  "text: \(text) \ndisplayText: \(displayText)")
    }
    
    var body: some View
    {
        VStack(spacing: spacing)
        {
            VStack(spacing: spacing)
            {
                Text(displayText)
                    .font(.custom("IBMPlexMono-Medium", size: 12))
                    .kerning(8)
            }
            .padding(.leading, 8.0)
            .frame(width: 224, height: 64)
            .foregroundColor(.white)
            
            VStack(spacing: spacing)
            {
                HStack(spacing: spacing)
                {
                    KeypadButton(name: "1", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                    
                    KeypadButton(name: "2", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                    
                    KeypadButton(name: "3", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                }
                
                HStack(spacing: spacing)
                {
                    KeypadButton(name: "4", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                    
                    KeypadButton(name: "5", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                    
                    KeypadButton(name: "6", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                }
                
                HStack(spacing: spacing)
                {
                    KeypadButton(name: "7", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                    
                    KeypadButton(name: "8", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                    
                    KeypadButton(name: "9", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                }
                
                HStack(spacing: spacing)
                {
                    KeypadButton(name: "DEL", isActive: false, isDisabled: false)
                    {
                        name in
                        if (text.count > 0)
                        {
                            text.removeLast()
                            processTextInput(sign: "")
                        }
                        
                    }
                    
                    KeypadButton(name: "0", isActive: false, isDisabled: isFull)
                    {
                        name in
                        processTextInput(sign: name)
                    }
                    
                    KeypadButton(name: "ENT", isActive: isFull, isDisabled: true)
                    {
                        name in
                    }
                }
            }
            
        }
        .frame(width: 256, height: 416)
        .background(Color("Dark Light"))
        .cornerRadius(24)
        .onAppear()
        {
            processTextInput(sign: "")
        }
        
    }
}

#Preview {
    Keypad()
}
