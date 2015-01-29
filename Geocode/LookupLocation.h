//
//  LookupLocation.h
//  Geocode
//
//  Created by Marius Horga on 1/29/15.
//  Copyright (c) 2015 Marius Horga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LookupLocation : NSObject

@property (strong, nonatomic)NSString *address;

+ (instancetype)sharedInstance;
- (void)setOnCompletionBlock;
- (void)getInformationForZip:(NSString *)zipCode;

@end
