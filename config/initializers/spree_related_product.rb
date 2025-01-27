Rails.application.config.after_initialize do
    Rails.application.config.spree_backend.main_menu.add(
      Spree::Admin::MainMenu::SectionBuilder.new('RelationTypes', 'inbox-fill.svg').
         with_admin_ability_check(Spree::RelationType).
         with_items([
           Spree::Admin::MainMenu::ItemBuilder.new('relation_types', Spree::Core::Engine.routes.url_helpers.admin_relation_types_path).build
         ]).
         build
    )
end
Rails.application.config.after_initialize do
  Rails.application.config.spree_backend.tabs[:product].add(
    Spree::Admin::Tabs::TabBuilder.new(Spree.t(:related), ->(resource){Spree::Core::Engine.routes.url_helpers.related_admin_product_path(resource)}).
    with_icon_key('view.svg').
    with_active_check.
    build
  )
end
