//
//  SynConfigResponse.m
//  QNKit
//
//  Created by Lo Robert on 12-8-9.
//
//

#import "SynConfigResponse.h"

@implementation SynConfigResponse

@synthesize serverConfigArray;

-(id)init{
    self=[super init];
    
    if (self) {
        serverConfigArray=[[NSMutableArray alloc] init];
    }
    
    return self;
}


-(void)dealloc{
    [serverConfigArray release];
    [super dealloc];
}

@end
