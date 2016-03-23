//
//  NJPersonModel.h
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJPersonModel : NSObject

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, copy) NSString *name;

+ (NJPersonModel *)setName:(NSString *)name age:(NSInteger)age;

@end



