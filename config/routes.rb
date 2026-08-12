
Rails.application.routes.draw do

  scope "(:locale)", locale: /en|fr/ do

    controller :pages do
      get :home, to: "pages#home"
      get :aikku_ia, to: "pages#aikku_ia"
      get :aikku_plann, to: "pages#aikku_plann"
      get :aikku_coopcomm, to: "pages#aikku_coopcomm"
      get :qui_sommes_nous, to: "pages#qui_sommes_nous"
      get :nos_clients, to: "pages#nos_clients"
      get :services, to: "pages#services"
      get :contact, to: "pages#contact"
      post :contact, to: "pages#contact_submit"
      get 'mentions-legales', to: 'pages#mentions_legales', as: 'mentions_legales'      
    end

    root "pages#home"
  end
end
