//
//  LoadProductRequestsOperation.swift
//  TestShopApp
//
//  Created by Art on 25.06.2022.
//

import Foundation
import Alamofire

final class LoadProductRequestsOperation: AsyncOperation {
    
// MARK: - Properties -
    private let pageNumber: Int
    private let categoryId: Int
    
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
// MARK: - Init -
    init(page: Int, categoryId: Int) {
        self.pageNumber = page
        self.categoryId = categoryId
    }
    
// MARK: - Override -
    override func main() {
        request = AF.request(ShopRouter.loadProducts(page: self.pageNumber, catId: self.categoryId)).response(queue: .global()) { [weak self] response in
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

