//
//  Shader.fsh
//  Kettle
//
//  Created by Admin on 06.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
