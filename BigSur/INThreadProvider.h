//
//  INThreadProvider.h
//  BigSur
//
//  Created by Ben Gotow on 4/28/14.
//  Copyright (c) 2014 Inbox. All rights reserved.
//

#import "INModelProvider.h"
#import "INNamespace.h"

@interface INThreadProvider : INModelProvider

@property (nonatomic, strong) INNamespace * namespace;

- (id)initWithNamespace:(INNamespace *)namespace;

- (void)fetchFromAPI:(ErrorBlock)callback;

@end