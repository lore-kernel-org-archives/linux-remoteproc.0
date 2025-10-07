Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1BD2EA73F
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855800; cv=none; b=OilDbj6euS2zLIFiUyHCnacSgs2lx6VKYdDg7qP9YSL0GDET5fXeg0UhJQpCxKgb+NXujISJrKvRBEuSRoz1msarBcTLZgdT74GU0n8Bk+ycGvPlC5+pcFLlhc+IZ8/tgopU7BDH9ZJVW/t8RDqR95RJiX0aDuJmidRsW2fm4TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855800; c=relaxed/simple;
	bh=gJKqFUZHYzvx7skd+COKa+uj15iUdsIf5S3yo7akmn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0xoXffhk19rgtm+2sLimf5w+kYNqgvrEi03R3afSozsmx7IlwGpLHHVtD6QniXIuh0ncnoWIF1/VZ7xlUeQesSjCZLaTHDepVOdiip9SJ7BTfUyOucACR6KsXtNOaedNuacb5uyF7Lb0WMptLxmTf4ZGr0anP+aojgtZlx2W+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ujd4Rfbq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ujd4Rfbq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETC0B006800
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Oct 2025 16:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gp1xD1m/DskKjBQHramIDkOW0/yEypn06NYGkHNWYWk=; b=Ujd4RfbqSFsS+pbi
	0LXzE/gHaQ+1HxhPtUNCXu5SdO5BLHOWlz9p+XOjyaBa41JJHjvjM2IduJ6uNSza
	iWTsHz4mmslTpqynfDdTeSxy7vIb1dNGl9wr5VrGKrhOQ908wty8lUjgwt+MJ+Td
	EfxSJ0KtMIzXJZ8sibiQ52kd0E4Ix96aYXK8GD3nyY5vNVLOF+fJLMVI/+2Jch+M
	lbPSY1jW5+4KHtfDXgzLdS/4wL6II/3xtteob3ZyUixobJGlkD4PRUNd4t7Cc/xH
	4CBgj2dxNKA1o6iwaLI2dZC0coT68OmTc6SokhO4lHIafoCUG73/4IyaVdzoZDo6
	wjwMvA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1qw1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 16:49:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6fbaso85133755ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 09:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855796; x=1760460596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gp1xD1m/DskKjBQHramIDkOW0/yEypn06NYGkHNWYWk=;
        b=EIYRYs9SdX/MsaAC64O3NAIi55v68GdBlhclRuFY+7tXM2a07pHasSRc/Om2SIFZwu
         4XqIZdaV4BbFU4oXNY7lYIA22DCl5n4a215RuZka2ZMg3sPn1Rv7LBavaOgK7cwNM652
         HIiU/JjnfAgmmQ+AyItUBUmC26YUQwNNLSdyht3Pj4NwGcNGFn6bPG/YtbHbgkvyX1YI
         v1SDS8Mh7DdWVaZX/BZWh3dOk6fD0MHbpGJIUBr3EJaTu1Zb2SnHvEwNH81oRj5slNF3
         YRj9xUiVHyYjnG7K+4la6yKIuuZC6L156LY4g1rUl2G2VWsfwCU2Kn8rCzqkTpsJKX2L
         RUwg==
X-Forwarded-Encrypted: i=1; AJvYcCUgDuYrXtUrLa6W+LZVc1v1OJN03S0PcHs/bZycCNsD3sz9Imrb4a92mYQsHKhmSFdXqQ2GIhYI8CS6Rj6DpMqs@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgp45qyYhAm3eNURC/yoi652Z5S6ns/CJ0MFoILVzhizkajdF1
	D3+FzDFhwQkcFlBXCZGOB1kDfnyjTOYg+i6Dh89rdOGtzrGk6K/ga6h5S5q8fhMZlvgWwzYl8Ru
	6qsKiHBuHcTN1gDOJCgdTncb8nwuzKDJARldTJWP0wVfOUFKGRx2df/1/ZEndb0kP99mmpDaX
X-Gm-Gg: ASbGncvu00GqNyakbdyn0LgYKagdg8sMSKgyxtcJ+IfyNPQHAiSFSfUftTxeO3XYZFG
	w57biD126tXY/O/aXjrC0qppY6GlBhFMQ5qiiwmhwqfeCKO/GHN0aCfvhmdRjrFmm6WJp4uYxWI
	batrNSM4yps5zft2rFw+tG4HxExBo7d/E7/PFCu/Icgh4AGRUV50Gmn2gSX/KH7QAmE38diM7P2
	Mrplt11S1NRJzEnrc9sWZeP+B0gq5NMmyxdC8x9xWM3B6FCIX9Y/vUuSQc+kLtY9kNCZIqJ2Upf
	NU9xSsZJ0/TJ3txHvYcqRryXur2esKjfElxCKF78BG8UKjWmKJD59gwK8AGcBr4ryM1ESvs5
X-Received: by 2002:a17:902:ccc8:b0:28d:18d3:46ce with SMTP id d9443c01a7336-290273ed885mr4400865ad.31.1759855796142;
        Tue, 07 Oct 2025 09:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXmn9mJzR2s1aE87b6mgEAGEI6jvhRvRbkXkx/f7MApydYJUTAm6MtSAssMfKNQdrihGqjmg==
