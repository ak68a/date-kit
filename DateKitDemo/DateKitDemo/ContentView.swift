//
//  ContentView.swift
//  DateKitDemo
//
//  Created by Flacko on 5/27/25.
//

import SwiftUI
import DateKit

struct ContentView: View {
    
    let date = Date()
    let shortDate = DateKit.Style.shortDate
    
    var body: some View {
        VStack {
            Text(date.formattedAs(shortDate))
            Text(date.formattedAs(.iso8601))
            Text(date.formattedAs(.longDateTime))
            Text(date.adding(minutes: 60).relativeString)
            Text(date.subtracting(seconds: 60).relativeString)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
