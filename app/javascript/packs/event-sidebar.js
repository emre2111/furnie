function sidebar(){
  const form = document.querySelector(".form-sidebar");

  form.addEventListener("change", (event) => {
    form.submit();
  });

}

export { sidebar };
