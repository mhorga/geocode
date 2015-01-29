//
//  LookupLocation.m
//  Geocode
//
//  Created by Marius Horga on 1/29/15.
//  Copyright (c) 2015 Marius Horga. All rights reserved.
//

#import "LookupLocation.h"
#import <AFNetworking.h>

@implementation LookupLocation

+ (instancetype)sharedInstance {
    static LookupLocation *defaultInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultInstance = [[self alloc] init];
    });
    return defaultInstance;
}

- (void)setOnCompletionBlock {
    
}

- (void)getInformationForZip:(NSString *)zipCode {
    NSString *apikey = @"AIzaSyAVPN6PXhUtuyuCIS_AZTlztBix1m15EH4";
    NSString *url = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=%@", zipCode, apikey];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *city = [[[[[responseObject objectForKey:@"results"] objectAtIndex:0] objectForKey:@"address_components"] objectAtIndex:1] objectForKey:@"long_name"];
        NSString *state = [[[[[responseObject objectForKey:@"results"] objectAtIndex:0] objectForKey:@"address_components"] objectAtIndex:2] objectForKey:@"short_name"];
        self.address = [NSString stringWithFormat:@"%@, %@", city, state];
        NSLog(@"%@", self.address);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
