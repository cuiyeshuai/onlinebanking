module TransactionsHelper

  def get_currency_symbol(currency)
    if currency == "GBP"
      "£"
    elsif currency == "USD"
       "$"
    else
      "€"
    end
  end
end
