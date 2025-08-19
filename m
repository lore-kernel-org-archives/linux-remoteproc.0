Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDC306D5F
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622570; cv=none; b=a36qOp1rk8E7twTT3z9SiqhmFYvRV3HYiVJmgDbTpMeBf4wh1tJObW/OTtmb0mGNGtiBgo/axM2WvMgWJkhbNm6g109pRnJpznvElLYvY7OC3aP62csAHDiHaVcHyamft6jZ3Mt2ouF5zBJHssJXFNvrq6BOX9RwnFlSHuxj6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622570; c=relaxed/simple;
	bh=4ddIxvA0hH2mxKgfv6MJY3eyB2GVx5N6CjAeCWH79KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axpmXnif1AX5gTyqweJuyqjQgF/iIVaCP3wGlAOOc4eEllzXIgC32lu2YQGhaL+gh9SOVyAEUDizsNibjZw6/sveycWDh6kSHR+PW6EBf6jcivU0uP/HV6KhEu3hkKKoKzEQjNkGVOyv0OqDmhZo/nwxSpYJ4/looDOGUqFZ6Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SobHllPW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SobHllPW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Zqi029790
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fwtoFh3kbTj
	shFkNb7Zh2kYEycwDTbRcgDbn16CiXI0=; b=SobHllPW2sSiKrpl/VQRv+jiiRS
	kZROaXacbWCM1uLOgoRb4YoqbVCHOdSUkXTGHppfrX2FvG4g25dFUM+AoKILMRAD
	xBxGVwXMlhtF8s4PVvLM3wqD2D1wiEX8YPXapJiDtrfrIT+FLBVRRhksUiyM5VJM
	DpEQrMm2iuuwkI3K9n9e2nToInUH/Ap2hKiQenhh+7hhv+1AARmmnPsTjzFd7+3W
	asRmqiVANYvdNpEtNEdAZC0QPvEpOnj0o3MflbCiuEccJK6CdegHpVJyTSLLNnSc
	AXIW6Z4S1HOlzWmxX45mmD0hcQbacVNxO1CJEP06LtBKps4p1RD3inQQzJw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mh6bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:56:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581ce13aso113192805ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 09:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622567; x=1756227367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwtoFh3kbTjshFkNb7Zh2kYEycwDTbRcgDbn16CiXI0=;
        b=Pkq1wX+UrwHe7MlhLmvufYKpf2/HJNK/Qqs+FWeqofcC0wZNLA5hrzBvy7JM+wJw/r
         qdmtz6uFMfdddyh5xa3ggXAT1X06MOHFvcCPOXwGZSPC+m4MakPXQelMVA6nJ0OrotXW
         7jP8fT1i3iw7dWv43DJhiizbviUrfvP66yf2TJgHwPJ65EagPFuV/nzwPO1Eqc6r/p5B
         cW1LaVBsHQhMEn1AciEvhn85h69d7SdStVlzxhkAuBKYRqJ4eI/dIEk5OtBu3UXlaoFY
         GCrYSHpJXr35KWEIAcRBnO1Qp8PnWxQ2XbfCOK6PcE7IDRVRSKKxZg4DYulbQ6Eu0kSk
         jHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMd3Gp47Z+3LPSrJev4yTEVjh09pUQwlCXIGXOTxgSMBHYWhqz69QbM1/vwDmGyniQoztDnxD/IUIaqjyKDb3t@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4tasYzUK6/GAK3PGWVY1KTrkEsbZ4WcCMISTcLDmWOv7bxiij
	jJq7POH9YV8Fsk46sp9BH1BHGy+X/UNbso+p9UTUav06v+cl0JKWPmpRkepMAiPwFTkN0OWwez6
	SDuJRNpSs6gwLPs6i+KxSHADnerP+DxxJU6r4KTZek+q5rv4HaOF30iUaVJwudPAY+dTrY/iu
