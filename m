Return-Path: <knilch@rmdir.de>
Date: Thu, 15 Feb 2018 16:12:55 +0100
From: Tobias Jordan <Tobias.Jordan@elektrobit.com>
Subject: [PATCH] remoteproc: qcom: Fix potential device node leaks
Message-ID: <20180215151255.xhe7gzxnwippv3gp@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sil2reviews@lists.osadl.org
List-ID: <linux-remoteproc@vger.kernel.org>

Add missing of_node_put()s at two places for device nodes returned by
of_parse_phandle().

Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating
 Hexagon v5")
Signed-off-by: Tobias Jordan <Tobias.Jordan@elektrobit.com>
---
 drivers/remoteproc/qcom_q6v5_pil.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
index 8e70a627e0bb..cbbafdcaaecb 100644
--- a/drivers/remoteproc/qcom_q6v5_pil.c
+++ b/drivers/remoteproc/qcom_q6v5_pil.c
@@ -1083,6 +1083,7 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 		dev_err(qproc->dev, "unable to resolve mba region\n");
 		return ret;
 	}
+	of_node_put(node);
 
 	qproc->mba_phys = r.start;
 	qproc->mba_size = resource_size(&r);
@@ -1100,6 +1101,7 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 		dev_err(qproc->dev, "unable to resolve mpss region\n");
 		return ret;
 	}
+	of_node_put(node);
 
 	qproc->mpss_phys = qproc->mpss_reloc = r.start;
 	qproc->mpss_size = resource_size(&r);
-- 
2.11.0
