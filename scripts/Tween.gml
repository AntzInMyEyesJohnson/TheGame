///Tween(type,start,change,time,duration);
type = argument[0];
start = (0+argument[1]);//'(0+arg)' drastically increases speed because yyc will recognize everything as a real number immediately because of '0'
change = (0+argument[2]);
time = (0+argument[3]);
duration = (0+argument[4]);

switch (type){
    case EASESMOOTH:
        time /= duration;
        return change*(time*(3-2*time)) + start;
    break;

    case EASESMOOTHER:
        time /= duration;
        return change*time*time*(time*(time*6-15)+10) + start;
    break;
    
    // circular easing in - accelerating from zero velocity
    case EASEINCIRC:
        time /= duration;
        return -change * (sqrt(1 - time*time) - 1) + start;
    break;

    // circular easing out - decelerating to zero velocity
    case EASEOUTCIRC:
        time /= duration;
        time--;
        return change * sqrt(1 - time*time) + start;
    break;

    // circular easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTCIRC:
        time /= duration/2;
        if (time < 1) return -change/2 * (sqrt(1 - time*time) - 1) + start;
        time -= 2;
        return change/2 * (sqrt(1 - time*time) + 1) + start;
    break;
    
    //simple linear tweening - no easing, no acceleration
    case EASELINEAR:
        return change*time/duration + start;
    break;
            
    // quadratic easing in - accelerating from zero velocity
    case EASEINQUAD:
        time /= duration;
        return change*time*time + start;
    break;
            
    // quadratic easing out - decelerating to zero velocity
    case EASEOUTQUAD:
        time /= duration;
        return -change * time*(time-2) + start;
    break;

    // quadratic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTQUAD:
        time /= duration/2;
        if (time < 1) return change/2*time*time + start;
        time--;
        return -change/2 * (time*(time-2) - 1) + start;
    break;

    // cubic easing in - accelerating from zero velocity
    case EASEINCUBIC:
        time /= duration;
        return change*time*time*time + start;
    break;

    // cubic easing out - decelerating to zero velocity
    case EASEOUTCUBIC:
        time /= duration;
        time--;
        return change*(time*time*time + 1) + start;
    break;

    // cubic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTCUBIC:
        time /= duration/2;
        if (time < 1) return change/2*time*time*time + start;
        time -= 2;
        return change/2*(time*time*time + 2) + start;
    break;
        
    // quartic easing in - accelerating from zero velocity
    case EASEINQUART:
        time /= duration;
        return change*time*time*time*time + start;
    break;

    // quartic easing out - decelerating to zero velocity
    case EASEOUTQUART:
        time /= duration;
        time--;
        return -change * (time*time*time*time - 1) + start;
    break;

    // quartic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTQUART:
        time /= duration/2;
        if (time < 1) return change/2*time*time*time*time + start;
        time -= 2;
        return -change/2 * (time*time*time*time - 2) + start;
    break;

    // quintic easing in - accelerating from zero velocity
    case EASEINQUINT:
        time /= duration;
        return change*time*time*time*time*time + start;
    break;

    // quintic easing out - decelerating to zero velocity
    case EASEOUTQUINT:
        time /= duration;
        time--;
        return change*(time*time*time*time*time + 1) + start;
    break;

    // quintic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTQUINT:
        time /= duration/2;
        if (time < 1) return change/2*time*time*time*time*time + start;
        time -= 2;
        return change/2*(time*time*time*time*time + 2) + start;
    break;
        
    // sinusoidal easing in - accelerating from zero velocity
    case EASEINSINE:
        return -change * cos(time/duration * (pi/2)) + change + start;
    break;

    // sinusoidal easing out - decelerating to zero velocity
    case EASEOUTSINE:
        return change * sin(time/duration * (pi/2)) + start;
    break;

    // sinusoidal easing in/out - accelerating until halfway, then decelerating
    case EASEINOUTSINE:
        return -change/2 * (cos(pi*time/duration) - 1) + start;
    break;

    // exponential easing in - accelerating from zero velocity
    case EASEINEXPO:
        return change * power( 2, 10 * (time/duration - 1) ) + start;
    break;

    // exponential easing out - decelerating to zero velocity
    case EASEOUTEXPO:
        return change * ( -power( 2, -10 * time/duration ) + 1 ) + start;
    break;

    // exponential easing in/out - accelerating until halfway, then decelerating
    case EASEINOUTEXPO:
        time /= duration/2;
        if (time < 1) return change/2 * power( 2, 10 * (time - 1) ) + start;
        time--;
        return change/2 * ( -power( 2, -10 * time) + 2 ) + start;
    break;

    case EASEINELASTIC: 
        var s=1.70158;var p=0;var a=change;
        if (time==0){ return start;}  
        if ((time/duration) == 1){ return start+change;}  
        if (!p){ p=duration*.3;}
        if (a < abs(change)) { a=change; var s=p/4; }
        else{ var s = p/(2*pi) * arcsin(change/a); }
        return -(a*power(2,10*(time-1)) * sin( (time*duration-s)*(2*pi)/p )) + start;
    break;

    case EASEOUTELASTIC:
        var s=1.70158;var p=0;var a=change;
        if (time==0) return start;  if ((time/duration)==1) return start+change;  if (!p) p=duration*.3;
        if (a < abs(change)) { a=change; var s=p/4; }
        else var s = p/(2*pi) * arcsin(change/a);
        return a*power(2,-10*time) * sin( (time*duration-s)*(2*pi)/p ) + change + start;
    break;

    case EASEINOUTELASTIC:    
        var s=1.70158;var p=0;var a=change;
        if (time==0) return start;  if ((time/duration/2)==2) return start+change;  if (!p) p=duration*(.3*1.5);
        if (a < abs(change)) { a=change; var s=p/4; }
        else var s = p/(2*pi) * arcsin(change/a);
        if (time < 1) return -.5*(a*power(2,10*(time-1)) * sin( (time*duration-s)*(2*pi)/p )) + start;
        return a*power(2,-10*(time-1)) * sin( (time*duration-s)*(2*pi)/p )*.5 + change + start;
    break;
    
    case EASEINBOUNCE:
        var a=0;var t=duration-time;
        if ((t/duration) < (1/2.75)) {
            a = change*(7.5625*t*t);
        } else if (t < (2/2.75)) {
            a = change*(7.5625*(t-(1.5/2.75))*t + .75);
        } else if (t < (2.5/2.75)) {
            a = change*(7.5625*(t-(2.25/2.75))*t + .9375);
        } else {
            a = change*(7.5625*(t-(2.625/2.75))*t + .984375);
        }
        return change - a + start;
    break;

    case EASEOUTBOUNCE:
        if ((time/duration) < (1/2.75)) {
            return change*(7.5625*time*time) + start;
        } else if (time < (2/2.75)) {
            return change*(7.5625*(time-(1.5/2.75))*time + .75) + start;
        } else if (time < (2.5/2.75)) {
            return change*(7.5625*(time-(2.25/2.75))*time + .9375) + start;
        } else {
            return change*(7.5625*(time-(2.625/2.75))*time + .984375) + start;
        }
    break;

    case EASEINOUTBOUNCE:
        if (time < duration/2) {
            var a=0;var t=2*(duration-time);
            if ((t/duration) < (1/2.75)) {
                a = change*(7.5625*t*t);
            } else if (t < (2/2.75)) {
                a = change*(7.5625*(t-(1.5/2.75))*t + .75);
            } else if (t < (2.5/2.75)) {
                a = change*(7.5625*(t-(2.25/2.75))*t + .9375);
            } else {
                a = change*(7.5625*(t-(2.625/2.75))*t + .984375);
            }
            return change - a * .5 + start;
        } else{
            var a=0;var t=time*2-duration;
            if ((time/duration) < (1/2.75)) {
                a = change*(7.5625*time*time);
            } else if (time < (2/2.75)) {
                a = change*(7.5625*(time-(1.5/2.75))*time + .75);
            } else if (time < (2.5/2.75)) {
                a = change*(7.5625*(time-(2.25/2.75))*time + .9375);
            } else {
                a = change*(7.5625*(time-(2.625/2.75))*time + .984375);
            }
            return a * .5 + change * .5 + start;
        }
    break;
}

