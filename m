Return-Path: <arnaud.pouliquen@st.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: [RFC 6/6] remoteproc: sti: select srm
Date: Fri, 24 Nov 2017 15:36:42 +0100
Message-ID: <1511534202-12995-7-git-send-email-arnaud.pouliquen@st.com>
In-Reply-To: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, arnaud.pouliquen@st.com, "Loic PALLARDY  <loic.pallardy@st.com>, Fabien DESSENNE" <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Fabien Dessenne <fabien.dessenne@st.com>

Select the remote proc system resource manager for the sti platform

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index a49589e..1ca0ec5 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -154,6 +154,8 @@ config ST_REMOTEPROC
 	select MAILBOX
 	select STI_MBOX
 	select RPMSG_VIRTIO
+	select REMOTEPROC_SRM_CORE
+	select REMOTEPROC_SRM_DEV
 	help
 	  Say y here to support ST's adjunct processors via the remote
 	  processor framework.
-- 
2.7.4
