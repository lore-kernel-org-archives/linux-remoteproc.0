Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE591DFE26;
	Wed, 26 Nov 2025 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764193650; cv=none; b=stqMpA5n9u/njOfPa+urLF8XCdPw/L/0H+7JydPf4mPurN2sbctcDYiTPb7bvrMTtxAWgqCksLrkoAjGPzCdEhRKCChTR3inFEyLAf3npuQE5xDNhRUaKKOO9mwFEfi+8Mz0fARts2VgwlOigDe5uhphHFax+nIjxu+dPrGco0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764193650; c=relaxed/simple;
	bh=yMnN0HMf+VpJg20rdgGWsZd+Ey+V2dsvekEswpHSCbc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8qlGd6M6gUCKJRhKDOoFqwipM8HC2Z6YaiGkW9VJ194f4K7Ai9HHdPn1PNCALm2Q8AUSMXSx5gGKQhNZCtLyIzHAJuj33VspDQlZehCJx7BId2AbWxsuGz92p2blEUfACaZQUFHnMxoEqiOCG+NovszP3vpxB16AVRLlDfuNi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eV4hcMeG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eV4hcMeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764193648; x=1795729648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yMnN0HMf+VpJg20rdgGWsZd+Ey+V2dsvekEswpHSCbc=;
  b=eV4hcMeGjiH9M4oRM55VmA4hgZN6rqNFiYXiVTdDG7r1WHhh9kbrA8V3
   MQgRim8mEj5mfXhZGr1kThwZXjW44/IhljDF+rGYlzvJc0XsxPTJZk0L4
   QPv8s0SC4ZZ4HcCisxLvdnVIgppLv3QkanE4GgbHVY4iEbzvCg3+eqlqk
   V5UfWTVuHy1Wizb2t3QYmbnEVEXFO8oR5LYb5jWJHYYpyVuRuHgGPJ8z1
   3Ns2ZZ9nXcXiSUE3jWadsTTdI6O/xb2t8+1gh0komy4SjHVTzyQ1clnzd
   Q3n4MI4EU1Vv+MJ8ubE6eK+nGghji5tDlQ5XZP6Q699OVolEXFPQESGMW
   Q==;
X-CSE-ConnectionGUID: 5XXVPe1YSDqx4WUKl3889w==
X-CSE-MsgGUID: MEwQsiCAThKHaiJ13I4YlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="68834488"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="68834488"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 13:47:27 -0800
X-CSE-ConnectionGUID: LOEz3vEGTeaU6vpJ7VHP5g==
X-CSE-MsgGUID: BxkqvAaET6iSS78fsdx3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192704107"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 26 Nov 2025 13:47:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4B05F9F; Wed, 26 Nov 2025 22:47:23 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v2 1/1] docs: Update documentation to avoid mentioning of kernel.h
Date: Wed, 26 Nov 2025 22:46:07 +0100
Message-ID: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For several years, and still ongoing, the kernel.h is being split
to smaller and narrow headers to avoid "including everything" approach
which is bad in many ways. Since that, documentation missed a few
required updates to align with that work. Do it here.

Note, language translations are left untouched and if anybody willing
to help, please provide path(es) based on the updated English variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---

v2: collected tag (Randy), fixed util_macros k-doc (Randy, me), fixed spelling (Randy)

 Documentation/core-api/kobject.rst              |  2 +-
 Documentation/dev-tools/checkpatch.rst          |  2 +-
 Documentation/driver-api/basics.rst             | 17 ++++++++++++++++-
 .../driver-api/driver-model/design-patterns.rst |  2 +-
 Documentation/process/coding-style.rst          | 10 +++++++---
 Documentation/staging/rpmsg.rst                 |  7 +++++--
 include/linux/util_macros.h                     |  2 +-
 7 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/kobject.rst
index 7310247310a0..5f6c61bc03bf 100644
--- a/Documentation/core-api/kobject.rst
+++ b/Documentation/core-api/kobject.rst
@@ -78,7 +78,7 @@ just a matter of using the kobj member.  Code that works with kobjects will
 often have the opposite problem, however: given a struct kobject pointer,
 what is the pointer to the containing structure?  You must avoid tricks
 (such as assuming that the kobject is at the beginning of the structure)
-and, instead, use the container_of() macro, found in ``<linux/kernel.h>``::
+and, instead, use the container_of() macro, found in ``<linux/container_of.h>``::
 
     container_of(ptr, type, member)
 
diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index fa2988dd4657..c1dff8e6bccb 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -753,7 +753,7 @@ Macros, Attributes and Symbols
     sizeof(foo)/sizeof(foo[0]) for finding number of elements in an
     array.
 
-    The macro is defined in include/linux/kernel.h::
+    The macro is defined in include/linux/array_size.h::
 
       #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 5e9f7aee71a7..8b6a5888cb11 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -114,10 +114,25 @@ Kernel objects manipulation
 Kernel utility functions
 ------------------------
 
-.. kernel-doc:: include/linux/kernel.h
+.. kernel-doc:: include/linux/array_size.h
+   :internal:
+
+.. kernel-doc:: include/linux/container_of.h
+   :internal:
+
+.. kernel-doc:: include/linux/kstrtox.h
    :internal:
    :no-identifiers: kstrtol kstrtoul
 
+.. kernel-doc:: include/linux/stddef.h
+   :internal:
+
+.. kernel-doc:: include/linux/util_macros.h
+   :internal:
+
+.. kernel-doc:: include/linux/wordpart.h
+   :internal:
+
 .. kernel-doc:: kernel/printk/printk.c
    :export:
    :no-identifiers: printk
diff --git a/Documentation/driver-api/driver-model/design-patterns.rst b/Documentation/driver-api/driver-model/design-patterns.rst
index 41eb8f41f7dd..965b2b93be6f 100644
--- a/Documentation/driver-api/driver-model/design-patterns.rst
+++ b/Documentation/driver-api/driver-model/design-patterns.rst
@@ -103,7 +103,7 @@ The design pattern is the same for an hrtimer or something similar that will
 return a single argument which is a pointer to a struct member in the
 callback.
 
-container_of() is a macro defined in <linux/kernel.h>
+container_of() is a macro defined in <linux/container_of.h>
 
 What container_of() does is to obtain a pointer to the containing struct from
 a pointer to a member by a simple subtraction using the offsetof() macro from
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 2969ca378dbb..258158637f65 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -1070,7 +1070,7 @@ readability.
 18) Don't re-invent the kernel macros
 -------------------------------------
 
-The header file include/linux/kernel.h contains a number of macros that
+There are many header files in include/linux/ that contain a number of macros that
 you should use, rather than explicitly coding some variant of them yourself.
 For example, if you need to calculate the length of an array, take advantage
 of the macro
@@ -1079,14 +1079,18 @@ of the macro
 
 	#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
 
+which is defined in array_size.h.
+
 Similarly, if you need to calculate the size of some structure member, use
 
 .. code-block:: c
 
 	#define sizeof_field(t, f) (sizeof(((t*)0)->f))
 
-There are also min() and max() macros that do strict type checking if you
-need them.  Feel free to peruse that header file to see what else is already
+which is defined in stddef.h.
+
+There are also min() and max() macros defined in minmax.h that do strict type checking
+if you need them. Feel free to peruse the header files to see what else is already
 defined that you shouldn't reproduce in your code.
 
 
diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 40282cca86ca..42bac1149d9d 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -224,9 +224,12 @@ content to the console.
 
 ::
 
-  #include <linux/kernel.h>
+  #include <linux/dev_printk.h>
+  #include <linux/mod_devicetable.h>
   #include <linux/module.h>
+  #include <linux/printk.h>
   #include <linux/rpmsg.h>
+  #include <linux/types.h>
 
   static void rpmsg_sample_cb(struct rpmsg_channel *rpdev, void *data, int len,
 						void *priv, u32 src)
@@ -244,7 +247,7 @@ content to the console.
 	/* send a message on our channel */
 	err = rpmsg_send(rpdev->ept, "hello!", 6);
 	if (err) {
-		pr_err("rpmsg_send failed: %d\n", err);
+		dev_err(&rpdev->dev, "rpmsg_send failed: %d\n", err);
 		return err;
 	}
 
diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
index 2eb528058d0d..71564868b8f6 100644
--- a/include/linux/util_macros.h
+++ b/include/linux/util_macros.h
@@ -119,7 +119,7 @@
  * a fuss about it. This makes the programmer responsible for tagging
  * the functions that can be garbage-collected.
  *
- * With the macro it is possible to write the following:
+ * With the macro it is possible to write the following::
  *
  *     static int foo_suspend(struct device *dev)
  *     {
-- 
2.50.1

