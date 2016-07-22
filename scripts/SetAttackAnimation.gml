///SetAttackAnimation(current_state,animation1,animation2);
var sprite = argument[1];
if (argument[0] == stateATTACK ){
    if (sprite_index != argument[2]){
        sprite = argument[2];
    } 
}

return sprite;
