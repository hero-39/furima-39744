const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
  // 入力された金額を数値に変換
  const price = parseFloat(inputValue);
  
  if (!isNaN(price)) {
    // 販売手数料率（仮の値）
    const feePercentage = 10; // 手数料率（仮の値）
    const fee = Math.floor((price * feePercentage) / 100);
    
    // 販売手数料を表示
    addTaxDom.innerHTML = fee;
    
    // 販売利益を計算
    const profit = price - fee;
    
    // 販売利益を表示
    profitDom.innerHTML = profit;
  } else {
    // 金額が有効でない場合、エラーメッセージを表示
    addTaxDom.innerHTML = "";
    profitDom.innerHTML = "";
  }
});