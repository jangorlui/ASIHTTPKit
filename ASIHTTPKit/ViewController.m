//
//  ViewController.m
//  ASIHTTPKit
//
//  Created by mac on 5/8/13.
//  Copyright (c) 2013 AlvinLui. All rights reserved.
//

#import "ViewController.h"
#import "ALSynConfig.h"
#import "ALLogin.h"
#import "Man.h"
#import "Manager.h"

@interface ViewController ()<ALLoginDelegete,ALSynConfigDeleget>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ALSynConfig *synConfig = [[ALSynConfig alloc] init];
    synConfig.delegate = self;
    [synConfig asynchronousSynConfig];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonTap:(id)sender {
    Man *man = [[Man alloc] initWithEmail:@"cm30461" andPassword:@"12345"];
    ALLogin *login = [[ALLogin alloc] initWithMan:man];
    [man release];
    login.delegate = self;
    [login asynchronousLogin];
}

- (void)requestSynConfigSuccess:(ALSynConfig *)synConfig responseObject:(SynConfigResponse *) response
{
    
    [[Manager instance] setArySynConfig:[response serverConfigArray]];
    
}

- (void)requestSynConfigFailed:(ALSynConfig *)synConfig errorCode:(NSString *) errorCode
{
    
}

- (void)loginSuccess:(ALLogin *)login responseObject:(LoginResponse *) loginResponse
{
    
}

- (void)loginFailed:(ALLogin *)login errorCode:(NSString *) errorCode
{
    
}

@end
