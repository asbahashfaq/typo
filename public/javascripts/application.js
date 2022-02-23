
var errors = 0;
var correct = 0;
var speed = 0;
var accuracy = 100;

var error_sound = document.querySelector('#error_sound');   

var typing_text = document.querySelector('.typing_area .todo')
var typed_text = document.querySelector('.typing_area .done') 
var keyCatcher = document.querySelector('#key_catcher') 
keyCatcher.addEventListener("keypress", function(event) {
    console.log(event.key)
    console.log(typing_text.textContent[0])
    if (event.key == typing_text.textContent[0]){
        keyCatcher.value = ''
        typing_text.textContent = typing_text.textContent.substring(1)
        typed_text.textContent += event.key
        correct ++;
    }else{
        error_sound.play();
        errors ++;
    }
});



// var firstEntryDone = 0;
// var typingarea = document.querySelector('textarea');

// var d = new Date();
// var start = d.getTime();
// var speed, characters = 0;
// var timepassed;
// var resultArea = document.querySelector(".results");
// typingarea.addEventListener('input', function (event) {

//     if (firstEntryDone == 0){
//         start = d.getTime();
//     }

//     //if ()
//    // document.querySelector(".characters").innerText = event.target.value.length;
//      d = new Date();
//     characters = event.target.value.length;
//     timepassed = d.getTime() - start ;
//     timepassed /= 1000;
//     timepassed =  Math.round(timepassed);
//     console.log(" Time passed : " + timepassed + " start time = " + start + " end time = " + d.getTime());
//     speed = characters / timepassed;
//     console.log("Characters per second : " + speed); 
//     console.log ("Average words per minute : " + speed * 60 / 5 );

//     resultArea.innerText = "Average words per minute : " + speed * 60 / 5 ;

//     firstEntryDone = 1; 

// });