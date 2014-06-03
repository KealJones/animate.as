package {
	
	import flash.display.MovieClip;
	import fl.motion.AdjustColor;
	import flash.filters.ColorMatrixFilter;
	import flash.utils.setInterval;
	import flash.utils.setTimeout;
	import com.kealjones.anim.Animate;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.events.ComponentEvent; 
	import fl.controls.ComboBox;
	import fl.data.DataProvider; 
	import flash.text.TextFormat;
	
	
	public class animateExample extends MovieClip {
		private var comboData:Array = new Array( 
			{label:"bounce", data:"bounce"}, 
			{label:"flash", data:"flash"},
			{label:"pulse", data:"pulse"},
			{label:"shake", data:"shake"},
			{label:"swing", data:"swing"},
			{label:"bounceIn", data:"bounceIn"},
			{label:"bounceInDown", data:"bounceInDown"},
			{label:"bounceInUp", data:"bounceInUp"},
			{label:"bounceInLeft", data:"bounceInLeft"},
			{label:"bounceInRight", data:"bounceInRight"},
			{label:"fadeInDown", data:"fadeInDown"},
			{label:"fadeInUp", data:"fadeInUp"},
			{label:"fadeInLeft", data:"fadeInLeft"},
			{label:"fadeInRight", data:"fadeInRight"},
			{label:"fadeInUpBig", data:"fadeInUpBig"},
			{label:"fadeInDownBig", data:"fadeInDownBig"},
			{label:"fadeInRightBig", data:"fadeInRightBig"}
		); 
		private var selectedAnimation:String = "";
 
		private var combobox_cb:ComboBox = new ComboBox();
		private var color:AdjustColor = new AdjustColor(); //This object will hold the color properties
		private var filter:ColorMatrixFilter; //Will store the modified color filter to change the image
		private var i:Number = 0;
		private var countUp:Boolean = true;
		
		public function animateExample():void {
			// constructor code
			
			color.brightness = 0;
			color.contrast = 0;
			color.hue = 0;
			color.saturation = 0;
			grad.alpha=0;
			//trace(grad.parent.parent);
			var txtformat:TextFormat = new TextFormat(); 
    txtformat.size = 15;   //Lets just increase the size of fonts   

//Increase the main TextField's font size of your ComboBox
combobox_cb.textField.setStyle("textFormat", txtformat);

//Increase the font size of dropDownList items
combobox_cb.dropdown.setRendererStyle("textFormat", txtformat);
			Animate.to(grad,"fadeInDown");
			
			combobox_cb.dropdownWidth = 150; 
			combobox_cb.width = 150;  
			combobox_cb.height = 40;
			//combobox_cb.move(150, 50); 
			combobox_cb.setStyle("textPadding", 10); 
			combobox_cb.prompt = "Make a Choice"; 
			combobox_cb.dropdown.rowHeight = 25;

			combobox_cb.dataProvider = new DataProvider(comboData); 
			combobox_cb.addEventListener(Event.CHANGE, changeHandler); 
			combobox_cb.x=148;
			combobox_cb.y=246;
			animateBtn.addEventListener(MouseEvent.CLICK,runAnimation)
			addChild(combobox_cb); 
			setInterval(hueLoop,50);
		}
		

		public function changeHandler(event:Event):void { 
			// do something based on the selected item's value
			selectedAnimation = combobox_cb.selectedItem.data;
		}
		
		public function runAnimation(e:Event){
			Animate.to(grad,selectedAnimation);
		}
		
		private final function hueLoop(){
			
			if (i==360){
				countUp = false;
			} else if (i==-360){
				countUp = true;
			}
			
			if (countUp){i++;} else {i--;}
		
		
		
		adjustHue(i);
		}
		
		private final function adjustHue(newVal:Number):void
			{
				color.hue = newVal;
				update();
			}
			
		private final function update():void
			{
				filter = new ColorMatrixFilter(color.CalculateFinalFlatArray());
				grad.filters = [filter];
				animateBtn.filters = [filter];
			}
	}
	
}
