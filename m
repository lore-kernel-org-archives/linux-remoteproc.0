Return-Path: <gustavo@embeddedor.com>
Date: Fri, 30 Aug 2019 10:14:06 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] remoteproc: use struct_size() helper
Message-ID: <20190830151406.GA23274@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-ID: <linux-remoteproc@vger.kernel.org>

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct fw_rsc_vdev {
	...
        struct fw_rsc_vdev_vring vring[0];
} __packed;

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

sizeof(*rsc) + rsc->num_of_vrings * sizeof(struct fw_rsc_vdev_vring)

with:

struct_size(rsc, vring, rsc->num_of_vrings)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3c5fbbbfb0f1..d427b8208ad6 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -478,8 +478,8 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 	char name[16];
 
 	/* make sure resource isn't truncated */
-	if (sizeof(*rsc) + rsc->num_of_vrings * sizeof(struct fw_rsc_vdev_vring)
-			+ rsc->config_len > avail) {
+	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
+			avail) {
 		dev_err(dev, "vdev rsc is truncated\n");
 		return -EINVAL;
 	}
-- 
2.23.0
