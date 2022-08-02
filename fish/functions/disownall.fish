# Fish-specific disowning of all pending jobs.

function disownall -d "disown all pending jobs"
	disown (jobs -p)
end

