Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036730C36D
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241825; cv=none; b=WrWcp6tYBSspv3D4fY0EWSBrXdkFKgttiqdroT4nRZ+IbPceS5YPMovRp3lRW5Dym/W2pkhSBOMO9hv2Ld3zLDAjTQLjROikGqcDUwX5bNbuy/aH0Cb8Y7SPcYXIhpfrw/gFuLJJauPQFZTCuRcwOfcAKViHjcWtwmlejdg1K2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241825; c=relaxed/simple;
	bh=WElPtVnlh+C1PSgldb6zWFPdJuCyxq0WGV9rXeZJ+rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdh3kJF4JNu1L72nVYTdHYuqobzctagHsAJc+5518/2bl3L8+mqLQq3KKSQi8nYv0/tM9KoG0V3uUK/IPVv8q/lgNZ3R25ryVRqerz7cnFsjzGMWvGhneyogUrOjvsrjlJYDZvkLYUsiKcPsbekGaIt8kQfNp5mH6YNn/ziqc50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaiIhBg5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dn5Ryl0j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaiIhBg5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dn5Ryl0j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42rqc93693365
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 07:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ttv0A/uYCNoEfTOIueJ0Teu2hpiw4Qf158DWOAthokg=; b=iaiIhBg5GBKSlZcT
	4Z18dxVW7K45Lyna7uXFKfri4v2siZLCohcIU8fLWwBaODqzvAp8SqqIBEf9uKHR
	dZpsbABzsHZbQhw9HZCsU1VIUVQCmgbE/HBn0StFsdmhKVLYov94UQwa5Vga568z
	E756XNk3O3FOGVm5gCl0CTU3QfD5a+Z8aP8gRMMnStbIuu0kD3OWlPM/2OVpC6Dj
	vzsfY3k2fwo/XTizVHE4TK+HY9gMY6htwFHSinQcFFvV9e7vdOFEo0P04nGeMHBb
	mm6O/dv+N7BLTG2shN0j4/+vjA7kLnYHWYcZBoJipkgl0fIzGJH/1mt9k3OYG98V
	0EJD7A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b320u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 07:36:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso1179029a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 23:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241819; x=1762846619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttv0A/uYCNoEfTOIueJ0Teu2hpiw4Qf158DWOAthokg=;
        b=dn5Ryl0jVFyjI1z0UCDLqpMbV3e2x41UlpcBqXdXW2DWuYjFrOkJiDPdrr8pXVWzXA
         Lmmz92EMCDbmi/IpaDA89GXx04TwS/60OSxe+Ze3z749KD62UIXwcSEMNNcbGRbha9Ms
         Y93MhkzW6xgAGW4jdgbzIEx26gVvNsnFrCzEjhzU1HD2MiQHm5Mb2ZE88qg/YeOlsbBq
         9GaQYf/dqPE2O/NH1nz+fx6GxyCerXHMWQWzBAf86kR99x1vYNBL/l+D6R/KSR72wOmY
         T3jxXGH2ULoa78aEuOx4NuJnu9/EiVOzoDmPxgbDz2fdZHY8PnhjCLfGQ9bfIRAYetkL
         garA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241819; x=1762846619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttv0A/uYCNoEfTOIueJ0Teu2hpiw4Qf158DWOAthokg=;
        b=HmRnNuLhLudfc8lIeLAOI3EmDVyC9WkXHcfrSdL8w5JpPmQX+lRfRricTCYcoqY+j3
         fcbdh/4T+GC+PKNXJ8dDyNf6yZgbVbBFPs+JZwcIay2pP6w05AOH9EIhDGp8mQPrIZKm
         qRu79Gpt+j6L1bqJqbnLZrQbzvcchC1GsdI2lXcTwW5yITJByjKhB6vX/mqR3Nuu1zEo
         OL4pr4SrIGVX+2Bfxp4fS3aNCA2j6kDC0M07tc18FhqzHwkyGpYUL4P6HgqgopCLYgea
         E4+Hx9acSPgfwJFCGesHYbpFofsKYGV5AAm2ynAzPGH0XrjlQxn3VJaM7ZThEFbVSp2t
         FN2A==
X-Forwarded-Encrypted: i=1; AJvYcCUEjjVXBoBnLI4OvEXJ3cwafh2vwZ7xVqEJ87Pqpwz78gdfTAuqGylxIQVcDTSbsg3ug/TFE2p3YU8QN6FVIgO9@vger.kernel.org
X-Gm-Message-State: AOJu0YxaHnfDS79QE/i0u2ScSQdx2hctLMfMROb3bKMNXD93Sm6D1nWj
	mfnIg6D3d3VuiLBpa9VfCbXHzYbZ7v2DjkT3wZzxsP2e+p9HEwhUByTOf0IcGOTfp32VeXnnkzu
	QQVUZmKWbTni+TxINud6qSfLHSxgY4LZVSmSqZqHxjCPytgBu3GsOml1nMQ9lsgi5+y4F5/Ou
