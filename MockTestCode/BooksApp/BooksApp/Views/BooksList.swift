//
//  BooksList.swift
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

struct BooksList: View {
    let books: [Book]
    
    var body: some View {
        List(books) { book in
            NavigationLink {
                BookDetails(book: book)
            } label: {
                VStack(alignment: .leading) {
                    Text(book.title)
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("\(book.downloadCount) downloads")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        BooksList(books: [.exampleBook])
    }
}
