import {itemCount} from "./addCount";

const eventActive = () => {
  let before;
  const cards = document.querySelectorAll(".random-card");


    function handleActive(e){
      console.log(cards)
      cards.forEach(card => card.classList.remove("active-border"));
        this.classList.add("active-border");
    }
    cards.forEach(card => card.addEventListener("click", handleActive));
}

export  {eventActive};
