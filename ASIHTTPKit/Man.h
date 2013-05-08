//
//  Man.h
//  ASIHTTPKit
//
//  Created by mac on 5/8/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Man : NSObject
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *password;

- (id)initWithEmail:(NSString*)theEmail andPassword:(NSString*)thePassword;

@end
