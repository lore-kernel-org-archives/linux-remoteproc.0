Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A0430B53E
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 07:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241803; cv=none; b=N3gafcso+CcsMhJajX0MVap1C7uEuBMmBlFQ9HcK1nnH4JOpBhJpjG+F4FocoWsyXHZkofC7yUjQ9I3tsHmZryVluPG/qLJeuF5CdCmGaH4mWAvRU5G+p113wF3oLWVz785DcK9iXiQc6ZSvE/5TKKY+hO3YMl4I506ep1Ft8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241803; c=relaxed/simple;
	bh=f7VXfKs4se9v8TY2Jj18kfT0kRZEWFOC/ZbGamMdPyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WXfspmlOf+K7Vsy2w3Cw2an6LoMlvOkKKnbV9wywH7BhF7IhDJBj/KHsAWF36nkM5wccbK7T/3l9oUPiC6PUy8CEiwYCMMU8MYRwDQQrSGeBzfqWGQyQj+m0aPUFLM5MsRr6+IyZ/YbPay88UsJhsAuC7H4fBrINXQWhD+heErk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mH8u2Deb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QSOwch4W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mH8u2Deb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QSOwch4W"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42uYNo3667773
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 07:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8fTGgl6J89LxhsYpqGgdlY6OnIJwv4clHy1l+1tA0c=; b=mH8u2Deb5UvvFkEK
	jK1hvA2jxW67WCsQ5HbUhzfEzLMr/kK6bZ/kT9QJ5DEIH6L0PnOiiYxYbeon3iuU
	k9ikqF5STHn2EKxZe5bnFulqtZeY+EDKvUbT4PBhVymKrJCCfAW0k/LttM8WJrIm
	scZDHb2b+xztO55aUBsDfUv6rzeNbnCQkSf9HlJk52Uh8n2MWbzz5XB5wQerIigl
	1BOFfycZnlvmK+yy870BXjWmTbUufgqokcrzMyCvHn4Z4ZSzvVKZVvM7XvzThxJR
	yqychzZ5PaZ4PZKpoidnS43U0kuaQDqjfz8yNxev1T4PkAB7Efec3Nkc7vBKEkzf
	MqBzZA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70ffj3fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 07:36:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3418c17d21dso69151a91.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 23:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241800; x=1762846600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8fTGgl6J89LxhsYpqGgdlY6OnIJwv4clHy1l+1tA0c=;
        b=QSOwch4Wc7jNY9/D0Qm5PqRT5BYm2sql1u5vZlbCK5LshksP+eY8PSfPozBodI/k2E
         ntlulBBASvXdi9PtUzoezwM495m0DONz52W5lGVCx7g4FaRE/LNea8+7ToSg7EQgGOU1
         7IWM3dgxSAX9TriKcm6VKyhoiaW6iU4FbpDBcGGtkgP0aJPIA7j4tixqYfoFdH4EHeGB
         eaFY1ObqyDMpsnFYB8OOeo/KLgmFRYeNp9NxHoi2jIc/Q9UyuASSWmLaHey817MZ0rY5
         EkVcCEvMLukSLKKR03YOCL6BqHZGNzPnREU8FMpdVOXLo8h524/1vvwDYuiwKxkkntFG
         4rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241800; x=1762846600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8fTGgl6J89LxhsYpqGgdlY6OnIJwv4clHy1l+1tA0c=;
        b=YSJT8wXCqPLx6yw3XqIJxv9wNpjM1MT1d1IYTQuOWPBv03X5GP1gYWtg+8REDC6jlO
         Hlcn2JOf4tuZnxGgqmI2Mvqkjjnqn8Z73QiUq6z0Gao153Gx4OuKiXEO8k//BJzTKKj5
         m+fXiwKrvuspcCNFV1gMYbda/QcPWvGFP+gQwxYD6j97Rn88DtaogX/xk0XuwfheTqf3
         Iz4wp7KM6Zk1DfaQNAiGYAGZWWOxrn6BndHnEXm7ijzOBA4sBHj/ml1r1aWyGhOl5t+e
         t4JrFE0w2wdGQV95QyYJ/QktnW98sFqHxrSjW7v4vWMUw0nvVVRYzpAgUZkStogaywpb
         GjjA==
X-Forwarded-Encrypted: i=1; AJvYcCVaVv+od01WZCgOdXvhXOom8UBYJ+dQNaEiFAxYn0/ZvJyeQ5YJ6+CfL1MnG9bKk3lV1R1yNA4Oip3Yv7TIFeGR@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUYahsGEJYXrIjRFP5ENAMAbqOxfq1Mo0Gm01g2on7BkBEIUf
	gsc9fXMFFdrEiQXtyhAJ1iSf6C5jTFkJyIXtiJkdQFnjlCbK4CidFXD1MfPeyoaLwaP7VgsXFfP
	cTRfsQzSwaEb/ruUNErfxKn2rKQmJdELmFXRN7XXRE0HviyDqqubDI2AkiZ3P1/YoH/7A4KHWN+
	KjoVe/
