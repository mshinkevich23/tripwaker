Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '801932253231169', '0e83b1399a06ebafa9f3f6db58516a59',
    :scope => 'email, public_profile', :display => "popup"
   provider :vkontakte, '4935211', 'ZrDeyYRksXSxxqKrHpSV',
    :scope => 'email, public_profile', :display => "popup"
end
