//
//  Response.h
//  ASIHTTPKit
//
//  Created by mac on 5/8/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject
@property(nonatomic,copy)NSString *errorMsg;
/** 错误编号*/
@property(nonatomic,copy)NSString *errorNo;
/** 未知*/
@property(nonatomic,copy)NSString *ext;
/** 返回的结果，一般为:1或0(1为成功，0为失败)*/
@property(nonatomic,retain)NSNumber *result;
@end
