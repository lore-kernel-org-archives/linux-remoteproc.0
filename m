Return-Path: <bjorn.andersson@linaro.org>
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/5] remoteproc: qcom: mdt_loader: Don't overwrite firmware object
Date: Mon, 30 Jan 2017 08:55:44 -0800
Message-Id: <20170130165547.4344-2-bjorn.andersson@linaro.org>
In-Reply-To: <20170130165547.4344-1-bjorn.andersson@linaro.org>
References: <20170130165547.4344-1-bjorn.andersson@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.com>, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

The "fw" firmware object is passed from the remoteproc core and should
not be overwritten, as that results in leaked buffers and a double free
of the the last firmware object.

Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
Cc: stable@vger.kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_mdt_loader.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_mdt_loader.c b/drivers/remoteproc/qcom_mdt_loader.c
index 2ff18cd6c096..2393398f63ea 100644
--- a/drivers/remoteproc/qcom_mdt_loader.c
+++ b/drivers/remoteproc/qcom_mdt_loader.c
@@ -116,6 +116,7 @@ int qcom_mdt_load(struct rproc *rproc,
 	const struct elf32_phdr *phdrs;
 	const struct elf32_phdr *phdr;
 	const struct elf32_hdr *ehdr;
+	const struct firmware *seg_fw;
 	size_t fw_name_len;
 	char *fw_name;
 	void *ptr;
@@ -154,16 +155,16 @@ int qcom_mdt_load(struct rproc *rproc,
 
 		if (phdr->p_filesz) {
 			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
-			ret = request_firmware(&fw, fw_name, &rproc->dev);
+			ret = request_firmware(&seg_fw, fw_name, &rproc->dev);
 			if (ret) {
 				dev_err(&rproc->dev, "failed to load %s\n",
 					fw_name);
 				break;
 			}
 
-			memcpy(ptr, fw->data, fw->size);
+			memcpy(ptr, seg_fw->data, seg_fw->size);
 
-			release_firmware(fw);
+			release_firmware(seg_fw);
 		}
 
 		if (phdr->p_memsz > phdr->p_filesz)
-- 
2.11.0
