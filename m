Return-Path: <loic.pallardy@st.com>
From: Loic Pallardy <loic.pallardy@st.com>
Subject: [PATCH v2 1/7] remoteproc: correct rproc_mem_entry_init() comments
Date: Thu, 10 Jan 2019 14:49:05 +0100
Message-ID: <1547128151-44077-2-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
References: <1547128151-44077-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Add alloc parameter description and correct comment
about release one.

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 54ec38fc5dca..c1a66e25b173 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -900,7 +900,8 @@ EXPORT_SYMBOL(rproc_add_carveout);
  * @dma: dma address
  * @len: memory carveout length
  * @da: device address
- * @release: memory carveout function
+ * @alloc: memory carveout allocation function
+ * @release: memory carveout release function
  * @name: carveout name
  *
  * This function allocates a rproc_mem_entry struct and fill it with parameters
-- 
2.7.4
