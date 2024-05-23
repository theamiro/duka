//
//  ContentView.swift
//  Coopduka
//
//  Created by Michael Amiro on 23/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    let viewModel = AuthViewModel()
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack(alignment: .bottom) {
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
                VStack(spacing: 40) {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 103, height: 83)
                    Text("Welcome to a New Banking Experience\nDream it. Achieve it")
                        .fontWeight(.semibold)
                        .foregroundStyle(.background)
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 10)
            }
            .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Already registered on the new platform?")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text("Use your credentials to log in")
                    .multilineTextAlignment(.center)
            }
            .padding(.bottom, 20)
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Username")
                    TextField("Username", text: $username)
                    VStack(alignment: .trailing) {
                        Button(action: {}, label: {
                            Text("Forgot Username?")
                                .font(.caption)
                        })
                    }
                }

                VStack(alignment: .leading) {
                    Text("Password")
                    TextField("Password", text: $password)
                    Button(action: {}, label: {
                        Text("Forgot Password?")
                            .font(.caption)
                    })
                }
                .padding(.bottom, 50)
                Button(action: {
                    do {
                        try viewModel.performLogin()
                    } catch {
                        print(error.localizedDescription)
                    }
                }, label: {
                    Text("Log In")
                        .padding()
                        .fontWeight(.semibold)
                        .frame(width: .infinity, alignment: .center)
                        .foregroundStyle(.background)
                        .background(Color.accentColor)

                })
                .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                .background(Color.accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 5.0))
            }
            .padding(20)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
