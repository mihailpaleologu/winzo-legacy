Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '252974314858701', '235f8df0f5cea8ee7a777aed98004619'
end
