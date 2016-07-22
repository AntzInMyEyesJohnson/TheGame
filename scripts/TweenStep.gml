#define TweenStep
/// TweenStep(tween,amount)
/*
    @tween      tween id
    @amount     relative amount/direction to step (1.0 = forward | -1.0 = backward)
    
    RETURN:
        na
        
    INFO:
        Steps a tween forward or backward by a given amount.
        The direction can be a decimal (floating point) value.
        
        Using 1.0 or -1.0 will step a tween 1 step in the indicated direction.
        Lesser values, such as 0.5, will step the tween half a step foward.
        Greater values, such as 2.0, will step a tween 2 steps forward.
*/

var _t = TGMS_FetchTween(argument0);
if (is_undefined(_t)) return 0;
    
// Cache shared tweener
var _sharedTweener = SharedTweener();
// Cache time scales
var _systemTimeScales = _sharedTweener.timeScales;

if (_t[TWEEN.STATE] != TWEEN_STATE.STOPPED && _sharedTweener.timeScale != 0)
{
    var _keepPaused = _t[TWEEN.STATE] == TWEEN_STATE.PAUSED;
    
    // IF tween instance exists AND delay is NOT destroyed
    if (_t[TWEEN.DELAY] > 0)
    { 
        // Decrement delay timer
        _t[@ TWEEN.DELAY] -= argument1 * _systemTimeScales[_t[TWEEN.DELTA]];
        
        // IF the delay timer has expired
        if (_t[TWEEN.DELAY] <= 0)
        {
            // Indicate that delay should be removed from delay list
            _t[@ TWEEN.DELAY] = -1; 
            // Execute FINISH DELAY event
            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_FINISH_DELAY);                    
            // Update property with start value
            script_execute(_t[TWEEN.PROPERTY], _t[TWEEN.START], _t[TWEEN.DATA], _t[TWEEN.TARGET]);
            // Execute PLAY event callbacks
            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_PLAY);
            
            if (_keepPaused) { _t[@ TWEEN.STATE] = TWEEN_STATE.PAUSED; }
        }
        else
        {
            if (_keepPaused) { _t[@ TWEEN.STATE] = TWEEN_STATE.PAUSED; }
            return 0;
        }
    }
                
    // Get updated time -- [DELTA] boolean selects between step/delta time scale
    var _time = _t[TWEEN.TIME] + argument1 * (_t[TWEEN.TIME_SCALE] * _systemTimeScales[_t[TWEEN.DELTA]]);
    
    // Cache PROPERTY and DURATION
    var _property = _t[TWEEN.PROPERTY];
    var _duration = _t[TWEEN.DURATION];
    
    // IF tween is within start/destination
    if (_time > 0 && _time < _duration)
    {
        // Assign updated time
        _t[@ TWEEN.TIME] = _time;
        // Update tweened property with eased value
        if (_property != null__) script_execute(_property, script_execute(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _duration), _t[TWEEN.DATA], _t[TWEEN.TARGET]);    
    }
    else // Tween has reached start or destination
    if (_t[TWEEN.TIME_SCALE] != 0) // Make sure time scale isn't "paused"
    {
        // Update tween based on its play mode -- Could put overflow wait time in here????
        switch(_t[TWEEN.MODE])
        {
        case TWEEN_MODE_ONCE:
            _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;  // Set tween's state as STOPPED
            _t[@ TWEEN.TIME] = _duration*(_time > 0); // Update tween's time
            
            // Update property
            if (_property != null__) script_execute(_property, _t[TWEEN.START] + _t[TWEEN.CHANGE]*(_time > 0), _t[TWEEN.DATA], _t[TWEEN.TARGET]);
             
            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_FINISH); // Execute FINISH event
            if (_t[TWEEN.DESTROY]) TweenDestroy(_t);              // Destroy tween if temporary
        break;
        
        case TWEEN_MODE_BOUNCE:
            if (_time > 0)
            {
                _time = 2*_duration - _time;        // Update local raw time
                _t[@ TWEEN.TIME] = _time;           // Update tween with local raw time
                _time = clamp(_time, 0, _duration); // Clamp local raw time
                
                // Update property
                if (_property != null__) script_execute(_property, script_execute(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _duration), _t[TWEEN.DATA], _t[TWEEN.TARGET]);
                
                _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];           // Reverse direction
                _t[@ TWEEN.TIME_SCALE] = -_t[TWEEN.TIME_SCALE];         // Invert time scale
                TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_CONTINUE); // Execute BOUNCE event
            }
            else
            {
                // Update tween's time
                _t[@ TWEEN.TIME] = 0;
                
                // Update property
                if (_property != null__) script_execute(_property, _t[TWEEN.START], _t[TWEEN.DATA], _t[TWEEN.TARGET]);
                
                _t[@ TWEEN.STATE] = TWEEN_STATE.STOPPED;              // Set tween state as STOPPED
                TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_FINISH); // Execute FINISH event
                if (_t[TWEEN.DESTROY]) TweenDestroy(_t);              // Destroy tween if temporary
            }
        break;
        
        case TWEEN_MODE_PATROL:
            // Update local time with epsilon compensation
            if (_time > 0) { _time = 2*_duration - _time; }
            else           { _time = -_time; }
            
            _t[@ TWEEN.TIME] = _time;           // Update with raw time value
            _time = clamp(_time, 0, _duration); // Clamp local time

            // Update property
            if (_property != null__) script_execute(_property, script_execute(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _duration), _t[TWEEN.DATA], _t[TWEEN.TARGET]); 
            
            _t[@ TWEEN.DIRECTION] = -_t[TWEEN.DIRECTION];           // Reverse tween direction
            _t[@ TWEEN.TIME_SCALE] = -_t[TWEEN.TIME_SCALE];         // Invert time scale
            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_CONTINUE); // Execute BOUNCE event
        break;
        
        case TWEEN_MODE_LOOP:
            // Update local raw time
            if (_time > 0) { _time = _time - _duration; }
            else           { _time = _time + _duration; }
            
            _t[@ TWEEN.TIME] = _time;           // Update tween with local raw time
            _time = clamp(_time, 0, _duration); // Clamp local raw time   
            
            // Update property
            if (_property != null__) script_execute(_property, script_execute(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _duration), _t[TWEEN.DATA], _t[TWEEN.TARGET]);
            // Execute LOOP event
            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_CONTINUE);
        break;
        
        case TWEEN_MODE_REPEAT:
            // Update local time and tween's starting location
            if (_time > 0)
            {
                _time = _time - _duration;
                _t[@ TWEEN.START] = _t[TWEEN.START] + _t[TWEEN.CHANGE];
            }
            else
            {
                _time = _time + _duration;
                _t[@ TWEEN.START] = _t[TWEEN.START] - _t[TWEEN.CHANGE];
            }
            
            _t[@ TWEEN.TIME] = _time;           // Update tween with raw local time
            _time = clamp(_time, 0, _duration); // Clamp local raw time
            
            // Update property
            if (_property != null__) script_execute(_property, script_execute(_t[TWEEN.EASE], _time, _t[TWEEN.START], _t[TWEEN.CHANGE], _duration), _t[TWEEN.DATA], _t[TWEEN.TARGET]);
            // Execute LOOP event
            TGMS_ExecuteEvent(_t[TWEEN.EVENTS], TWEEN_EV_CONTINUE);
        break;
        
        default:
            show_error("Invalid Tween Play Mode! --> Reverting to TWEEN_MODE_ONCE", false);
            TweenSetMode(_t, TWEEN_MODE_ONCE);
        }
    }
    
    if (_keepPaused) { _t[@ TWEEN.STATE] = TWEEN_STATE.PAUSED; }
}

#define TweenStepAll
/// TweenStepAll(direction,deactivated)

TweensExecute(TWEENS_ALL, 0, argument1, TweenStep, argument0);

#define TweenStepGroup
/// TweenStepGroup(group,direction,deactivated)

TweensExecute(TWEENS_GROUP, argument0, argument2, TweenStep, argument1);


#define TweenStepTarget
/// TweenStepTarget(target,direction,deactivated)

TweensExecute(TWEENS_TARGET, argument0, argument2, TweenStep, argument1);


