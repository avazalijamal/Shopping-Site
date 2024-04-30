window.addEventListener('load',function(){

    const minus=document.querySelector("#minus");
    const count=document.querySelector("#count");
    const plus=document.querySelector("#plus");
    const img=document.querySelector("#img");
    const images=document.querySelectorAll("#images img");
    const photoResize=document.querySelector("#photoResize");
    const info=document.querySelector("#info");
    const imgHidden=document.querySelector("#imgHidden");

    var ind=0;
    var zoom=5;

    img.width=250;
    img.height=300;

    photoResize.width=300;
    photoResize.height=400;

    let w=photoResize.width;
    let h=photoResize.height;

    imgHidden.width=w/zoom;
    imgHidden.height=h/zoom;


    const ctxImg=img.getContext('2d');
    const ctxHidden=imgHidden.getContext('2d');

    plus.addEventListener("click",function(){
        count.value++;
        minus.disabled=false;
    });
    minus.addEventListener("click",function(){
        if(count.value>0)count.value--;
        else minus.disabled=true;

    });

    ctxImg.drawImage(images[ind],0,0,img.width,img.height);

    for(let i=0;i<images.length;i++){

        images[i].addEventListener("click",function(){
            ind=i;
            ctxImg.drawImage(images[ind],0,0,img.width,img.height);

        });
    }

    img.addEventListener("click",function(){
        
        if(zoom<10) zoom++;

        imgHidden.width=w/zoom;
        imgHidden.height=h/zoom;

    });

    img.addEventListener("contextmenu",function(e){
        e.preventDefault();
        
        if(zoom>1) zoom--;

        imgHidden.width=w/zoom;
        imgHidden.height=h/zoom;
    });

    img.addEventListener("mouseover",function(){

        photoResize.classList.add('show');
        info.classList.remove('show');


    });

    img.addEventListener("mouseout",function(){
        photoResize.classList.remove('show');
        info.classList.add('show');

        ctxImg.clearRect(0,0,img.width,img.height);
        ctxImg.drawImage(images[0],0,0,img.width,img.height);

    });

    img.addEventListener("mousemove",function(e){
        let x=e.offsetX;
        let y=e.offsetY;

        x=x-(w/zoom/2);
        y=y-(h/zoom/2);


        ctxImg.clearRect(0,0,img.width,img.height);
        ctxImg.drawImage(images[ind],0,0,img.width,img.height);

        let ph=ctxImg.getImageData(x,y,w/zoom,h/zoom);

        ctxImg.globalAlpha=0.5;
        ctxImg.fillStyle="#777777";
        ctxImg.rect(0,0,img.width,img.height);
        ctxImg.fill();

        ctxImg.globalAlpha=1;
        ctxImg.lineWitdh=1;
        ctxImg.strokeStyle="red";
        ctxImg.strokeRect(x,y,w/zoom,h/zoom);
        ctxImg.clearRect(x,y,w/zoom,h/zoom);
        ctxImg.putImageData(ph,x,y);


        ctxHidden.putImageData(ph,0,0);
        photoResize.src=imgHidden.toDataURL('image/png');





    });

});