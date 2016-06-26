class Egg:
	def __init__(self, kind = "fried"):
		self.kind = kind

	def whatKind(self):
		return self.kind

def main():
	# print("This is the xsyntax.py file")
	fried = Egg()
	scrablled = Egg("scrambled")
	print(scrablled.whatKind())

if __name__ == "__main__": main()