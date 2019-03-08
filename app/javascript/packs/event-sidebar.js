function sidebar(){
  const sidebarForm = document.querySelector(".form-sidebar");

  sidebarForm.addEventListener("change", (event) => {
    sidebarForm.submit();
  });

}
sidebar();
export default sidebar;
