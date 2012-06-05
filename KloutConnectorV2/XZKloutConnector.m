//
//  XZKloutConnector.m
//  KloutConnector
//
//  Created by Camille Kander on 05/06/12.
//  Copyright (c) 2012 Supinfo. All rights reserved.
//

#import "XZKloutConnector.h"

@implementation XZKloutConnector

@synthesize apiKey, operationQueue;

#pragma mark - Lifecycle

+ (XZKloutConnector *)sharedConnector {
    static XZKloutConnector *sharedConnector = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConnector = [[XZKloutConnector alloc] init];
        sharedConnector.operationQueue = [[NSOperationQueue alloc] init];
    });
    return sharedConnector;
}

- (NSDictionary *)dictionaryWithResults:(NSData *)responseData {
    NSError *error = nil;
    return [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
}

- (void)queryKloutIDForUserWithTwitterScreenName:(NSString *)twitterScreenName delegate:(id<XZKloutConnectorDelegate>)delegate {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.klout.com/v2/identity.json/twitter?screenName=%@&key=%@", twitterScreenName, self.apiKey]];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *results = [self dictionaryWithResults:data];
        NSLog(@"Response for twitter screen name \"@%@\":\n%@", twitterScreenName, results);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [delegate didReceiveKloutID:[results objectForKey:@"id"] forUserWithTwitterScreenName:twitterScreenName];
        });
    }];
}

- (void)queryKloutIDForUserWithTwitterID:(NSString *)twitterID delegate:(id<XZKloutConnectorDelegate>) delegate {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.klout.com/v2/identity.json/tw/%@?key=%@", twitterID, self.apiKey]];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *results = [self dictionaryWithResults:data];
        NSLog(@"Response for Twitter ID \"%@\":\n%@", twitterID, [self dictionaryWithResults:data]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [delegate didReceiveKloutID:[results objectForKey:@"id"] forUserWithTwitterID:twitterID];
        });
    }];
}

- (void)queryTwitterIDForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>) delegate {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.klout.com/v2/identity.json/klout/%@/tw?key=%@", kloutID, self.apiKey]];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *results = [self dictionaryWithResults:data];
        NSLog(@"Response for Klout ID \"%@\":\n%@", kloutID, [self dictionaryWithResults:data]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [delegate didReceiveTwitterID:[results objectForKey:@"id"] forUserWithKloutID:kloutID];
        });
    }];
}

- (void)queryInfosForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>)delegate {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.klout.com/v2/user.json/%@?key=%@", kloutID, self.apiKey]];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *results = [self dictionaryWithResults:data];
        NSLog(@"User infos for Klout ID \"%@\":\n%@", kloutID, [self dictionaryWithResults:data]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [delegate didReceiveInfos:results forUserWithKloutID:kloutID];
        });
    }];
}

- (void)queryScoreForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>)delegate {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.klout.com/v2/user.json/%@/score?key=%@", kloutID, self.apiKey]];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *results = [self dictionaryWithResults:data];
        NSLog(@"User score for Klout ID \"%@\":\n%@", kloutID, [self dictionaryWithResults:data]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [delegate didReceiveScore:results forUserWithKloutID:kloutID];
        });
    }];
}

- (void)queryTopicsForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>)delegate {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.klout.com/v2/user.json/%@/topics?key=%@", kloutID, self.apiKey]];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *results = [self dictionaryWithResults:data];
        NSLog(@"User topics for Klout ID \"%@\":\n%@", kloutID, [self dictionaryWithResults:data]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [delegate didReceiveTopics:results forUserWithKloutID:kloutID];
        });
    }];
}

- (void)queryInfluenceForUserWithKloutID:(NSString *)kloutID delegate:(id<XZKloutConnectorDelegate>)delegate {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.klout.com/v2/user.json/%@/influence?key=%@", kloutID, self.apiKey]];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        NSDictionary *results = [self dictionaryWithResults:data];
        NSLog(@"User influence for Klout ID \"%@\":\n%@", kloutID, [self dictionaryWithResults:data]);
        dispatch_sync(dispatch_get_main_queue(), ^{
            [delegate didReceiveInfluence:results forUserWithKloutID:kloutID];
        });
    }];
}

@end
