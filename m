Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 8/8] remoteproc: Reset table_ptr on stop
Date: Fri,  5 Jan 2018 15:58:05 -0800
Message-Id: <20180105235805.9948-9-bjorn.andersson@linaro.org>
In-Reply-To: <20180105235805.9948-1-bjorn.andersson@linaro.org>
References: <20180105235805.9948-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

The installed resource table is no longer accessible after stopping the
remote, so update table_ptr to point to the local copy.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 84e07d5b7c2c..4170dfbd93bd 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1000,6 +1000,9 @@ static int rproc_stop(struct rproc *rproc)
 	/* remove any subdevices for the remote processor */
 	rproc_remove_subdevices(rproc);
 
+	/* the installed resource table is no longer accessible */
+	rproc->table_ptr = rproc->cached_table;
+
 	/* power off the remote processor */
 	ret = rproc->ops->stop(rproc);
 	if (ret) {
-- 
2.15.0
