function bookRandom() {
  document.querySelectorAll(".btn-random").forEach((f) => {

    f.addEventListener("click", (event) => {
      let x = document.querySelector(".conf_modal")
      x.classList.add('shown_modal')
      setTimeout(function(){
        x.classList.remove('shown_modal')
      }, 2000);
    })
  })
}

export { bookRandom };