/*
switch (type){
    case EASESMOOTH:
        time /= (0+duration);
        return change*(time*(3-2*time)) + start;
    break;

    case EASESMOOTHER:
        time /= (0+duration);
        return change*time*time*(time*(-15+time*6)+10) + start;
    break;
    
    //simple linear tweening - no easing, no acceleration
    case EASELINEAR:
        return (0+change)*time/duration + start;
    break;
            
    // quadratic easing in - accelerating from zero velocity
    case EASEINQUAD:
        time /= (0+duration);
        return (0+change)*time*time + start;
    break;
            
    // quadratic easing out - decelerating to zero velocity
    case EASEOUTQUAD:
        time /= (0+duration);
        return -change * time*(-2+time) + start;
    break;

    // quadratic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTQUAD:
        time /= (0+duration)/2;
        if (time < 1) return (0+change)/2*time*time + start;
        time -= 1;
        return -change/2 * (time*(-2+time) - 1) + start;
    break;

    // cubic easing in - accelerating from zero velocity
    case EASEINCUBIC:
        time /= (0+duration);
        return (0+change)*time*time*time + start;
    break;

    // cubic easing out - decelerating to zero velocity
    case EASEOUTCUBIC:
        time /= (0+duration);
        time -= 1;
        return change*((0+time)*time*time + 1) + start;
    break;

    // cubic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTCUBIC:
        time /= (0+duration)/2;
        if (time < 1) return (0+change)/2*time*time*time + start;
        time -= 2;
        return change/2*((0+time)*time*time + 2) + start;
    break;
        
    // quartic easing in - accelerating from zero velocity
    case EASEINQUART:
        time /= (0+duration);
        return (0+change)*time*time*time*time + start;
    break;

    // quartic easing out - decelerating to zero velocity
    case EASEOUTQUART:
        time /= (0+duration);
        time -= 1;
        return -change * ((0+time)*time*time*time - 1) + start;
    break;

    // quartic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTQUART:
        time /= (0+duration)/2;
        if (time < 1) return (0+change)/2*time*time*time*time + start;
        time -= 2;
        return -change/2 * ((0+time)*time*time*time - 2) + start;
    break;

    // quintic easing in - accelerating from zero velocity
    case EASEINQUINT:
        time /= (0+duration);
        return (0+change)*time*time*time*time*time + start;
    break;

    // quintic easing out - decelerating to zero velocity
    case EASEOUTQUINT:
        time /= (0+duration);
        time -= 1;
        return change*((0+time)*time*time*time*time + 1) + start;
    break;

    // quintic easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTQUINT:
        time /= (0+duration)/2;
        if (time < 1) return (0+change)/2*time*time*time*time*time + start;
        time -= 2;
        return change/2*((0+time)*time*time*time*time + 2) + start;
    break;
        
    // sinusoidal easing in - accelerating from zero velocity
    case EASEINSINE:
        return -change * cos(time/duration * (pi/2)) + change + start;
    break;

    // sinusoidal easing out - decelerating to zero velocity
    case EASEOUTSINE:
        return change * sin(time/duration * (pi/2)) + start;
    break;

    // sinusoidal easing in/out - accelerating until halfway, then decelerating
    case EASEINOUTSINE:
        return -change/2 * (cos(pi*time/duration) - 1) + start;
    break;

    // exponential easing in - accelerating from zero velocity
    case EASEINEXPO:
        return change * power( 2, 10 * ((0+time)/duration - 1) ) + start;
    break;

    // exponential easing out - decelerating to zero velocity
    case EASEOUTEXPO:
        return change * ( -power( 2, -10 * time/duration ) + 1 ) + start;
    break;

    // exponential easing in/out - accelerating until halfway, then decelerating
    case EASEINOUTEXPO:
        time /= (0+duration)/2;
        if (time < 1) return change/2 * power( 2, 10 * ((0+time) - 1) ) + start;
        time -= 1;
        return change/2 * ( -power( 2, -10 * time) + 2 ) + start;
    break;
        
    // circular easing in - accelerating from zero velocity
    case EASEINCIRC:
        time /= (0+duration);
        return -change * (sqrt(1 - (0+time)*time) - 1) + start;
    break;

    // circular easing out - decelerating to zero velocity
    case EASEOUTCIRC:
        time /= (0+duration);
        time -= 1;
        return change * sqrt(1 - (0+time)*time) + start;
    break;

    // circular easing in/out - acceleration until halfway, then deceleration
    case EASEINOUTCIRC:
        time /= (0+duration)/2;
        if (time < 1) return -change/2 * (sqrt(1 - (0+time)*time) - 1) + start;
        time -= 2;
        return change/2 * (sqrt(1 - (0+time)*time) + 1) + start;
    break;  
}
*/
