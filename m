Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [RFC 1/2] remoteproc: sysfs: authorize rproc shutdown when rproc is crashed
Date: Wed, 11 Mar 2020 11:54:31 +0100
Message-ID: <1583924072-20648-2-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

When remoteproc recovery is disabled and rproc crashed, user space
client has no way to reboot co-processor except by a complete platform
reboot.
Indeed rproc_shutdown() is called by sysfs state_store() only is rproc
state is RPROC_RUNNING.

This patch offers the possibility to shutdown the co-processor if
it is in RPROC_CRASHED state and so to restart properly co-processor
from sysfs interface.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c  | 2 +-
 drivers/remoteproc/remoteproc_sysfs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..7ac87a75cd1b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1812,7 +1812,7 @@ void rproc_shutdown(struct rproc *rproc)
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
 
-	ret = rproc_stop(rproc, false);
+	ret = rproc_stop(rproc, rproc->state == RPROC_CRASHED);
 	if (ret) {
 		atomic_inc(&rproc->power);
 		goto out;
diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 7f8536b73295..1029458a4678 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -101,7 +101,7 @@ static ssize_t state_store(struct device *dev,
 		if (ret)
 			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
 	} else if (sysfs_streq(buf, "stop")) {
-		if (rproc->state != RPROC_RUNNING)
+		if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_CRASHED)
 			return -EINVAL;
 
 		rproc_shutdown(rproc);
-- 
2.7.4
