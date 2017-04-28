Return-Path: <dan.j.williams@intel.com>
Subject: [PATCH 1/3] printk: provide generic dynamic_hex_dump fallback
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Apr 2017 14:28:59 -0700
Message-ID: <149341493902.35578.4854765976357149724.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <149341493336.35578.13631055553267152302.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <149341493336.35578.13631055553267152302.stgit@dwillia2-desk3.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: linux-nvdimm@lists.01.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-acpi@vger.kernel.org, Jason Baron <jbaron@akamai.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The lack of a silent fallback for this routine has caused the nfit
driver and the virtio_rpmsg_bus to develop local workarounds. Define a
nop version of dynamic_hex_dump() in the CONFIG_DYNAMIC_DEBUG=n case so
we can clean up those local workarounds.

Cc: Jason Baron <jbaron@akamai.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 include/linux/dynamic_debug.h |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 546d68057e3b..c26302e1e387 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -180,6 +180,12 @@ static inline int ddebug_dyndbg_module_param_cb(char *param, char *val,
 	do { if (0) printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__); } while (0)
 #define dynamic_dev_dbg(dev, fmt, ...)					\
 	do { if (0) dev_printk(KERN_DEBUG, dev, fmt, ##__VA_ARGS__); } while (0)
+
+static inline void dynamic_hex_dump(const char *prefix_str, int prefix_type,
+		int rowsize, int groupsize, const void *buf, size_t len,
+		bool ascii)
+{
+}
 #endif
 
 #endif
