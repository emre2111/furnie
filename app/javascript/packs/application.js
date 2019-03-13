import "bootstrap";
import "../plugins/flatpickr";
import  { order }  from "./event-order";
import  { sidebarFormdate }  from "./event-date";

import  { searchButton }  from "./event-search";

import {eventActive} from "../plugins/event_active";
import {eventReload} from "./event_reload";

import  { bookRandom }  from "./event_booking_random";

// import { addCount } from "../components/item-count";

eventReload();
eventActive();
bookRandom();
// addCount();

// To add badge
document.getElementById("itemCount").innerText = document.getElementById("itemCount").innerText;
let itemCount = parseInt(document.getElementById("itemCount").textContent) + 1;
const addCartButton = document.querySelector(".btn-to-cart");
if(addCartButton){
  addCartButton.addEventListener("click", addCount);
}

const numItem = document.getElementById("itemCount");
  if(numItem.innerText === "0"){
    numItem.style.display = 'none';
}

function addCount(e) {
  // e.preventDefault();

  // increment badge number
  function incrementValue() {
    const numItem = document.getElementById("itemCount");
    numItem.style.display = 'block';
    numItem.innerText = itemCount++;
  };
  incrementValue();
};