X-Gm-Gg: ASbGnctTi6SEKrf3lLMieE17Va6KLqXnOYw7ysrYu1oVHFKpj0wxf0uVsdyHS1/FTFq
	IpCjtkDlEAJs9BNJxLd71Thxu8LQ2oe1HtyW8LvhKq6ZpP/K2qZb17sCTGGicw66SL+MryjkKgg
	I4n84zm6P2JijTeCXCIqn35mm2qONwXOxVZauT8Ume4WoXZqZvHNYO0L0ozgTFsYzkK6mB+yD4t
	Nbr0x896G5I5ctM90FGWEx0VVzX0zT3Y8U4GLbcY7EKaXP0+fEh+oyL0pxHzGBy5cijTU03JbOc
	InAxUZK64BwyEJpASsuOpuwyNbAdxYflHTtVI2s2nPSB2HbetnLGzfIkAN974u2wt3HKdVCf3sH
	wDmvNRTS2brfmOc+VFtmZE1e1kQ==
X-Received: by 2002:a17:90b:2789:b0:341:88ba:bdda with SMTP id 98e67ed59e1d1-34188babf0emr578037a91.31.1762241799769;
        Mon, 03 Nov 2025 23:36:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyebbjIzDryaQRpDZJO+LTJ16iG+lKvxXXGziZyVCKMfstPlAHg2easMtTJQXVyofBYcO2LQ==
X-Received: by 2002:a17:90b:2789:b0:341:88ba:bdda with SMTP id 98e67ed59e1d1-34188babf0emr577987a91.31.1762241799006;
        Mon, 03 Nov 2025 23:36:39 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:38 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:48 +0530
Subject: [PATCH v6 08/14] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-8-7017b0adc24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=4512;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=f7VXfKs4se9v8TY2Jj18kfT0kRZEWFOC/ZbGamMdPyQ=;
 b=XBh4X15hxAfOK2LhgsfA//Vzq1ZgSEXmYNkLwsE4R2bb3G3eByKdNddJDYQKp/zYnZKuE0GN3
 GiSdvHEXbnTAJovzlBeBVkBeo85kBtdFfYBtgZw2iJTbzLVmaXuARzG
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=6909ad08 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XGel9bHSJmg9pP0w-tEA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: UgaC_6jitbFf8Jq4JTohjf9gs_w91JEU
X-Proofpoint-ORIG-GUID: UgaC_6jitbFf8Jq4JTohjf9gs_w91JEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX/A5D4Lg7Z5Wo
 1Bws7ouLSms8ljjafRrJMIABne+H/X+V+g+QdWIKjsCjIPD0j9ivFbT7rvt9jnNV27yFcKsU1si
 87RYkxji0pE3moTxz6PWZDO0P0t7Cb/GpU+AIdQBT+Az72f3xJuy9u0u348KPbE9Wf+rn0j6GDi
 Wvpg5zWGDY+i8gibT8SuXrcfQ32sXIr0kkWoxL40JS9OgBPXL48iqmcTmD1fjVzzjRuvPIzynRz
 U0h4LrEsmIkERQlOHDg4kPccqcIMi+BdKe+hi2s7ztAIyv2u18kZKnlAn4XoHPf+UBI1vCIo1Dj
 lCl3Ug1SzLU4lKZRYEK9/pVNOqmRZWy91PBTCfKBb9QAHQOaZhEGmTSfvnk+NGrMowJEy+D7YBL
 xaNOSPOfqv6umk5ztgQ4w4djs7pDjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040061

For memory passed to TrustZone (TZ), it must either be part of a pool
registered with TZ or explicitly registered via SHMbridge SMC calls.
When Gunyah hypervisor is present, PAS SMC calls from Linux running at
EL1 are trapped by Gunyah running @ EL2, which handles SHMbridge
creation for both metadata and remoteproc carveout memory before
invoking the calls to TZ.

On SoCs running with a non-Gunyah-based hypervisor, Linux must take
responsibility for creating the SHM bridge before invoking PAS SMC
calls. For the auth_and_reset() call, the remoteproc carveout memory
must first be registered with TZ via a SHMbridge SMC call and once
authentication and reset are complete, the SHMbridge memory can be
deregistered.

Introduce qcom_scm_pas_prepare_and_auth_reset(), which sets up the SHM
bridge over the remoteproc carveout memory when Linux operates at EL2.
This behavior is indicated by a new field added to the PAS context data
structure. The function then invokes the auth_and_reset SMC call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 48 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9cdd152da592..283e6cff550b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -772,6 +772,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
 
+/**
+ * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
+ *					   remote processor
+ *
+ * @ctx:	Context saved during call to qcom_scm_pas_context_init()
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
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
+{
+	u64 handle;
+	int ret;
+
+	if (!ctx->has_iommu)
+		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
+
+	/*
+	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
+	 * auth_and_reset call and create an shmbridge on the remote subsystem
+	 * memory region and then invokes a call to TrustZone to authenticate.
+	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
+	 * subsequently call TrustZone for authenticate and reset.
+	 */
+	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
+	if (ret) {
+		dev_err(__scm->dev, "Failed to create shmbridge for PAS ID (%u): %d\n",
+			ctx->pas_id, ret);
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
index 2905587dcd17..345ddcd53b42 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -78,6 +78,7 @@ struct qcom_scm_pas_context {
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	struct qcom_scm_pas_metadata *metadata;
+	bool has_iommu;
 };
 
 void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
@@ -89,6 +90,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1

