# Convert hex-encoded ciphertexts to bytes
ct1_bytes = bytes.fromhex('b6e3251da5c15ebc55f7416aa42ccb879e787425401eb5e6e2ff2572a164b64f5cebd4e9165a3e201b4dc2338928a3b6ac8243f5')
ct2_bytes = bytes.fromhex('b6e23f02a1dd4ab30ab97b5abd70d09bb0483f7d7632bcc1f2c17a509f63d9307cd7cfe736590e081d3dc46fb018a0e9a38856e3f812b2d7af6669d4edd0ab')

leak = b'Shikanoko nokonoko koshitantan! Shikanoko nokonoko koshitantan!'

xor_ct1_ct2 = bytes(a ^ b for a, b in zip(ct1_bytes, ct2_bytes))

flag = bytes(a ^ b for a, b in zip(xor_ct1_ct2, leak))

print(flag)