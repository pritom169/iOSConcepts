//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Pritom Mazumder on 21/4/25.
//
import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func loadItems(completion: @escaping ([LoadFeedResult]) -> Void)
}
