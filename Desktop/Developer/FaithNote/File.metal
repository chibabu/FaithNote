//
//  File.metal
//  FaithNote
//
//  Created by 차종훈 on 2017. 5. 25..
//  Copyright © 2017년 Carus. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;


-(void)setBorderIBColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

-(UIColor*)borderIBColor {
    return [UIColor colorWithCGColor:self.borderColor];
}
