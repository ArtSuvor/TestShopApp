//
//  LogoutRequestOperation.swift
//  TestShopApp
//
//  Created by Art on 12.06.2022.
//

import Foundation
import Alamofire

final class LogoutRequestOperation: AsyncOperation {
    
// MARK: - Properties -
    private let userId: Int
    
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
// MARK: - Init -
    init(userId: Int) {
        self.userId = userId
    }
    
// MARK: - Override -
    override func main() {
        request = AF.request(AuthRouter.logout(id: userId)).response(queue: DispatchQueue.global()) {[weak self] response in
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
