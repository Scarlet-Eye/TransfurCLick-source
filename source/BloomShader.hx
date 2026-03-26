import flixel.addons.display.FlxShaderMaskCamera;
import flixel.system.FlxAssets.FlxShader;

class BloomShader extends FlxShader
{
	@:glFragmentSource('
    #pragma header
    
    uniform float strength;
    
    void main()
    {
    vec2 uv = openfl_TextureCoordv;
    vec4 color = texture2D(bitmap, uv);

    float brightness = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    float bloomFactor = smoothstep(0.7, 1.0, brightness);

    vec3 bloom = color.rgb * bloomFactor * strength;

    vec3 finalColor = min(color.rgb + bloom, vec3(1.0));

    gl_FragColor = vec4(finalColor, color.a);
    }')
	public function new()
	{
		super();
	}
}
