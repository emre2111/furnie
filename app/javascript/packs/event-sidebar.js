function sidebar(){
  const sidebar_form = document.querySelector(".form-sidebar");

  sidebar_form.addEventListener("change", (event) => {
    sidebar_form.submit();
  });

}

export { sidebar };
