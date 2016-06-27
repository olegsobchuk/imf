class BasePage
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def wait_js_execution
    loop until page.evaluate_script('jQuery.active').zero?
  end
end
