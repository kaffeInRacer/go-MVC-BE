package res

import "point-of-sale/app/model"

type SetOrderResponse struct {
	ID          int                    `json:"order_id"`
	OrderCode   string                 `json:"order_code"`
	Name        string                 `json:"name"`
	OrderOption string                 `json:"order_option"`
	NumberTable int                    `json:"number_table"`
	Note        string                 `json:"note"`
	Amount      int                    `json:"total"`
	Service     int                    `json:"service"`
	Items       []SetItemOrderResponse `json:"items"`
	Transaction SetTransactionResponse `json:"transaction"`
}

type SetItemOrderResponse struct {
	ID       int    `json:"id"`
	Name     string `json:"name"`
	Quantity int    `json:"quantity"`
	Price    int    `json:"price"`
	Subtotal int    `json:"subtotal"`
}

type SetTransactionResponse struct {
	Status  string `json:"payment_status"`
	Payment string `json:"payment_method"`
}

func TransformResponse(order model.Order) SetOrderResponse {
	setItems := make([]SetItemOrderResponse, len(order.Items))
	totalAmount := 0

	for i, item := range order.Items {
		setItems[i] = SetItemOrderResponse{
			ID:       item.ProductID,
			Name:     item.Products.Name,
			Quantity: item.Quantity,
			Price:    item.Products.Price,
			Subtotal: item.Subtotal,
		}

		totalAmount += item.Subtotal
	}

	setTransaction := SetTransactionResponse{
		Status:  order.Transaction.Status,
		Payment: order.Transaction.Payment,
	}

	setResponse := SetOrderResponse{
		ID:          order.ID,
		OrderCode:   order.OrderCode,
		Name:        order.Name,
		OrderOption: order.OrderOption,
		NumberTable: order.NumberTable,
		Note:        order.Note,
		Amount:      totalAmount,
		Items:       setItems,
		Transaction: setTransaction,
	}

	return setResponse
}
