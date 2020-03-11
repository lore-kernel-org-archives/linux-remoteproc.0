Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [RFC 2/2] remoteproc: core: keep rproc in crash state in case of recovery failure
Date: Wed, 11 Mar 2020 11:54:32 +0100
Message-ID: <1583924072-20648-3-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
References: <1583924072-20648-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

When an error occurs during recovery procedure, internal rproc
variables may be unaligned:
- state is set to RPROC_OFFLINE
- power atomic not equal to 0
which is normal as only rproc_stop() has been executed and not
rproc_shutdown()

In such case, rproc_boot() can be re-executed by client to
reboot co-processor.

This patch proposes to keep rproc in RPROC_CRASHED state in case
of recovery failure to be coherent with recovery disabled mode.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 7ac87a75cd1b..def4f9fc881d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1679,6 +1679,12 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	release_firmware(firmware_p);
 
 unlock_mutex:
+	/*
+	 * In case of error during recovery sequence restore rproc
+	 * state in CRASHED
+	 */
+	if (ret)
+		rproc->state = RPROC_CRASHED;
 	mutex_unlock(&rproc->lock);
 	return ret;
 }
-- 
2.7.4
