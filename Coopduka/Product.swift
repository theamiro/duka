//
//  Product.swift
//  Coopduka
//
//  Created by Michael Amiro on 23/05/2024.
//

import Foundation

struct Product: Decodable, Identifiable {
    let userId: Int
    let id: Int
    var title: String
    let body: String
    var url: URL {
        return URL(string: "https://api.api-ninjas.com/v1/randomimage?category=\(self.id)")!
    }
}
