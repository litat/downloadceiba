module Tst

import Downloadsite

using Downloadsite
using Requests

println("\"file\" for read from FILE.")
println("\"url\" for read from URL.")
usingfileorurl = readline(STDIN)

if usingfileorurl == "url"
	println("input the site for download")
	site = readline(stream=STDIN)
	downloadsite(site)
elseif usingfileorurl == "file"
	fdata = open(readbytes, "./ceiba.html")
	fdata = UTF16String(ASCIIString(fdata))
	matched = eachmatch(r"href=\'(.*?)\'", utf8(fdata))
end

end
