Return-Path: <s-anna@ti.com>
From: Suman Anna <s-anna@ti.com>
Subject: [PATCH] remoteproc: Reset table_ptr in rproc_start() failure paths
Date: Thu, 26 Jul 2018 20:15:35 -0500
Message-ID: <20180727011535.21729-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Unwind the modified table_ptr and restore it to the local copy
upon any subsequent failures in the rproc_start() function. This
keeps the function to remain balanced on failures without the need
to balance any modified variables elsewhere.

While at this, do some minor cleanup of the extra lines between
the failure labels as well.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 drivers/remoteproc/remoteproc_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index eadff6ce2f7f..afef2d491c5b 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -953,7 +953,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	if (ret) {
 		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
 			rproc->name, ret);
-		return ret;
+		goto reset_table_ptr;
 	}
 
 	/* power up the remote processor */
@@ -979,10 +979,11 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 
 stop_rproc:
 	rproc->ops->stop(rproc);
-
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
-
+reset_table_ptr:
+	if (loaded_table)
+		rproc->table_ptr = rproc->cached_table;
 	return ret;
 }
 
-- 
2.18.0
