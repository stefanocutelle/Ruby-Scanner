require 'socket'
require 'timeout'

$ip = ARGV[0]
$start_port = ARGV[1].to_i
$end_port = ARGV[2].to_i

ports = ($start_port..$end_port).to_a

ports.each do |port|
	begin
		Timeout::timeout(1){TCPSocket.new($ip,port)}
	rescue
		puts "closed: #{port}"
	else
		puts "Open: #{port}"
	end
end
