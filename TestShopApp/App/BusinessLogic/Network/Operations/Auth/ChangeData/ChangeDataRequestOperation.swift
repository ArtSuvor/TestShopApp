//
//  ChangeDataRequestOperation.swift
//  TestShopApp
//
//  Created by Art on 12.06.2022.
//

import Foundation
import Alamofire

final class ChangeDataRequestOperation: AsyncOperation {
    
// MARK: - Properties -
    private let requestParameters: ChangeUserDataRequest
    
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
// MARK: - Init -
    init(requestParameters: ChangeUserDataRequest) {
        self.requestParameters = requestParameters
    }
    
// MARK: - Override -
    override func main() {
        request = AF.request(AuthRouter.changeData(request: self.requestParameters)).response(queue: .global()) {[weak self] response in
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
