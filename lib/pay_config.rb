module PayConfig
  MERCHANT_NAME = 'WUNDERKINDGE'

  MERCHANT_SECRET_KEY = '2hM9nqtESAo1hLerJ2ZW'

  CURRENCY = 'GEL'
  LANG = 'KA'
  TEST_MODE_ON = 1
  TEST_MODE_OFF = 0
  DESCRIPTION = 'ბალანსის შევსება WUNDERKIND'
  ISPREAUTH_YES = 1
  ISPREAUTH_NO = 0
  TRANSACTION_STATUS_COMPLETED = 'COMPLETED'
  TRANSACTION_STATUS_CANCELED = 'CANCELED'
  TRANSACTION_STATUS_CANCELED = 'CANCELED'
  TRANSACTION_STATUS_ERROR = 'ERROR'
  SUCCESS_URL = 'http://localhost:3000/ge/authentications/return_from_pay?'
  ERROR_URL = 'http://localhost:3000/ge/authentications/return_from_pay?'
  CANCEL_URL = 'http://localhost:3000/ge/authentications/return_from_pay?'
  CALLBACK_URL = 'http://localhost:3000/ge/authentications/callback?'
end