require "spec_helper"

describe Lita::Handlers::Hopcat, lita_handler: true do
  it { is_expected.to route_command("hopcat").to(:hopcat) }
  it { is_expected.to route_command("hopcat me").to(:hopcat) }
end
