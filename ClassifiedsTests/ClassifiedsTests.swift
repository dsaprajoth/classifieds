//
//  ClassifiedsTests.swift
//  ClassifiedsTests
//
//  Created by Prajoth D'sa on 18/01/21.
//

@testable import Classifieds
import XCTest

class ClassifiedsTests: XCTestCase {

    func testListingFields(){
        let sut = ListingViewModel()
        let model1 = Listing(name: "glass", price: "4 AED", uid: "1010203938", created_at: "2019-02-24 04:04:17.566515", image_urls: ["https://demo-app-photos-45687895456123.s3.amazonaws.com"], image_urls_thumbnails: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/thumb"])
        let model2 = Listing(name: "glass", price: "", uid: "1010203938", created_at: "2019-02-24 04:04:17.566515", image_urls: ["https://demo-app-photos-45687895456123.s3.amazonaws.com"], image_urls_thumbnails: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/thumb"])
        let model3 = Listing(name: "glass", price: "4 AED", uid: "1010203938", created_at: "2019-02-24 04:04:17.566515", image_urls: [], image_urls_thumbnails: [])
        let model4 = Listing(name: "", price: "4 AED", uid: "1010203938", created_at: "2019-02-24 04:04:17.566515", image_urls: ["https://demo-app-photos-45687895456123.s3.amazonaws.com"], image_urls_thumbnails: ["https://demo-app-photos-45687895456123.s3.amazonaws.com/thumb"])
        XCTAssertEqual(sut.validateListings(listingObj: model1), "Good")
        XCTAssertEqual(sut.validateListings(listingObj: model2), "Price Empty")
        XCTAssertEqual(sut.validateListings(listingObj: model3), "Images Empty")
        XCTAssertEqual(sut.validateListings(listingObj: model4), "Name Empty")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
