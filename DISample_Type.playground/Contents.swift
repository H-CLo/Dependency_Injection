//: Playground - noun: a place where people can play

import UIKit

class RequestManager {
    
}

// MARK: - Before dependency injection

class ViewController : UIViewController {
    
    lazy var requestManager: RequestManager? = RequestManager()
    
}

// MARK: - After dependency injection

class ViewController1 : UIViewController {
    
    var requestManager: RequestManager?
}

let viewController1 = ViewController1()
viewController1.requestManager = RequestManager()










import Foundation

protocol Serializer {
    
    func serialize(data: Any) -> Data?
}

class RequestSerializer : Serializer {
    
    func serialize(data: Any) -> Data? {
        
        return nil
    }
}

class MockSerializer : Serializer {
    
    func serialize(data: Any) -> Data? {
        
        return Data(base64Encoded: "Mock Data")
    }
}

class DataManager {
    
    var serializer: Serializer?
}

let dataManager = DataManager()
dataManager.serializer = RequestSerializer()








// MARK: -- setup injection type

// 1. Initializer

class InitailizerManager {
    
    private let serializer: Serializer?
    
    init(serializer: Serializer) {
        self.serializer = serializer
    }
}

let initializeSerializer = RequestSerializer()
let initializeManager = InitailizerManager(serializer: initializeSerializer)

// 2. Property

class PropertyManager {
    
    var propertySerializer: Serializer?
    
    init() {
        
    }
}

let propertyManager = PropertyManager()
propertyManager.propertySerializer = RequestSerializer()

// 3. Method

class MethodManager {
    
    func serializeRequest(with serialize: Serializer) -> Data? {
        return nil
    }
}


















