policy :default do

  lookup :main do
    datasource :file, {
      :docroot => '/vagrant/jerakia/data',
      :searchpath => [

        # node and location based overrides
        #
        "node/#{scope[:certificate]}",
        "location/#{scope[:location]}",

        # Per env data for systems, roles and base data
        #
        "#{scope[:env]}/#{scope[:system]}",
        "#{scope[:env]}/#{scope[:role]}",
        "#{scope[:env]}/base",

        # Defaults for systems, roles and base data
        #
        "default/#{scope[:system]}",
        "default/#{scope[:role]}",
        "default/base",

        # Other non-scoped defaults
        "common",
      ],
      :format => :yaml
    }
  end
end

