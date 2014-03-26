module PayConfig
  MERCHANT_NAME = 'EMALL'

  MERCHANT_SECRET_KEY = 'W6ZwSBpnQiu4hQZc7wx9'

  CURRENCY = 'GEL'
  LANG = 'KA'
  TEST_MODE_ON = 1
  TEST_MODE_OFF = 0
  DESCRIPTION = 'ბალანსის შევსება WUNDERKIND'
  #DESCRIPTION = 'WUNDERKIND.GE'
  ISPREAUTH_YES = 1
  ISPREAUTH_NO = 0
  TRANSACTION_STATUS_COMPLETED = 'COMPLETED'
  TRANSACTION_STATUS_CANCELED = 'CANCELED'
  TRANSACTION_STATUS_CANCELED = 'CANCELED'
  TRANSACTION_STATUS_ERROR = 'ERROR'
  SUCCESS_URL = 'http://localhost:3000/ge/authentications/return_from_pay?'
  ERROR_URL = 'http://localhost:3000/ge/authentications/return_from_pay?'
  CANCEL_URL = 'http://localhost:3000/ge/authentications/return_from_pay?'
  CALLBACK_URL = ''
end