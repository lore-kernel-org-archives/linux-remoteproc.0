Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45D2C11E2
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755622528; cv=none; b=QxHbVBb8EDudbh6tBc2/GbAY4A4FsBJKmVFYSebSuw4SI+NoSQx1QyQcWyg88m3JRspSOzKVM3EQQeLRfWjyZpeLjgKuPUR9M5uTfulzQCtQ3pVSzcapkdujdBEbHBqIA35fvbK+Xv/xJA0kwshxMEoGUnNem5/GiihsJ35XuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755622528; c=relaxed/simple;
	bh=/AflHXTFVOH16SOW2V+0meYRbIqCERPZj2WZC7Vo8H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euC0vbMgXhjTF0+cCmDA7UYRSGu9GQ7aRxQv4/jOB2oNOuTYL+5tbaouVyVDW8Qo4YK2wYprV05G4g7fxaIDkyK4WoFw8fYptt4IlWTeQtwF4nNYm4S3HvEC1z3PzeTf38Zi53oKGJ3nH7jIHedYOJVq29mE3ccgwbSpTkhmAJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXRdml3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXRdml3m"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90fUL007332
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pXVD6URM8iG
	tLYeJuDTnL3ZNXgs+m9zGa8usL8h3epI=; b=cXRdml3mbCs2lHhaZJZzWvieN84
	kUS2hI4UYd+t00HXPun/dT3q0wvOzh+VJZq5Sz4z68oWu6692DeoM6iHmvklrRvk
	3kO1lhs7ViWgxA7Tc/8A06DVdWK60h+dHVuL4iS4EVmLd7n7orD79MAnQhiq9Vea
	x8mZItrgJUcJNZo06G0lcAL8rfbWcfRdZwY4kzuyGkAAMKVwMehXWpGYZMQfcL8c
	983esjVm9Rovo/ji4enBKuQseE70aQHRkDTwV2jGVxXPg3QtFeb8XiXiB3pkMrAK
	rdh2t6kW9+ewtdHjPflu6mtlmLLbkbFSZzRHSfsZ+kIrBBC/BRbbPRx342A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj749cw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 16:55:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458264c5aso58482045ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 09:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755622525; x=1756227325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXVD6URM8iGtLYeJuDTnL3ZNXgs+m9zGa8usL8h3epI=;
        b=CU6GHcUR4J1zTWRdvviDdv7Fg+S2wlKvKTrH3MU5oMHPdjkttMQ5DicFPpRD2NvgbP
         /lXff9G4Z+DziBuRP7dvV9F51MOpgm9dnwcU+GyEG5yQo3KXNR6u/XZ1MH8p8/f4a92u
         6C8wnzGqaqsLqAJIctVEGGgIQbwaTm0sxRBdzy6W9tsJmTu8zFJn/Q0sEWAdFNxlDhGn
         IyDrA6ZzlY/WSk+KBMiH52BouoP7Ml8LA5fLaBhbT0J6Ty2eUAV8lsW763zeMZ1pSvOj
         LRVX9mUWoND5+0R5ytdwDPfVdYcJzV8dtcojSxjBWM0ibEQr9PgaezIF7HXuMIafeZ0b
         nUkw==
X-Forwarded-Encrypted: i=1; AJvYcCVOiYvXN+CKs/QHzqYJutUzbIQQCu6beJz6Fcp6U68RzT1ET+gMrRDJRxRkM3XroOnm4ZfR07bNGuL51Fp4rYEC@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuKmKSSN+qCK0FH/cP+fRff9Z1dBkPaEBbYajHklqfMTJV1q4
	1gjats1J9wqxFPzuZLBX5fimN41D/0990sNf+jMxlhHoBjhmxX0+bFJM4aV9NuhTU6y+Ly8lVNb
	glgGgua2rkS1/h595/mcqYKZYq91cO5/F/qXMYBIKY+tJ3OkQP/5Inc0cz9h233QzDtVpersVuE
	9IoXkz
