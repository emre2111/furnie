function itemCount (){
  const numItem = document.getElementById("itemCount");
  if(numItem.innerText === "0"){
    numItem.style.display = 'none';
  };

  document.getElementById("itemCount").innerText = document.getElementById("itemCount").innerText;
  let itemCount = parseInt(document.getElementById("itemCount").textContent) + 1;
  const addCartButtons = document.querySelectorAll(".btn-to-cart");

  function handleCart(){
    function incrementValue() {
      const numItem = document.getElementById("itemCount");
      numItem.style.display = 'block';
      numItem.innerText = itemCount++;
      console.log("HIIIIIIIIIIIIII")
    };
    incrementValue();
  }

  if(addCartButtons){
    addCartButtons.forEach(btn => btn.addEventListener("click", handleCart));
  }
}

export { itemCount };
