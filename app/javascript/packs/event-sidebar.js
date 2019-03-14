// to make user allow to click on label (click label -> click hiding submit button)

function sidebar(){
  const sidebarForm = document.querySelector(".form-sidebar");

  sidebarForm.addEventListener("change", (event) => {
   document.getElementById("hdn-submitbtn").click()
  });

}
sidebar();
export default sidebar;
