//
//  INInboxNavTitleView.m
//  BigSur
//
//  Created by Ben Gotow on 5/13/14.
//  Copyright (c) 2014 Inbox. All rights reserved.
//

#import "INInboxNavTitleView.h"
#import "UIView+FrameAdditions.h"

@implementation INInboxNavTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 0, 0, 30)];
        [_titleLabel setFont: [[UINavigationBar appearance] titleTextAttributes][NSFontAttributeName]];
        [_titleLabel setTextColor: [[UINavigationBar appearance] titleTextAttributes][NSForegroundColorAttributeName]];
        _titleUnreadLabel = [[UILabel alloc] initWithFrame: CGRectMake(0, 6, 0, 20)];
        [_titleUnreadLabel setFont: [UIFont boldSystemFontOfSize: 12]];
        [_titleUnreadLabel setTextColor: [_titleLabel textColor]];
        [_titleUnreadLabel setTextAlignment: NSTextAlignmentCenter];
        [_titleUnreadLabel setBackgroundColor: [UIColor whiteColor]];

        [self addSubview: _titleLabel];
        [self addSubview: _titleUnreadLabel];
    }
    return self;
}

- (void)setTitle:(NSString*)title andUnreadCount:(long)count
{
    float x = 0;
    
    [_titleLabel setText: title];
    [_titleLabel setFrameWidth: [_titleLabel.text sizeWithAttributes: @{NSFontAttributeName: [_titleLabel font]}].width + 6];
    x += [_titleLabel frame].size.width;
    
    if (count == NSNotFound) {
        [_titleUnreadLabel setFrameWidth: 0];
    } else {
        [_titleUnreadLabel setText: [NSString stringWithFormat: @"%ld", count]];
        [_titleUnreadLabel setFrameWidth: [_titleUnreadLabel.text sizeWithAttributes: @{NSFontAttributeName: [_titleUnreadLabel font]}].width + 6];
        [_titleUnreadLabel setFrameX: x];
        x += [_titleUnreadLabel frame].size.width;
    }
    [self setBounds:CGRectMake(0, 0, x, 30)];
}


@end