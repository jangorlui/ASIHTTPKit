//
//  ALLogin.m
//  ASIHTTPKit
//
//  Created by mac on 5/8/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#define METHOD                     @"/member/logincheck"

#import "ALLogin.h"
#import "SBJson.h"

@implementation ALLogin

- (id)initWithMan:(Man *)man{
    self=[super init];
    
    if (self) {
        [self setRequestMethod:METHOD shareSession:NO];
        [self setRequestMan:man];
        
        [m_request addPostValue:[man email] forKey:@"email"];
        [m_request addPostValue:[man password] forKey:@"password"];
        
        [m_request setDelegate:self];
        [m_request setDidFailSelector:@selector(requestDidFailed:)];
        [m_request setDidFinishSelector:@selector(requestDidSuccess:)];
    }
    
    NSLog(@"requestHeaders:%@,requestMethod:%@",[m_request requestHeaders],[m_request url]);
    
    return self;
}

-(void)asynchronousLogin{
    [m_request startAsynchronous];
    [self requestStart:self.delegate];
}


-(LoginResponse *)synchronousLogin{
    [self requestStart:self.delegate];
    [m_request startSynchronous];
    
    NSString *responseStr=[m_request responseString];
    LoginResponse *loginResponse=[self jsonToLoginResponseObject:responseStr];
    
    return loginResponse;
}


- (void)requestDidSuccess:(ASIFormDataRequest *)request{
    [super requestDidSuccess:request];
    
    NSString *responseStr=[request responseString];
    
    LoginResponse *response=[self jsonToLoginResponseObject:responseStr];
    
    if ([[response result] intValue]==1) {
        NSMutableArray *cookies=[[request responseCookies] mutableCopy];
        NSLog(@"------cookies:%@",[cookies description]);

    }
    
    if([self.delegate conformsToProtocol:@protocol(ALLoginDelegete)]){
        
        if([self.delegate respondsToSelector:@selector(loginSuccess:responseObject:)]){
            [self.delegate loginSuccess:self responseObject:response];
        }
    }
}


- (void)requestDidFailed:(ASIFormDataRequest *)request{
    [super requestDidFailed:request];
    
    if ([self.delegate conformsToProtocol:@protocol(ALLoginDelegete)]) {
        if([self.delegate respondsToSelector:@selector(loginFailed:errorCode:)]){
            [self.delegate loginFailed:self errorCode:[request responseString]];
        }
    }
}


- (LoginResponse *)jsonToLoginResponseObject:(NSString *) jsonString{
//    NSDictionary *dict=[self jsonToDictionary:jsonString];
    
    LoginResponse *response=nil;
    
    return response;
}


-(void)dealloc{
    [_requestMan release];
    _delegate=nil;
    [super dealloc];
}

@end
