//
//  Person.h
//  AnimationDemo
//
//  Created by JY on 15/6/30.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, SayType)
{
    SayTypeText = 0,
    SayTypeImage = 1,
    SayTypeLocation = 2,
    SayTypeVoice = 3
};



@interface Person : NSObject

@property (nonatomic,copy) NSString *personName;
@property (nonatomic,copy) NSString *personImage;

@property (nonatomic,copy) NSString *sendImage;
@property (nonatomic,copy) NSString *sendVoice;
@property (nonatomic,copy) NSString *sendLocation;
@property (nonatomic,copy) NSString *sendText;

@property (nonatomic,assign) SayType sayType;
@property (nonatomic,assign) BOOL isMe;

@end
