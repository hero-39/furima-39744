window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const price = priceInput.value;
  
  const feePercentage = 10; 
  const fee = Math.floor((price * feePercentage) / 100);
    
  addTaxDom.innerHTML = fee;
    
  const profit = price - fee;
    
  profitDom.innerHTML = profit;
})
});