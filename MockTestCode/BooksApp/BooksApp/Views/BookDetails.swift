//
//  BookDetails.swift
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

struct BookDetails: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                Text(book.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(book.downloadCount) downloads")
                    .foregroundStyle(.secondary)
                
                Text("Authors")
                    .font(.title3)
                    .fontWeight(.bold)
                
                ForEach(book.authors) { author in
                    Text(author.name)
                }
                
                Text("Summary")
                    .font(.title3)
                    .fontWeight(.bold)
                
                ForEach(Array(book.summaries.enumerated()), id: \.offset) { _, summary in
                    Text(summary)
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    BookDetails(book: .exampleBook)
}
