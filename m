Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C233640DFD4
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150742; cv=none; b=VCQKqMG6ggCd2IqgOXryerp8XimfeX2QfTGCd8YGlRHyO/o9QOQiumGg2eEbdkF3JViQqx1HK3d7Hi8L2nOnamjAzQEFrfwu5Lcv8KQjLzgC525b8CNTWBWCtXTHIhlePDWNxg1XV+sMFngIfmsxUQ2u05QWP+3P/BuFnceNCWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150742; c=relaxed/simple;
	bh=cmUO7eLo3YfN1R+TeCkHuV+UYuymQZWbHZ/FgYZVwRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c9/2yFC3C2wjqYintNxTAPZRowXlp3y5i/FCuJDwVFKH1w9do5mOnMWkMOHVnGdd3MnZQBLxaWhFJtIbHnkEc+WQSv6eOKDC+FZ8cMl9Kxbc6bVRBbp1SlPCqq7Gnl5jekAbXve4Ylk4w6v3M0IlHXfnQcuDl1QKo19fy7VLwU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEKuwLaC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cd8pZbnd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEKuwLaC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cd8pZbnd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaTkJ303796
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E0X5Yam2Y/K
	A0Hu2oSOl/+Yjcj2TbDdAlIdpUoAMbcc=; b=NEKuwLaCFFyhxPbtY8/CY5Wxngn
	lCpWvwMlOjXjNf/k0giwW2jhpi8HYjpAgZQ/BkbJ5/viAOuKFsaETGPjWo+2xZOD
	XVmJhVl0NLgNLc1g62kKn62nbzxC6urFERB1sxC7j+AdjRImMnuWwjeau8LXizvD
	x4ZDo+pS+HXUTgA851wsdZPWHUguC6XTjlin9DQU/KhvH79THlvZK2MknwkuItSE
	0OzCVOYzLHKFy377sLVetrfWX8dbmDFv/Yf4IN+AWyYyerGh59DuCXURImk9EVPF
	edQEAmnXZlX1d5acJ0Ns65bnOC4AA+JWHBxIlAGi7CcCNCtywBcqqeWR8Ew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf0r75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:52:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so11602243a91.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 06:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773150738; x=1773755538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0X5Yam2Y/KA0Hu2oSOl/+Yjcj2TbDdAlIdpUoAMbcc=;
        b=Cd8pZbnddvfC9dzP/0H0SN+iKAgANdEYXHqMYy9z5hjI01ivQ5jT17gFKOMpXc9cTm
         u4WpGA3iYRb+s40nT8bZpVUL0veXbLg4ecb/RCUGPJec131kqqYuQuCsREnIFLwfCJqA
         sUIFS1ZXwG2zZwDMo2OEOvPCyX+zgO3ewJjB7T9LG6FTjh2bO+FI5HERcJaX8Cj+IzM3
         ovqBPLenm7VtpPqLawSIfvRySseWDutm3x50wtMb/FuPxDgrHADJsBybUpkoay5NrlNH
         RWydLC8EFEbO3wRBeAaevvkd41gjP+sFGUMSD0dxaNXeFr4jSAGuzpo7bted1i5KqGFy
         JH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150738; x=1773755538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0X5Yam2Y/KA0Hu2oSOl/+Yjcj2TbDdAlIdpUoAMbcc=;
        b=psSUHCE+V5VI9CEh9ypdYK1XmZ2yoLoe3+pWJr9FjgZbyKAN7Sd42h/tXIbVS/rmvc
         UMSxyFcOPR+ATAVfwgwcWwWy/BbNfjqEnj0VwxYsYG3Avwk4bsg844c2WGRVP268nnnG
         araVhrOf7adB8LSpCRrf19goOGwm9M6Dj4fxjBevE4zfbdsbYXHeB6cSdwKJM/EQ6RJ/
         6BD5IVEQR9bT88XgektqJUuY8gF4nEkLyZAPETEDGNWjLNSLhG6q7zY49tiOzyLcpdq7
         stxjDGVf4hk6lRJSkRSAoZvE0mLSGAva1q3h56/WNkecVZKCLKTkf28Ku2qiOV8P9wl6
         rAxA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Y4pkSLIaPdm4VgNDNKUqeGtsUJjZYW8gxDJvwxAVyKPcFfachNLeTA4as7+T8hGjcAJyQ+rhd2YYMIZFpEkD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw37Nlz/+mk61hGF6Np/NpcOfpKdjWVz0a64ZD46op3FHU/omc9
	VNES9dsHqahCoZ9w6ZgdvHGeV7jwNmIWiIL/SN3k3rmACl+5vv5x3NijuIgw/fNqyRgIeDz2AeZ
	pf90kW0Zhi9sJWnxLTQdmdl1aUcznV39izOFF+MWmepIkahqssFxcZPeTvgzkValWRhRBB8IT
