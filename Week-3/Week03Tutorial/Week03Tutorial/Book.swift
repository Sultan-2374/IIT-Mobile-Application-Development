//
//  File.swift
//  Week03Tutorial
//
//  Created by Sultan  on 17/10/2025.
//

import Foundation

// We make it Identifiable so SwiftUI's List can uniquely identify each book.
struct Book: Identifiable {
    let id = UUID() // Provides a unique ID for each book instance.
    var title: String
    var author: String
    var summary: String
}
