//
//  Errors.swift
//  Give me joke
//
//  Created by Юрий Кручинин on 19/10/23.
//

import Foundation

enum NetwokErrors: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unknownError
    case gotErrorFetchingData
    case errorParsingData
}
