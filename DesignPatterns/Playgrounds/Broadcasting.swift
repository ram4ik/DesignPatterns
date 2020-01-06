//
//  Broadcasting.swift
//  DesignPatterns
//
//  Created by ramil on 06.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import UIKit

protocol BCObserver {
    func notify()
    var uid: Int { get }
}

protocol Subject {
    mutating func register(_ observer: BCObserver)
    mutating func unregister(_ observer: BCObserver)
}

extension UILabel: BCObserver {
    func notify() {
        self.text = "Subject state changed"
    }
    
    var uid: Int {
        return ObjectIdentifier(self).hashValue
    }
}

extension UIButton: Subject {
    private static var observers = [BCObserver]()
    
    func register(_ observer: BCObserver) {
        UIButton.observers.append(observer)
    }
    
    func unregister(_ observer: BCObserver) {
        UIButton.observers = UIButton.observers.filter{$0.uid != observer.uid}
    }
    
    func onStateChanged() {
        UIButton.observers.forEach { (observer) in
            observer.notify()
        }
    }
}

class MyViewController : UIViewController {
    var labels = [UILabel]()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        
        let notifyButton = UIButton(frame: CGRect(x: 0, y: 50, width: 380, height: 44))
        notifyButton.setTitle("Notify observers", for: .normal)
        notifyButton.setTitleColor(.black, for: .normal)
        notifyButton.backgroundColor = .lightGray
        view.addSubview(notifyButton)
        notifyButton.addTarget(self, action: #selector(onNotifyPressed(sender:)), for: UIControl.Event.touchUpInside)

        let unregisterButton = UIButton(frame: CGRect(x: 0, y: 100, width: 380, height: 44))
        unregisterButton.setTitle("Unregister observer", for: .normal)
        unregisterButton.setTitleColor(.white, for: .normal)
        unregisterButton.backgroundColor = .red
        view.addSubview(unregisterButton)
        unregisterButton.addTarget(self, action: #selector(onUnregisterPressed(sender:)), for: UIControl.Event.touchUpInside)

        let labelCount = 10
        
        for i in 0 ..< labelCount {
            let label = UILabel(frame: CGRect(x: 0, y: 200 + (i * 30), width: 380, height: 20))
            label.text = "Label # \(i + 1) listening..."
            label.textColor = .black
            label.textAlignment = .center
            view.addSubview(label)
            
            notifyButton.register(label)
            
            labels.append(label)
        }
        
        self.view = view
    }
    
    @objc func onNotifyPressed(sender: UIButton!) {
        sender.onStateChanged()
    }
    
    @objc func onUnregisterPressed(sender: UIButton!) {
        guard !labels.isEmpty else {
            return
        }
        let label = labels.removeFirst()
        label.text = "unregistered"
        sender.unregister(label)
    }
}

class BroadcastingExecutor {
    func execute() {
        // Present the view controller in the Live View window
        // PlaygroundPage.current.liveView = MyViewController()
    }
}

