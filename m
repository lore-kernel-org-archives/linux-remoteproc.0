Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DCD34EEE7
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466001; cv=none; b=ZPd45jpxbXCNP9N7kuTpvgRymPhH5VxYUSGqZMptVUSiqsYnLLhj0ZSwCySeu9CGMQ7fMoo6qTMWU+PbQZYGsi7xFjTLv76sBcPflPPaaSZv2qXdvbeUt5C3YalK1t/ggCdH87hmXLhGwytcip923G97XkNFU/YKQr0m/LYdfF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466001; c=relaxed/simple;
	bh=JuW09jaLv43h6WkzRWhWfuWSNmoTe2++rTIaF6Qpk84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsSVvfmgRPz23Ieot5XEC0NrLbxdDs7Qr4oux1FDCYCg/+zV+htaoc/xl0XxYE/AMCGcG+s1L+Bz4EcB4VWufJ+nyvHjLPDWyBQYxGj+3Ib61/5JkNJZwspH0NwLUndgLUtBYX/HivpM2mbXsA8tJrdFNsFrpRiePRXgKGbso7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tf04pAlI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OObF0pAa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tf04pAlI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OObF0pAa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHDHN585582
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L+D7Q3NsycO
	SbfPPL0GRxbVBpYFPZc9f/EDs+I5ad30=; b=Tf04pAlIBp75im9QuAsTxSSQzbd
	RCJsiqkGH7EZNvcEzo+j5D7chO2dvtQYsFwLFA+Or04UbjcbVzAcExuZs2ocapBa
	EiMl9nQTFtHcOnRWJz9va1KW3nOxcChfOySSsrZIP9oQTHJT5d5RXNptX4nCyzJl
	5pJB0WxV+oVMPOq2eDUoyYkn/3ieuWIqVpzs8PXkpzLLbOa7YqZ7MhlfNhpGsUA8
	e2R/kFZDMPFMmyfKKuKI0+9z4m6KiFZmaXIHjjpZW+hEAXsmyxkchcegrZnM3MzF
	qtwL3uigb8cc7nXGFPTSdj/S/fP/iCowb34uyrfqsOH6IMkdEeojPWbhyOA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp3jum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 19:13:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35b8f351debso383342a91.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Mar 2026 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774465999; x=1775070799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+D7Q3NsycOSbfPPL0GRxbVBpYFPZc9f/EDs+I5ad30=;
        b=OObF0pAaWmeupe+QX4PlQ9msfigwUQK68LRjkhuYy10QghNoC/xDXl826AK1BysLLR
         UibvP7cwPb5twnZpN+CBSKu/78wiDHQ0Czb112TBv3AZ4/tA0bd9tCBvd6xDDDOghD1J
         gyZ7+2C/jGoqD73qoU8V+h1nOsoLIVuw4N8xf2SGwRx4i+pLcmvVAc1/LqWjBxwsW2z9
         uqZtniPeKpMkqW2RLoSYBcgi+F2F13x4M0hsdJGZvVJL6sZdYrjjmDpXVB6djuoE7SSC
         b+uVC+N8Yyx7BgUrYPf9HIW+NdczEbhTvsc0f+CTfJN1eFzRCc17TCrzv678AcZ+gV+X
         JIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465999; x=1775070799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+D7Q3NsycOSbfPPL0GRxbVBpYFPZc9f/EDs+I5ad30=;
        b=jNYkye6n3mV5wxvgiuI78Jx3HXIbwEHp3rBMrzFYwt+0LC48x35LnKNL2uVZ82Buc1
         yKqSox97rP+ajCDOsSiSyVTYC8LVRRL7QpWqGfCethbuqOCn+ZD7NtHGkM/pmOXECtq4
         0LQCUAq33xsdRt0tOHnQbr6e7fAq1nq251DGXf+dwEd0M9hEIEtfA+9yvmc+CFVHt3yY
         p6mm3+CTpULU131FW/ToqKfI3p7S6P67S5mGAfSQzkOGD43/OSo0UR+nLUo/H2svuK9l
         l2ZY/V+Nr3q/EqEDhJBeViaYPIlza5vLQu8uKvSnb085tKJJBsm4Y0lZjl2d0/aPqEAp
         Qfvw==
