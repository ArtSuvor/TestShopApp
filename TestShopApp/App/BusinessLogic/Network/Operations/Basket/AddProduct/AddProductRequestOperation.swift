//
//  AddProductRequestOperation.swift
//  TestShopApp
//
//  Created by Art on 09.07.2022.
//

import Foundation
import Alamofire

final class AddProductRequestOperation: AsyncOperation {
    private let id: Int
    
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
// MARK: - Init -
    init(id: Int) {
        self.id = id
    }
    
// MARK: - Override -
    override func main() {
        request = AF.request(BasketRouter.addProduct(id: self.id)).response(queue: .global()) {[weak self] response in
            guard let self = self else { return }
            
            self.data = response.data
            self.error = response.error
            self.state = .finished
        }
    }
    
    override func cancel() {
        request?.cancel()
        super.cancel()
    }
    
// MARK: - Public -
    func getData() -> Data? {
        self.data
    }
    
    func getError() -> Error? {
        self.error
    }
}
