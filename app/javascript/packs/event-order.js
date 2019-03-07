function order(){
  const order_form = document.querySelector(".form-order");

  order_form.addEventListener("change", (event) => {
    order_form.submit();
  });

}

export { order };
