Rails.application.routes.draw do
  resources :detail_kasbons
  resources :potongan_employees
  resources :kasbons
  resources :potongans
  resources :golongans
  #get '*path' => redirect('/')
  resources :take_homes
  resources :additional_incomes
  resources :salaries
  resources :attendances
  resources :group_rosters
  resources :rosters
  resources :restos
  resources :position_groups
  resources :locations
  resources :employees
  # get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'restos/:id/new' => 'restos#add_employee', as: :add_employee
  get 'employees/salary_recap/:month&:year' => 'employees#salary_recap', as: :salary_recap
  #match 'employees/salary_recap/:month' => "employees#generate_attendance", :via => :post
  get 'golongans/:id/group_rosters' => 'golongans#roster_group', as: :roster_group
  get 'employees/:id/salary_detail/:month&:year' =>'employees#salary_detail', as: :salary_detail
  get 'employees/:id/tambah_income/:month&:year' =>'employees#tambah_income', as: :tambah_income
  get 'employees/:id/kasbon' => 'employees#kasbon', as: :employee_kasbon
  post 'employees/:id/add_row/:month&:year' => 'employees#add_row', as: :emp_add_income_row
  post 'employees/:id/add_potong/:month&:year' => 'employees#add_potong', as: :emp_add_potong_row
  
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
