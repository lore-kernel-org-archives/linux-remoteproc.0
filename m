Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 1/3] remoteproc: Modify FW_RSC_ADDR_ANY definition
Date: Tue, 6 Sep 2016 09:39:42 +0200
Message-ID: <1473147584-13183-2-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
References: <1473147584-13183-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: loic.pallardy@st.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Replace 0xFFFFFFFFFFFFFFFF by -1 to fit any type.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 include/linux/remoteproc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index d488f9e..80e1cba 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -118,7 +118,7 @@ enum fw_resource_type {
 	RSC_LAST	= 4,
 };
 
-#define FW_RSC_ADDR_ANY (0xFFFFFFFFFFFFFFFF)
+#define FW_RSC_ADDR_ANY (-1)
 
 /**
  * struct fw_rsc_carveout - physically contiguous memory request
-- 
1.9.1
