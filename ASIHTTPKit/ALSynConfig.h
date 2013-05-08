//
//  ALSynConfig.h
//  QNKit
//
//  Created by Lo Robert on 12-8-9.
//
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "WebService.h"
#import "SynConfigResponse.h"
#import "SynConfig.h"

@protocol ALSynConfigDeleget;

@interface ALSynConfig : WebService{
}

@property(nonatomic,assign,setter = setDelegate:) id<ALSynConfigDeleget> delegate;

/*!
 @method: asynchronousLogin
 @abstract:
 @discussion: 开始异步请求登录
 */

-(void)asynchronousSynConfig;

/*!
 @method: synchronousLogin
 @abstract:
 @discussion: 开始同步请求登录
 @return: LoginResponse  返回登录响应
 */
-(SynConfigResponse *)synchronousSynConfig;

@end

@protocol ALSynConfigDeleget <NSObject>
@required
- (void)requestSynConfigSuccess:(ALSynConfig *)synConfig responseObject:(SynConfigResponse *) response;
- (void)requestSynConfigFailed:(ALSynConfig *)synConfig errorCode:(NSString *) errorCode;
@end
