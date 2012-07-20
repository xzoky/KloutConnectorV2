//
//  XZKloutConnectorDelegate.h
//  KloutConnector
//
//  Created by Camille Kander, a student at SUPINFO International University.
//

// "THE BEER-WARE LICENSE" (Revision 42):
// <camille@kander.com> wrote this file. As long as you retain this notice you
// can do whatever you want with this stuff. If we meet some day, and you think
// this stuff is worth it, you can buy me a beer in return.

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
