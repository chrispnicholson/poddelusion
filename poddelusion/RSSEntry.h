//
//  RSSEntry.h
//  poddelusion
//
//  Created by Chris Nicholson on 23/10/2013.
//  Copyright (c) 2013 Chris Nicholson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject
{
    NSString *blogTitle;
    NSString *articleTitle;
    NSString *articleURL;
    NSDate *articleDate;
    
}

@end
