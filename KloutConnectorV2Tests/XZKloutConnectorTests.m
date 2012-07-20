//
//  XZKloutConnectorTests.m
//  KloutConnectorTests
//
//  Created by Camille Kander, a student at SUPINFO International University.
//

// "THE BEER-WARE LICENSE" (Revision 42):
// <camille@kander.com> wrote this file. As long as you retain this notice you
// can do whatever you want with this stuff. If we meet some day, and you think
// this stuff is worth it, you can buy me a beer in return.

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
