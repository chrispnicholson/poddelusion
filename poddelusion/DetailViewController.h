//
//  DetailViewController.h
//  poddelusion
//
//  Created by Chris Nicholson on 23/10/2013.
//  Copyright (c) 2013 Chris Nicholson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (copy, nonatomic) NSString *url;

@end
