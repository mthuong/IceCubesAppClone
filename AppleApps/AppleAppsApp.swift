//
//  AppleAppsApp.swift
//  AppleApps
//
//  Created by Thomas on 12/12/2023.
//

import SwiftUI
import Timeline
import Network

@main
struct AppleAppsApp: App {
    @State private var tabs: [String] = ["mastodon.social"]
    @State private var isServerSelectDisplayed: Bool = false
    @State private var newServerURL: String = ""
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ForEach(tabs, id: \.self) { tab in
                    NavigationStack {
                        TimelineView(kind: .pub)
                            .environmentObject(Client(server: tab))
                            .toolbar(content: {
                                ToolbarItem(placement: .topBarTrailing) {
                                    Button(action: {
                                        isServerSelectDisplayed.toggle()
                                    }, label: {
                                        Image(systemName: "globe")
                                    })
                                }
                            })
                            .alert("Connect to another server", isPresented: $isServerSelectDisplayed) {
                                TextField(tab, text: $newServerURL)
                                Button("Connect", action: {
                                  tabs.append(newServerURL)
                                  newServerURL = ""
                                })
                                Button("Cancel", role: .cancel, action: {})
                            }
                    }
                    .tabItem {
                        Label(tab, systemImage: "globe")
                    }
                }
            }
        }
    }
}
