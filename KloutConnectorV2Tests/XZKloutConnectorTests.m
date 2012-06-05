//
//  XZKloutConnectorTests.m
//  KloutConnectorTests
//
//  Created by Camille Kander on 05/06/12.
//  Copyright (c) 2012 Supinfo. All rights reserved.
//

#import "XZKloutConnectorTests.h"
#import "XZKloutConnector.h"

@implementation XZKloutConnectorTests

@synthesize connector;

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    self.connector = [XZKloutConnector sharedConnector];
    [self.connector setAPIkey:@"KloutDeveloperAPIKey"];
}

- (void)tearDown
{
    // Tear-down code here.
    self.connector = nil;
    
    [super tearDown];
}

- (void)testThatTheConnectorIsASingleton {
    STAssertEquals(self.connector, [XZKloutConnector sharedConnector], @"There should be only one instance of XZKloutConnector.");
}

- (void)testThatTheConnectorHasAnAPIKey {
    STAssertTrue(self.connector.apiKey.length > 0, @"The Connector's API Key should be a non-empty string.");
}

- (void)testThatConnectorCanParseResultsForIdentityMethodTwitterID {
    NSDictionary *expectedResults = [[NSDictionary alloc] initWithObjectsAndKeys:@"43628626155230198", @"id", @"ks", @"network", nil];
    STAssertEqualObjects([self.connector dictionaryWithResults:[@"{\"id\": \"43628626155230198\",\"network\": \"ks\"}" dataUsingEncoding:NSUTF8StringEncoding]], expectedResults, @"The results should parse correctly.");
}

- (void)testThatTheConnectorCanParseResultsForIdentityMethodTwitterScreenName {
    NSDictionary *expectedResults = [[NSDictionary alloc] initWithObjectsAndKeys:@"43628626155230198", @"id", @"ks", @"network", nil];
    STAssertEqualObjects([self.connector dictionaryWithResults:[@"{\"id\": \"43628626155230198\",\"network\": \"ks\"}" dataUsingEncoding:NSUTF8StringEncoding]], expectedResults, @"The results should parse correctly.");
}

- (void)testThatTheConnectorCanParseResultsForIdentityMethodKloutID {
    NSDictionary *expectedResults = [[NSDictionary alloc] initWithObjectsAndKeys:@"17106368", @"id", @"tw", @"network", nil];
    STAssertEqualObjects([self.connector dictionaryWithResults:[@"{\"id\": \"17106368\",\"network\": \"tw\"}" dataUsingEncoding:NSUTF8StringEncoding]], expectedResults, @"The results should parse correctly.");
}

- (void)testThatTheConnectorReturnsNilInCaseOfInvalidJSON {
    STAssertNil([self.connector dictionaryWithResults:[@"{invalid_json}" dataUsingEncoding:NSUTF8StringEncoding]], @"The connector should return nil in case of invalid JSON input.");
}

@end
