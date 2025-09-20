Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0182566D9
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397330; cv=none; b=dhkp320wCzQuhVyikttVUtCrke/dfG1IsZa9kmxZrtxQ8zzzz0/RzsVg9on2hQSCaQ/yk3k2ZftVAapM4TsCjw63Afkrb6JBFL3eziqvoLmzKWMX/q2SJAxv6OFR042y2vUE2g+kX5MtYNqakivVLBScZLVVASoRGPUARBrKtYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397330; c=relaxed/simple;
	bh=3Gsa1ygLvfww6X1LDJZ5+cyiNGAfoG3HUC9QPJkbdQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2fUG6deWW29Vo1F/VK6wlZkb4RzU1eTFRBZDdUXsgyIZsslfibFPvGu02byIqMTSF9LqC+oWH//BdM4FlYU5CSvBW/h+FQUzoSKUu3DNFJgXjr0srDBXZpKBN3164IbLRmsh9/T30RZygnEWemfPMqYai+R2qm3Y7pXhDOQiMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQgfrjHd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQgfrjHd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KIuAUl010102
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bskQ4OXKVoPNLr7GyCp9XNvtiQakpOp32/gupE0+8EU=; b=ZQgfrjHdTv4ePWdm
	HvVYJWAjSYfvR3kKB4Dg4LEn5wtnX2O1irSXhx6r3u9SjZKD9e8goXbmKnEoVhVO
	W41PDx1n5k5Z1g942lecJTZIrM8ygayCwEVEzG0T2KWTdjKkZbltK5Q2KPNdGCQF
	kaBUYIb/Yrtuj7O5Mhj1FeNped9KxzcjMA5VYCfbIGB2ZQHGeDu5fTuM2UyOKAqv
	mNzMppLf4xZeUazvP11pLJ8xp8ASxkssYAtQoXt7fqB+bR4qQrVr3Ce0XOcqE+GX
	3vzSK2J+jfzFlAmWqbdtss6PUWoZF7Tr54pz20rvPx4/bOYdpTuwQOqH7cj+FFV7
	xrWS0w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyehedh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:42:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so282755b3a.2
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397327; x=1759002127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bskQ4OXKVoPNLr7GyCp9XNvtiQakpOp32/gupE0+8EU=;
        b=LwLhNkKs9/q8uoc+tiXp6WCisG1teFqY2Q1j5Q9X08kGQ59lBJDvurqjvX/hHwmb5N
         Sb00gToPbwIef+QiIvDnwjf5h2q6L9FIC8MSHZJWkq+zZCXfw6ENlhwpbBze1ALnGs0u
         +Wemo3kiMXOtcBd7UWmb5RAsVmVNsNUV8tPS3Te/fbdZ4nX8+R8sP2qmom3Oiqpy9wiJ
         t7VJHimltS3/2qRQfsUdgrYGBzJErIHppWMHEwPbOIYujU7qwDsOkpjJHZn7BZDMfzaw
         3Q3R9qh0kcY62gYGUYcXWW6yWVQ8b3MPyGJaWhT3zJy2u1P+mFHG7KO3UPf15fSHuUeg
         E9Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWDB0x0eUwNUnMD/gSvoE6BgcEZp70c2KXDpElJ2c4gTfjo8fIo+4yRLBGarDfmy1lSfLeWUGYZPkqxecqu6zlE@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo58/5YP7ua3Z40wRkV1GRCcu80gW+M8xhPJPO2OqWmFfkmU4V
	XXI2vIjJRTNFcZcglxFk8YsxSJ+oXKggRpd6WK0ouPvKR+DJ9l7K4SmgMu8PoJQ1q3kVf9kxlNZ
	O1CuBBavG4fhhWWdLSAaNlXJ1IPuRdrNk6JT/H1kmRlOXntle2SrYlixp53JwxkP9CeTUtmrV
X-Gm-Gg: ASbGncs/C51m/TG62f9UGP0KTH+Q6EXG+FYAJ6juQxyhGevicKHUZZZhUtocjXA2M/H
	4jYGo2B6SZp4Lq5YTRq+wchX77Bh1pFMrzQ5xD0iRu6JFXaORoRUYMKrTl0NWIlsE7fjSc6YkvZ
	xPxreXiKuiubQdbnkuFsoCvQruRckvHXmBwfS5SYH2bmJ/Vm6pBjBq6jJSRATBxHfyMynXQtqkC
	BSUQUcmHIt4cEMgv5VfJR/wKVbSpAVHeVvvDu/Wh0nGkNZTqBSvFXtfzJ0Kl80iLUvH0WkgYYsz
	0quFtZK2mbeqU1Wvuhmq4EUaDpAMLq/qcZNJrXEw6EMGZQGCKMqsjdy9qflj3xmv60g=
