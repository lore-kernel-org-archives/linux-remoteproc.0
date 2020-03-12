Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 12/18] remoteproc: Rename function rproc_fw_boot()
Date: Thu, 12 Mar 2020 16:11:52 -0600
Message-Id: <20200312221158.3613-13-mathieu.poirier@linaro.org>
In-Reply-To: <20200312221158.3613-1-mathieu.poirier@linaro.org>
References: <20200312221158.3613-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, loic.pallardy@st.com, s-anna@ti.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Renaming function rproc_fw_boot() in order to better reflect the work
that is done when supporting scenarios where the remoteproc core is
synchronising with an MCU.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d57b47b0d6be..36c4d0f13ae9 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1363,7 +1363,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 /*
  * take a firmware and boot a remote processor with it.
  */
-static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
+static int rproc_actuate_platform(struct rproc *rproc,
+				  const struct firmware *fw)
 {
 	struct device *dev = &rproc->dev;
 	const char *name = rproc->firmware;
@@ -1756,7 +1757,7 @@ static int rproc_actuate(struct rproc *rproc,
 		 firmware_p ? "powering up" : "syncing with",
 		 rproc->name);
 
-	ret = rproc_fw_boot(rproc, firmware_p);
+	ret = rproc_actuate_platform(rproc, firmware_p);
 	if (ret)
 		atomic_dec(&rproc->power);
 
-- 
2.20.1
