window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
  
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const proFit = document.getElementById("profit");
  const addTax = inputValue * 0.1;
  proFit.innerHTML = Math.floor(inputValue - addTax);
  });
});