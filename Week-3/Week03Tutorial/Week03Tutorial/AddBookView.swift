//
//  SwiftUIView.swift
//  Week03Tutorial
//
//  Created by Sultan  on 17/10/2025.
//

import SwiftUI

struct AddBookView: View {
    // This allows us to dismiss this view when we're done.
    @Environment(\.dismiss) var dismiss

    // State variables to hold the text from the TextFields.
    @State private var title = ""
    @State private var author = ""
    @State private var summary = ""
    
    // This is a "callback" function. We'll give this view a function
    // from the LibraryView to run when a book is added.
    var onAdd: (Book) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Author", text: $author)
                TextField("Summary", text: $summary)
                
                Button("Add Book") {
                    // Create a new book instance with the data.
                    let newBook = Book(title: title, author: author, summary: summary)
                    // Run the callback function to pass the new book back.
                    onAdd(newBook)
                    // Dismiss the sheet.
                    dismiss()
                }
                // Disable the button if the title or author is empty.
                .disabled(title.isEmpty || author.isEmpty)
            }
            .navigationTitle("Add Book")
            .navigationBarItems(trailing: Button("Cancel") {
                // The cancel button just dismisses the sheet.
                dismiss()
            })
        }
    }
}

