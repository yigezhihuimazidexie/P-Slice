#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
int amount;
#define iChannel0 bitmap
#define iChannel1 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor

void main()
{
    vec2 uv = fragCoord/iResolution.xy;

    vec3 col = vec3(0, 0, 0);

    // chromatic aberration 
    amount = 0;

    float shift = 1.5 / 640.0;
    col.x = texture(iChannel0, vec2(uv.x + shift, uv.y)).x;
    col.y = texture(iChannel0, uv).y;
    col.z = texture(iChannel0, vec2(uv.x - shift, uv.y)).z;

    // vignette
    float bri = 0.9 + (1.6 * uv.x * uv.y) * (1.0 - uv.x) * (1.0 - uv.y);
    // scanlines in darker areas
    float lum = (0.2126 * col.x + 0.7152 * col.y + 0.0722 * col.z);
    bri *= 0.93 + 0.07 * lum + sin(uv.y * 3.14 * 180.0) * 0.07 * (1.0 - lum);

    col.x *= bri;
    col.y *= bri;
    col.z *= bri;

    // Output to screen
    fragColor = vec4(col.rgb + amount, .4);
}