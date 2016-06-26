def main():
	for n in primes(): # generate a list of prime numbers
		if n > 100: break
		print(n)

def isprime(n):
	if n == 1:
		return False
	for x in range(2, n):
		if n % X == 0:
			return False
	else: 
		return True

if __name__ == "__main__": main()

