import sys

for line in sys.stdin:
    if line == "\r\n":
        break

message = "hello world!"

# Write the HTTP response
sys.stdout.write("HTTP/1.1 200 OK\r\n")
sys.stdout.write("Content-Type: text/html\r\n")
sys.stdout.write(f"Content-Length: {len(message)}\r\n")  # Adjust length based on actual content
sys.stdout.write("\r\n")
sys.stdout.write(message)
# sys.stdout.write("\r\n")  # Blank line between headers and body
# sys.stdout.write("<html><head><title>Hello World</title></head><body><h1>Hello World</h1></body></html>")
sys.stdout.flush()
