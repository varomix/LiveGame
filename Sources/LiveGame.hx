package;

import kha.System;
import kha.Scaler;
import kha.Image;
import kha.Color;
import kha.Font;
import kha.Assets;
import kha.Framebuffer;

class LiveGame {

	private var initialized:Bool = false;
	private var font:Font;
	private var xPos:Float = 0.0;
	private var grumpyCat:Image;

	private var backbuffer:Image;

	public function new() {
		backbuffer = Image.createRenderTarget(800, 600);

		Assets.loadFont("RobotoMonoLight", onFontLoad);
		Assets.loadImage("grumpy_cat_nope", onImageLoaded);
	}

	private function onFontLoad(font:Font):Void {
		this.font = font;
		checkLoaded();
	}

	private function onImageLoaded(image:Image):Void {
		grumpyCat = image;
		checkLoaded();
	}

	private inline function checkLoaded():Void {
		if(font != null && grumpyCat != null)
		{
			initialized = true;
		}

	}

	public function render(framebuffer: Framebuffer): Void {
		if(!initialized)
		{
			return;
		}

		var g = backbuffer.g2;
		g.begin();
		g.drawImage(grumpyCat, 0,0);
		g.end();

		g = framebuffer.g2;
		g.begin();

		Scaler.scale(backbuffer, framebuffer, System.screenRotation);

		g.font = font;
		g.fontSize = 32;
		g.color = Color.Black;
		g.drawString("Hello World", xPos, 0);

		g.end();

		xPos++;

		if(xPos == 800)
		{
			xPos = 0;
		}

	}
	
	public function update(): Void {

	}
}