X-Received: by 2002:a17:902:ccc8:b0:28d:18d3:46ce with SMTP id d9443c01a7336-290273ed885mr4400415ad.31.1759855795396;
        Tue, 07 Oct 2025 09:49:55 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:55 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:56 +0530
Subject: [PATCH v4 11/12] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-11-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=5694;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=gJKqFUZHYzvx7skd+COKa+uj15iUdsIf5S3yo7akmn0=;
 b=99EcZ89WiQrXLaw076CmJ14XhkhyvRFWhtcGqy/Z12tcB2y1ipeoJc7PCkFkCJJNk+UDRg8AV
 ZxPn6EwyAt6Ahiga86E70U9X/CyCRkHDUOmL3okAdubHsbJ6qqR3J/z
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: cPr1zhv9pRSaQ4cKDlhurIKbCYKLuPaH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX+ZMlfph5yCbu
 /uFDpdYSkg0eRte+itZSKdWKFH+JfAqVijLr5kBvou/4Wq8ulvbHrR7rU8J7w5WP4Kr+A5QlJoL
 nPaRd9kW8xkjzBvgTh4Z5y4Q3R1Rcg5SKWwgVnKawmSzrD0BqYxkjpSNktZ5nL5O3tN8aNSIozS
 U4no+6D0f3SGPCrXAcHyQwuSJONKaei87Rrkr82v6HOCsZBN4isNBXoxz3QbtHfLpgEwpBDyWiw
 PXFrHgs2tPlbkDAFTedbnn7oXlSkEE0JMT1E//5q73wwnp3dlI9j290VVm5Ha9NM7J+vgs0q171
 GiI1xzLQY7Ut7MQvgP8omzWbs4X/SsVxX+KcTFFpojtowSzl+g+A3Ybf6QdAAfHnyJfusLC6F99
 LK4YVtf2InAP4nSf11EGcB0q8L1a5g==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e544b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=58pnfTnN0ARRJNaB1lkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cPr1zhv9pRSaQ4cKDlhurIKbCYKLuPaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

Most Qualcomm platforms feature Gunyah hypervisor, which typically
handles IOMMU configuration. This includes mapping memory regions and
device memory resources for remote processors by intercepting
qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
during teardown. Additionally, SHM bridge setup is required to enable
memory protection for both remoteproc metadata and its memory regions.
When the aforementioned hypervisor is absent, the operating system must
perform these configurations instead.

When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
own device tree overlay file that specifies the firmware stream ID now
managed by Linux for a particular remote processor. If the iommus
property is specified in the remoteproc device tree node, it indicates
that IOMMU configuration must be handled by Linux. In this case, the
has_iommu flag is set for the remote processor, which ensures that the
resource table, carveouts, and SHM bridge are properly configured before
memory is passed to TrustZone for authentication. Otherwise, the
has_iommu flag remains unset, which indicates default behavior.

Enables Secure PAS support for remote processors when IOMMU configuration
is managed by Linux.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 61 ++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ed7bd931dfd5..940fd89d4fc4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -255,6 +256,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
+{
+	if (rproc->has_iommu)
+		iommu_unmap(rproc->domain, mem_phys, size);
+}
+
+static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
+{
+	int ret = 0;
+
+	if (rproc->has_iommu)
+		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
+				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	return ret;
+}
+
 static int qcom_pas_start(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -289,11 +306,15 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	if (pas->dtb_pas_id) {
-		ret = qcom_scm_pas_auth_and_reset(pas->dtb_pas_id);
+		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		if (ret)
+			goto disable_px_supply;
+
+		ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
 			dev_err(pas->dev,
 				"failed to authenticate dtb image and release reset\n");
-			goto disable_px_supply;
+			goto unmap_dtb_carveout;
 		}
 	}
 
@@ -304,18 +325,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
 	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
 
-	ret = qcom_scm_pas_auth_and_reset(pas->pas_id);
+	ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
+	if (ret)
+		goto release_pas_metadata;
+
+	ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
 	if (ret) {
 		dev_err(pas->dev,
 			"failed to authenticate image and release reset\n");
-		goto release_pas_metadata;
+		goto unmap_carveout;
 	}
 
 	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(pas->dev, "start timed out\n");
 		qcom_scm_pas_shutdown(pas->pas_id);
-		goto release_pas_metadata;
+		goto unmap_carveout;
 	}
 
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
@@ -327,10 +352,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
 	return 0;
 
+unmap_carveout:
+	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+
+unmap_dtb_carveout:
+	if (pas->dtb_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -386,8 +417,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
 		if (ret)
 			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 	}
 
+	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
+
 	handover = qcom_q6v5_unprepare(&pas->q6v5);
 	if (handover)
 		qcom_pas_handover(&pas->q6v5);
@@ -757,6 +792,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	if (of_property_present(pdev->dev.of_node, "iommus")) {
+		struct of_phandle_args args;
+
+		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
+						 "#iommu-cells", 0, &args);
+		if (ret < 0)
+			return ret;
+
+		rproc->has_iommu = true;
+		of_node_put(args.np);
+	} else {
+		rproc->has_iommu = false;
+	}
+
 	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
@@ -835,6 +884,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto destroy_pas_ctx;
 	}
 
+	pas->pas_ctx->has_iommu = rproc->has_iommu;
+	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto destroy_dtb_pas_ctx;

-- 
2.50.1

