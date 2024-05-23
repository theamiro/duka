//
//  File.swift
//  Coopduka
//
//  Created by Michael Amiro on 23/05/2024.
//

import Foundation

class DashboardViewModel: ObservableObject {
    @ObservedObject var search: String = ""
    @ObservedObject var products: [Product] = []

    func fetchProducts() async throws {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))

        products = try JSONDecoder().decode([Product].self, from: data)
    }
}
