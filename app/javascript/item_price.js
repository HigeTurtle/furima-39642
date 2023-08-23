
window.addEventListener('load', () => {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const priceCommission = document.getElementById("add-tax-price");
      priceCommission.innerHTML = Math.floor(priceInput.value * 0.1)
      const priceProfit = document.getElementById("profit");
      priceProfit.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1))
    })
  });