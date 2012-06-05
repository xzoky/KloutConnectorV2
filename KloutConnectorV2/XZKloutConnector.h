//
//  XZKloutConnector.h
//  KloutConnector
//
//  Created by Camille Kander on 05/06/12.
//  Copyright (c) 2012 Supinfo. All rights reserved.
//

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
