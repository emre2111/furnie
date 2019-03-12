function sidebar(){
  const sidebarForm = document.querySelector(".form-sidebar");

  sidebarForm.addEventListener("change", (event) => {
   document.getElementById("hdn-submitbtn").click()
  });

}
sidebar();
export default sidebar;
