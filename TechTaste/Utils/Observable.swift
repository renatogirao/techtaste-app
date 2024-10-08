//
//  Observable.swift
//  TechTaste
//
//  Created by Renato Savoia Girão on 26/09/24.
//

import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    private var listener: ((T?) -> Void)?
    
    init(_ value: T? = nil) {
        self.value = value
    }
    func bind(_ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener 
    }
}
