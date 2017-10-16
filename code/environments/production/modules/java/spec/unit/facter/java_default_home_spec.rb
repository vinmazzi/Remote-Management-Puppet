require "spec_helper"

describe Facter::Util::Fact do
  before {
    Facter.clear
    Facter.fact(:kernel).stubs(:value).returns('Linux')
  }

  describe "java_default_home" do
    context 'returns java home path when readlink present' do
      context 'when java is in HOME/jre/bin/java' do
        it do
          java_path_output = <<-EOS
/usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
          EOS
          Facter::Util::Resolution.expects(:which).with("readlink").returns(true)
          Facter::Util::Resolution.expects(:exec).with("readlink -e /usr/bin/java").returns(java_path_output)
          expect(Facter.value(:java_default_home)).to eql "/usr/lib/jvm/java-7-openjdk-amd64"
        end
      end
      context 'when java is in HOME/bin/java' do
        it do
          java_path_output = <<-EOS
/usr/lib/jvm/oracle-java8-jre-amd64/bin/java
          EOS
          Facter::Util::Resolution.expects(:which).with("readlink").returns(true)
          Facter::Util::Resolution.expects(:exec).with("readlink -e /usr/bin/java").returns(java_path_output)
          expect(Facter.value(:java_default_home)).to eql "/usr/lib/jvm/oracle-java8-jre-amd64"
        end
      end
    end
    context 'returns nil when readlink is present but java is not' do
      it do
        java_path_output = ""
        Facter::Util::Resolution.expects(:which).with("readlink").returns(true)
        Facter::Util::Resolution.expects(:exec).with("readlink -e /usr/bin/java").returns(java_path_output)
        expect(Facter.value(:java_default_home)).to be_nil
      end
    end

    context 'returns nil when readlink not present' do
      it do
        Facter::Util::Resolution.stubs(:exec)
        Facter::Util::Resolution.expects(:which).with("readlink").at_least(1).returns(false)
        expect(Facter.value(:java_default_home)).to be_nil
      end
    end
  end
end
