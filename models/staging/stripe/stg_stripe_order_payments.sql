SELECT
    id AS payment_id,
    orderid AS order_id,
    paymentmethod AS payment_method,
    CASE
        WHEN paymentmethod in   ('stripe'
                                , 'paypal' 
                                , 'credit_card'
                                , 'gift_card')
        THEN 'credit'
        ELSE 'cash'
    END AS payment_type,
    status,
    amount,
    CASE
        WHEN status = 'success'
        THEN true
        ELSE false
    END AS is_completed_payment,
    created AS created_date
from `dbt-tutorial.stripe.payment`

