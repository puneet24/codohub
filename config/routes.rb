Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index' 

  get 'mailer/compose' => 'mailer#compose', as: :mailer_compose
  get 'mailer/inbox' => 'mailer#inbox', as: :mailer_inbox
  get 'mailer/sent_mails' => 'mailer#sent_mails', as: :sent_mails
  get 'mailer/history/:ticket_id' => 'mailer#history', as: :history
  post 'mailer/create_mail/:ticket_id' => 'mailer#create_mail', as: :create_mail

  #static pages routing defined.
  get 'about' => 'staticpages#about', as: :about
  get 'contact' => 'staticpages#contact', as: :contact
  get 'homepage' => 'home#index', as: :homepage

  #Problems
  get 'problem/add' => 'problem#add', as: :problem_add
  get 'problem/all' => 'problem#all', as: :problem_all
  get 'problem/create' => 'problem#create_problem', as: :create_problem
  get 'problem/view/:id' => 'problem#view', as: :problem_view
  get 'user/all_problems' => 'problem#user_problems',as: :user_all_problems
  get 'user/edit/:id' => 'problem#edit',as: :user_edit
  get 'user/edit_problem/:id' => 'problem#edit_problem', as: :user_edit_problem
  get 'problem/add_comment/:id' => 'problem#add_comment', as: :problem_add_comment

  #groups
  get 'group/index' => 'group#index',as: :group_index
  get 'group/create' => 'group#create',as: :group_create
  get 'group/groups' => 'group#groups',as: :group_groups
  get 'group/info/:id' => 'group#info', as: :group_info
  get 'group/other/groups' => 'group#other',as: :group_other
  #Problem Comments
  # get 'problem/add_comment/:id' => 'problem#add_comment' as: :problem_add_comment


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
