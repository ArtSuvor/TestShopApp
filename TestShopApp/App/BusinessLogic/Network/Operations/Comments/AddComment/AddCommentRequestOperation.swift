//
//  AddCommentRequestOperation.swift
//  TestShopApp
//
//  Created by Art on 02.07.2022.
//

import Foundation
import Alamofire

final class AddCommentRequestOperation: AsyncOperation {
    private let userId: Int
    private let text: String
    
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
// MARK: - Init -
    init(userId: Int, text: String) {
        self.userId = userId
        self.text = text
    }
    
// MARK: - Override -
    override func main() {
        request = AF.request(CommentRouter.addComment(userId: self.userId, text: self.text)).response(queue: .global()) {[weak self] response in
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
