function price (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price")
    const Profit = document.getElementById("profit")

    const priceBeforeFee = itemPrice.value ;
    const feeRate = 0.1 ;
    const Fee = Math.round(priceBeforeFee * feeRate) ;
    const priceAfterFee = priceBeforeFee - Fee ;
    
    addTaxPrice.innerHTML = Fee ;
    Profit.innerHTML = priceAfterFee ;
  });
}
setInterval(price, 1000);