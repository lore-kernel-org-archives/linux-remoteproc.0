Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 11/18] remoteproc: Add child node component in rproc match list
Date: Thu, 16 Apr 2020 18:13:24 +0200
Message-ID: <20200416161331.7606-12-arnaud.pouliquen@st.com>
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, arnaud.pouliquen@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add the components, associated to the child devices populated, in
the match list for synchronization relying on bind/unbind mechanism.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 75f84fd3bd60..ecb36f64b1a0 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1608,6 +1608,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
 static int rproc_platform_populate(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
+	struct device_node *node = dev->of_node;
+	struct device_node *child_np;
 	int ret;
 
 	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
@@ -1617,6 +1619,19 @@ static int rproc_platform_populate(struct rproc *rproc)
 		goto depopulate;
 	}
 
+	child_np = of_get_next_available_child(node, NULL);
+
+	while (child_np) {
+		of_node_get(node);
+		component_match_add_release(dev, &rproc->match,
+					    rproc_release_of, rproc_compare_of,
+					    child_np);
+		child_np = of_get_next_available_child(node, child_np);
+	}
+
+	if (!rproc->match)
+		dev_dbg(dev, "No available child\n");
+
 	return 0;
 
 depopulate:
-- 
2.17.1
