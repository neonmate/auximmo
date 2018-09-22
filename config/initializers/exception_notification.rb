require 'exception_notification/rails'

ExceptionNotification.configure do |config|

  config.add_notifier :email, {
      email_prefix: '[auximmo] ',
      exception_recipients: %w[neonmate@users.noreply.github.com],
      sender_address: 'neonmate@users.noreply.github.com',
      sections: %w[request backtrace],
      background_sections: %w[backtrace],
  }

  # Regularly occurs when users have multiple tabs open
  config.ignored_exceptions += %w[ActionController::InvalidAuthenticityToken]

end
