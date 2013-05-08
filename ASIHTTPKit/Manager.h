//
//  MyManager.h
//  singleton
//
//  Created by Henry Yu on 10-11-01.
//  Copyright Sevenuc.com 2010. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject {  
}
@property(nonatomic, strong) NSArray *arySynConfig;
+ (id)instance;
- (NSArray*)getSynConfig;
@end
