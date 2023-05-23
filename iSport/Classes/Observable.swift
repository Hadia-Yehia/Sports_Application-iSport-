//
//  Observable.swift
//  iSport
//
//  Created by Hadia Yehia on 23/05/2023.
//

import Foundation
class Observable<T> {
    var value : T?{
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    init(value: T? = nil) {
        self.value = value
    }
    private var listener : ((T?)-> Void)?
    func bind(_ listener : @escaping ((T?)-> Void)){
        listener(value)
        self.listener = listener
    }
}
