using Toybox.WatchUi as Ui;

class Pace_2000mView extends Ui.SimpleDataField {
    //! Set the label of the data field here.
    function initialize() {
        label = "Pace/2000m";
    }

    //! The given info object contains all the current workout
    //! information. Calculate a value and return it in this method.
    function compute(info) {
        // See Activity.Info in the documentation for available information.
        //return info.speed;
    	return calc2KTime(info.currentSpeed);
    }
    
    function calc2KTime(speed){
    	var metersPerSecond = speed;
		var secondsPerMeter = 0;
		var secondsPer2K = 0;
		
		var resultMin = 0;
		var resultSec = 0;
		
		// check for null and divide by zero
		if (speed != null && speed != 0){
			secondsPerMeter = 1 / metersPerSecond;
			secondsPer2K 	= (secondsPerMeter * 2000).toNumber();
			
			resultMin 		= (secondsPer2K / 60).toNumber();
			resultSec 		= secondsPer2K.toNumber() % 60;
		} else {
			return "0:00";
		}
		
        return resultMin + ":" + (resultSec < 10 ? "0" + resultSec.toString() : resultSec.toString());
    }
}