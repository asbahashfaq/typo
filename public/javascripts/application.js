var errors = 0;
var correct = 0;


var typing_text = document.querySelector('.typing_area .todo')
var typed_text = document.querySelector('.typing_area .done') 
var keyCatcher = document.querySelector('.typing_area textarea') 
keyCatcher.addEventListener("keypress", function(event) {
    console.log(event.key)
    console.log(typing_text.textContent[0])
    if (event.key == typing_text.textContent[0]){
        typing_text.textContent = typing_text.textContent.substring(1)
        typed_text.textContent += event.key
        correct ++;
    }else{
        errors ++;
    }
});