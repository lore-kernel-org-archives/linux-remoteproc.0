Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 15/18] remoteproc: associate memory entry to a device
Date: Thu, 16 Apr 2020 18:13:28 +0200
Message-ID: <20200416161331.7606-16-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

mem entry could be registered at different levels, platform driver
or virtio device itself.
Add device information in rproc_mem_entry struct to retrieve a memory
region registered by another device.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c   | 2 ++
 drivers/remoteproc/remoteproc_virtio.c | 2 +-
 include/linux/remoteproc.h             | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 72fb97f28048..e72d681033d3 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -892,6 +892,7 @@ rproc_mem_entry_init(struct device *dev,
 	if (!mem)
 		return mem;
 
+	mem->dev = dev;
 	mem->va = va;
 	mem->dma = dma;
 	mem->da = da;
@@ -932,6 +933,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, int len,
 	if (!mem)
 		return mem;
 
+	mem->dev = dev;
 	mem->da = da;
 	mem->len = len;
 	mem->rsc_offset = FW_RSC_ADDR_ANY;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 4634cd63d547..0fd938afd146 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -439,7 +439,7 @@ static int rproc_vitio_start(struct rproc_subdev *subdev)
 		phys_addr_t pa;
 
 		if (mem->of_resm_idx != -1) {
-			struct device_node *np = rproc->dev.parent->of_node;
+			struct device_node *np = mem->dev->of_node;
 
 			/* Associate reserved memory to vdev device */
 			ret = of_reserved_mem_device_init_by_idx(dev, np,
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 7b8a6c3ef519..36abc9bc4def 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -331,6 +331,7 @@ struct rproc_mem_entry {
 	dma_addr_t dma;
 	int len;
 	u32 da;
+	struct device *dev;
 	void *priv;
 	char name[32];
 	struct list_head node;
-- 
2.17.1
