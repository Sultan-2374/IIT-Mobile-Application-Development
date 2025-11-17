//
//  ContentView.swift
//  BooksApp
//
//  Created by Pubudu Mihiranga on 2025-11-15.
//

/*
 Disclaimer: This solution contains sample code for the given specification.
 There is room for improvement in this code;
 however, you may refer to it when preparing for the in-class test
 */

import SwiftUI

struct ContentView: View {
    @State private var viewModel = BooksViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                switch viewModel.appState {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .success:
                    BooksList(books: viewModel.books)
                case .failure:
                    Text(viewModel.errorMessage ?? "Something went wrong. Please try again.")
                }
            }
            .navigationTitle("Books App")
            .task {
                await viewModel.fetchBooks()
            }
            .searchable(text: $searchText, prompt: "Search books")
            .onChange(of: searchText) { newValue in
                viewModel.search(with: newValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