X-Gm-Gg: ASbGnctsL1+1PzN9q7yA6iOFtSQ6tFnW1wFnwuTCRkRpDdhPR4gJI9fQsBsVWgkqQmM
	4hSl7l1TCNqLu8G92N7mpnwstNGDr3a75gwJef9N88t8e7mrFEulUAzpH1utJ0mcL1jhR9olUYi
	dwaP0PhQhfw2tTWD/qEJkdPyjwAaDrR/5TW3HaPdGBKd6DYL6d48V+FE1KrODG0wxR1PSXNfrmh
	9tiuIsRG5NvkD0ooSdeFJiNZtaB3Nc9p6jmkSNBoipAdfzepFoaGbbk5REO5IpKrHhCZfc/lKfo
	Dp7JeJIuqtC6xEJtfTEj+rHxxII3xqQVCFjWt2zT2t8VWG3IbqbMRSjhZo0R8kpyCXQ=
X-Received: by 2002:a17:902:ea11:b0:242:9bbc:6018 with SMTP id d9443c01a7336-245e051092bmr51315325ad.56.1755622566634;
        Tue, 19 Aug 2025 09:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECdBDJr9BaOa9/J98OCpO/ByhVvfRXLinprKgpMUZLUWytix2y9gTMERA8CUJSmYI74CBLNw==
X-Received: by 2002:a17:902:ea11:b0:242:9bbc:6018 with SMTP id d9443c01a7336-245e051092bmr51314965ad.56.1755622566169;
        Tue, 19 Aug 2025 09:56:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:56:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU managed by Linux
Date: Tue, 19 Aug 2025 22:24:46 +0530
Message-ID: <20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a4aca7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BWwITLIJPpf_DTsiswIA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G1Cb-Vd_ELddrq6jqGjbe4V569aHDX4C
X-Proofpoint-GUID: G1Cb-Vd_ELddrq6jqGjbe4V569aHDX4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX382JX1FTKo4u
 7Jr8V5enjGTmYBEVxXhpeygFgv7YdYKugFKDiHiYfeKP7R8SqXQStscUAyUsFb49zCqee6IFTRv
 OEFt9NPPdFf04wz534KAeXpEe2SlapXx0YP9EtSDzeR5XM8bkTg4knCQJ+jGANDVewrHkU6prD8
 sLGTj0VWaUWGYJUDBrk1dk9ypYrHM/+m3G1XmsZb7LXicN3/x7iY/AbpzvqgYhnxQzi48sswkn2
 9g/sAMnIjsmcU6dtAEzA0+MCLfw+oFlo8NiOmYWZzsumFajHDTSnAatnNzTPHeHe/3jeo0Mghr2
 ZK4/2BinQPwIuFABtIwA7Jro7WLAB2xgOJbz6AfJw7I8amAFm+YXPYo4OtcYwV7DBXrM2xOpiJk
 lzSfuQ8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is required
to enable memory protection for both remoteproc metadata and its memory
regions.

When the hypervisor is absent, the operating system must perform these
configurations instead.

Support for handling IOMMU and SHM setup in the absence of a hypervisor
is now in place. Extend the Iris driver to enable this functionality on
platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).

Additionally, the Iris driver must map the firmware and its required
resources to the firmware SID, which is now specified via the device tree.

Co-developed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c  |   9 +-
 drivers/media/platform/qcom/iris/iris_core.h  |   6 +
 .../media/platform/qcom/iris/iris_firmware.c  | 156 ++++++++++++++++--
 .../media/platform/qcom/iris/iris_firmware.h  |   2 +
 4 files changed, 155 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 0fa0a3b549a2..57417d4d7e05 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -17,6 +17,7 @@ void iris_core_deinit(struct iris_core *core)
 	mutex_lock(&core->lock);
 	iris_fw_unload(core);
 	iris_vpu_power_off(core);
+	iris_fw_deinit(core);
 	iris_hfi_queues_deinit(core);
 	core->state = IRIS_CORE_DEINIT;
 	mutex_unlock(&core->lock);
@@ -65,10 +66,14 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_queue_deinit;
 
-	ret = iris_fw_load(core);
+	ret = iris_fw_init(core);
 	if (ret)
 		goto error_power_off;
 
+	ret = iris_fw_load(core);
+	if (ret)
+		goto error_firmware_deinit;
+
 	ret = iris_vpu_boot_firmware(core);
 	if (ret)
 		goto error_unload_fw;
