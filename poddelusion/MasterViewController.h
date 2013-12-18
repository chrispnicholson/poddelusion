//
//  MasterViewController.h
//  poddelusion
//
//  Created by Chris Nicholson on 23/10/2013.
//  Copyright (c) 2013 Chris Nicholson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <NSXMLParserDelegate>
@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
