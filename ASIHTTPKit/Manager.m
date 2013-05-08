//
//  MyManager.m
//  singleton
//
//  Created by Henry Yu on 10-11-01.
//  Copyright Sevenuc.com 2010. All rights reserved.
//

#import "Manager.h"

static Manager *sharedMyManager = nil;

@implementation Manager
@synthesize arySynConfig = _arySynConfig;

- (void)dealloc {
    [_arySynConfig release];
	[super dealloc];
}

+ (id)instance {
	if(sharedMyManager == nil)
		sharedMyManager = [[super alloc] init];
    return sharedMyManager;	
}

- (NSArray*)getSynConfig{
    return self.arySynConfig;
}

@end
