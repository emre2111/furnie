const eventReload = () => {
  if (window.location.pathname.includes("randomize")) {
  document.body.onkeyup = function(e){
    if(e.keyCode == 13){
      location.reload();
    }
}
}
}
export { eventReload }
