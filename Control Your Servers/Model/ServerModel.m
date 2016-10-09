//
//  ServerModel.m
//  Control Your Servers
//
//  Created by Aleksey on 10/9/16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import "ServerModel.h"
#import "ReachabilityService.h"

@interface ServerModel ()

@property (nonatomic, strong, readwrite) NSString *serverName;
@property (nonatomic, strong, readwrite) NSString *serverAddress;

@end

@implementation ServerModel

- (instancetype)initWithName:(NSString *)name address:(NSString *)address {
    if (self = [super init]) {
        _serverName = name;
        _serverAddress = address;
    }
    return self;
}

- (void)checkReachability {
    
}

@end
