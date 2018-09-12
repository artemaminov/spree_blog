Deface::Override.new(:original => 'e48585c7f540e0c388f4c9b7480a84b5f56003e4',
                     :virtual_path => "spree/layouts/admin",
                     :name => "blog_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<% if can? :admin, Spree::Promotion %>
  <ul class=\"nav nav-sidebar\">
    <%= main_menu_tree Spree.t(:blog), icon: \"gift\", sub_menu: \"blog\", url: \"#sidebar-blog\" %>
</ul>
<% end %>",
                     :disabled => false)