X-Gm-Gg: ASbGncvdGAq7CnbkdNQPTTJJRsPrZvWsPXGRZC/jT+Bw802O6XIAPDmPLCuSO9xzOKx
	R53na9WsuslhppOPfJFAMJ3U/s4njl/IzNXv78028IEnay0PAt+WdTumwGFGCL2fi1KFOKZa5VZ
	/mcefcyRlPfe0DpZd+STzQQatehK7sLl/erfkSAA1LKhal+QACsMzanPL56CyLx7rIc28aBT7cl
	vcnrKvx4NoI5z1FlV3Kv8mtwmb3DxUSvd3W6pI0UzOshHn9TEOB+duA0dkp47vK9HU15c1VRpES
	e/Ep68FD3jFP2peCiGFWg+cmMDcQn/bfu3RcjeOnLdJ8uGIUfJkkqI8VjUnnHbGnHXtwE7n/Bbw
	vohrJeIkUwD43f63ziRjzDqjzWA==
X-Received: by 2002:a17:90b:2e4b:b0:341:8bdd:5cf3 with SMTP id 98e67ed59e1d1-3418bdd5d5dmr304462a91.7.1762241818732;
        Mon, 03 Nov 2025 23:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzgRpt33g8LH+r/hUNLLbndg+nf7J0Iu8VGs80RcMH+Ykfd+QAkTkyhAw+/oQsik5bSPDVNg==
X-Received: by 2002:a17:90b:2e4b:b0:341:8bdd:5cf3 with SMTP id 98e67ed59e1d1-3418bdd5d5dmr304401a91.7.1762241817990;
        Mon, 03 Nov 2025 23:36:57 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:57 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:53 +0530
Subject: [PATCH v6 13/14] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-13-7017b0adc24e@oss.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=5426;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=WElPtVnlh+C1PSgldb6zWFPdJuCyxq0WGV9rXeZJ+rw=;
 b=e6KOrcaoVF+JgTkvZ7OssMAQH1daA6mX+N7uC9YUPf6nUAxgDb+EvwuXEQys0RhH7EU4BKY5M
 eGewFwwExulDjoTa9scKsHp8ITiWWbmmzECSPyQfgZcb0aftxymeCaM
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX1D2loXR4z30L
 EKQciyhabN5tFM4Kn7nwJbSsRS+liDGOD68gg848vov9hzaHO/If7ZLrPiOwO90J6FR9kZ9qzRv
 KiYWCDUj4fLYysuX8sYQrvTXzUDGpqYG1dSOyEX3G849uNWWw+P3eTQewRpE2Lnqgzc5HgOzCFh
 xIzoitv2dOMAkgbuoUy3EGk1GT/+zFLvgG4j09k/pjHUvmfVYrm1y6hIzAYRn2717BEb1jRmvqC
 aFu6CRF+L8wEEovrlSX3R4pEv9e87xbjPS2PN53PxmoMqVKg69t9awsplEze/hIaxM3ykzH1Jfq
 aWnuXOxXsQygt9CenfszRZ1kkBg6HKlz0x7LWlJ/nHEIW3XIlv9lOnLYXojPNM5DFQsns4vwWBf
 AsHGDCx5gBU4oTOe8PzQRknnF4mYEg==
X-Proofpoint-GUID: gHYNDvrNl2jmtgwtvqC3Q4ik-6-JSFkt
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6909ad1b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=58pnfTnN0ARRJNaB1lkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: gHYNDvrNl2jmtgwtvqC3Q4ik-6-JSFkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040061

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
 drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a8d3d2e9a70e..59196a13e3a1 100644
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
@@ -256,6 +257,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
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
@@ -290,11 +307,15 @@ static int qcom_pas_start(struct rproc *rproc)
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
 
@@ -305,18 +326,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -328,10 +353,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -387,8 +418,12 @@ static int qcom_pas_stop(struct rproc *rproc)
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
@@ -758,6 +793,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	rproc->has_iommu = of_property_present(pdev->dev.of_node, "iommus");
 	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
@@ -837,6 +873,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto remove_ssr_sysmon;
 	}
 
+	pas->pas_ctx->has_iommu = rproc->has_iommu;
+	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;

-- 
2.50.1

