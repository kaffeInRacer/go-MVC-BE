package res

type FormatApi struct {
	Meta Meta        `json:"meta"`
	Data interface{} `json:"data"`
}

type Meta struct {
	Code    int    `json:"code"`
	Status  string `json:"status"`
	Message string `json:"message"`
}

func Response(code int, status, message string, data interface{}) FormatApi {
	Meta := Meta{
		Code:    code,
		Status:  status,
		Message: message,
	}

	return FormatApi{
		Meta: Meta,
		Data: data,
	}
}
