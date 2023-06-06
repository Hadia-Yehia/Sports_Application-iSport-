//
//  MockNetworkServiceTests.swift
//  iSportTests
//
//  Created by Hadia Yehia on 05/06/2023.
//

import XCTest
@testable import iSport
final class MockNetworkServiceTests: XCTestCase {

    var networkService : MockNetworkService?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testGetAllLeaguesShouldPass(){
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getAllLeagues(game: "", completionHandler: {(result : Result<AllLeagues?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertNotEqual(data?.result?.count,0, "no data")
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                break
            }
            
        })
    }
    func testGetAllLeaguesShouldFail(){
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getAllLeagues(game: "", completionHandler: {(result : Result<AllLeagues?, NetworkError>) in
            switch result{
            case .success(let data):
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
                //XCTFail()
                break
            }
            
        })
    }
    func testGetTeamDetailsShouldPass(){
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getTeamDetails(game: "", teamId: 0, completionHandler: {
            (result : Result<TeamDetailsResponse?,NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertNotNil(data?.result)
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                break
            }
        })
    }
    func testGetTeamDetailsShouldFail(){
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getTeamDetails(game: "", teamId: 0, completionHandler: {
            (result : Result<TeamDetailsResponse?,NetworkError>) in
            switch result{
            case .success(let data):
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
               // XCTFail()
                break
            }
        })
    }
   
    func testGetDataOfUpcomingEventsShouldPass(){
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getDataOfUpComingEvents(game: "", leagueKey: 0, completionHandler: {(result : Result<EventsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertNotEqual(data?.result?.count,0, "no data")
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                break
            }
            
        })
    }
    func testGetDataOfUpcomingEventsShouldFail(){
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getDataOfUpComingEvents(game: "", leagueKey: 0, completionHandler: {(result : Result<EventsResponse?, NetworkError>) in
            switch result{
            case .success(let data):
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
               // XCTFail()
                break
            }
            
        })
    }

    func testAllPlayersShouldPass(){
        networkService = MockNetworkService(shouldReturnError: false)
        networkService?.getPlayers(game: "", leagueKey: 0, completionHandler: {
            (result : Result<AllPlayers?, NetworkError>) in
            switch result{
            case .success(let data):
                XCTAssertNotNil(data?.result)
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                break
            }
        })
    }
    func testAllPlayersShouldFail(){
        networkService = MockNetworkService(shouldReturnError: true)
        networkService?.getPlayers(game: "", leagueKey: 0, completionHandler: {
            (result : Result<AllPlayers?, NetworkError>) in
            switch result{
            case .success(let data):
                break
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssertNotNil(error)
              //  XCTFail()
                break
            }
        })
    }

   



}
