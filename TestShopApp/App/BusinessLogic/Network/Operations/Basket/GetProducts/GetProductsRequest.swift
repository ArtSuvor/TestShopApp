//
//  GetProductsRequest.swift
//  TestShopApp
//
//  Created by Art on 06.08.2022.
//

import Foundation
import Alamofire

final class GetProductsRequestOperation: AsyncOperation {
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
// MARK: - Override -
    override func main() {
        request = AF.request(BasketRequestRouter.getAllProducts).response(queue: .global()) {[weak self] response in
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
