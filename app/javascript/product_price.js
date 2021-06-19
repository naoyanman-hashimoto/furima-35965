function price(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");
    const tax = inputValue*0.1
    addTaxDom.innerHTML = Math.floor(tax).toLocaleString();
    profitDom.innerHTML = Math.floor(inputValue-tax).toLocaleString();
  });
};
window.addEventListener('load', price)