X-Forwarded-Encrypted: i=1; AJvYcCXg/TD8dc/iBssrFo43kyALL4gWHR8rF4Xjx3hCc4I1TzAywn6c81KWbFLKBbL6++PGdfaAsz4iW1AfXO0ZrC2n@vger.kernel.org
X-Gm-Message-State: AOJu0YydoLk6zjo/OXxiov7N3GWbPZFpG/CPmnTroq6txTU4DQi5afBJ
	8vEVaRDB/uPdiBQ4aUcX9qX0xz292gyyE71oNJgAQJkOthlyeRnJm2U1GD7ITvijOK0xa43mwB/
	M+/qSlC4yKOvdxUP3dRp22Qn+G42FBSN741983+Hd4mJ2Zsl7K5Cwldx0t4Q7G7nozXLqvLh+
X-Gm-Gg: ATEYQzzdudzTpUtRChRxLiwUsHa+KQKfnW9Edn2dJm9PoDvGn4ntRbddMNnxv8YiQ3f
	r0o1kSKIRQm/qEELU4PeVimyW7j/kfPO+bCmBM/FGEqhCGBrBA3z7cNQThx7IeH0AvoCoG0P8xY
	RApipvuDp0320peqH1RJ1onceEg8nNtOcYK9COssschJoVpi4WitlM9Rzn0pksUD88hsZqXOp5a
	Ko66R8wp5v2Sronmodj/e+hgCqmtoEO6+8vev6/dmPM4P5ywUfX2nniXO55HYivE3WvjWJB1Ub8
	v+B8uxKSKTXjAuXDdBG5BJqscAhWUcQcdz+92RTF60r4osloPvtzgdin+su5v5QMQ2q2J6lyUbg
	7ZL4ZKEQbD4n014Mb+1DBCexBU0Ozm41OAAuzObUFsNjFBw0c
X-Received: by 2002:a17:90b:3a05:b0:35b:e4f8:55ab with SMTP id 98e67ed59e1d1-35c0dce9bd4mr4589554a91.6.1774465998585;
        Wed, 25 Mar 2026 12:13:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3a05:b0:35b:e4f8:55ab with SMTP id 98e67ed59e1d1-35c0dce9bd4mr4589520a91.6.1774465997967;
        Wed, 25 Mar 2026 12:13:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1dd36ef9sm76379a91.4.2026.03.25.12.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:13:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
Date: Thu, 26 Mar 2026 00:43:00 +0530
Message-ID: <20260325191301.164579-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xxHlCpGBstyKJBC_-u3eHm0c2JyIGcBY
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c433cf cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGcaN23jOmXheONn8IMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: xxHlCpGBstyKJBC_-u3eHm0c2JyIGcBY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MCBTYWx0ZWRfX5YYBgYmtw3Eu
 0AfGzKG/j+A2Xl7WaMAhiH0WdNRJatod/kFHf8gntmmonU2ZL2FLvGH3sMF6qiZMVEP8E5yqC4j
 eo48ogtaJ1Br8qs6INFY79kznsEx6tbgYUZnncHGb5MVltLVLzJRnDje4CTztMtctAWe/D+SPt3
 JkmVlowXmoDlpUosyjkfiMa1t8D8jtHuAts3oigcQI0avfeAOFgT28Uz9uZOLkC1Kx+4a4Bo41v
 HUT31E0BMVM9KxyBTX3CwuFgBg7xnMETnzeUSVxnDurkVQoYrFGJNvCMfduJ2OcTwx6wEnQERFW
 Dt8IruOAyrfqwzuIfk4WN584ZL6+TDM/IFACQCi5jb8aoUrplXXIRzg2Xdyo4+XobKN+WghfLXB
 iN0+Y0oK/H69ECvHLZ+jSHfZvn8ZXZ91YjqIdpPcUy6PaKc/d4guKzghP0NyS4yH5Ke+r8KRRhC
 9NCKlIqekrahAS1bfdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250140

Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
Peripheral Authentication Service (PAS), always map the MBA region before
use and unmap it once the usage is complete. This behavior was introduced
to avoid issues seen in the past where speculative accesses from the
application processor to the MBA region after it was assigned to the remote
Q6 led to an XPU violation. The issue was mitigated by unmapping the region
before handing control to the remote Q6.

