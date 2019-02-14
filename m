Return-Path: <xiaoxiang781216@gmail.com>
Return-Path: <xiaoxiang781216@gmail.com>
From: Xiang Xiao <xiaoxiang781216@gmail.com>
Subject: [PATCH 1/2] lib/string: add memrchr function
Date: Thu, 14 Feb 2019 11:48:16 +0800
Message-Id: <1550116097-29710-1-git-send-email-xiaoxiang@xiaomi.com>
To: gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com, andriy.shevchenko@linux.intel.com, ohad@wizery.com, bjorn.andersson@linaro.org, wendy.liang@xilinx.com, arnaud.pouliquen@st.com, kumar.gala@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Here is the detailed description for memrchr:

void *memrchr(const void *s, int c, size_t n);

The memrchr() function is like the memchr() function, except
that it searches backward from the end of the n bytes pointed
to by s instead of forward from the beginning.

The memrchr() functions return a pointer to the matching byte
or NULL if the character does not occur in the given memory
area.

Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
---
 include/linux/string.h |  1 +
 lib/string.c           | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index 7927b87..f380f4b 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -167,6 +167,7 @@ static inline void memcpy_flushcache(void *dst, const void *src, size_t cnt)
 	memcpy(dst, src, cnt);
 }
 #endif
+void *memrchr(const void *s, int c, size_t n);
 void *memchr_inv(const void *s, int c, size_t n);
 char *strreplace(char *s, char old, char new);
 
diff --git a/lib/string.c b/lib/string.c
index 38e4ca0..92914f6 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -964,6 +964,27 @@ void *memchr(const void *s, int c, size_t n)
 EXPORT_SYMBOL(memchr);
 #endif
 
+/**
+ * memrchr - Find a character in an area of memory.
+ * @s: The memory area
+ * @c: The byte to search for
+ * @n: The size of the area.
+ *
+ * returns the address of the last occurrence of @c, or %NULL
+ * if @c is not found
+ */
+void *memrchr(const void *s, int c, size_t n)
+{
+	const unsigned char *p = s + n;
+
+	while (n-- != 0) {
+		if ((unsigned char)c == *--p)
+			return (void *)p;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL(memrchr);
+
 static void *check_bytes8(const u8 *start, u8 value, unsigned int bytes)
 {
 	while (bytes) {
-- 
2.7.4