X-Gm-Gg: ATEYQzzbndhxptyLGVambvnAAOBh6BcE5eESfMRRU0NEghItva5kxuV9x2OKX0IxIEx
	x0ZVXXO5OEyMy/5syehtmESVeACCZtQwHQk/qFQ+0B5TT+jBDzXhEBSIBElLmH3O+oex5+EsCY+
	KMQjjJpF1CXsH6FWTOb9W62CkONmA9vGhWDI35ndvpxCx7bIOhXnp2oNCpNiSuyaoqvMB/wYiX+
	57RJoVlebqrcNQ+Hl9MXnnkAPgBZCZ7le7YPxXKjTPccaM0UvAoCyiV7+P97nvnV6r5OkJGkJ4E
	UwIcRDOYaDW0fftlEkQWoUoCxLIl4LqV2MENcQW+F62T1zHQQxzIZCLvGn9g/bVfxz6N30F38mv
	xtBd6HB1+iPG/uXtgb1fHvWMh9w2OClr9pUo1TdDxx1g8yW/f
X-Received: by 2002:a17:90b:1d44:b0:359:f825:5700 with SMTP id 98e67ed59e1d1-359f82559d6mr1598617a91.10.1773150738276;
        Tue, 10 Mar 2026 06:52:18 -0700 (PDT)
X-Received: by 2002:a17:90b:1d44:b0:359:f825:5700 with SMTP id 98e67ed59e1d1-359f82559d6mr1598583a91.10.1773150737703;
        Tue, 10 Mar 2026 06:52:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f088e4bbsm3333149a91.9.2026.03.10.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:52:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
Date: Tue, 10 Mar 2026 19:22:05 +0530
Message-ID: <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JR6kCS-Fq6BjuPD_USg6ve70ZW6EeDuX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyMCBTYWx0ZWRfX4PoZgJqClRwh
 kMR41sIfKiKpmis8NtlRup89lAaCMgrTnNbkflkj2WIXqGy2SSCE/Vy7RETQBOSQU+H5ktYR1bs
 isLEnAuQln4nwoE3bSiLeHHkiKP1DlCYNYzHUIjG+L4jj/Elsic65HKFphB5nw4k0MD1wN9P0pE
 HIB6W3Tz4EQZ1qUZrWFFaCwDQaBOdiiVB/Zi5sM5/PCCd+4i5t1baqcWwzywHFWPxiuNiM+fdUw
 f/ZbrEKRIKfZ7+gTmJb6e6vv66xJ5oMUrdq+oCANcDIke3B3ZEgZ5ODNUb3NRCQd81Jm73pQUgg
 m/FIJpKecLUT/jS7nVjW5hWvuwfBg4TKJDscFQKp4zmMsPh8EKtbmqp31Xg3HDFUnaJa30UL7LS
 mvmj0pVljDrVZxaJsG9/eDVVEb0p1OAeM1myIdF/NM60KWZQGzYxrl6fRR4zf3kx9+7vh8wlku6
 4tsz7x6k+kjUPrfCIcQ==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b02213 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=g0QXFxIELhCdF1mkvcsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: JR6kCS-Fq6BjuPD_USg6ve70ZW6EeDuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100120

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
 drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3bde37ac510c..033d618ccba9 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 		return;
 	}
 
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return;
+	}
+
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
@@ -240,9 +247,18 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			return ret;
 		}
 
+		pas->dtb_mem_region = ioremap_wc(pas->dtb_mem_phys, pas->dtb_mem_size);
+		if (!pas->dtb_mem_region) {
+			dev_err(pas->dev, "unable to map dtb memory region: %pa+%zx\n",
+				&pas->dtb_mem_phys, pas->dtb_mem_size);
+			goto release_dtb_metadata;
+		}
+
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, pas->dtb_mem_region,
 					&pas->dtb_mem_reloc);
+		iounmap(pas->dtb_mem_region);
+		pas->dtb_mem_region = NULL;
 		if (ret)
 			goto release_dtb_metadata;
 	}
@@ -320,8 +336,23 @@ static int qcom_pas_start(struct rproc *rproc)
 		}
 	}
 
+	/*
+	 * During subsystem restart, when coredump is enabled, region is mapped but
+	 * not unmapped there, NULL check to reuse the mapping if its already mapped.
+	 */
+	if (!pas->mem_region) {
+		pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+		if (!pas->mem_region) {
+			dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+				&pas->mem_phys, pas->mem_size);
+			goto release_pas_metadata;
+		}
+	}
+
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
 				pas->mem_region, &pas->mem_reloc);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
 	if (ret)
 		goto release_pas_metadata;
 
@@ -447,6 +478,13 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	if (is_iomem)
 		*is_iomem = true;
 
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return NULL;
+	}
+
 	return pas->mem_region + offset;
 }
 
@@ -637,11 +675,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
-	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->mem_region)) {
-		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(pas->mem_region);
-	}
 
 	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
 						       pas->mem_phys, pas->mem_size);
@@ -660,11 +693,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
 	pas->dtb_mem_size = resource_size(&res);
-	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->dtb_mem_region)) {
-		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
-		return PTR_ERR(pas->dtb_mem_region);
-	}
 
 	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
 							   pas->dtb_mem_phys,
-- 
2.50.1

