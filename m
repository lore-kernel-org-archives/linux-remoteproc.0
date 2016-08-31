Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 07/19] remoteproc: Add new resource type for resource table spare bytes
Date: Wed, 31 Aug 2016 22:50:10 +0200
Message-ID: <1472676622-32533-8-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
References: <1472676622-32533-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

To allow resource appending to an existing resource table,
remoteproc framework should get information about resource
table spare area. With current resource table construction,
remoteproc is not able to identify by itself any free location.
This patch introduces a new resource type named RSC_SPARE which
allows firmware to define room for resource table extension.
Defined spare area will be used by remtoreproc to extend resource
table.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 include/linux/remoteproc.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d0c0793..4e2f822 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -100,6 +100,7 @@ struct fw_rsc_hdr {
  *		    the remote processor will be writing logs.
  * @RSC_VDEV:       declare support for a virtio device, and serve as its
  *		    virtio header.
+ * @RSC_SPARE:      spare area in resource table for resource appending
  * @RSC_LAST:       just keep this one at the end
  *
  * For more details regarding a specific resource type, please see its
@@ -115,7 +116,8 @@ enum fw_resource_type {
 	RSC_DEVMEM	= 1,
 	RSC_TRACE	= 2,
 	RSC_VDEV	= 3,
-	RSC_LAST	= 4,
+	RSC_SPARE	= 4,
+	RSC_LAST	= 5,
 };
 
 #define FW_RSC_ADDR_ANY (0xFFFFFFFFFFFFFFFF)
@@ -306,6 +308,15 @@ struct fw_rsc_vdev {
 } __packed;
 
 /**
+ * struct fw_rsc_spare - resource table spare area definition
+ * @len: length of spare area in byte
+ */
+struct fw_rsc_spare {
+	u32 len;
+	u8 spare_bytes[0];
+} __packed;
+
+/**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
  * @dma: dma address
-- 
1.9.1
