#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

// effect reference: http://glslsandbox.com/e#30736.1
#define antialiasing(n) n/min(iResolution.y,iResolution.x)
#define S(d,b) smoothstep(antialiasing(3.0),b,d)
#define B(p,s) max(abs(p).x-s.x,abs(p).y-s.y)

float random (vec2 p) {
    return fract(sin(dot(p.xy, vec2(12.9898,78.233)))* 43758.5453123);
}

void mainImage()
{
    vec2 p = fragCoord/iResolution.xy;
    vec2 prevP = p;
    vec3 col = texture(iChannel0, p).rgb;
    
    p*=10.;
    vec2 id = floor(p);
    vec2 gr = fract(p)-0.5;
    float rnd = random(id);
    if(rnd>=0.7){
        float s = sin((10.*iTime*rnd)+rnd);
        float d = B(gr,vec2(s,s*rnd));

        vec2 ruv = prevP+vec2(sin(rnd+iTime*1000.)*0.02,0.0);
        float r = random(id+vec2(sin(iTime*1.5)));
        float g = random(id+20.0+vec2(sin(iTime*1.5)));
        float b = random(id+37.0+vec2(sin(iTime*1.5)));

        col = mix(col,texture(iChannel0, ruv).rgb*vec3(r,g,b),S(d,0.));
    }
    //col.rg+=gr;
    
    fragColor = vec4(col,1.0);
}