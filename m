Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 07/13] remoteproc/omap: fix various code formatting issues
Date: Fri, 12 Aug 2016 18:42:22 -0500
Message-ID: <20160812234228.39731-8-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

This patch fixes some of the existing checkpatch warnings in OMAP
remoteproc code. The fixes are to the following warnings:
1. WARNING: missing space after return type
2. WARNING: Unnecessary space after function pointer name
3. CHECK: Alignment should match open parenthesis

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c          | 2 +-
 include/linux/platform_data/remoteproc-omap.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index b74368a91235..ddc1a12d75e0 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -196,7 +196,7 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	}
 
 	rproc = rproc_alloc(&pdev->dev, pdata->name, &omap_rproc_ops,
-				pdata->firmware, sizeof(*oproc));
+			    pdata->firmware, sizeof(*oproc));
 	if (!rproc)
 		return -ENOMEM;
 
diff --git a/include/linux/platform_data/remoteproc-omap.h b/include/linux/platform_data/remoteproc-omap.h
index bfbd12b41162..71a1b2399c48 100644
--- a/include/linux/platform_data/remoteproc-omap.h
+++ b/include/linux/platform_data/remoteproc-omap.h
@@ -39,9 +39,9 @@ struct omap_rproc_pdata {
 	const char *firmware;
 	const char *mbox_name;
 	const struct rproc_ops *ops;
-	int (*device_enable) (struct platform_device *pdev);
-	int (*device_shutdown) (struct platform_device *pdev);
-	void(*set_bootaddr)(u32);
+	int (*device_enable)(struct platform_device *pdev);
+	int (*device_shutdown)(struct platform_device *pdev);
+	void (*set_bootaddr)(u32);
 };
 
 #if defined(CONFIG_OMAP_REMOTEPROC) || defined(CONFIG_OMAP_REMOTEPROC_MODULE)
-- 
2.9.0
