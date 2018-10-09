Return-Path: <sibis@codeaurora.org>
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 5/5] remoteproc: qcom: q6v5-mss: Register segments/dumpfn for coredump
Date: Tue,  9 Oct 2018 21:53:39 +0530
Message-Id: <20181009162339.30522-6-sibis@codeaurora.org>
In-Reply-To: <20181009162339.30522-1-sibis@codeaurora.org>
References: <20181009162339.30522-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, tsoni@codeaurora.org, sricharan@codeaurora.org, akdwived@codeaurora.org, kyan@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Register the MDT segments, custom dumpfn and private data with the
remoteproc core dump functionality.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 85db95bfd355..bece5dd46bca 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1065,10 +1065,53 @@ static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
 	return qproc->mpss_region + offset;
 }
 
+static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
+				const struct firmware *mba_fw)
+{
+	const struct firmware *fw;
+	const struct elf32_phdr *phdrs;
+	const struct elf32_phdr *phdr;
+	const struct elf32_hdr *ehdr;
+	struct q6v5 *qproc = rproc->priv;
+	unsigned long segment_cnt = 0;
+	int ret;
+	int i;
+
+	ret = request_firmware(&fw, "modem.mdt", qproc->dev);
+	if (ret < 0) {
+		dev_err(qproc->dev, "unable to load modem.mdt\n");
+		return ret;
+	}
+
+	ehdr = (struct elf32_hdr *)fw->data;
+	phdrs = (struct elf32_phdr *)(ehdr + 1);
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &phdrs[i];
+
+		if (!q6v5_phdr_valid(phdr))
+			continue;
+
+		ret = rproc_coredump_add_custom_segment(rproc, phdr->p_paddr,
+							phdr->p_memsz,
+							(void *)segment_cnt,
+							qcom_q6v5_dump_segment);
+		if (ret)
+			break;
+
+		segment_cnt++;
+	}
+
+	qproc->dump_segment_cnt = segment_cnt;
+	release_firmware(fw);
+	return ret;
+}
+
 static const struct rproc_ops q6v5_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
 	.da_to_va = q6v5_da_to_va,
+	.parse_fw = qcom_q6v5_register_dump_segments,
 	.load = q6v5_load,
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
