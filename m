Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A4F304BCE
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622567; cv=none; b=qKgsrQdpDPTaBYYMK2+TOa5egXcz+9yn9kZN1Jnojw2+Y7TlYVO0WhCPpapOYjEOdAMYJvPdFAkJhLxZeDbbv6Ml/AenElB7C1+MbibBTaLgkzWSVh01RemWjluwS9KMhcPI49f7thuCj7sC75Lzsd4rVJQ3ecVNo7DrjkzQcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622567; c=relaxed/simple;
	bh=Zc7+4/Z4XXaktbT2Lj7+7GuvFjOCS7TRGcWb2kd9DCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiM0V3fnAwYA0DUhJzfbU7Vf4qQlX3XZxWmjdfOgwKm73A3MZZPRqtqqFo1t3GOzW+y+DXbBe6fkErX4y2YLIDby3SI3WbBfI6hm44VbgDyUQwI2x8LT9NPpVyATAPJwz+2lzgOpblKu+2C2A4JEezTi6B0UHirTd5Y4/tuwye8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PtN7QPdF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtN7QPdF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90dbn023727
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7TQCNmijRE9
	VS3dO0cEngmYEHlTvYCRhw6o+g4o3fCo=; b=PtN7QPdFvYCJJ9iXRc5gaT+8PwE
	DC6REKCdsle28yGZSmwt3oHX/3BAOaUzgJfSlzvoSHeM5fuK/xEqDM65Ae/ysP7P
	bMzwzTPs5KHRYxCwkOtDL7Ep/Yrej+rTnrRH1jkz9AoqT6v1itykSljuOI267Bmw
	s7y4GUuYzdwJKv2fXXeYfs1X0nSdnUOhXE7LsedmvAv6NNwqFvQv6E6MzhTVpjDw
	CDifGgtNof5w4bod+bKyldy4notNfLZtAqbf9K/nUwME8vTjB9Mp8UPGNW7RMWo6
	G3VUyN3GvMK7mG+eoM5jsox6GAqkB0BR2tQCWrC9debMTa+hhOALNQKFV5A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5k1ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:56:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806eab4so58156855ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 09:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622563; x=1756227363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TQCNmijRE9VS3dO0cEngmYEHlTvYCRhw6o+g4o3fCo=;
        b=ZzYnBaaijY730irJYOKxt/m9b3295iXExG7iewGXnui+2RH9VQkS5DXmGosbl2MpNP
         lA2uMMTiZSadlItgQDoz66psBfFlKCar6jEG83k7RPgNS9RPkrfi+nBdYdwxAPb1k1DA
         66M7Wm1U4cLoPPS3jTyN1tXdYEfjw9JWUcllnXUXlAkBXYrYt/0HPD++ZomdOh8M1KU/
         xIhpGVmgx0d+UgX6n+hJ0lToT3gOXlNBq5iYZ2NtbTdhEhGDJOSTu/X3OvyKgvnooFLv
         IH4EKXRHgVZ0KgHuzURQFh7N2tTraJtYplQmyrEoHwc+48JT6E4ydtJCFQILDiRiTaRM
         2elQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpWiRKGjOPm83rAvdnZn5vOVUGIKYFI54mJJFS/sK6UpeHLWwPo2kbiM+cNSOBBx1L3WyLIzClBFESzHkaB6B+@vger.kernel.org
X-Gm-Message-State: AOJu0YwteOaUkOj+mt1v9Qsg/a4GHxv3WLfk5SkGIugmxkdPgb1T82g+
	sqdtbwlTecxnsGT1JxEwjQThGSf45+QekLaqy5W/RsXvpklLKiKk3npP5Wt9Xjda4piK7hIAEIC
	CpZTCWv+81TX7uYEOk3lPjpf68ui89HCwHLjXz1SqkYY0CN057pqkJU+UakJEWLVcfgTtzv/h
