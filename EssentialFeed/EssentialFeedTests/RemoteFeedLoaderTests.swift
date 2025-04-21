//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Pritom Mazumder on 21/4/25.
//

import XCTest

class RemoteFeedLoader {
    func load(){
        HTTPClient.shared.requestedURL = URL(string: "https://example.com/feed.xml")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {
        
    }
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL(){
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL(){
        // Arrange
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        // Act
        sut.load()
        
        // Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
