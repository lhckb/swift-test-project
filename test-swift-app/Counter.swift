//
//  Counter.swift
//  test-swift-app
//
//  Created by Luís Cruz on 22/03/23.
//

import SwiftUI

struct Counter: View {
    @State
    var count = 0
    
    func loadCountValue() {
        count = StorageController.getCounterValue()
    }

    func increment() {
        count = count + 1
        StorageController.setCounterValue(count: count)
    }
    
    func decrement() {
        if (count == 0) {
            return
        }
        count = count - 1
        StorageController.setCounterValue(count: count)
    }
    
    func resetCount() {
        count = 0
        StorageController.setCounterValue(count: count)
    }
    
    
    
    var body: some View {
        VStack {
            Text(count.formatted())
            Button("Increment", action: increment).buttonStyle(.bordered)
            Button("Decrement", action: decrement).buttonStyle(.bordered)
            Button("Reset", action: resetCount).buttonStyle(.borderedProminent)
        }.onAppear(perform: loadCountValue)
        .padding()
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        Counter()
    }
}
