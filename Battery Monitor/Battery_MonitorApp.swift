//
//  Battery_MonitorApp.swift
//  Battery Monitor
//
//  Created by Randy Fong on 4/27/23.
//

import SwiftUI
import NewRelic

@main
struct Battery_MonitorApp: App {
    init() {
        NewRelic.start(withApplicationToken:"AA6f7e60e06d819fedead069b3b074dff5e71688e3-NRMA")
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
}
