//
//  BooksViewModel.swift
//  BooksApp
//
//  Created by Pubudu Mihiranga on 2025-11-15.
//

/*
 Disclaimer: This solution contains sample code for the given specification.
 There is room for improvement in this code;
 however, you may refer to it when preparing for the in-class test
 */

import Foundation
import Observation

@Observable
class BooksViewModel {
    var appState: AppState = .idle
    var booksResponse: BooksResponse?
    var books: [Book] = []
    var errorMessage: String?
    
    // MARK: - Fetch books
    func fetchBooks() async {
        guard appState != .loading else { return }
        
        appState = .loading
        
        let urlString = "https://gutendex.com/books/"
        
        guard let url = URL(string: urlString) else {
            errorMessage = APIError.invalidURL.errorDescription
            appState = .failure
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                errorMessage = APIError.invalidResponse.errorDescription
                appState = .failure
                return
            }
            
            let decodedData = try JSONDecoder().decode(BooksResponse.self, from: data)
            booksResponse = decodedData
            books = decodedData.results
            appState = .success
        } catch {
            errorMessage = APIError.unknown.errorDescription
            appState = .failure
        }
    }
    
    // MARK: - Search
    func search(with text: String) {
        guard let allBooks = booksResponse?.results else { return }
        
        guard !text.isEmpty else {
            books = allBooks
            return
        }
        
        let lowercased = text.lowercased()
        
        books = allBooks.filter {
            $0.title.lowercased().contains(lowercased)
        }
    }
}
