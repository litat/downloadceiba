module Downloadsite

using Requests

export downloadsite

function downloadsite(site::AbstractString)
	rq = @spawn get(site)
	matched = collect(eachmatch(r"href=\"([^#]*?)\"", utf8(fetch(rq).data)))
	pmap(matched) do m
		url = m[:1]
		fullurl = ismatch(r"http", url) ? url : site * url
		filename = basename(fullurl)
		filename != "" && @async download(fullurl, filename)
	end
	return
end

end
