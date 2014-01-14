//
//  DetailViewController.h
//  poddelusion
//
//  Created by Chris Nicholson on 23/10/2013.
//  Copyright (c) 2013 Chris Nicholson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) AVPlayer *audioPlayer;
@property (strong, nonatomic) IBOutlet UISlider *volumeControl;

- (IBAction)adjustVolume:(id)sender;
- (IBAction)playAudio:(id)sender;
- (IBAction)stopAudio:(id)sender;

@property (copy, nonatomic) NSString *url;

@end
