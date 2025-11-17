//
//  BooksResponse.swift
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

struct BooksResponse: Codable {
    let results: [Book]
}

struct Book: Codable, Identifiable {
    let id = UUID()
    let title: String
    let authors: [Author]
    let summaries: [String]
    let downloadCount: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case authors
        case summaries
        case downloadCount = "download_count"
    }
}

struct Author: Codable, Identifiable {
    let id = UUID()
    let name: String
}

extension Book {
    static let exampleBook = Book(title: "My Self",
                                  authors: [Author(name: "Pubudu Mihiranga")],
                                  summaries: ["Graduate from Class of 23, University of Westminster", "Lead mobile engineer for Circles.Life Singapore Selfcare App", "Passionately serving as a visiting lecturer at IIT (hopefully for one last time 🫡)"],
                                  downloadCount: 1)
}

