Return-Path: <nikita.shubin@maquefel.me>
From: nikita.shubin@maquefel.me
Subject: [PATCH] remoteproc: error on kick missing
Date: Fri, 28 Feb 2020 14:08:04 +0300
Message-Id: <20200228110804.25822-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nikita.shubin@maquefel.me, Nikita Shubin <NShubin@topcon.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

From: Nikita Shubin <NShubin@topcon.com>

.kick method not set in rproc_ops will result in:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference

in rproc_virtio_notify, after firmware loading.

refuse to register an rproc-induced virtio device if no kick method was
defined for rproc.

Signed-off-by: Nikita Shubin <NShubin@topcon.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 8c07cb2ca8ba..31a62a0b470e 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -334,6 +334,13 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	struct rproc_mem_entry *mem;
 	int ret;
 
+	if (rproc->ops->kick == NULL) {
+		ret = -EINVAL;
+		dev_err(dev, ".kick method not defined for %s",
+				rproc->name);
+		goto out;
+	}
+
 	/* Try to find dedicated vdev buffer carveout */
 	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
 	if (mem) {
-- 
2.24.1
