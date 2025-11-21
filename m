Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613B534D3AE
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722940; cv=none; b=UvCYQJrsgvY0amEvpjrWWgH3jmZYRp2BOJ2DsTY6WU8SM2oxX8xIYyJeh1XUDo8so2fIWktCLFrtfgNoGjYNCxhP2jzyhpAsLYoN4lMFXhRGw//gMke4WvTDxmkLzYocjdNl6cv+n+HGFo9RjcTz7MwKyt/Fm6u71nKXVKrAuBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722940; c=relaxed/simple;
	bh=LDWAD2OdrCo60t+xziU/S1D39LdH7Wm0TjQa6U2Nrp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1P2eyDfNUscp6lx7/PDTF1JxNszlet9ykYtkXMGuFH9k+GOpGCCz+GMerNEfTj/KdeCeJ6EvbHtJsEHj3WYnXucVJo27lowwRs+Zj23okvH4Bqsu/hDnqOlLvuf/hhX/8bSUi5+B2dnK0YsFa7OzEcDr3q4XmlN1KogIqmP0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cF0gYsn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XPViP7Lc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cF0gYsn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XPViP7Lc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5SUp82757556
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzDVse6SiyFvQ9mA2qbhi5suczpNw/QR0pHgsig8MBw=; b=cF0gYsn6xQ0AnMBw
	j3pwXOI2LjN+UVs26wL8O66Y0Rxf1hn/m1FmJnwo9Y1IKn8PppW1imnRCzVCGM4M
	udCmBjtmjSCaoQ/JGL+b6vOHJRTBce8aYikF3sGRokZVhv96h4XDReLrK2SycA0f
	e0EpCuFdtp8y/ZWekQYMleUHR2+r4ZR3UNASwc/V/gmqISo8LIba3bmjsgAER66v
	IkyAn8jgSeV9xYdM/wetZ0phOMhvX09ZRIeoRg678OcRy13W5X362Xd9C2mSS9fR
	/i/RCxh6VvUygNja4k9jVETXyyrasOhsZA6qLOOLuYV4qZjU5ftYfuIwtJaHY7il
	jSilcw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhy615cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 11:02:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso2263579a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 Nov 2025 03:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722936; x=1764327736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wzDVse6SiyFvQ9mA2qbhi5suczpNw/QR0pHgsig8MBw=;
        b=XPViP7Lcn3db+8/Qdd8rChevhW6rw1LqEoxZUgr9+8zGb6mmlcfTmg8conPOXYiNKk
         uBg7jKhFkzjTorLCjFjMBf7mVA7rUeZcsGhxd0O7C7cJAc3Q4tKtcsWZEyJ+qF5ptWl2
         MZeUgShwGs9xLJP4WBt1fSiYMrtATRwgAY0lOOU38D3T8nvUEOiOsLrOl7nAWRDCag8F
         rkhbhEtQv6U1pXuhdKrOogTQnkdiMJdQPicU4OXsETMUxSn81MXqXoMNr+axibmnv377
         vNpIwllBrRsHVpayyP+IFLc30sDWNGZs0UGi+3FvlpRNLtB6YO49EP6bIg8vmOthfddW
         ZkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722936; x=1764327736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wzDVse6SiyFvQ9mA2qbhi5suczpNw/QR0pHgsig8MBw=;
        b=DDuttZIaL1lEYRWJ7hN3OOc5SNITyvN8GDz7VufvT0g21EDutrsTt7ANr2m1jRwloh
         tSm1/5lkRpPCPfhiUHTbPCWIA/XcY9f2V8Xtmk7wiIW35CtEs0hFTSVUnIBimXx41HmN
         3JSCpM0M0EIR7kSK047iMIl4j8cKyBG/tF+uixVkUjz0cNHfLvslYSz5tzUi4omHcZ82
         7kRYfr1waCmAA/12ibNVkaYuyggGfiXfBJ9BxnPByRWTeEQ4DIdtWbO7g2tUJl9eu6PX
         FLsus0lwr72DtnPo+sdGg9F+CL6LKTWW6fvkAEY1ZLfPdiE7y2B0IOD6CDf51ILhVF8R
         kTiA==
