const result = document.querySelector('.result');

let string="";
const listBtn= document.querySelectorAll(".caculator__keyboard-btn");
listBtn.forEach((ele, index)=>{
    ele.addEventListener('click',()=>{
        let str= ele.innerHTML;
        if(index!=14) string +=str.trim();
        result.innerHTML=string;
        console.log(string)
    })
});

document.querySelector('.btn-result').addEventListener('click',()=>{
    result.innerHTML=eval(string);
    string= result.innerHTML;
})