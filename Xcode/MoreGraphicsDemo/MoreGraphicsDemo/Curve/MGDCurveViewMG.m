//
//  MGDCurveViewMG.m
//  MoreGraphicsDemo
//
//  Created by Ricardo on 8/25/14.
//  Copyright (c) 2014 Idean. All rights reserved.
//

#import "MGDCurveViewMG.h"
#import "MGLHeaders.h"

@implementation MGDCurveViewMG

- (void)shadeRect:(CGRect)rect
{
    // Line
    MGLPoint* start = [MGLPoint pointWithX:CGRectGetMinX(rect) y:CGRectGetMaxY(rect)];
    MGLPoint* end = [MGLPoint pointWithX:CGRectGetMaxX(rect) y:CGRectGetMinY(rect)];
    MGLLine* line = [MGLLine lineWithStart:start end:end];
    
    // Control points
    MGLPoint* a = [MGLPoint pointWithX:CGRectGetMaxX(rect)*0.25 y:CGRectGetMaxY(rect)*0.25];
    MGLPoint* b = [MGLPoint pointWithX:CGRectGetMaxX(rect)*0.75 y:CGRectGetMaxY(rect)*0.75];
    MGLPoint* c = [MGLPoint pointWithX:CGRectGetMaxX(rect)*0.8 y:CGRectGetMaxY(rect)*0.2];
    
    // Curve
    MGLCurve* curve = [[MGLCurve alloc] initWithLine:line inFrame:rect];
    curve.segments = 100;
    curve.strokeWidth = 8.0;
    curve.strokeColor = [MGLColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    [curve bezierQuarticWithPointA:a b:b c:c];
    [curve strokeBezier];
    
    // Points
    [curve showPoints];
}

@end
