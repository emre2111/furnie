const eventActive = () => {
  console.log("hellooo")
  let before;
  const card = document.querySelectorAll(".random-card");

    function handleActive(e){
        console.log("hellooo")
        if(before && this === before) return;
        if(before) before.classList.remove("active-border");
        this.classList.add("active-border");
        before =  this;
    }
    card.forEach(card => card.addEventListener("click", handleActive))
}

export  {eventActive};
