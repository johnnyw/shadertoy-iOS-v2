//
//  AboutViewController.m
//  shadertoy
//
//  Created by Reinder Nijhoff on 25/08/15.
//  Copyright (c) 2015 Reinder Nijhoff. All rights reserved.
//

#import "AboutViewController.h"

#import "UIImage+ResizeMagick.h"
#import "BlocksKit+UIKit.h"
#import <MessageUI/MessageUI.h>

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *logo = [[[UIImage imageNamed:@"shadertoy_title"] resizedImageByMagick:@"10000x24"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithImage:logo style:UIBarButtonItemStylePlain handler:^(id sender) {
    }];
    
    self.navigationItem.leftBarButtonItem = item;
    
    [self.aboutText setText:
     @"Shadertoy App is a fast and lightweight app, which can be used to view the shaders of http://www.shadertoy.com on your phone.\n\n"
     @"This app uses the Shadertoy.com API.\n\n"
     @"Coded by: Reinder Nijhoff.\n" ];
     
     [self.aboutText2 setText:
     @"\nThis is version 0.1 of the Shadertoy App. Not all input types of the shaders (keyboard, webcam, sound, video) are fully implemented yet. Also, the sound-pass of a shader is not evaluated.\n\n"
     @"Please let me know if you have any suggestions, comments or questions about this app:\n"
     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)initTabBarItem {
    self.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
}

- (IBAction)contactClick:(id)sender {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        [mail setSubject:@"Shadertoy App"];
        [mail setMessageBody:@"Hi,\n\nI have the following comment about your Shadertoy App:\n\n" isHTML:NO];
        [mail setToRecipients:@[@"reinder@infi.nl"]];
        [self presentViewController:mail animated:YES completion:NULL];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end