//
//  NJPersonModel.m
//  Sqlite3
//
//  Created by Mr nie on 15/7/22.
//  Copyright (c) 2015年 Mr nie. All rights reserved.
//

#import "NJPersonModel.h"

@implementation NJPersonModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

+ (NJPersonModel *)setName:(NSString *)name age:(NSInteger)age
{
    NJPersonModel *model = [[NJPersonModel alloc] init];
    model.name = name;
    model.age = age;
    return model;
}

@end
