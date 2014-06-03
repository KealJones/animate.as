package com.kealjones.anim{
	
	import com.greensock.TweenNano;
	import com.greensock.easing.*;
	import flash.utils.setTimeout;
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Animate{
		
		// Private Properties:
		private static var VERSION_STRING:String = "Animate.as Initalized: ";
		private static var VERSION_NUMBER:String = "1.0.0";
		//private static var betterBounce:Function = CustomEase.create("betterBounce", [{s:0,cp:0.5605,e:0.776},{s:0.776,cp:0.9915,e:0.862},{s:0.862,cp:0.7325,e:0.868},{s:0.868,cp:1.0035,e:1}]);
		trace(VERSION_STRING + "Version - "+VERSION_NUMBER);
		
		// Main Function:
		
		public function Animate(target:Object,animType:String,callbackFunc:Function=null,callbackParams:Array=null) {
			var oldY = target.y;
			var oldX = target.x;
			
			var targetHeight = target.height;
			var targetWidth = target.width;
			
			var targetStage = target;
						while (!targetStage.hasOwnProperty("stageHeight")){
							targetStage = targetStage.parent;
						}
			var targetStageHeight = targetStage.stageHeight;
			var targetStageWidth = targetStage.stageWidth;
			
			//if( animType
						
			switch (animType)
			{
				case "bounce":
					TweenNano.to(target,.10,{y:(oldY-20),onComplete:function(){TweenNano.to(target,.75,{y:(oldY),ease:Bounce.easeOut,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});}});
				break;
				case "flash":
					TweenNano.to(target,.25,{alpha:0,onComplete:function(){TweenNano.to(target,.25,{alpha:1,onComplete:function(){TweenNano.to(target,.25,{alpha:0,onComplete:function(){TweenNano.to(target,.25,{alpha:1,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});}});}});}});
				break;
				case "pulse":
					TweenNano.to(target,.3,{scaleX:1.25,scaleY:1.25,onComplete:function(){TweenNano.to(target,.3,{scaleX:1,scaleY:1,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});}});
				break;
				case "shake":				
					TweenNano.to(target,.10,{x:oldX+10,onComplete:function(){
						TweenNano.to(target,.10,{x:oldX-10,onComplete:function(){
							TweenNano.to(target,.10,{x:oldX+10,onComplete:function(){
								TweenNano.to(target,.10,{x:oldX-10,onComplete:function(){
									TweenNano.to(target,.10,{x:oldX+10,onComplete:function(){
										TweenNano.to(target,.10,{x:oldX-10,onComplete:function(){
											TweenNano.to(target,.10,{x:oldX+10,onComplete:function(){
												TweenNano.to(target,.10,{x:oldX,onComplete:function(){
													if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
													}
												}});
											}});
										}});
									}});
								}});
							}});							
						}});							
					}});
				break;
				case "swing":
					TweenNano.to(target,.2,{rotation:15,ease:Linear.easeNone,onComplete:function(){
						TweenNano.to(target,.2,{rotation:-10,ease:Linear.easeNone,onComplete:function(){
							TweenNano.to(target,.2,{rotation:5,ease:Linear.easeNone,onComplete:function(){
								TweenNano.to(target,.2,{rotation:-2,ease:Linear.easeNone,onComplete:function(){
									TweenNano.to(target,.2,{rotation:0,ease:Linear.easeNone,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
								}});
							}});
						}});
					}});
				break;
				case "bounceIn":
					target.scaleX = 0;
					target.scaleY = 0;
					TweenNano.to(target,1,{scaleX:1,scaleY:1,ease:Bounce.easeOut,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "bounceInDown":
					target.y = -targetHeight;
					TweenNano.to(target,1,{y:oldY,ease:Bounce.easeOut,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "bounceInUp":
					target.y = targetStageHeight+targetHeight;
					//target.scaleY = 0;
					TweenNano.to(target,1,{y:oldY,ease:Bounce.easeOut,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "bounceInLeft":
					target.x = -targetWidth;
					//target.scaleY = 0;
					TweenNano.to(target,1,{x:oldX,ease:Bounce.easeOut,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "bounceInRight":
					target.x = targetStageWidth+targetWidth;
					//target.scaleY = 0;
					TweenNano.to(target,1,{x:oldX,ease:Bounce.easeOut,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "fadeInDown":
					target.alpha=0;
					target.y = oldY-(targetHeight/2);
					//target.scaleY = 0;
			
					TweenNano.to(target,1,{alpha:1,y:oldY,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "fadeInUp":
					target.alpha=0;
					target.y = oldY+(targetHeight/2);
					TweenNano.to(target,1,{alpha:1,y:oldY,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "fadeInLeft":
					target.alpha=0;
					target.x = oldX-(targetWidth/2);
					TweenNano.to(target,1,{alpha:1,x:oldX,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "fadeInRight":
					target.alpha=0;
					target.x = oldX+(targetWidth/2);
					TweenNano.to(target,1,{alpha:1,x:oldX,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "fadeInDownBig":
					target.alpha=0;
					target.y = -targetHeight;
					//target.scaleY = 0;
					//setTimeout(function(){TweenNano.to(target,.5,{alpha:1})},500);
					TweenNano.to(target,1,{alpha:1,y:oldY,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "fadeInUpBig":
					target.alpha=0;
					target.y = targetStageHeight+targetHeight;
					//target.scaleY = 0;
					//setTimeout(function(){TweenNano.to(target,.5,{alpha:1})},500);
					TweenNano.to(target,1,{alpha:1,y:oldY,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
				case "fadeInRightBig":
					target.alpha=0;
					target.x = targetStageWidth+targetWidth;
					//target.scaleY = 0;
					TweenNano.to(target,1,{alpha:1,x:oldX,onComplete:function(){
														if (callbackFunc !=null){												
														callbackFunc.apply(null, callbackParams);
														}
													}});
				break;
			}
			
		}
		
		public static function to(target:Object, animType:String,callbackFunc:Function=null,callbackParams:Array=null):Animate {
			return new Animate(target, animType, callbackFunc, callbackParams);
		}
		
	}
	
}