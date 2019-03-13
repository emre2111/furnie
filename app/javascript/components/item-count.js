function addCount(e) {
  e.preventDefault();
  let itemCount = document.getElementById("itemCount").innerText;

// if (document.getElementById("itemCount").innerText = 0) {
//   let itemCount = 0;
//   incrementValue();
// } else {
//   let itemCount = document.getElementById("itemCount").innerText;
//   incrementValue();
// };
  // increment badge number
  function incrementValue() {
    const numItem = document.getElementById("itemCount");
    numItem.style.display = 'block';
    console.log(numItem);
    itemCount++;

    // itemCount = Number.parseInt(numItem.innerText, 10) + 1;

    // itemCount++;
  }
  incrementValue();
}

export { addCount };

