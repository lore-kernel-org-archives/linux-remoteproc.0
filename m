Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FE260590
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397351; cv=none; b=m/FPJahXc5Z+lXKSwdNowpIunBrJesHlTToH2c6NSkLdUp+Tx9xoz8HG+RsWwhIi0hFLkYLowPXaiAdmBcBBHHaRV0nZLY09Vb0o5gzN7KATrABK+HLF84Hns1Z9gdrept3XAjuKomWcPVmZCPSmassomo0iBKIo9sVNhtROgzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397351; c=relaxed/simple;
	bh=HaQL7SzoKQ+uCuoNDRBd4ngS117LQfzY4lgUkCMm2i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BzINHLYV5e3RLCcyacydAKWAMocTAgSBUjpDV3cxgoe1vM7zmNJx1AEQayXTXZWrDjNyb/tUs/nRhLPvrVD+cCk2QpWuGLO5ssN3fJ6cP+qF+MB3n0fcV+8jh0jxv6juZ4NB9Yz2EOpuaSCkIdVzzbUYWv+zlEXGX8cLeOToS50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE5OP1iC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE5OP1iC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3GCkF006574
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJLhCmWC5V5JvS2iP0Cc2gMwfOUtpus24rN2cUz0R8k=; b=nE5OP1iCoD2LLmGc
	7SAAp/+fASY9jYtCTRP7/HHMmv5Y6kMZDbV+iDXW8AQh4eZhrmxkCcGu7RHp6JVf
	z3sFsLcSqdqKh4ljwB1AeVr8au9BxmzEtRcHMN6fqM+c7YPFSA23kPLLP5ZoMdsw
	hCVOY358XrXo2OqFu4SZF/rN5CgXPLq4diujMe/NSyfi8WPL3broz+C6h0Lv1l6a
	Txd1UtkUl12S3KRSGHYqqT4whjbAxAPRdeYOmP1SxVN+5mpLCpZsz+Zu3ftmTmoX
	PWL0bt+3nAGtxj26aFZzgf2lORK5luGia5vTt6I9b4aKDkxQhQEzshmCHU3rUVtl
	zD5yBw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kkhh98v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77df695490dso2023885b3a.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397346; x=1759002146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJLhCmWC5V5JvS2iP0Cc2gMwfOUtpus24rN2cUz0R8k=;
        b=WSFx7r9agn7F4NX3qp1QCiHV9Te8BNMYNn+jX5ocG/a1QNJQeysH6iDCID7KoIKDlj
         /2Z5to+hGrD7U89YKsqSqP/qsB4Fh9a0eRTDGCOQ3Z7PFfO0qwNOe8MIYPdjJvHKO0Lo
         dcOHonHzMpoqYjymdn+iDG9KKS+sLiTEWNAae1oPwGxa1BL4mOnuAPig5DOwivBP11V7
         F+hYkla2xBMVe1CIbvPcs48KIscpi8B79G6EGPstO6iFZaLv5f53ytIVBYgCf+RraGK8
         IQoOGx3+1VGa1v33nDQ5TLsIIjuf3dx96c4O1T/4NWgkxSZOxWkD2T/cG7WUxwbVIxCG
         6qJg==
X-Forwarded-Encrypted: i=1; AJvYcCWKBfuUXkLObL2Mba0K4PkgdDUnZ0noWXEuPmBctExgRer0vA3R/kaZquAFYi65wOZkva+NQdRdn/gxqE7ug09Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwbIEzdgKCNeVX5YH9Ru/Tpxlwj65Hqb/LxWXFjZBNpQzJUyx/T
	VfqyQMywcWI4JKaPUtan4q+3E2fYPmFqUj0OIBQFId1Zzc7QKakHZyPk1NrGIC7OR0awqsiI8L3
	MTDok8X3gQMHgLOvLSlFrg1m1ab/HLFnudrXYb5AvAftr5f9RFKRgdeE2jC3S3ZnT1UIhuy+b
