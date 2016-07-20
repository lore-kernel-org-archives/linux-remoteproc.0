Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: Fix randomly placed semi-colon
Date: Wed, 20 Jul 2016 10:29:35 +0100
Message-Id: <20160720092935.5902-1-lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, patrice.chotard@st.com, ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

It should never have been there in the first place.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index fe03b2a..9823178 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -865,7 +865,7 @@ static void rpmsg_recv_done(struct virtqueue *rvq)
 		msgs_received++;
 
 		msg = virtqueue_get_buf(rvq, &len);
-	};
+	}
 
 	dev_dbg(dev, "Received %u messages\n", msgs_received);
 
-- 
2.9.0
