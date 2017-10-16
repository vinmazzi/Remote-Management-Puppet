Facter.add(:serial_number) do
   setcode do
      begin
         File.open('/etc/serial_number').read().strip()
      rescue
	 "N/A"
      end
   end
end

