Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH 01/13] remoteproc: use proper format-specifier for printing dma_addr_t
Date: Fri, 12 Aug 2016 18:42:16 -0500
Message-ID: <20160812234228.39731-2-s-anna@ti.com>
In-Reply-To: <20160812234228.39731-1-s-anna@ti.com>
References: <20160812234228.39731-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The dma_addr_t types can be printed properly using the %pad
printk format-specifier, there is no need to resort to the
unsigned long long type-casting to deal with different possible
type sizes.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 63fd365dec14..3a9982b8e8c2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -236,8 +236,8 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	}
 	notifyid = ret;
 
-	dev_dbg(dev, "vring%d: va %p dma %llx size %x idr %d\n", i, va,
-				(unsigned long long)dma, size, notifyid);
+	dev_dbg(dev, "vring%d: va %p dma %pad size %x idr %d\n",
+		i, va, &dma, size, notifyid);
 
 	rvring->va = va;
 	rvring->dma = dma;
@@ -594,8 +594,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		goto free_carv;
 	}
 
-	dev_dbg(dev, "carveout va %p, dma %llx, len 0x%x\n", va,
-					(unsigned long long)dma, rsc->len);
+	dev_dbg(dev, "carveout va %p, dma %pad, len 0x%x\n",
+		va, &dma, rsc->len);
 
 	/*
 	 * Ok, this is non-standard.
@@ -639,8 +639,8 @@ static int rproc_handle_carveout(struct rproc *rproc,
 		mapping->len = rsc->len;
 		list_add_tail(&mapping->node, &rproc->mappings);
 
-		dev_dbg(dev, "carveout mapped 0x%x to 0x%llx\n",
-					rsc->da, (unsigned long long)dma);
+		dev_dbg(dev, "carveout mapped 0x%x to %pad\n",
+			rsc->da, &dma);
 	}
 
 	/*
-- 
2.9.0
