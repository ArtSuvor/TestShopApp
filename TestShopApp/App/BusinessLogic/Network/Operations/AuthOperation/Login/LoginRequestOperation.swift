//
//  LoginRequestOperation.swift
//  TestShopApp
//
//  Created by Art on 11.06.2022.
//

import Foundation
import Alamofire

final class LoginRequestOperation: AsyncOperation {
    
// MARK: - Properties -
    private let login: String
    private let password: String
    
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
// MARK: - Init -
    init(login: String, password: String) {
        self.login = login
        self.password = password
    }
    
// MARK: - Override -
    override func main() {
        request = AF.request(AuthRouter.login(log: self.login, pass: self.password)).response(queue: .global()) {[weak self] response in
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
