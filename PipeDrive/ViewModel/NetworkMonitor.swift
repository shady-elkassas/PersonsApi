//
//  NetworkMonitor.swift
//  Pipedrive
//
//  Created by Shady Elkassas on 30/11/2023.
//

import Foundation
import Network

//Class for network status
class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    
    @Published var isConnected: Bool = false

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}