@@ -83,6 +88,8 @@ int iris_core_init(struct iris_core *core)
 
 error_unload_fw:
 	iris_fw_unload(core);
+error_firmware_deinit:
+	iris_fw_deinit(core);
 error_power_off:
 	iris_vpu_power_off(core);
 error_queue_deinit:
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index aeeac32a1f6d..57eeefb38f22 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -73,6 +73,12 @@ struct iris_core {
 	int					irq;
 	struct v4l2_device			v4l2_dev;
 	struct video_device			*vdev_dec;
+	bool					has_iommu;
+	struct video_firmware {
+		struct device *dev;
+		struct qcom_scm_pas_ctx *ctx;
+		struct iommu_domain *iommu_domain;
+	} fw;
 	const struct v4l2_file_operations	*iris_v4l2_file_ops;
 	const struct v4l2_ioctl_ops		*iris_v4l2_ioctl_ops;
 	const struct vb2_ops			*iris_vb2_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index f1b5cd56db32..e3f2fe5c9d7a 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -3,10 +3,18 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/device.h>
 #include <linux/firmware.h>
-#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/kernel.h>
+#include <linux/iommu.h>
+#include <linux/io.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/sizes.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
 #include "iris_core.h"
@@ -17,15 +25,14 @@
 static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 {
 	u32 pas_id = core->iris_platform_data->pas_id;
+	struct qcom_scm_pas_ctx *ctx;
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
-	struct reserved_mem *rmem;
-	struct device_node *node;
-	phys_addr_t mem_phys;
-	size_t res_size;
-	ssize_t fw_size;
-	void *mem_virt;
-	int ret;
+	struct reserved_mem *rmem = NULL;
+	struct device_node *node = NULL;
+	ssize_t fw_size = 0;
+	void *mem_virt = NULL;
+	int ret = 0;
 
 	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
 		return -EINVAL;
@@ -39,36 +46,64 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	if (!rmem)
 		return -EINVAL;
 
-	mem_phys = rmem->base;
-	res_size = rmem->size;
+	if (core->has_iommu)
+		dev = core->fw.dev;
 
+	ctx = qcom_scm_pas_ctx_init(dev, pas_id, rmem->base, rmem->size, false);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->has_iommu = core->has_iommu;
 	ret = request_firmware(&firmware, fw_name, dev);
 	if (ret)
 		return ret;
 
 	fw_size = qcom_mdt_get_size(firmware);
-	if (fw_size < 0 || res_size < (size_t)fw_size) {
+	if (fw_size < 0 || rmem->size < (size_t)fw_size) {
 		ret = -EINVAL;
 		goto err_release_fw;
 	}
 
-	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
+	mem_virt = memremap(rmem->base, rmem->size, MEMREMAP_WC);
 	if (!mem_virt) {
 		ret = -ENOMEM;
 		goto err_release_fw;
 	}
 
-	ret = qcom_mdt_load(dev, firmware, fw_name,
-			    pas_id, mem_virt, mem_phys, res_size, NULL);
+	ret = qcom_mdt_pas_load(ctx, firmware, fw_name, mem_virt, NULL);
 	if (ret)
 		goto err_mem_unmap;
 
-	ret = qcom_scm_pas_auth_and_reset(pas_id);
+	if (core->has_iommu) {
+		ret = iommu_map(core->fw.iommu_domain, 0, rmem->base, rmem->size,
+				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
+		if (ret)
+			goto err_mem_unmap;
+
+		/*
+		 * Firmware has no support for resource table for now, so, lets
+		 * pass NULL and zero for input resource table and input resource
+		 * table respectively.
+		 */
+		ret = qcom_mdt_pas_map_devmem_rscs(ctx, core->fw.iommu_domain, NULL, 0);
+		if (ret)
+			goto err_unmap_carveout;
+	}
+
+	ret = qcom_scm_pas_prepare_and_auth_reset(ctx);
 	if (ret)
-		goto err_mem_unmap;
+		goto err_unmap_devmem_rscs;
+
+	core->fw.ctx = ctx;
 
 	return ret;
 
+err_unmap_devmem_rscs:
+	if (core->has_iommu)
+		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
+err_unmap_carveout:
+	if (core->has_iommu)
+		iommu_unmap(core->fw.iommu_domain, 0, rmem->size);
 err_mem_unmap:
 	memunmap(mem_virt);
 err_release_fw:
@@ -109,10 +144,97 @@ int iris_fw_load(struct iris_core *core)
 
 int iris_fw_unload(struct iris_core *core)
 {
-	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
+	struct qcom_scm_pas_ctx *ctx;
+	int ret;
+
+	ctx = core->fw.ctx;
+	ret = qcom_scm_pas_shutdown(ctx->peripheral);
+	if (core->has_iommu) {
+		iommu_unmap(core->fw.iommu_domain, 0, ctx->mem_size);
+		qcom_mdt_pas_unmap_devmem_rscs(ctx, core->fw.iommu_domain);
+	}
+
+	return ret;
 }
 
 int iris_set_hw_state(struct iris_core *core, bool resume)
 {
 	return qcom_scm_set_remote_state(resume, 0);
 }
+
+int iris_fw_init(struct iris_core *core)
+{
+	struct platform_device_info info;
+	struct iommu_domain *iommu_dom;
+	struct platform_device *pdev;
+	struct device_node *np;
+	int ret;
+
+	np = of_get_child_by_name(core->dev->of_node, "video-firmware");
+	if (!np)
+		return 0;
+
+	core->has_iommu = true;
+	memset(&info, 0, sizeof(info));
+	info.fwnode = &np->fwnode;
+	info.parent = core->dev;
+	info.name = np->name;
+	info.dma_mask = DMA_BIT_MASK(32);
+
+	pdev = platform_device_register_full(&info);
+	if (IS_ERR(pdev)) {
+		of_node_put(np);
+		return PTR_ERR(pdev);
+	}
+
+	pdev->dev.of_node = np;
+
+	ret = of_dma_configure(&pdev->dev, np, true);
+	if (ret) {
+		dev_err(core->dev, "failed to allocate domain\n");
+		goto err_unregister;
+	}
+
+	core->fw.dev = &pdev->dev;
+
+	iommu_dom = iommu_get_domain_for_dev(core->fw.dev);
+	if (!iommu_dom) {
+		dev_err(core->fw.dev, "Failed to get iommu domain\n");
+		ret = -EINVAL;
+		goto err_iommu_free;
+	}
+
+	ret = iommu_attach_device(iommu_dom, core->fw.dev);
+	if (ret) {
+		dev_err(core->fw.dev, "could not attach device\n");
+		goto err_iommu_free;
+	}
+
+	core->fw.iommu_domain = iommu_dom;
+
+	of_node_put(np);
+
+	return 0;
+
+err_iommu_free:
+	iommu_domain_free(iommu_dom);
+err_unregister:
+	platform_device_unregister(pdev);
+	of_node_put(np);
+	return ret;
+}
+
+void iris_fw_deinit(struct iris_core *core)
+{
+	struct iommu_domain *iommu_dom;
+
+	if (!core->has_iommu)
+		return;
+
+	iommu_dom = core->fw.iommu_domain;
+	iommu_detach_device(iommu_dom, core->fw.dev);
+	iommu_domain_free(iommu_dom);
+
+	core->fw.iommu_domain = NULL;
+	platform_device_unregister(to_platform_device(core->fw.dev));
+}
diff --git a/drivers/media/platform/qcom/iris/iris_firmware.h b/drivers/media/platform/qcom/iris/iris_firmware.h
index e833ecd34887..adde46109966 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.h
+++ b/drivers/media/platform/qcom/iris/iris_firmware.h
@@ -11,5 +11,7 @@ struct iris_core;
 int iris_fw_load(struct iris_core *core);
 int iris_fw_unload(struct iris_core *core);
 int iris_set_hw_state(struct iris_core *core, bool resume);
+int iris_fw_init(struct iris_core *core);
+void iris_fw_deinit(struct iris_core *core);
 
 #endif
-- 
2.50.1

