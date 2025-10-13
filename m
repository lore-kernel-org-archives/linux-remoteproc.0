Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D42FFDCE
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349855; cv=none; b=dNAN3ilNgcrjb6K/KnVtDCy8B+1DmpnE2fxCbPr05wBxW2q6NRkZmVdzJ4+PxBm8SJ9LHK1IzuUegelgSwd8/NrFqtw1Z8Iu9z2doNW9GJQhrFKIfbLzGAc7JaVWVSM+fx2b7pEe7Ip4aSb0DbW9784h+YK2d+FUzEsy+LNY8Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349855; c=relaxed/simple;
	bh=8hZm30CWvb7JLW+d0khgV1UhhQZmzpIiZ5CwI+qm9/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwyGo0U1husYcqx1UL3XmMrrgGfwLloMb5mYqkpknmoCPgqUPIVTDIXCrQhkQMX8YhBy5AfK7THKeu8zDju8dI8rRmOUHKbTHF3Jw/wZi5uFT50QyHoqQMHId8JcBzyn0hw2OBo/ChkoMNdAaTPyUPLpChrWpZJEbupj2PfJzcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTAn6d+a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTAn6d+a"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nC0q000934
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bn92h9RApZSfqikarJGJdkgvCyYOoKZC0dM4YRCgEQI=; b=iTAn6d+a7JxB4Jq8
	a1/LlCuzuVZft7hCDhSYYQ+COLTT3C8u6I4RvHfJCevpLl3F0zW5rnEjJ6E1JIxq
	KRjsMiNQkCqZrDHvAICwbS4UcNDBe8coppD54iibRG3hEWi/T7AePvM1dZK7SApB
	cP9KTS6tBF+9v+mGteTmu81apaY9qM2A0vBRjvQGYw2a2E/5feaIyjjoveIcnN/F
	Iu/9JnJTPRRNH5JO+6dT45C6a3uVJh+fiZcAUjpTk5k4QN9EIkYUmAwVcqHwHO96
	dkAqMWAL3/xeY9Jr+KfcwdS7oEtZwQ19MHcqt383WRNbUfZYJdDvDxfxeqrpFMQe
	TmrPXg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd8v6ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 10:04:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so5404327b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Oct 2025 03:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760349851; x=1760954651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bn92h9RApZSfqikarJGJdkgvCyYOoKZC0dM4YRCgEQI=;
        b=fRgkf7gxoO4gk+kwE6WrEKIlL0IitafAmoSUq7iYRQfxeiov0Tm4jUGnJn0Pn2QxM8
         OQXTdensAvcz0OaTDOOVBzHHBRL63Fhadu4s1bnmoiWxNyhWSusOUbfGor9QO2K1lkY2
         l/kYsg0EYP1GI6nmmrJjlK9TMFFChT1u/8rT1h/9AeVyFBwOkZ+VSDGqV5EQ5PgKgav2
         FClSdkB193sH3ZCSsHiz8dgQyihuE6NgZkWVnZe/TaNzKqEiUlS4mN/Lf7vxd/M2sS8Z
         tukv5AhEk9Ml/KEaFGMVqsnEiINIMb8OOVdc2K1CoDfWnuTxCJDolQT0vjCNoqmyDkvq
         XFsw==
X-Forwarded-Encrypted: i=1; AJvYcCWpBsywqHT9dnXoziKLuFvEpNo8RXwbzyWckDy+VBBHeMr9gT+o83GqlXG5622Z6ev76uaUJxEIVG00vTtOqbt0@vger.kernel.org
X-Gm-Message-State: AOJu0YyW78w/LfZJfIb0ZFmFBRebT1VsEYqjGgp+zizOhD4vpdox6kqw
	gR7zmP7bpLwCq/bPlLnfHpY/MwxwLj6yDFNNlRAFI5nDJUw6FGZaUpICtC78DJ/F3njCJi6kt4d
	tGxeVM93sBCgd7CaU6jvEw2J+4NEDKGFHncvji0oHtEIOSNnmlYtExtQKSBIXl3wf4XUfzNZyKp
	Xz41RO
