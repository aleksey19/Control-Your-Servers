//
//  ServerModel.h
//  Control Your Servers
//
//  Created by Aleksey on 10/9/16.
//  Copyright © 2016 Aleksey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerModel : NSObject

@property (nonatomic, strong, readonly) NSString *serverName;
@property (nonatomic, strong, readonly) NSString *serverAddress;

- (instancetype)initWithName:(NSString *)name address:(NSString *)address;
- (void)checkReachability;

@end
