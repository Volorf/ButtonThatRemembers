//
//  ContentView.swift
//  ButtonThatRemembers
//
//  Created by Oleg Frolov on 15/12/2023.
//

import SwiftUI

struct ContentView: View 
{
    var body: some View 
    {
        VStack 
        {
            Spacer()
            
            HStack
            {
                Spacer()
                
                ButtonThatRemembers()
                .onTapGesture 
                {
                    location in
                    print("Tapped at \(location)")
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .background(Color("Dark"))
        .ignoresSafeArea()
    }
}

#Preview 
{
    ContentView()
}
