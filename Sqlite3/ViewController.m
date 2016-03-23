//
//  ViewController.m
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import "ViewController.h"
#import "NJDB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NJDB openDataBase];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
