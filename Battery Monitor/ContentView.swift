//
//  ContentView.swift
//  Battery Monitor
//
//  Created by Randy Fong on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var monitorBeaconsNow = false
    var body: some View {
        VStack {
            Image(systemName: "thermometer.transmission")
                .font(.system(size: 40))
                .foregroundColor(.red)
            Text("Monitor Temperature Beacons")
                .font(.system(.title3))
                .padding()
            Button(monitorBeaconsNow ? "Stop Monitoring Beacons" : "Start Monitoring Beacons") {
                pressMonitorBeacons()
            }
            .foregroundColor(monitorBeaconsNow ?  .red : .accentColor)
            .padding()
            Button("Make Network Call") {
                Task {
                    try? await makeNetworkCall()
                }
            }
            .padding()
            Button("Bomb Application") {
                bombApplication()
            }
            .foregroundColor(.red)
            .padding()

        }
        .padding()
    }
    
    func pressMonitorBeacons() {
        monitorBeaconsNow.toggle()
        monitorBeaconsNow ? print("** Monitoring Beacons Started") : print("** Monitoring Beacons Stopped")
        monitorBeacons()
    }
        
        func monitorBeacons() {
            Task {
                while monitorBeaconsNow  {
                    print("(Monitoring Beacons)")
                }
            }
        }
    
    func makeNetworkCall() async throws {
        print("** Make Network Call (Call Yahoo)")
        let url = URL(string: "https://yahoo.com")!
        let (_, _) = try await URLSession.shared.data(from: url)
    }
    
    func bombApplication() {
        print("** Bomb Application")
        let zero: Int = Int.random(in: 0...1)
        let _: Int = 5 / zero
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
