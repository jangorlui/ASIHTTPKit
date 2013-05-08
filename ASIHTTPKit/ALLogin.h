//
//  ALLogin.h
//  ASIHTTPKit
//
//  Created by mac on 5/8/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#import "WebService.h"
#import "Man.h"
#import "LoginResponse.h"

@protocol ALLoginDelegete;

@interface ALLogin :WebService{
}

@property(assign,nonatomic,setter=setDelegate:)id<ALLoginDelegete> delegate;
@property(nonatomic,retain)Man *requestMan;

/*!
 @method: initWithMan:man
 @abstract:
 @discussion: 初始化登录请求
 @param: man 男士
 @return: ALLogin
 */

-(id)initWithMan:(Man *)man;

/*!
 @method: asynchronousLogin
 @abstract:
 @discussion: 开始异步请求登录
 */

-(void)asynchronousLogin;

/*!
 @method: synchronousLogin
 @abstract:
 @discussion: 开始同步请求登录
 @return: LoginResponse  返回登录响应
 */
-(LoginResponse *)synchronousLogin;

@end

@protocol ALLoginDelegete <NSObject>
@required
- (void)loginSuccess:(ALLogin *)login responseObject:(LoginResponse *) loginResponse;
- (void)loginFailed:(ALLogin *)login errorCode:(NSString *) errorCode;
@end
