const eventActive = () => {
  const cards = document.querySelectorAll(".random-card");
  cards.forEach(card => card.addEventListener("click", (e) => {
    removeActiveBorder(cards)
    e.currentTarget.classList.add("active-border");
  }))
}

const removeActiveBorder = (elements) => {
  elements.forEach(element => element.classList.remove("active-border"));
}

export {eventActive};
