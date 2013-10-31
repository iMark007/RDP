//
//  NSObject+ViewTree.m
//  Realtime Debug Protal
//
//  Created by Feather Chan on 13-6-25.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "NSObject+ViewTree.h"

#pragma mark - NSObject -

@implementation NSObject (ViewTree)

- (NSMutableDictionary *)toDict
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:NSStringFromClass([self class]) forKey:@"className"];
    
    [dict setObject:@((int)self) forKey:@"address"];
    
    return dict;
}

- (void)fromDict:(NSDictionary *)dict
{
    
}

@end




#pragma mark - UIApplication -

@implementation UIApplication (ViewTree)

- (NSMutableDictionary *)toDict
{
    NSMutableDictionary *dict = [super toDict];
    
    [dict setObject:NSStringFromCGRect([UIScreen mainScreen].bounds) forKey:@"bounds"];
    
    // add windows list as a property
    NSMutableArray *windows = [NSMutableArray array];
    
    for (UIView *view in self.windows) {
        [windows addObject:[view toDict]];
    }
    
    [dict setObject:windows forKey:@"subviews"];
    
    return dict;
}

- (void)fromDict:(NSDictionary *)dict
{
    [super fromDict:dict];
}

@end



#pragma mark - UIWindow -

@implementation UIWindow (ViewTree)

- (NSMutableDictionary *)toDict
{
    NSMutableDictionary *dict = [super toDict];
    
    [dict setObject:@(self.keyWindow) forKey:@"keyWindow"];
    
    return dict;
}

- (void)fromDict:(NSDictionary *)dict
{
    [super fromDict:dict];
}

@end


#pragma mark - UIView -

@implementation UIView (ViewTree)

- (NSString*)colorToWeb:(UIColor*)color
{
    NSString *webColor = @"transparent";
    
    // This method only works for RGB colors
    if (color &&
        CGColorGetNumberOfComponents(color.CGColor) == 4)
    {
        // Get the red, green and blue components
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        
        // These components range from 0.0 till 1.0 and need to be converted to 0 till 255
        CGFloat red, green, blue;
        red = roundf(components[0] * 255.0);
        green = roundf(components[1] * 255.0);
        blue = roundf(components[2] * 255.0);
        
        // Convert with %02x (use 02 to always get two chars)
        webColor = [[NSString alloc]initWithFormat:@"%02x%02x%02x", (int)red, (int)green, (int)blue];
    }
    
    return webColor;
}


- (NSMutableDictionary *)toDict
{
    NSMutableDictionary *dict = [super toDict];
    
    [dict setObject:NSStringFromCGRect(self.frame) forKey:@"frame"];
    
    [dict setObject:NSStringFromCGRect(self.bounds) forKey:@"bounds"];
    
    [dict setObject:@(self.hidden) forKey:@"hidden"];
    
//    [dict setObject:@(self.opaque) forKey:@"opaque"];
    
//    [dict setObject:[self colorToWeb:self.backgroundColor] forKey:@"backgroundColor"];

    
    // add subview list as a property
    NSMutableArray *subviews = [NSMutableArray array];
    
    for (UIView *view in self.subviews) {
        
        NSDictionary *viewInfo = [view toDict];
        
        if (viewInfo) {
            [subviews addObject:[view toDict]];
        }
    }
    
    [dict setObject:subviews forKey:@"subviews"];

    return dict;
}

- (void)fromDict:(NSDictionary *)dict
{
    [super fromDict:dict];
    
    if ([dict objectForKey:@"frame"]) {
        self.frame = CGRectFromString([dict objectForKey:@"frame"]);
    }
    
    if ([dict objectForKey:@"bounds"]) {
        self.bounds = CGRectFromString([dict objectForKey:@"bounds"]);
    }
    
    if ([dict objectForKey:@"hidden"]) {
        self.hidden = [[dict objectForKey:@"hidden"] boolValue];
    }
    
    if ([dict objectForKey:@"opaque"]) {
        self.opaque = [[dict objectForKey:@"opaque"] boolValue];
    }
}

@end



#pragma mark - UILabel -

@implementation UILabel (ViewTree)

- (NSMutableDictionary *)toDict
{
    NSMutableDictionary *dict = [super toDict];
    
    if(self.text) [dict setObject:(self.text) forKey:@"text"];
    
    if(self.font.fontName) [dict setObject:(self.font.fontName) forKey:@"fontName"];
    
    if(self.font.pointSize) [dict setObject:@(self.font.pointSize) forKey:@"fontSize"];
    
    return dict;
}

- (void)fromDict:(NSDictionary *)dict
{
    [super fromDict:dict];
}

@end



#pragma mark - UIButton -

@implementation UIButton (ViewTree)

- (NSMutableDictionary *)toDict
{
    NSMutableDictionary *dict = [super toDict];
    
    if (self.currentTitle) {
        [dict setObject:([self currentTitle]) forKey:@"text"];
    }
    
    return dict;
}

- (void)fromDict:(NSDictionary *)dict
{
    [super fromDict:dict];
}

@end

