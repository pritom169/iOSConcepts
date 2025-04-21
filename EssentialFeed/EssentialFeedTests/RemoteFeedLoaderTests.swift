//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Pritom Mazumder on 21/4/25.
//

import XCTest

class RemoteFeedLoader {
    func load(){
        HTTPClient.shared.get(from: URL(string: "https://example.com/feed")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
    
    /// One of the common ways to make singleton testable is to
    /// change the let to var.
    ///
    /// However it does not stays as singleton afterwards, as it turns
    /// to sharable global state
    
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL){
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL(){
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL(){
        // Arrange
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        // Act
        sut.load()
        
        // Assert
        XCTAssertNotNil(client.requestedURL)
    }
}
