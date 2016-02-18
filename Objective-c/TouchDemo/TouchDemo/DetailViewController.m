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
        if ([identifier isEqualToString:@"1"]) {
            self.view.backgroundColor = [UIColor redColor];
        } else if ([identifier isEqualToString:@"2"]) {
            self.view.backgroundColor = [UIColor yellowColor];
        } else if ([identifier isEqualToString:@"3"]) {
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
