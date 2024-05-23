//
//  AuthViewModel.swift
//  Coopduka
//
//  Created by Michael Amiro on 23/05/2024.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @State var username = ""
    @State var password = ""

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    func performLogin() throws {
        if username.isEmpty {
            throw AuthError.emptyValue(.username)
        }
        if password.isEmpty {
            throw AuthError.emptyValue(.password)
        }
        isLoggedIn = true
    }
}

enum FieldName: String {
    case username
    case password
}

enum AuthError: Error {
    case emptyValue(FieldName)
}
