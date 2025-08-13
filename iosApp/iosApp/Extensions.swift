//
// Created by Hassaan Raza on 11/08/2025.
//

import KMPObservableViewModelCore
import Shared
import Foundation

extension Kmp_observableviewmodel_coreViewModel: KMPObservableViewModelCore.ViewModel {}

enum ApiValueSwift {
    case loading
    case success([Article])
    case error(KotlinException)
}

extension ApiValueSwift {
    init?(_ value: ApiResponse?) {
        switch value {
        case is ApiResponse.Loading:
            self = .loading
        case let success as ApiResponse.Success:
            self = .success(success.data ?? [])
        case let error as ApiResponse.Error:
            self = .error(error.error)
        default:
            return nil
        }
    }
}
