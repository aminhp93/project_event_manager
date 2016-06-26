def main():
	# print("This is the synteac py file")
	func(3)
	func(4)
	func(7)

def func(a=7):
	for i in range(a, 10):
		print(i, end=' ')
	print()

if __name__ == "__main__": main()