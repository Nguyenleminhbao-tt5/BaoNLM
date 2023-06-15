//function: change background

const container= document.querySelector(".conTainer");
let index= 0;
setInterval(()=>{
    index++;

   
    switch(index){
        case 0: 
            container.style.backgroundImage= "url('https://dohz8k90z3boq.cloudfront.net/images/2023/5/25/BSB_B1G_Tournament_G8_vs_Maryland-SB_2827_WVLd5.jpg?width=1416&height=797&mode=crop&scale=both&format=jpg&quality=80')";
            container.style.animation="swing 1s";
            break;
        case 1: 
            container.style.backgroundImage= "url('https://www.sciencenews.org/wp-content/uploads/2023/04/040623_di_climatebaseball_feat.jpg')";
            container.style.animation="wobble 1s";
            break;
        case 2: 
            container.style.backgroundImage= "url('https://img.mlbstatic.com/mlb-images/image/upload/t_16x9/t_w1024/mlb/lxhh7c4duzlh4qtmhain')";
            container.style.animation="jello 1s";
            break;
        case 3: 
            container.style.backgroundImage= "url('https://dxbhsrqyrr690.cloudfront.net/sidearm.nextgen.sites/usdtoreros.com/images/2023/2/27/ANGELO_WS_227.png')";
            container.style.animation="bounceIn 1s";
            break;
    }
    if (index==3) index=-1;
},10000)


// function: change time


const listTime = document.querySelectorAll('.calendar-list__item-num')
console.log(listTime)

setInterval(()=>{
    const date = new Date()

    let hour =  date.getHours() >=10 ? `${date.getHours()}` : `0${date.getHours()}`
    let minute = date.getMinutes() >=10? `${date.getMinutes()}` : `0${date.getMinutes()}`
    let second = date.getSeconds() >=10? `${date.getSeconds()}` : `0${date.getSeconds()}`
    listTime[1].innerText = hour
    listTime[2].innerText = minute
    listTime[3].innerText = second
 
},1000)

// function: show content




function showContent()
{
    const check =document.getElementById('check');
    const chevronRight = document.querySelector('.sideBar__icon-right')
    const chevronLeft = document.querySelector('.sideBar__icon-left')
    if(!check.checked)
    {
        document.querySelector('.content').style.display='block';
        chevronRight.style.display='none';
        chevronLeft.style.display='block';
    }
    else 
    {
        document.querySelector('.content').style.display='none';
        chevronRight.style.display='block';
        chevronLeft.style.display='none';
    }
}
document.querySelector('.sideBar').addEventListener('click',()=>showContent())

