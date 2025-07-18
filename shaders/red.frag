#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float distort = 0.0;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main



void mainImage()
{
    vec2 uv = fragCoord/iResolution.xy;
    
    vec3 col = texture(iChannel0, uv).xyz;
    
    vec3 rad;
    
    vec2 offset2 = iResolution.xy/100.0 - fragCoord.xy;
    for(int i = 0; i < 20; i++){
       vec2 offset = fragCoord + offset2*smoothstep(0.,4.- length(uv*2.0-1.0)*2., float(i+1)/150.);
       rad.x += texture(iChannel0, offset/iResolution.xy).x;
       rad.y += texture(iChannel0, (offset+vec2(0.1))/iResolution.xy).y;
       rad.z += texture(iChannel0, (offset-vec2(0.1))/iResolution.xy).z;

    }
    rad /= 16.;
    
    rad = pow(rad, vec3(1.)/vec3(1.3,1.,1.3));
    //rad = pow(rad, vec3(1.)/2.2);
    fragColor = vec4(rad,1.0);
}