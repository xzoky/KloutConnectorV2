//
//  XZKloutConnectorDelegate.h
//  KloutConnector
//
//  Created by Camille Kander on 05/06/12.
//  Copyright (c) 2012 Supinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XZKloutConnectorDelegate <NSObject>

- (void)didReceiveKloutID:(NSString *)kloutID forUserWithTwitterScreenName:(NSString *)twitterScreenName;
- (void)didReceiveKloutID:(NSString *)kloutID forUserWithTwitterID:(NSString *)twitterID;
- (void)didReceiveTwitterID:(NSString *)twitterID forUserWithKloutID:(NSString *)kloutID;

- (void)didReceiveInfos:(NSDictionary *)infos forUserWithKloutID:(NSString *)kloutID;
- (void)didReceiveScore:(NSDictionary *)score forUserWithKloutID:(NSString *)kloutID;
- (void)didReceiveTopics:(NSDictionary *)topics forUserWithKloutID:(NSString *)kloutID;
- (void)didReceiveInfluence:(NSDictionary *)influence forUserWithKloutID:(NSString *)kloutID;

@end
