Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH v3 1/2] remoteproc: Fall back to using parent memory pool if no dedicated available
Date: Mon, 20 Apr 2020 11:05:59 -0500
Message-ID: <20200420160600.10467-2-s-anna@ti.com>
In-Reply-To: <20200420160600.10467-1-s-anna@ti.com>
References: <20200420160600.10467-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>, Tero Kristo <t-kristo@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
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
v3:
 - Go back to v1 logic (removed the vdevbuf_mem_id variable added in v2)
 - Revised the comment to remove references to vdevbuf_mem_id
 - Capitalize the patch header
v2: https://patchwork.kernel.org/patch/11447651/

 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index e61d738d9b47..44187fe43677 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -376,6 +376,18 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
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
+		 * the rvdev dev to allocate from. Failure is non-critical and
+		 * the allocations will fall back to global pools, so don't
+		 * check return value either.
+		 */
+		of_reserved_mem_device_init_by_idx(dev, np, 0);
 	}
 
 	/* Allocate virtio device */
-- 
2.26.0