X-Forwarded-Encrypted: i=1; AJvYcCXiGhRSwlUrTU1KVzU3Zz6M2IfGm0Nh2btQMozuJp7Sw9ZcXVpb9nUMWswMtW83d3r0+Ygw+as6Y+P3rZgRUHcO@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ8/MsOoCRzILo8rD2yAiYEX9RklaRjIR/mm5N/O3H9zag1611
	snNZ9SdeT4X1/cgIaAbgaEwyurJR4bmIX1EugdlXO+SrvsS8vO1U+xnyvOgtkiaPwevGejeGucq
	pdhPvABZM1NPF/TL6zX6JzkLLYdA4TvUYfKy414ewZXmMQmLNgoDOPiVT92oeNte8Hd+djrCu
X-Gm-Gg: ASbGncvrvV5mSEf8EjG+vQ8I6+Z0AD8lMcAX3gYsdetuTeezfEEfmqUHSv65wIadfCJ
	1jGJdjqDcoyCNa/ZqX6VT+ejXH37pq2mZFG3GGttuvtZSNzIcSXdGM2f3u79IxH/iqc5Y+W6lDm
	k+0sWGxpJAIijkqvPZTmbSSsw+ScHwOQVz4FWGIlXoZE5d6TX9y2MOLmq67zxZ0W7pxWmtQPNv0
	6V5oflLYGE52ev8nxQkxhdA9XlOK2zsKTBoHNGuXGEMs9L27WJSjzXyeDGMnjezynAjxn8SY9k+
	SHwlGfpFVG2XB6AIhM1u2wikKCc+ER/2rPjhbOtHV636GjfED2ml9YeMfODVl5NYePjo5phdGy9
	AbnUw8T/xpaCIqzucRl1cnPlJgnZzcBM3hVKS
X-Received: by 2002:a17:90b:2f85:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-34733e4ce7fmr1636096a91.2.1763722935385;
        Fri, 21 Nov 2025 03:02:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEyx4OJNMZDxNS2Lv8sRqqfI93j+bv62197cKPsmEzMrlYJCRV60V11I6/4w8n3Fr2p97tdA==
X-Received: by 2002:a17:90b:2f85:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-34733e4ce7fmr1636050a91.2.1763722934637;
        Fri, 21 Nov 2025 03:02:14 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:02:14 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:15 +0530
Subject: [PATCH v8 13/14] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-13-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=5426;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=LDWAD2OdrCo60t+xziU/S1D39LdH7Wm0TjQa6U2Nrp8=;
 b=2gjk5vgALyrjvuFLK7nI+VjRGLP6ywbIIC5ra95eCjN5uxwfcOkjsn0g1Vz5CqJbtgIzIQLgm
 zowm8xjK2/mAz1ZWEGy66cLuE3XVHlYZoQEAxjOElE7ucna9zVzTChU
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=Lb0xKzfi c=1 sm=1 tr=0 ts=692046b8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=58pnfTnN0ARRJNaB1lkA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: XITQza04_BgKnbREobGDFV_LLTS7OxiU
X-Proofpoint-GUID: XITQza04_BgKnbREobGDFV_LLTS7OxiU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfXxjuDaDir1Z0w
 Hu0lZV9DxWzWwyT6LScrlYd4M7Uy+3p+QmEBDWGxofJITRKGAQDVYZhhhiNVjXLfRrWA8KuMoRu
 D2xg9GUsFr9Mnf+pGHhe6sRHfChFxSEH6ADFDBBbt6pKmqmxIHXKLNqtBjrERvljFTATXC5Fzj4
 syM2diedxLxCJCEb4kO5X8+rt9dLhttKlrgAEvFZdBZ+wJiSuyq+4YgPEQOYIPu8Y0Jn80MNsUh
 3aKbOelcDj/gCnL5m/i/VAd8UEPYkZ11r4qCGwjVi5IOvaQ/6u/te6n7W4eQ6enQjKAKi5t/Jw7
 sy8kAp3SJXHZ5ZTDbv38q4+4YiquFnNUdRFuzTdsEySSeAlxfV42ZcF+j9jkq4oaWQwPLf3FFCW
 sdxsLDOy/FCURMRZtWnk6/216OLutA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

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
index 186a90d6c83a..2df3b06f8157 100644
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

