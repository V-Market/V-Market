/**
 * Created by Neill on 6/6/2015.
 */

/*window.setInterval(function(){
    if(semaforo==false) {
        semaforo = true;
        key(events.shift());
        semaforo = false;
    }
},750);
document.onkeydown = function(e) {
 if(e.keyCode>=37&& e.keyCode<=40) {
 if(semaforo==false) {
 semaforo = true;
 events.push(e.keyCode);
 semaforo = false;
 }
 }
 };*/



function keyDown(e,index,divs,categories,indexC){
    var view;
    switch (e.keyCode) {
        case 37:
            if(index == 0){
                if( indexC == 0){
                    indexC = 2;
                    $(categories[0]).removeClass();
                    $(categories[0]).addClass('defaultSaleDerecha');
                    $(categories[2]).removeClass();
                    $(categories[2]).addClass('defaultEntraIzquierda');
                    view = categories[2];
                }else{
                    indexC = indexC - 1;
                    $(categories[indexC]).removeClass();
                    $(categories[indexC+1]).removeClass();
                    $(categories[indexC+1]).addClass('defaultSaleDerecha');
                    $(categories[indexC]).addClass('defaultEntraIzquierda');

                    view = categories[indexC];
                }
            }

            break;
        case 38:
            if(index !=0) {
                index = index - 1 ;
                scrollToID(divs[index], 750, divs[index+1], index+1);
            }
            if(index == 0) {
                $('.background-color').css('background-color', 'transparent');
            }
            break;
        case 39:
            if(index == 0){
                if( indexC == 2){
                    indexC = 0;
                    $(categories[2]).removeClass();
                    $(categories[2]).addClass('defaultSaleIzquierda');
                    $(categories[0]).removeClass();
                    $(categories[0]).addClass('defaultEntraDerecha');
                    view = categories[0];

                }else{
                    indexC = indexC + 1;
                    $(categories[indexC]).removeClass();
                    $(categories[indexC]).addClass('defaultEntraDerecha');
                    $(categories[indexC-1]).removeClass();
                    $(categories[indexC-1]).addClass('defaultSaleIzquierda');
                    view = categories[indexC];
                }

            }

            break;
        case 40:

            if(index != 4) {
                index = index + 1;
                scrollToID(divs[index], 750, divs[index-1], index-1);
            }
            if(index == 1) {
                $('.background-color').css('background-color', 'white');
            }


            break;
    }
    setInterval(function(){
        if(view!=null){

            for(var j=0;j<3;j++){
                if(categories[j]==view){
                    $(view).addClass('default');
                    continue;
                }
                $(categories[j]).removeClass();
                $(categories[j]).addClass('defaultHide');
            }

            view = null;
        }
    }, 1000);
}

function scrollToID(id, speed, before, index){
    var offSet = 50;
    var targetOffset = $(id).offset().top - offSet;
    $(id).css('opacity','1');
    $('html,body').animate({scrollTop:targetOffset}, speed);
}