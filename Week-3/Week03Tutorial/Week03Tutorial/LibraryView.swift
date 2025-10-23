//
//  LibraryView.swift
//  Week03Tutorial
//
//  Created by Sultan  on 17/10/2025.
//
import SwiftUI

struct LibraryView: View {
    // @State tells SwiftUI to watch this variable. If it changes,
    // the view will automatically update.
    @State private var books: [Book] = [
        Book(title: "1984", author: "George Orwell", summary: "A dystopian novel."),
        Book(title: "To Kill a Mockingbird", author: "Harper Lee", summary: "A novel about injustice."),
        Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", summary: "A critique of the American dream."),
        Book(title: "Pride and Prejudice", author: "Jane Austen", summary: "A romantic novel.")
    ]
    
    // A state variable to control showing the AddBookView sheet.
    @State private var showingAddBookSheet = false

    var body: some View {
        NavigationView {
            List {
                // ForEach loops over our books array and creates a row for each one.
                ForEach(books) { book in
                    NavigationLink(
                        destination:
                            VStack(alignment: .leading) {
                                Text("Book Title: \(book.title)")
                                    .bold()
                                Text("Book Author: \(book.author)")
                                    .bold()
                                Text("Book Summary: \(book.summary)")
                                    .bold()
                            }
                        ){
                                        
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text(book.author)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                                   
                // This modifier enables the swipe-to-delete and edit mode functionality.
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Book List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton() // This button now works with .onDelete!
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Set our state variable to true to show the sheet.
                        showingAddBookSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // This presents the AddBookView as a sheet when showingAddBookSheet is true.
            .sheet(isPresented: $showingAddBookSheet) {
                AddBookView { newBook in
                    // This is the code that runs when the "Add Book" button is tapped
                    // in AddBookView. We simply add the new book to our array.
                    books.append(newBook)
                }
            }
        }
    }
    
    // 🗑️ This function is called by the .onDelete modifier.
    private func deleteBooks(at offsets: IndexSet) {
        books.remove(atOffsets: offsets)
    }
}

#Preview {
    LibraryView()
}
