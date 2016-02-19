//
//  DetailViewController.m
//  TouchDemo
//
//  Created by chenbin on 2/18/16.
//  Copyright © 2016 TouchDemo. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (instancetype)initWithIdentifier:(NSString *)identifier
{
    self = [super init];
    if (self) {
        if ([identifier isEqualToString:@"Red"]) {
            self.view.backgroundColor = [UIColor redColor];
        } else if ([identifier isEqualToString:@"Yellow"]) {
            self.view.backgroundColor = [UIColor yellowColor];
        } else if ([identifier isEqualToString:@"Blue"]) {
            self.view.backgroundColor = [UIColor blueColor];
        }
        
        self.title = identifier;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    UIPreviewAction *actionOne = [UIPreviewAction actionWithTitle:@"Action One" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    UIPreviewAction *actionTwo = [UIPreviewAction actionWithTitle:@"Action Two" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    UIPreviewAction *actionThree = [UIPreviewAction actionWithTitle:@"Action Three" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    
    return @[actionOne, actionTwo, actionThree];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
