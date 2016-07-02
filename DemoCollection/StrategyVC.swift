//
//  StrategyObject.swift
//  DemoCollection
//
//  Created by Jimmy on 22/6/2016.
//  Copyright © 2016 浙江大华. All rights reserved.
//

import UIKit

class StrategyVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let car = CLCar(name: "Car")
        let boart = CLBoart(name: "Boart")
        let plan = CLPlan(name: "Plan")
        
        var context = CLContext(traffic: car)
        let aa = context.name
        
        print(aa)
    }
}

class CLTraffic: NSObject {
    
}

class CLCar: CLTraffic {
    var carName = "car"
    init(name: String) {
        carName = name
    }
}

class CLBoart: CLTraffic {
    var boartName = "boart"
    init(name: String) {
        boartName = name
    }
}

class CLPlan: CLTraffic {
    var planName = "plan"
    init(name: String) {
        planName = name
    }
}

enum CLStrategy {
    case Car
    case Boart
    case Plan
}

class CLContext {
    
    var traffic: CLTraffic?
    var strategy: CLStrategy?
    var strategyDelegate: CLBasicStrategy?
    
    init(traffic: CLTraffic) {
        self.traffic = traffic
        
        if traffic.isKindOfClass(CLCar) {
            strategy = .Car
            strategyDelegate = CLCarStrategy(object: traffic)
        } else if traffic.isKindOfClass(CLBoart) {
            strategy = .Boart
            strategyDelegate = CLBoartStrategy(object: traffic)
        } else if traffic.isKindOfClass(CLPlan) {
            strategy = .Plan
            strategyDelegate = CLPlanStrategy(object: traffic)
        }
    }
    
    var name: String? {
        get {
            return strategyDelegate?.name
        }
    }
    
}

@objc protocol CLBasicStrategyDelegate {
    optional var name: String { get }
}



class CLBasicStrategy: NSObject, CLBasicStrategyDelegate {
   
    var name: String { return "" }
    
    init(object: CLTraffic) {
        
    }
}

class CLCarStrategy: CLBasicStrategy {
    var car: CLCar?
    
    override init(object: CLTraffic) {
        super.init(object: object)
        car = object as? CLCar
    }
    
    override var name: String { return car?.carName ?? "unknown" }
    
}

class CLBoartStrategy: CLBasicStrategy {
    var boart: CLBoart?
    
    override init(object: CLTraffic) {
        super.init(object: object)
        boart = object as? CLBoart
    }
    
    override var name: String { return boart?.boartName ?? "unknown" }
    
}

class CLPlanStrategy: CLBasicStrategy {
    var plan: CLPlan?
    
    override init(object: CLTraffic) {
        super.init(object: object)
        plan = object as? CLPlan
    }
    
    override var name: String { return plan?.planName ?? "unknown" }
    
}

