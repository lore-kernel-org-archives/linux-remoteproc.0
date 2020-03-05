Return-Path: <nikita.shubin@maquefel.me>
From: Nikita Shubin <NShubin@topcon.com>
Subject: [PATCH v3 1/1] remoteproc: Fix NULL pointer dereference in rproc_virtio_notify
Date: Thu,  5 Mar 2020 14:02:18 +0300
Message-Id: <20200305110218.8799-2-NShubin@topcon.com>
In-Reply-To: <20200305110218.8799-1-NShubin@topcon.com>
References: <20200228110804.25822-1-nikita.shubin@maquefel.me>
 <20200305110218.8799-1-NShubin@topcon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nikita Shubin <NShubin@topcon.com>, stable@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

.kick method not set in rproc_ops will result in:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference

in rproc_virtio_notify, after firmware loading.

refuse to register an rproc-induced virtio device if no kick method was
defined for rproc.

Signed-off-by: Nikita Shubin <NShubin@topcon.com>
Fixes: 7a186941626d19f668b08108db158379b32e6e02 ("remoteproc: remove the single rpmsg vdev limitation")
Cc: stable@vger.kernel.org
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
