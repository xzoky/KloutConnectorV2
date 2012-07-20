//
//  XZKloutConnector.h
//  KloutConnector
//
//  Created by Camille Kander, a student at SUPINFO International University.
//

// "THE BEER-WARE LICENSE" (Revision 42):
// <camille@kander.com> wrote this file. As long as you retain this notice you
// can do whatever you want with this stuff. If we meet some day, and you think
// this stuff is worth it, you can buy me a beer in return.

#import <Foundation/Foundation.h>
#import "XZKloutConnectorDelegate.h"

@interface XZKloutConnector : NSObject

@property (strong, readwrite, setter = setAPIkey:) NSString *apiKey;
@property (strong, readwrite) NSOperationQueue *operationQueue;

+ (XZKloutConnector *)sharedConnector;

- (NSDictionary *)dictionaryWithResults:(NSData *)responseData;

- (void)queryKloutIDForUserWithTwitterScreenName:(NSString *)twitterScreenName delegate:(id<XZKloutConnectorDelegate>) delegate;
- (void)queryKloutIDForUserWithTwitterID:(NSString *)twitterID delegate:(id<XZKloutConnectorDelegate>) delegate;
- (void)queryTwitterIDForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>) delegate;

- (void)queryInfosForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>) delegate;
- (void)queryScoreForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>) delegate;
- (void)queryTopicsForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>) delegate;
- (void)queryInfluenceForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>) delegate;

@end
