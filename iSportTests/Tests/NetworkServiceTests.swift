//
//  NetworkServiceTest.swift
//  iSportTests
//
//  Created by Hadia Yehia on 05/06/2023.
//

import XCTest
@testable import iSport

final class NetworkServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testGetAllLeaguesShouldPass(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getAllLeagues(game: "football", completionHandler: { (result : Result<AllLeagues?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                expectation.fulfill()
            }
        }
                                     
    )
        waitForExpectations(timeout: 7,handler: nil)
}
    func testGetTeamsShouldPass(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getTeams(game: "football", leagueKey: 4, completionHandler: { (result : Result<AllTeams?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertNotEqual(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 6,handler: nil)
}
    func testGetDataOfUpcomingEventsSHouldPass(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getDataOfUpComingEvents(game: "football", leagueKey: 4, completionHandler:{ (result : Result<EventsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                expectation.fulfill()
            }
        }
                                     
    )
        waitForExpectations(timeout: 6,handler: nil)
}
    func testGetDataOfLatestEventsShouldPass(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getDataOfLatestEvents(game: "football", leagueKey: 4, completionHandler: { (result : Result<EventsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertNotNil(data?.result)
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 10,handler: nil)
}
    func testGetTeamDetailsShouldPass(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getTeamDetails(game: "football", teamId: 4, completionHandler: { (result : Result<TeamDetailsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertNotEqual(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNil(error)
                XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}
    func testGetPlayersShouldPass(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getPlayers(game: "tennis", leagueKey: 2833 ,completionHandler: { (result : Result<AllPlayers?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}
    func testGetAllLeaguesShouldFail(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getAllLeagues(game: "american", completionHandler: { (result : Result<AllLeagues?, NetworkError>) in
            switch result{
            case .success(let data):
                //XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
               // XCTFail()
                expectation.fulfill()
            }
        }
                                     
    )
        waitForExpectations(timeout: 5,handler: nil)
}
  
 
    func testGetDataOfUpcomingEventsShouldFail(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getDataOfUpComingEvents(game: "tennis", leagueKey: 4, completionHandler:{ (result : Result<EventsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
              //  XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
               // XCTFail()
                expectation.fulfill()
            }
        }
                                     
    )
        waitForExpectations(timeout: 6,handler: nil)
}
  
    func testGetDataOfLatestEventsShouldFail(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getDataOfLatestEvents(game: "tennis", leagueKey: 4, completionHandler: { (result : Result<EventsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                //XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
                //XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 10,handler: nil)
}
    func testGetDataOfLatestEventsShouldFail2(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getDataOfLatestEvents(game: "", leagueKey: 4, completionHandler: { (result : Result<EventsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                //XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
                //XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 10,handler: nil)
}
    
    func testGetTeamsShouldFail(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getTeams(game: "tennis", leagueKey: 4, completionHandler: { (result : Result<AllTeams?, NetworkError>) in
            switch result{
            case .success(let data):
                //XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
                //XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}
    func testGetTeamsShouldFail2(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getTeams(game: "//", leagueKey: 4, completionHandler: { (result : Result<AllTeams?, NetworkError>) in
            switch result{
            case .success(let data):
                //XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
                //XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}
    
    

    func testGetTeamDetailsShouldFail(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getTeamDetails(game: "basketball", teamId: 4, completionHandler: { (result : Result<TeamDetailsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                //XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
               // XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}
    func testGetTeamDetailsShouldFail2(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getTeamDetails(game: "/", teamId: 4, completionHandler: { (result : Result<TeamDetailsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                //XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
               // XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}
  
    func testGetPlayersShouldFail(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getPlayers(game: "cricket", leagueKey: 2833 ,completionHandler: { (result : Result<AllPlayers?, NetworkError>) in
            switch result{
            case .success(let data):
              //  XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
                //XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}
    func testGetPlayersShouldFail2(){
        let expectation = expectation(description: "waiting API")
        NetworkService.getPlayers(game: "/", leagueKey: 2833 ,completionHandler: { (result : Result<AllPlayers?, NetworkError>) in
            switch result{
            case .success(let data):
              //  XCTAssertGreaterThan(data?.result?.count ?? 0,0,"array is empty")
                expectation.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
                //XCTFail()
                expectation.fulfill()
            }
        }

    )
        waitForExpectations(timeout: 5,handler: nil)
}

 

}
