require "weld/version"

ActionView::Template.register_template_handler(:weld, Weld::Handler)

