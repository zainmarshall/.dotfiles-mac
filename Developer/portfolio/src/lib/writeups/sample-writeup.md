---
title: "Breaking the Unbreakable: PicoCTF Vault Door"
description: "A deep dive into reverse engineering Java vault doors in PicoCTF."
date: "2025-12-20"
categories: ["Reversing", "Java", "CTF"]
published: true
---

# PicoCTF: Vault Door 1

This was a classic reversing challenge where we were given a Java class and asked to find the password.

## The Code

The core logic was in the `checkPassword` method:

```java
public boolean checkPassword(String password) {
    return password.length() == 32 &&
           password.charAt(0)  == 'd' &&
           password.charAt(29) == '3' &&
           password.charAt(4)  == 'r' &&
           // ... more checks
           password.charAt(31) == '4';
}
```

## The Solution

I wrote a quick script to reassemble the characters based on their indices.

```python
# Quick solver
indices = [0, 29, 4, 31, ...]
# ... reassembly logic
```

Flag: `picoCTF{d35tr0y_4ll_v4ult5}`
