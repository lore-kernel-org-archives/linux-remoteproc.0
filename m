Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v3 07/20] remoteproc: core: Add RSC_VDEV support to rproc_request_resource
Date: Wed, 12 Oct 2016 18:00:25 +0200
Message-ID: <1476288038-24909-8-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
References: <1476288038-24909-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Add the possibility for platform specific driver to submit resource
request related to VDEV.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 4c6314e..ce62546 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -874,6 +874,7 @@ int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *reso
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_request_resource *request;
+	struct fw_rsc_vdev *v;
 	int size;
 
 	request = devm_kzalloc(dev, sizeof(*request), GFP_KERNEL);
@@ -893,6 +894,12 @@ int rproc_request_resource(struct rproc *rproc, u32 type, u32 action, void *reso
 	case RSC_TRACE:
 		size = sizeof(struct fw_rsc_trace);
 		break;
+	case RSC_VDEV:
+		v = resource;
+		size = sizeof(struct fw_rsc_vdev);
+		size += v->num_of_vrings * sizeof(struct fw_rsc_vdev_vring);
+		size += v->config_len;
+		break;
 	default:
 		dev_err(dev, "Unsupported resource type: %d\n", type);
 		return -EINVAL;
-- 
1.9.1
