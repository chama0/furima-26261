function calc () {
  const itemPrice = document.getElementById('item-price');
  itemPrice.addEventListener('keyup', () => {
    const price = itemPrice.value;
    const fee = Math.floor(price / 10);
    const gain = price - fee;
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    addTaxPrice.innerHTML = `${fee}`;
    profit.innerHTML = `${gain}`;
  });
}

window.addEventListener('load', calc);