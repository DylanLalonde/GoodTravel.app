function more() {
  var hiddenBlock = document.querySelector("#expand-content");
  if (hiddenBlock) {
      document.querySelector(".button").addEventListener("click", function () {
    if (hiddenBlock.className === "content-active") {
      hiddenBlock.className = "content"
    } else {
      hiddenBlock.className = "content-active"
    }
  });
  }


}

export {
  more
};
