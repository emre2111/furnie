function sidebarFormdate(){

  const sidebarForm = document.querySelector(".date-picker-index");
  console.log(typeof sidebarForm)
  if(sidebarForm){
    sidebarForm.addEventListener("change", (event) => {


    sidebarForm.submit();
  });
  }

}
sidebarFormdate();
export { sidebarFormdate };
