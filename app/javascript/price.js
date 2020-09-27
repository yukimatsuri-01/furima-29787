function price(){
  const priceInput = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit")

    priceInput.addEventListener(`keyup`, () => {
      const value = priceInput.value;
      if (value >= 300 && value <= 9,999,999) {
        let fee = Math.floor(value * 0.1);
        let gains = value - fee;
        addTax.textContent = fee;
        profit.textContent = gains;
      } else {
        let fee = `0`;
        let gains = `0`;
        addTax.textContent = fee;
        profit.textContent = gains;
      }
    });
}

window.addEventListener(`load`, price)