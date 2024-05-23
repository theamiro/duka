//
//  DashboardView.swift
//  Coopduka
//
//  Created by Michael Amiro on 23/05/2024.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var authViewModel: AuthViewModel
    @StateObject var dashboardViewModel: DashboardViewModel
    var body: some View {
        ScrollView {
            HStack {
                Button {
                } label: {
                    Image("user")
                }
                Spacer()
                Text("Hello \(authViewModel.username)")
                Spacer()
                Button {
                } label: {
                    Image("logout")
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            Text("15% off if you pay via MCoopCash!")
                .padding()
                .foregroundStyle(.background)
                .fontWeight(.semibold)
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.accentColor)
            TextField("", text: $dashboardViewModel.search, prompt: Text("Search products"))

            Section {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 16) {
                    ForEach(dashboardViewModel.$products, id:\ .id) { product in
                        NavigationLink {
                            Text("")
                        } label: {
                            VStack(alignment: .leading) {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.accentColor)
                                        .frame(width: 100, height: 100)
                                    AsyncImage(url: product.url) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .transition(.scale(scale: 0.1, anchor: .center))
                                            .clipped()
                                    } placeholder: {
                                        ProgressView()
                                            .tint(Color.accentColor)
                                    }
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                }
                                .cornerRadius(8.0)
                                .clipped()
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(product.name)
                                        .fontWeight(.bold)
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                    Text("KES \(product.price)")
                                        .font(.custom("Lato-Bold", size: 18))
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 300)
                            .padding(12)
                            .background(Color("white"))
                            .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
                .background(Color("babe"))
            } header: {
                Text("Best Selling")
            }
        }
        .onAppear {
            dashboardViewModel.fetchProducts()
        }
    }
}

#Preview {
    DashboardView(authViewModel: AuthViewModel(), dashboardViewModel: DashboardViewModel())
}