Currently, most Qualcomm SoCs using the PAS driver run either with a
standalone QHEE or the Gunyah hypervisor. In these environments, the
hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
violations cannot occur.

However, when the same SoC runs Linux at EL2, Linux itself must perform the
unmapping to avoid such issues. It is still correct to apply this mapping/
unmapping sequence even for SoCs that run under Gunyah, so this behavior
should not be conditional.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
Changes in v2: https://lore.kernel.org/lkml/20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com/
 - Moved map/unmap to pas_load function and further to coredump/minidump function.

 drivers/remoteproc/qcom_q6v5_pas.c  | 40 ++++++++++++++++++++---------
 drivers/soc/qcom/mdt_loader.c       | 18 ++++++++++---
 include/linux/soc/qcom/mdt_loader.h |  4 +--
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3bde37ac510c..c8c143fea1b4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -148,7 +148,16 @@ static void qcom_pas_minidump(struct rproc *rproc)
 	if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
 		return;
 
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return;
+	}
+
 	qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
 }
 
 static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
@@ -241,7 +250,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
+					pas->dtb_firmware_name,
 					&pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
@@ -321,7 +330,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				pas->mem_region, &pas->mem_reloc);
+				&pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -512,6 +521,22 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static void qcom_pas_coredump(struct rproc *rproc)
+{
+	struct qcom_pas *pas = rproc->priv;
+
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return;
+	}
+
+	rproc_coredump(rproc);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -520,6 +545,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.coredump = qcom_pas_coredump,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -637,11 +663,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
-	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->mem_region)) {
-		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(pas->mem_region);
-	}
 
 	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
 						       pas->mem_phys, pas->mem_size);
@@ -660,11 +681,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
 	pas->dtb_mem_size = resource_size(&res);
-	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->dtb_mem_region)) {
-		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
-		return PTR_ERR(pas->dtb_mem_region);
-	}
 
 	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
 							   pas->dtb_mem_phys,
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c004d444d698..33f3543f8e55 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/elf.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -478,22 +479,31 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
  * @firmware:   Name of the firmware used to construct segment file names
- * @mem_region: Memory region allocated for loading the firmware
  * @reloc_base: Physical address adjusted after relocation
  *
  * Return: 0 on success or a negative error code on failure.
  */
 int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
-		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+		      const char *firmware, phys_addr_t *reloc_base)
 {
+	void *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
-				     ctx->mem_size, reloc_base);
+	mem_region = ioremap_wc(ctx->mem_phys, ctx->mem_size);
+	if (!mem_region) {
+		dev_err(ctx->dev, "unable to map memory region: %pa+%zx\n", &ctx->mem_phys,
+			ctx->mem_size);
+		return -EINVAL;
+	}
+
+	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
+				    ctx->mem_size, reloc_base);
+	iounmap(mem_region);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 82372e0db0a1..7c551b98e182 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -21,7 +21,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
-		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+		      const char *firmware, phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
@@ -47,7 +47,7 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
-				    void *mem_region, phys_addr_t *reloc_base)
+				    phys_addr_t *reloc_base)
 {
 	return -ENODEV;
 }
-- 
2.53.0

