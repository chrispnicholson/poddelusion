//
//  DetailViewController.m
//  poddelusion
//
//  Created by Chris Nicholson on 23/10/2013.
//  Copyright (c) 2013 Chris Nicholson. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"URL is %@", self.url);
    NSURL *audiourl = [NSURL URLWithString:self.url];
    
    NSError *error;
    _audioPlayer = [[AVPlayer alloc] initWithURL:audiourl];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[_audioPlayer currentItem]];
    [_audioPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];

    if (error)
    {
        NSLog(@"Error in audio player: %@",
              [error localizedDescription]);
    }
    else
    {
        [_audioPlayer play];
    }
        
}

- (void)updateProgress:(NSNotification *)notification
{
    // code for showing progress
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _audioPlayer && [keyPath isEqualToString:@"status"] ) {
        if (_audioPlayer.status == AVPlayerStatusFailed) {
            NSLog(@"AVPlayer failed");
        } else if (_audioPlayer.status == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayer status ready to play");
        } else if (_audioPlayer.status == AVPlayerStatusUnknown) {
            NSLog(@"AVPlayer unknown");
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

- (IBAction)adjustVolume:(id)sender
{
    if (_audioPlayer != nil) {
        _audioPlayer.volume = _volumeControl.value;
    }
}
- (IBAction)playAudio:(id)sender
{
    [_audioPlayer play];
}

- (IBAction)stopAudio:(id)sender
{
    [_audioPlayer pause];
}

- (void) playerItemDidReachEnd:(NSNotification *)notification
{
    // clean up code after audio ends
}

@end
