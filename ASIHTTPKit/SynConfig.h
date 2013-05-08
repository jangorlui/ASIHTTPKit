//
//  SynConfig.h
//  QNKit
//
//  Created by Lo Robert on 12-8-9.
//
//

#import <Foundation/Foundation.h>

@interface SynConfig : NSObject

@property(nonatomic,retain)NSString *socketHost;
@property(nonatomic,retain)NSNumber *socketPort;
@property(nonatomic,retain)NSNumber *chatEnable;
@property(nonatomic,retain)NSString *chatFlag;
@property(nonatomic,retain)NSString *chatName;
@property(nonatomic,retain)NSString *chatVersion;
@property(nonatomic,retain)NSNumber *minBalanceForChat;
@property(nonatomic,retain)NSString *translateLanguage;
@property(nonatomic,retain)NSString *termURL;
@property(nonatomic,retain)NSString *privacyURL;
@property(nonatomic,retain)NSString *chatPrivacyURL;
@property(nonatomic,retain)NSString *aboutURL;
@property(nonatomic,retain)NSString *faqsURL;
@property(nonatomic,retain)NSString *feedbackURL;
@property(nonatomic,retain)NSString *fromID;
@property(nonatomic,retain)NSArray *countryList;
@property(nonatomic,retain)NSString *ipaVersion;
@property(nonatomic,retain)NSArray *socketProxyHosts;
@property(nonatomic,retain)NSString *configCode;

@end
