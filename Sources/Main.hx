package;

import kha.Scheduler;
import kha.System;

class Main {
	public static function main() {
		System.init({title: "Live Game", width: 800, height:600}, initialized);
	}
	
	private static function initialized(): Void {
		var game = new LiveGame();
		System.notifyOnRender(game.render);
		Scheduler.addTimeTask(game.update, 0, 1 / 60);
	}
}