X-Gm-Gg: ASbGncsEeMOp5DGijpGineu84LOJER63BX+MMLlHmGWBKFIvny36Y+7LF+VukaIbm2q
	ImEM3vdv+DCoh2KYknNBQAtCg+cVK88AeXTWb0OaXn+aN/5cuyEcDJJmhEPpkspoN5KQBqGLRl6
	cDCg8mNkyAGMqyt4Gl1u751+IXRgT6h8GK2gOUsx+6rCDY+Oj24Ov//vM70z/O4xdkl+wdqAuG1
	xQH+yRwv5eyLKm/xTM46Clwrmew0DJy2VJZjBe30ZeOuOK+uFY1by8A8S8206gjZa8qABkdFUrH
	Yxe4GSo7tzS/YKDrqfScWAuQCHehJuDKy3wllIaDiZy8PfISp36otitKkiviuHltUkU=
X-Received: by 2002:a05:6a20:9146:b0:2dd:5de9:537d with SMTP id adf61e73a8af0-32da7f1d974mr26039426637.0.1760349850587;
        Mon, 13 Oct 2025 03:04:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkepsAd/sFmmzOQMnmuosORBwE0j45YLn3MYyiStu4O0jdvLq1kf45fEz/ncS3MkAY05DfHQ==
X-Received: by 2002:a05:6a20:9146:b0:2dd:5de9:537d with SMTP id adf61e73a8af0-32da7f1d974mr26039370637.0.1760349849911;
        Mon, 13 Oct 2025 03:04:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b8672sm10981657b3a.69.2025.10.13.03.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 03:04:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 15:33:11 +0530
Subject: [PATCH v5 07/13] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-kvm_rprocv5-v5-7-d609ed766061@oss.qualcomm.com>
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
In-Reply-To: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760349819; l=4507;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=8hZm30CWvb7JLW+d0khgV1UhhQZmzpIiZ5CwI+qm9/8=;
 b=N85JGHOHG8LetyCjmUjV3FsTNYA/tv+mBZg0IQn7R0FYSTAHR31+Z7owFVcYXIrgd0alVgb6g
 Zn26aw8i5bSDHq0uuvCKt9IysJ/RKm+3sjjUuWF1CxO903ylwPBrYWE
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: 2eQIFLYnVyyXjNXYfCn8LqSl_P-C_1B0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX4vAdwivOGGvm
 L/3vTEC4hI54YOEPirZA3VQODkLhBwdwNVZPJNY1glxr/2l3Z3FFqSRoar6Gb4IlrDvkgznKUb8
 N+JpktwhfUoAoblud0kUo59BcwX0jFPOW3hGhYAmEsd/pPdAApQjOtgQt2hk0Nna3knUsQv7RC1
 KRlv+X7mAJnzjq44r3PtJ57RasSW/Ejp2oKl8LqRp0JCRIVba7MRPGit48WncyUhhYzRFYXxNf1
 fk/U07Bx9UVUnpVN1+gcJkitj185lemiW9iFGWq7fbHycJ4z2TU7QfohShIFSG9X8Bgp2o7ziOG
 iEmu3Ax8yiOzfVNUzmyWYVNB+dmAVgLcpPALTTASzjJYaBJ/tWbdN/hw3wZ5wzw+oE/8U/d08FM
 +tMz4uP0Q3Aba9PXPaSSeSfzdcRqpg==
X-Proofpoint-GUID: 2eQIFLYnVyyXjNXYfCn8LqSl_P-C_1B0
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ecce9b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=XGel9bHSJmg9pP0w-tEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

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
index b11a21797d46..a66e782fdb68 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -770,6 +770,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
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
index 7c58d26ede24..e1de3cf73451 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -78,6 +78,7 @@ struct qcom_scm_pas_context {
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	struct qcom_scm_pas_metadata *metadata;
+	bool has_iommu;
 };
 
 void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
@@ -89,6 +90,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1