X-Gm-Gg: ASbGnct6YVQtz6aEA+3S714KYYC6DrXIAKAbPmw0SvEBvrX3WDLCjMZtPjwPK+w0W6m
	7Hnpc8+A92ZmVLRUG8T0L3V3S90ghnz2L1a0OzD7rk2ORmJdWna+FqYnRpVsARw/2I5okH/M1J4
	chYMnH5DU/rbbb5AnBZsI9UV2xtaQCkvblPbosfdxutLxycQyur4pqGFglCTMmCkyKHZWC4Lnog
	003jUz/qlEAhSr2/TwBCRVXLD+67k5w2V63oOMELPL0BPy9LVXYmSGp9UjHjZZ/LisjV/keJUxE
	Rs5RjC640dIwwkgUjwOKmQvuCBAXemOqhw8L1NPrz9DEXJKTCdFbD4gqs7XDagMCGDA=
X-Received: by 2002:a17:903:198e:b0:240:967a:fec3 with SMTP id d9443c01a7336-245e0484a9amr41225465ad.29.1755622525329;
        Tue, 19 Aug 2025 09:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+lNYppywDdTFFexVwLhEK+BRHzaI9WsoHo0SSwLAnNl6dT+h/o5sN/sHh1+Wi0XAryEA6Lg==
X-Received: by 2002:a17:903:198e:b0:240:967a:fec3 with SMTP id d9443c01a7336-245e0484a9amr41225205ad.29.1755622524920;
        Tue, 19 Aug 2025 09:55:24 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33aa3esm2273885ad.24.2025.08.19.09.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:55:24 -0700 (PDT)
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
Subject: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context initialization helper
Date: Tue, 19 Aug 2025 22:24:36 +0530
Message-ID: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: bF8Il7gWTiObUAcpAdkROLpF0ZMjOR0u
X-Proofpoint-ORIG-GUID: bF8Il7gWTiObUAcpAdkROLpF0ZMjOR0u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX2L2hG56LwMnt
 O1sqxiOXQylmTllIDTztf4laJqqcvZKbNIaGaPjps5pIxBOLvkC68hhT3DTp55IxWWm/cSGf6kG
 cepVy0O/H5Y9oGjnNkfUKoriia/McH9YEKxAATTi0JjSYKxdMCgBBl9nvxNVr5fNztaTVx9nDWx
 SUzpQJ6ia466Sp1e+n7wtTTKMLb3Vv/7UuCQ/FfOVwCccvPC8u2HpjLNQGZTAqnKNaKznlMCy36
 OUk5GQIpQmkXZQDcYqFpw8oI3Jyq7TruTvTOeI+FGL/wdfjVtTzhw3VGX8UJzRCnrVeGYV+CM8n
 2Nu73oULwI2P/fjXusfbNaYS2PsJiobAIPiQCFjoE4rqOoTV4rklWUS5S7RN9UEZiul/Nnj9d1p
 aG7YLMx0
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a4ac7e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3w5JJ7MTCOpz5QvkTaEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

Currently, remoteproc and non-remoteproc subsystems use different
variants of the MDT loader helper API, primarily due to the handling of
the metadata context. Remoteproc subsystems retain this context until
authentication and reset, while non-remoteproc subsystems (e.g., video,
graphics) do not require it.

Unify the metadata loading process for both remoteproc and
non-remoteproc subsystems by introducing a dedicated PAS context
initialization function.

By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
across subsystems and reduce the number of parameters passed to MDT
loader functions, improving code clarity and maintainability.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 96d5cf40a74c..33187d4f4aef 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
 }
 
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
+			    size_t mem_size, bool save_mdt_ctx)
+{
+	struct qcom_scm_pas_ctx *ctx;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	ctx->dev = dev;
+	ctx->peripheral = peripheral;
+	ctx->mem_phys = mem_phys;
+	ctx->mem_size = mem_size;
+	ctx->save_mdt_ctx = save_mdt_ctx;
+	ctx->metadata = NULL;
+
+	if (save_mdt_ctx) {
+		ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), GFP_KERNEL);
+		if (!ctx->metadata)
+			return NULL;
+	}
+
+	return ctx;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a55ca771286b..b7eb206561a9 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
 	ssize_t size;
 };
 
+struct qcom_scm_pas_ctx {
+	struct device *dev;
+	u32 peripheral;
+	phys_addr_t mem_phys;
+	size_t mem_size;
+	struct qcom_scm_pas_metadata *metadata;
+	bool save_mdt_ctx;
+};
+
+void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
+			    size_t mem_size, bool save_mdt_ctx);
 int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 			    struct qcom_scm_pas_metadata *ctx);
 void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
-- 
2.50.1

