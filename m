Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH 1/1] remoteproc: fix recovery procedure
Date: Wed, 9 Jan 2019 11:56:43 +0100
Message-ID: <1547031403-34535-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, xiaoxiang781216@gmail.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Commit 7e83cab824a87e83cab824a8 ("remoteproc: Modify recovery path
to use rproc_{start,stop}()") replaces rproc_{shutdown,boot}() with
rproc_{stop,start}(), which skips destroy the virtio device at stop
but re-initializes it again at start.

Issue is that struct virtio_dev is not correctly reinitialized like done
at initial allocation thanks to kzalloc() and kobject is considered as
already initialized by kernel. That is due to the fact struct virtio_dev
is allocated and released at vdev resource handling level managed and
virtio device is registered and unregistered at rproc subdevices level.

This patch initializes struct virtio_dev to 0 before using it and
registering it.

Fixes: 7e83cab824a8 ("remoteproc: Modify recovery path to use rproc_{start,stop}()")

Reported-by: Xiang Xiao <xiaoxiang781216@gmail.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 183fc42a510a..88eade99395c 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -332,6 +332,8 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	struct virtio_device *vdev = &rvdev->vdev;
 	int ret;
 
+	/* Reset vdev struct as you don't know how it has been previously used */
+	memset(vdev, 0, sizeof(struct virtio_device));
 	vdev->id.device	= id,
 	vdev->config = &rproc_virtio_config_ops,
 	vdev->dev.parent = dev;
-- 
2.7.4
