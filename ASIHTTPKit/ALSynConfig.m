//
//  ALSynConfig.m
//  QNKit
//
//  Created by Lo Robert on 12-8-9.
//
//

#import "ALSynConfig.h"

@implementation ALSynConfig


- (id)init{
    self=[super init];
    
    if (self) {
        [self setRequestMethod:@"/other/syn_config/" shareSession:NO];
        
        [m_request setDelegate:self];
        [m_request setDidFailSelector:@selector(requestDidFailed:)];
        [m_request setDidFinishSelector:@selector(requestDidSuccess:)];
    }
    
    NSLog(@"requestHeaders:%@,requestMethod:%@",[m_request requestHeaders],[m_request url]);
    return self;
}


- (void)asynchronousSynConfig{
    [self requestStart:self.delegate];
    [m_request startAsynchronous];
}


-(SynConfigResponse *)synchronousSynConfig{
    [self requestStart:self.delegate];
    [m_request startSynchronous];
    NSString *responseStr=[m_request responseString];
    
    SynConfigResponse *response=[self jsonToResponse:responseStr];
    return response;
}


- (void)requestDidSuccess:(ASIFormDataRequest *)request{
    [super requestDidSuccess:request];
    
    NSString *responseStr=[request responseString];
    SynConfigResponse *response=[self jsonToResponse:responseStr];
    
    if([self.delegate conformsToProtocol:@protocol(ALSynConfigDeleget)])
    {
        if([self.delegate respondsToSelector:@selector(requestSynConfigSuccess:responseObject:)])
        {
            [self.delegate requestSynConfigSuccess:self responseObject:response];
        }
    }
    
}


- (void)requestDidFailed:(ASIFormDataRequest *)request{
    [super requestDidFailed:request];
    
    if ([self.delegate conformsToProtocol:@protocol(ALSynConfigDeleget)]) {
        if([self.delegate respondsToSelector:@selector(requestSynConfigFailed:errorCode:)]){
            [self.delegate requestSynConfigFailed:self errorCode:[request responseString]];
        }
    }
    
}


- (SynConfigResponse *)jsonToResponse:(NSString *) jsonString{
    NSDictionary *dict=[self jsonToDictionary:jsonString];
    
    SynConfigResponse *response=nil;
    
    if (dict!=nil&&![dict isKindOfClass:[NSNull class]]) {
        response=[[[SynConfigResponse alloc] init] autorelease];
        
        NSDictionary *data=[self checkData:dict];
        
        if (data!=nil) {
            
            int count=[data count];
            
            if (count>0) {
                NSMutableArray *array=[[NSMutableArray alloc] init];
                
                NSDictionary *config0=[data objectForKey:@"0"];
                NSDictionary *config1=[data objectForKey:@"1"];
                NSDictionary *config4=[data objectForKey:@"4"];
                NSDictionary *configx=[data objectForKey:@"x"];
                
                [array addObject:[self synConfigWidthDict:config0]];
                [array addObject:[self synConfigWidthDict:config1]];
                [array addObject:[self synConfigWidthDict:config4]];
                [array addObject:[self synConfigMemberWidthDict:configx]];
                
                [response setServerConfigArray:array];
                [array release];
            }
            
        }
        
        NSNumber  *result=[dict objectForKey:@"result"];
        [response setResult:result];
        [response setErrorMsg:[dict objectForKey:@"errmsg"]];
        [response setErrorNo:[dict objectForKey:@"errno"]];
        [response setExt:[dict objectForKey:@"ext"]];
    }
    
    return response;
}


- (SynConfig *) synConfigWidthDict:(NSDictionary *) dict{
    
    SynConfig *synConfig=[[[SynConfig alloc] init] autorelease];
    
    [synConfig setAboutURL:[dict objectForKey:@"about_url"]];
    [synConfig setChatEnable:[dict objectForKey:@"chat_enable"]];
    [synConfig setChatFlag:[dict objectForKey:@"chat_flag"]];
    [synConfig setChatName:[dict objectForKey:@"chat_name"]];
    
    [synConfig setChatPrivacyURL:[dict objectForKey:@"chat_privacy_url"]];
    [synConfig setChatVersion:[dict objectForKey:@"chat_version"]];
    [synConfig setFaqsURL:[dict objectForKey:@"faqs_url"]];
    [synConfig setFeedbackURL:[dict objectForKey:@"feedback_url"]];
    
    [synConfig setFromID:[dict objectForKey:@"from_id"]];
    [synConfig setMinBalanceForChat:[dict objectForKey:@"min_balance_for_chat"]];
    [synConfig setPrivacyURL:[dict objectForKey:@"privacy_url"]];
    [synConfig setSocketHost:[dict objectForKey:@"socket_host"]];
    [synConfig setIpaVersion:[dict objectForKey:@"ipa_version_code"]];
    
    NSString *proxyHostStr=[dict objectForKey:@"socket_proxy_host"];
    NSArray *array=[proxyHostStr componentsSeparatedByString:@","];
    
    [synConfig setSocketProxyHosts:array];
    
    NSString *country=[dict objectForKey:@"country_list"];
    if (![country isEqualToString:@""]&&country!=nil) {
        NSArray *array=[country componentsSeparatedByString:@","];
        [synConfig setCountryList:array];
    }
    
    [synConfig setSocketPort:[dict objectForKey:@"socket_port"]];
    [synConfig setTermURL:[dict objectForKey:@"term_url"]];
    [synConfig setTranslateLanguage:[dict objectForKey:@"translate_languages"]];
    
    return synConfig;
}

- (SynConfig *) synConfigMemberWidthDict:(NSDictionary *) dict{
    
    SynConfig *synConfig=[[[SynConfig alloc] init] autorelease];
    
    [synConfig setPrivacyURL:[dict objectForKey:@"privacy_url"]];
    [synConfig setTermURL:[dict objectForKey:@"term_url"]];
    [synConfig setConfigCode:[dict objectForKey:@"config_code"]];
    
    return synConfig;
}


@end
