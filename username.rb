def generate_username1 (first)
	return first[0].downcase
end

def generate_username2 (first,last)
	if first.empty? || last.empty? then return nil end
	first = first.split("").select{|char| char.match(/[aA-zZ]/)}.join
	last = last.split("").select{|char| char.match(/[aA-zZ]/)}.join
	result = first.downcase[0] + last.downcase
end

def generate_username3 (first,last,year)
	if year.to_s.split("").length != 4 then return nil end
	result = generate_username2(first,last);
	result = result + year.to_s.split("").pop(2).join
end

def check_privilege(p = 0)
	privs = []
	privs[0] = "user"
	privs[1] = "seller"
	privs[2] = "manager"
	privs[3] = "admin"
	return privs[p]
end

def generate_username4 (first,last,year,priv = 0)
	result = generate_username3(first,last,year)
	result = priv > 0 ? check_privilege(priv) + "-" + result : result
end

$users = []

def generate_username5 (first,last,year)
	result = generate_username4(first,last,year)
	#check if result exists in array
	#if doesn't exist, add it
	#if it does exist, take it, iterate or add num 
	#and resubmit
	if ($users.include?(result)) 
		result = result + "_1"
	end
	$users << result
	result
end
