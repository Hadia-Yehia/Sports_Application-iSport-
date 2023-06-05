//
//  MockAllLeagues.swift
//  iSportTests
//
//  Created by Hadia Yehia on 05/06/2023.
//

import Foundation
 
protocol Mockable: AnyObject {

    var bundle: Bundle { get }

    func loadJSON<T: Decodable>(filename: String, type: T.Type) throws -> T

}
extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) throws -> T {

        guard let path = bundle.url(forResource: filename, withExtension: "json") else {

            throw MockableError.failedToLoadJSON
        }

        

        do {

            let data = try Data(contentsOf: path)

            let decodedObject = try JSONDecoder().decode(T.self, from: data)

            return decodedObject

        } catch {

            throw MockableError.failedToDecodeJSON

        }

    }

}

 

enum MockableError: Error {
    case failedToLoadJSON
    case failedToDecodeJSON
}


