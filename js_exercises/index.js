const result = document.querySelector('.result');

let string="";
const listBtn= document.querySelectorAll(".caculator__keyboard-btn");
listBtn.forEach((ele, index)=>{
    ele.addEventListener('click',()=>{
        let str= ele.innerHTML;
        if(index!=14) 
        {
            string +=str.trim();
            result.innerHTML=string;
        }
        else{
            
            let value = eval(string);
            if (typeof(value) != Number) string = "0.0";
            console.log(typeof(value),typeof(value) != Number)
            result.innerHTML=value;
            string= result.innerHTML;
        }
       

    })
});

