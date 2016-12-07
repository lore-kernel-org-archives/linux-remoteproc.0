Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 1/1] remoteproc: core: probe subdevices before booting coprocessor
Date: Wed, 7 Dec 2016 21:49:28 +0100
Message-ID: <1481143768-16377-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

With subdevice support introduction, coprocessor boot sequence has
changed. Related coprocessor subdevices are now starting after firmware
and resource table loading and coprocessor boot.

But some subdevices can resources to allocate before coprocessor start,
like rpmsg buffers allocation for example.

This patch probes subdevices just before loading resource table,
to keep backward compatibility with existing firmwares.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
v2: remove unused stop_rproc label

 drivers/remoteproc/remoteproc_core.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f0f6ec1..61f06a7 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -913,6 +913,14 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up_resources;
 	}
 
+	/* probe any subdevices for the remote processor */
+	ret = rproc_probe_subdevices(rproc);
+	if (ret) {
+		dev_err(dev, "failed to probe subdevices for %s: %d\n",
+			rproc->name, ret);
+		goto clean_up_resources;
+	}
+
 	/*
 	 * The starting device has been given the rproc->table_ptr as the
 	 * resource table. The address of the vring along with the other
@@ -932,22 +940,12 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
 		goto clean_up_resources;
 	}
 
-	/* probe any subdevices for the remote processor */
-	ret = rproc_probe_subdevices(rproc);
-	if (ret) {
-		dev_err(dev, "failed to probe subdevices for %s: %d\n",
-			rproc->name, ret);
-		goto stop_rproc;
-	}
-
 	rproc->state = RPROC_RUNNING;
 
 	dev_info(dev, "remote processor %s is now up\n", rproc->name);
 
 	return 0;
 
-stop_rproc:
-	rproc->ops->stop(rproc);
 clean_up_resources:
 	rproc_resource_cleanup(rproc);
 clean_up:
-- 
1.9.1
