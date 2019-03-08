function sidebarFormdate(){
  const sidebarForm = document.querySelector("#edit_booking_7");
  console.log(typeof sidebarForm)

  sidebarForm.addEventListener("change", (event) => {
  console.log("hello")

    sidebarForm.submit();
  });
}
sidebarFormdate();
export { sidebarFormdate };
