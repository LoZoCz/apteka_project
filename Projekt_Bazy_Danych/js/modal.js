const openClientForm = document.querySelector(".open-client-form");
const closeClientForm = document.querySelector(".close-client-form");
const clientForm = document.querySelector(".new-client-form");

openClientForm.addEventListener("click", () => {
  clientForm.showModal();
});

closeClientForm.addEventListener("click", () => {
  clientForm.close();
});

const openBuyForm = document.querySelector(".open-buy-form");
const closeBuyForm = document.querySelector(".close-buy-form");
const buyForm = document.querySelector(".new-client-form");
