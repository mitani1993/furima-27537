const pay = () => {
  Payjp.setPublicKey("pk_test_887bb80045728983ffe69960");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_order[number]"),
      exp_month: formData.get("user_order[exp_month]"),
      exp_year: `20${formData.get("user_order[exp_year]")}`,
      cvc: formData.get("user_order[cvc]")
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj)
      }

      document.getElementById("user_order_number").removeAttribute("name");
      document.getElementById("user_order_exp_month").removeAttribute("name");
      document.getElementById("user_order_exp_year").removeAttribute("name");
      document.getElementById("user_order_cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);