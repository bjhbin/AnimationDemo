//
//  ChatWithOtherCell.m
//  AnimationDemo
//
//  Created by JY on 15/6/30.
//  Copyright (c) 2015年 jingyoutimes. All rights reserved.
//

#import "ChatWithOtherCell.h"
#import "NSString+Size.h"

@interface ChatWithOtherCell ()
//  发送的内容
@property (nonatomic,strong) UILabel *lblContext;

//  背景图片
@property (nonatomic,strong) UIImageView *backImageView;

//  语音
@property (nonatomic,strong) UIView *voiceView;

//  地址
@property (nonatomic,strong) UIView *locationView;

//  发送图片
@property (nonatomic,strong) UIImageView *sendImageView;

@property (weak, nonatomic) IBOutlet UIImageView *chatImageView;

@end

@implementation ChatWithOtherCell

+ (CGFloat)heightWithPerson:(Person *)person
{
    CGFloat height = 0.0f;
    
    if (person.sayType == SayTypeText) {
        
        height = [person.sendText sizeWithFont:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(320, MAXFLOAT)].height;
        height += 10;
        
    } else if (person.sayType == SayTypeVoice) {
        height = 30;
    } else if (person.sayType == SayTypeImage) {
        height = 40;
    } else if (person.sayType == SayTypeLocation) {
        height = 50;
    }
    
    
    return height;
}

- (void)configWithPerson:(Person *)person
{
    
    NSURL *photourl = [NSURL URLWithString:person.personImage];
    //url请求异步
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:photourl]];
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.chatImageView.image = image;
        });
    });
    
    if (person.sayType == SayTypeImage) {
        
        [self.lblContext removeFromSuperview];
        [self.voiceView removeFromSuperview];
        [self.locationView removeFromSuperview];
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:person.sendImage]]];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.sendImageView.image = image;
                [self.contentView addSubview:self.sendImageView];
                
                
                CGRect rect = self.sendImageView.frame;
                rect.size.width  = 180;
                rect.size.height = 100;
                rect.origin.x = self.chatImageView.frame.origin.x - 180 - 10;
                rect.origin.y = self.chatImageView.frame.origin.y + 5;
                
                self.sendImageView.frame = rect;
                
                
            });
        });
        
        
    } else if (person.sayType == SayTypeLocation){
        [self.lblContext removeFromSuperview];
        [self.voiceView removeFromSuperview];
        [self.sendImageView removeFromSuperview];
        [self.contentView addSubview:self.locationView];
        
    } else if (person.sayType == SayTypeText) {
        [self.voiceView removeFromSuperview];
        [self.sendImageView removeFromSuperview];
        [self.locationView removeFromSuperview];
        
        self.lblContext.text = person.sendText;
        [self.contentView addSubview:self.lblContext];
        
        CGRect rect = self.lblContext.frame;
        self.lblContext.font = [UIFont systemFontOfSize:13];
        CGSize strSize = [person.sendText sizeWithFont:self.lblContext.font maxSize:CGSizeMake(self.chatImageView.frame.origin.x -20, MAXFLOAT)];
        rect.size.width  = strSize.width;
        rect.size.height = strSize.height;
        rect.origin.x = self.chatImageView.frame.origin.x - strSize.width - 10;
        rect.origin.y = self.chatImageView.frame.origin.y + 5;
        
        self.lblContext.frame = rect;
        
        
    } else if (person.sayType == SayTypeVoice) {
        [self.lblContext removeFromSuperview];
        [self.sendImageView removeFromSuperview];
        [self.locationView removeFromSuperview];
        
        //  绑定语音
        //        person.sendVoice
        
        [self.contentView addSubview:self.voiceView];
    }
    
    
    
}

- (UILabel *)lblContext
{
    if (!_lblContext) {
        _lblContext = [[UILabel alloc] initWithFrame:CGRectZero];
        _lblContext.lineBreakMode = NSLineBreakByCharWrapping;
        _lblContext.numberOfLines = 0;
        
    }
    return _lblContext;
}

- (UIView *)voiceView
{
    if (!_voiceView) {
        _voiceView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _voiceView;
}

- (UIImageView *)backImageView
{
    if (!_backImageView) {
        
        _backImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _backImageView;
}

- (UIView *)locationView
{
    if (!_locationView) {
        _locationView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _locationView;
}



- (UIImageView *)sendImageView
{
    if (!_sendImageView) {
        _sendImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _sendImageView;
}

@end
