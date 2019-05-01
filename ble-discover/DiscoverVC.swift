//
//  DiscoverVC.swift
//  ble-discover
//
//  Created by Michael Hunt on 5/1/19.
//  Copyright © 2019 Michael Hunt. All rights reserved.
//

import UIKit
import CoreBluetooth

class DiscoverVC: UIViewController, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       centralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOff:
            print("Bluetooth is powered off.")
            break
        case .poweredOn:
            print("Bluetooth is powered on.")
            break
        case .resetting:
            print("Bluetooth is resetting.")
            break
        case .unauthorized:
            print("Bluetooth is unauthorized for this app.")
            break
        case .unknown:
            print("Bluetooth is in an unknown state on this device.")
            break
        case .unsupported:
            print("Bluetooth is unsupported on this device.")
            break
        default:
            break
        }
    }
    
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("Discovered New Peripheral: \(peripheral.name ?? "(No Name)"), RSSI: \(RSSI)")
        for ad in advertisementData {
            print("AD Data: \(ad)")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        
    }
    
    func centralManager(_ central: CBCentralManager, willRestoreState dict: [String : Any]) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        
    }
}