X-Received: by 2002:a05:6a00:4c9c:b0:77e:f6a5:aeac with SMTP id d2e1a72fcca58-77ef6a5af0emr5868360b3a.20.1758397327309;
        Sat, 20 Sep 2025 12:42:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa1tWWdHEt3dXgK2dUyS1TDb58uyb8uRpjBv4fiZKR/hkx55ViaZnbeL/P7TkY4ouuDeBoRg==
X-Received: by 2002:a05:6a00:4c9c:b0:77e:f6a5:aeac with SMTP id d2e1a72fcca58-77ef6a5af0emr5868342b3a.20.1758397326841;
        Sat, 20 Sep 2025 12:42:06 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:06 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:04 +0530
Subject: [PATCH v3 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250921-kvm_rproc_pas-v3-6-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=4811;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=3Gsa1ygLvfww6X1LDJZ5+cyiNGAfoG3HUC9QPJkbdQk=;
 b=2s5fYo+BSjHmtETnuObTh0Ex2K8m0KsNEMHhUVzQGULNNH8NRRRpYsHacSRvb2ac/K/njPOra
 nUo/2LAuZ64B4FPEJ16+DBY4Qk7nBiOyAuAZxfrQcAAe2Rf7AiXYOLD
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 4VIZE6PwZFC7QfreBb-fEfPCo4kDsj51
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68cf0390 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xhUff6YxzY9YBBblk4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXwlorDTvwVZyy
 QKAk0AuYZ8PNaSUV95hTSv+dxaI10Oy4uHUalVC2Sq9c1n+DjlZbuXazzhGqA9xm6hqajqaAdo/
 PfL+xm+MQ+Yl7YqyonV9VBflXXh0BjkW8HWNMu8RlNYBHe07izQM2IYfrOCs0HaUVwG4wjVkWMf
 Th77tJTJV2F6G8oLjZXMJs69gKtM5mktpQ0wp11dQxMo2W+T7PqBQl/cvuJSYCpZ7Y3Z/64dgrN
 udAsSJscmzQ9ftdwSpMJcXk2AQ9RWwoNACEZG2yTYT2T3M3wxpTy6NIJm5TkRdSrC9AN1183npV
 pvPEmaaUbGHm4R8E1XJ/Ki2rn7zzRYkKdpWUvUo0T8QzRJSsfhmJYe/2wjh+4wTE607fjIHnAH1
 dvt2rWdg
X-Proofpoint-ORIG-GUID: 4VIZE6PwZFC7QfreBb-fEfPCo4kDsj51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
Environment—a library present in the Gunyah hypervisor) utilize the
Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
securely authenticate and reset remote processors via a sequence of SMC
calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
qcom_scm_pas_auth_and_reset().

For memory passed to Qualcomm TrustZone, it must either be part of a
pool registered with TZ or be directly registered via SHMbridge SMC
calls. When QHEE is present, PAS SMC calls from Linux running at EL1 are
trapped by QHEE (running at EL2), which then creates or retrieves memory
from the SHMbridge for both metadata and remoteproc carveout memory
before passing them to TZ. However, when the SoC runs with a
non-QHEE-based hypervisor, Linux must create the SHM bridge for both
metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
for remoteproc memory (before the call is made to TZ in
qcom_scm_pas_auth_and_reset()).

For auth_and_reset() call, first it need to register remoteproc carveout
memory with TZ via SHMbridge SMC call and then it can trigger
auth_and_reset SMC call and once the call returns, remoteproc carveout
memory can be deregisterd with TZ.

Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
the SHMbridge over carveout memory and call auth_and_reset SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 917341308873..7a86b27ea666 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -790,6 +790,52 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
+/**
+ * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
+ *
+ * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
+ *
+ * This function performs the necessary steps to prepare a PAS subsystem,
+ * authenticate it using the provided metadata, and initiate a reset sequence.
+ *
+ * It should be used when Linux is in control setting up the IOMMU hardware
+ * for remote subsystem during secure firmware loading processes. The preparation
+ * step sets up a shmbridge over the firmware memory before TrustZone accesses the
+ * firmware memory region for authentication. The authentication step verifies
+ * the integrity and authenticity of the firmware or configuration using secure
+ * metadata. Finally, the reset step ensures the subsystem starts in a clean and
+ * sane state.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
+{
+	u64 handle;
+	int ret;
+
+	if (!ctx->has_iommu)
+		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+
+	/*
+	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
+	 * shmbridge on remote subsystem memory region before it passes the call to
+	 * TrustZone to authenticate it while when Linux runs at EL2, it needs to create
+	 * shmbridge before this call goes to TrustZone.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret) {
+		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
+			ret, ctx->pas_id);
+		return ret;
+	}
+
+	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
+	qcom_tzmem_shm_bridge_delete(handle);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
+
 /**
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @pas_id:	peripheral authentication service id
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 9ca3218f0948..1774584ff5e3 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -78,6 +78,7 @@ struct qcom_scm_pas_ctx {
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	struct qcom_scm_pas_metadata *metadata;
+	bool has_iommu;
 };
 
 void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
@@ -90,6 +91,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1

