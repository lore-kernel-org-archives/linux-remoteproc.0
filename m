Return-Path: <peng.fan@nxp.com>
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 2/2] remoteproc: use filesz as backup when translate memsz fail
Date: Thu,  9 Apr 2020 16:22:52 +0800
Message-Id: <1586420572-28353-2-git-send-email-peng.fan@nxp.com>
In-Reply-To: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
Return-Path: peng.fan@nxp.com
MIME-Version: 1.0
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Since we no need memset if memsz is larger than filesz, we could
use filesz for the da to va translation when memsz translation fail.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index cc50fe70d50c..74d425a4b34c 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -229,8 +229,16 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		if (!ptr) {
 			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
 				memsz);
-			ret = -EINVAL;
-			break;
+
+			ptr = rproc_da_to_va(rproc, da, filesz);
+			if (!ptr) {
+				dev_err(dev,
+					"bad phdr da 0x%llx mem 0x%llx\n",
+					da, filesz);
+				ret = -EINVAL;
+				break;
+			}
+
 		}
 
 		/* put the segment where the remote processor expects it */
-- 
2.16.4
