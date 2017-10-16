Facter.add(:group_name) do
   setcode do
      begin
         File.open('/etc/group_name').read().strip()
      rescue 
	 "N/A"
      end
   end
end

