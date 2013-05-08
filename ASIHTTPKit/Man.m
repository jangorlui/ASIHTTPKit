//
//  Man.m
//  ASIHTTPKit
//
//  Created by mac on 5/8/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#import "Man.h"

@implementation Man

- (id)initWithEmail:(NSString*)theEmail andPassword:(NSString*)thePassword{
    
    self=[super init];
    
    if (self) {
        _email = theEmail;
        _password = thePassword;
    }
    
    return self;
}

- (void)dealloc{
    [_email release];
    [_password release];
    [super dealloc];
}

@end
