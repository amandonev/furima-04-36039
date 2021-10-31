window.addEventListener('load', () => {

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {

  // 販売手数料(10%)の表示
  const addTax = document.getElementById("add-tax-price");
  addTax.innerHTML = Math.round(priceInput.value * 0.1);

  // 販売利益(価格 - 販売手数料(10%))の表示
  const addProfit = document.getElementById("profit");
  addProfit.innerHTML = Math.round(priceInput.value * 0.9);

  })
});


