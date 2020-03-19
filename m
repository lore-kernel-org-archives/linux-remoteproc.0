Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v2 1/2] remoteproc: fall back to using parent memory pool if no dedicated available
Date: Thu, 19 Mar 2020 11:23:20 -0500
Message-ID: <20200319162321.20632-2-s-anna@ti.com>
In-Reply-To: <20200319162321.20632-1-s-anna@ti.com>
References: <20200319162321.20632-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Loic Pallardy <loic.pallardy@st.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Tero Kristo <t-kristo@ti.com>

In some cases, like with OMAP remoteproc, we are not creating dedicated
memory pool for the virtio device. Instead, we use the same memory pool
for all shared memories. The current virtio memory pool handling forces
a split between these two, as a separate device is created for it,
causing memory to be allocated from bad location if the dedicated pool
is not available. Fix this by falling back to using the parent device
memory pool if dedicated is not available.

Fixes: 086d08725d34 ("remoteproc: create vdev subdevice with specific dma memory pool")
Signed-off-by: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2:
 - Address Arnaud's concerns about hard-coded memory-region index 0
 - Update the comment around the new code addition
v1: https://patchwork.kernel.org/patch/11422721/

 drivers/remoteproc/remoteproc_virtio.c | 15 +++++++++++++++
 include/linux/remoteproc.h             |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index eb817132bc5f..b687715cdf4b 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -369,6 +369,21 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 				goto out;
 			}
 		}
+	} else {
+		struct device_node *np = rproc->dev.parent->of_node;
+
+		/*
+		 * If we don't have dedicated buffer, just attempt to re-assign
+		 * the reserved memory from our parent. A default memory-region
+		 * at index 0 from the parent's memory-regions is assigned for
+		 * the rvdev dev to allocate from, and this can be customized
+		 * by updating the vdevbuf_mem_id in platform drivers if
+		 * desired. Failure is non-critical and the allocations will
+		 * fall back to global pools, so don't check return value
+		 * either.
+		 */
+		of_reserved_mem_device_init_by_idx(dev, np,
+						   rproc->vdevbuf_mem_id);
 	}
 
 	/* Allocate virtio device */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ed127b2d35ca..07bd73a6d72a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -481,6 +481,7 @@ struct rproc_dump_segment {
  * @auto_boot: flag to indicate if remote processor should be auto-started
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
+ * @vdevbuf_mem_id: default memory-region index for allocating vdev buffers
  */
 struct rproc {
 	struct list_head node;
@@ -514,6 +515,7 @@ struct rproc {
 	bool auto_boot;
 	struct list_head dump_segments;
 	int nb_vdev;
+	u8 vdevbuf_mem_id;
 	u8 elf_class;
 };
 
-- 
2.23.0
