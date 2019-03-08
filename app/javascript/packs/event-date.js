function sidebarFormdate(){
  const sidebarForm = document.querySelector(".date-picker-index");
  console.log(typeof sidebarForm)

  sidebarForm.addEventListener("change", (event) => {
  console.log("hello")

    sidebarForm.submit();
  });
}
sidebarFormdate();
export { sidebarFormdate };
