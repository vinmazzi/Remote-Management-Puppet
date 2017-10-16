require 'spec_helper'

describe Puppet::Type.type(:sensu_check_config) do
  let(:resource_hash) do
    {
      :title => 'foo.example.com',
      :catalog => Puppet::Resource::Catalog.new
    }
  end

  describe 'notifications' do
    let(:resource_hash) do
      c = Puppet::Resource::Catalog.new
      c.add_resource(service_resource)
      {
        :title => 'foo.example.com',
        :catalog => c
      }
    end

    context 'when managing sensu-enterprise (#495)' do
      let(:service_resource) do
        Puppet::Type.type(:service).new(name: 'sensu-enterprise')
      end
      it 'notifies Service[sensu-enterprise]' do
        notify_list = described_class.new(resource_hash)[:notify]
        # compare the resource reference strings, the object identities differ.
        expect(notify_list.map(&:ref)).to eq [service_resource.ref]
      end
    end

    context 'when managing sensu-api (#600)' do
      let(:service_resource) do
        Puppet::Type.type(:service).new(name: 'sensu-api')
      end
      it 'notifies Service[sensu-api]' do
        notify_list = described_class.new(resource_hash)[:notify]
        # compare the resource reference strings, the object identities differ.
        expect(notify_list.map(&:ref)).to eq [service_resource.ref]
      end
    end
  end

  describe 'relationships' do
    let(:resource_hash) do
      c = Puppet::Resource::Catalog.new
      r = Puppet::Type.type(:anchor).new(name: 'plugins_before_checks')
      c.add_resource(r)
      {
        :title => 'foo.example.com',
        :catalog => c
      }
    end
    let(:resource) do
    end
    context 'plugins before checks (#463)' do
      subject { described_class.new(resource_hash)[:subscribe].map(&:ref) }
      it 'subscribes to Anchor[plugins_before_checks]' do
        is_expected.to eq ['Anchor[plugins_before_checks]']
      end
    end
  end
end