X-Gm-Gg: ASbGnctlQ1Vj+RLa1OJ0ZuvNZJ3of/dnIoxELtAbxtO9z2xvUzrJuF05/BBZRgQYl2E
	0QuRGSHfjGpELnsEzVC3mASdy15X25q/Kh85rBwJFcd8Er3s+vOhpYC10UbWFhQIgSoskLalger
	899WCF+sNPFMfpJP7VO7ZLWvSOVcBRSk5SCWvf3q3zY3rRwshmXhAMSCy5ehI04j+IFEbwidV80
	tFjbAsGLPDdFn/UBN3Dzw8uxeiH+gPGsG/Skya0jIa4u6fPvco2nJ6mkekAIL0a1xtxKWWB0oVF
	5GxpwTCJa8B4OyDQI6amrFgXCniQxWnPMk95qTN5V23b4v1xpYQe3sGuD+x5JqVsxlo=
X-Received: by 2002:a05:6a00:9299:b0:77a:2eb:a456 with SMTP id d2e1a72fcca58-77e4d129a4bmr8654932b3a.10.1758397346317;
        Sat, 20 Sep 2025 12:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhW02y4cKqYgaAhLIk153K10CuK8W8rj1tVqHucpPt914fFE5q/61YjV9uWqc3fx+xZcgvfw==
X-Received: by 2002:a05:6a00:9299:b0:77a:2eb:a456 with SMTP id d2e1a72fcca58-77e4d129a4bmr8654913b3a.10.1758397345890;
        Sat, 20 Sep 2025 12:42:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:09 +0530
Subject: [PATCH v3 11/12] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-11-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=5727;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=HaQL7SzoKQ+uCuoNDRBd4ngS117LQfzY4lgUkCMm2i0=;
 b=axOMnTfAmjJadjnx+kWYfL4yus2rYoK6z65CPwn+Av/JHIsGKtR9O2/5sspB9ZUuwkPuQe8Ov
 EhUcTo8nEJhCAmNrwnuVQiZlrlQInhieCKkbhlQVMaN+NE3dXGusmvZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: f5OOkMAVn34DGfcXx37TBdnXYkHrByWO
X-Proofpoint-GUID: f5OOkMAVn34DGfcXx37TBdnXYkHrByWO
X-Authority-Analysis: v=2.4 cv=JMo7s9Kb c=1 sm=1 tr=0 ts=68cf03a3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aSAcVJyT6VmtggMVTjAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX/2yOdzTwdbkx
 BxielfFnu6ywW7nwpmIiO9ZjZyYYxMJKouz2Tk5RQpC1jRUgc9Yr2qUufjB7n6zC7WqCFAbngP+
 wPhcuc77dUDIUs/P7FOxZ9H0Hzj/Fv1Oe4lzrL9sM/7z2mFy0g302p15frw/lawDfjbM5Gg/YQN
 e1gR+jv9vPVZZ3WhLATHwHhB+RF8SveK8h/ouE7gVogWgg+N4YMoGFJbU0cxNxhxcscCJmc4Qjl
 mmtQthsiY/PKw1W/jbiiU0EdkgTTdz0MeIN6/7BgEP+DaaNE5gpYPfelsoSp1SmXieNHgQCQeph
 GQfNaKi/fpGz82fsYlWhNAwua5MZF7XNTEGPswMb4MUqORY//mCjvw2bofgodOQSubgmkAcOtY3
 /cx8k2/m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is
required to enable memory protection for both remoteproc metadata and
its memory regions. When the aforementioned hypervisor is absent, the
operating system must perform these configurations instead.

When Linux runs as the hypervisor (at EL2) on a SoC, it will have its
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
index 9a0c0e8f5506..ca5a214162eb 100644
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
@@ -251,6 +252,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
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
@@ -285,11 +302,15 @@ static int qcom_pas_start(struct rproc *rproc)
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
 
@@ -300,18 +321,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -323,10 +348,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -382,8 +413,12 @@ static int qcom_pas_stop(struct rproc *rproc)
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
@@ -753,6 +788,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
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
 
@@ -830,6 +879,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto destroy_pas_ctx;
 	}
 
+	pas->pas_ctx->has_iommu = rproc->has_iommu;
+	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto destroy_dtb_pas_ctx;

-- 
2.50.1