X-Gm-Gg: ASbGncsN0/GyJnU+sXgOUnm9zmyRLSX/wsIvcW7wz5+XlHacCplrpdoj+2syNFPexa3
	9MjhIW8Fabze59C9jNCeBGcGsnQrGpcktLq7V24QpoDqcdH9WgL1JMAp1kQymdP13+0LdzPuxGV
	kW583pAVNgfiTdFCcvZymVeoGNGrJaIQjOIrJFB4O4mlYl/+OCcuo8hngt8iA6JpsLl7wPPKwGE
	n+2gplD1tB1uT8ee5exppRnDFYOGe8dRK2KKOZcoggZUVtPO3Cjd00JBW6Bratz1rKxeWxumlq2
	aBvewETvaATvduZWZhMD2mTG0sZP6eahxmJN2IF8yhkHLfl0lxKnhdDhxGUdo0v8OuM=
X-Received: by 2002:a17:902:e80a:b0:242:2cad:2f8 with SMTP id d9443c01a7336-245e030786dmr50925165ad.22.1755622562541;
        Tue, 19 Aug 2025 09:56:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZhIm1RfeHftaTXr4FFqQ6mdKSfUgMY7hKB3MMlwRM9W570Zfi/DtPRME7Cf9owHlZ1VkQyg==
X-Received: by 2002:a17:902:e80a:b0:242:2cad:2f8 with SMTP id d9443c01a7336-245e030786dmr50924715ad.22.1755622562030;
        Tue, 19 Aug 2025 09:56:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:56:01 -0700 (PDT)
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
Subject: [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support with IOMMU managed by Linux
Date: Tue, 19 Aug 2025 22:24:45 +0530
Message-ID: <20250819165447.4149674-11-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a4aca3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=aSAcVJyT6VmtggMVTjAA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zD5jWVddCEIJ5aXfqi30-Yv-6VoW7GZQ
X-Proofpoint-GUID: zD5jWVddCEIJ5aXfqi30-Yv-6VoW7GZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX1dRIoQHt+EDg
 ZzKbPHKLli1uCf06IFrN2uOekW5XbTCHS02+FUSsGA545gCY8vmmH5qzoyU3CEYBgsm7sLR7y5L
 H09oOmMSyVpcI1C+DHVIi+jMiDuU8PNDqrmOae6FfH7wKmsTHqmwm7uhDDAmDGY1AgJIBsC4s7K
 II4bL24rr6LcW4jBvxsTczJ8yQMyxJNodkgNsnZVrUjP3ji9IKOHqE8Xwmr8NibiCH9K7W0Ki8d
 XVguCBaQZ/M4oyigBdWAabvLiWhzZzzWh95Vh2gLtUTRhnO8BMEYqJVoMuVVxdqjrKM6Jot9Jrk
 5KC0ymr5jxyLn7LmeAaFCZTjPh5u/Aq0InwMSoGOIUuxaac8miMiZ+feTW6T0e/ey5VZfRKFVJ3
 rOx6dHaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is
required to enable memory protection for both remoteproc metadata and
its memory regions.

When the aforementioned hypervisor is absent, the operating system must
perform these configurations instead.

When Linux runs as the hypervisor (at EL2) on a SoC, it will have its
own device tree overlay file that specifies the firmware stream ID now
managed by Linux for a particular remote processor. If the iommus
property is specified in the remoteproc device tree node, it indicates
that IOMMU configuration must be handled by Linux. In this case, the
has_iommu flag is set for the remote processor, which ensures that the
resource table, carveouts, and SHM bridge are properly configured before
memory is passed to TrustZone for authentication. Otherwise, the
has_iommu flag remains unset, which is the default behavior.

Enables Secure PAS support for remote processors when IOMMU configuration
is managed by Linux.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 63 +++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1e0f09bf1ef2..180528bcd57c 100644
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
@@ -250,6 +251,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
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
@@ -284,11 +301,15 @@ static int qcom_pas_start(struct rproc *rproc)
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
 
@@ -299,18 +320,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -322,10 +347,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -381,8 +412,12 @@ static int qcom_pas_stop(struct rproc *rproc)
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
@@ -424,7 +459,8 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	if (!rproc->has_iommu)
 		return ret;
 
-	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, NULL, 0, &output_rt, &output_rt_size);
+	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, NULL, 0,
+					 &output_rt, &output_rt_size);
 	if (ret) {
 		dev_err(pas->dev, "error %d getting resource_table\n", ret);
 		return ret;
@@ -726,6 +762,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
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
 
@@ -800,6 +850,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (!pas->dtb_pas_ctx)
 		goto remove_ssr_sysmon;
 
+	pas->pas_ctx->has_iommu = pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
-- 
2.50.1

