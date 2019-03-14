// click x and selections to be shown

function searchButton() {
  document.querySelectorAll(".add-button").forEach((button) => {
    button.addEventListener("click", e => {
      button.parentNode.nextElementSibling.classList.toggle("select_show")
      button.classList.toggle("btn_rotated")
    });
  })
}
searchButton();

export { searchButton };
