//
//  AddingOperations.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation

protocol AddingOperations {
    var operationQueue: OperationQueue { get }
    func addingOperations<T: Operation, U: Operation>(request: T, parse: U)
}

extension AddingOperations {
    var operationQueue: OperationQueue {
        OperationQueue()
    }
    
    func addingOperations<T: Operation, U: Operation>(request: T, parse: U) {
        let operations = [request, parse]
        parse.addDependency(request)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
