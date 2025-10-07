Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6724C2E8B7A
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 16:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855782; cv=none; b=APWToHQLLVPPue/6b2E07w/EAfLuhMD5pVOef/KFXxndgmoeEImTfBEFgdKFdgiLvt1iR98LUyX1OimiLnfQQHeTbvXFbxMUgblegjitVzBEgsdpt6QAMWEQyoQ+iKNahg1rCz+hWdboIkJbIaCo0E15pBWfkONH+V2flS2jG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855782; c=relaxed/simple;
	bh=nchSFZ9vMH7dW6216FZMDpCFBfk970TnOtt7Cg6SajU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VEHg765VstTHg2ANQX20M107MaLewq5APiq/DxJwj9N/mM0FMx0BTXWXHMx3entz1qCAUF6Iu+10EFsiUj5bziJQu9SUL+lTm//TvAzf6sgHIojqHzhEW/+Y1yFKVur+w9N9YB/vFJBbHcWsEWVs67R+pkxCRHWtA/nwfbKSKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPmFfr8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPmFfr8w"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET5eh017440
	for <linux-remoteproc@vger.kernel.org>; Tue, 7 Oct 2025 16:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UNNiIF2DanVuzJOdBEyhVzVrPsK1cze6XOd5wQkJelw=; b=WPmFfr8wvWiuNHHx
	5i5jn8yjMdRevNFEbtqc3WSnXRY9MDav7EgQK82eH654YSBpdIEJznAUEAVjhDED
	DeNZev/SWYry/PRjgvhKhqO3ubgRkz+FeClNF1U/QEwEFdZWUj1wsD8hpht5LpZn
	JTYuKWo67pE7PkZk988oCFYgYoLrcqDFFHD+etHv6Oo29gqyzMoFQAqTZb9hf9yb
	EuCmprN/u9uvLeQIkydRR0/eqyTqI3GPwCnu/gg+uxvByh/VGxsqlw7CDnN+ewWC
	j1wDLJ3r4ugV7uMj20REbpgCZt4fYRFxmnjUr9CifMe6NCGCU57+F03NiR06Ryso
	imYu/Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn89n1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 16:49:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-277f0ea6fbaso85130115ad.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 09:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855778; x=1760460578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNNiIF2DanVuzJOdBEyhVzVrPsK1cze6XOd5wQkJelw=;
        b=AlJv48UPBMUuJSbBHQZSFci5vMk/V1Z5EdpCEvZYANElJdKjQIizHM+h+qnotw0may
         vid5XOXofEaxnw1bjMnDXSeN83wQ65XMyF9d2e95FMdOEMwqnq6y8UBcXFtlXeUUZxmP
         J6EHjF9HoZCXSR7BoD3L86on7uQiTb02X17fksninAXKR1BHVKrpIkUfyfEpPWMwTZjw
         +P2X+ejHwOjapI098ZSLkCsGgMuY0esETx5cGlLeXSjszQENOUesZLcJ5tFdE8AurXRp
         WEi8SXvQcOPDQM7bOkIkFkpBm7RNMd+DqNpqVmvj7GDzVlK4M4gGT1yCup1fI/5VGDJG
         DAuA==
X-Forwarded-Encrypted: i=1; AJvYcCWFYyyuNkXCVQJQdHqM5npxhKwEU02ozGUanG67gPIjBJzLnOhezwAtYO4E/npiWvl5/fqrri52sX4F84sVxBMt@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdmkt6c4autK9ilPc7FPoAOnzpZqIkUzwEAxkEnjfsW9knyiN
	YOc4rdtS5DiQJTNtAowXFNP3Mtnb/cJhzSObX5N1cjxIGSA2BHbuCgk/w40bsiqoB/knTwP66rV
	XO8oFHsnVmGWHXnhQjeVeahUw40gPY1dvmcYKpkxFuUY6ccWvtEM0DBEenL9g3MHG/xiidMpF
X-Gm-Gg: ASbGncsc+IQJ9tcKttQUeDa45pQEKEEHCAfqP9rVKlrhBfDb178ZUoEIBCBUP8g7ePN
	mIt2k27AXeurPwnqasxbvINFaxnVVgWqwb37zObKq4xAykuvuBsB6Hh5d8IKhLuuWHSdRp+hHfc
	pdr5nHPlTVclkY/RpGKLiOm0Z7noXXPmo28dk8PsaI2kup0mWxKOCtT8NIIFxcOY61yf8Py2Iq1
	i1R7ty30k7ucBfxK71+ehJohQ2Gp4JDZpgsiUsxfwxEc9O9ioXV6VfkAGAMUoelo/NZVFU3oi/p
	B0GfbHKDWF0S0Tv7qsd6/tL/gdwd6/jwBn4UU9vUN184SVR/rydOSYgyT7p75v8EJgyPcfVt
X-Received: by 2002:a17:903:1ae4:b0:26b:3aab:f6bf with SMTP id d9443c01a7336-290273ffe32mr4460315ad.42.1759855777784;
        Tue, 07 Oct 2025 09:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEY7nMywzbXyLxfw2TSjQ3gmdhL1C+GRhWvNFsztEfraqsz9K7OkbcVxN2Oq4GJ8EkE0bi4g==
X-Received: by 2002:a17:903:1ae4:b0:26b:3aab:f6bf with SMTP id d9443c01a7336-290273ffe32mr4459975ad.42.1759855777155;
        Tue, 07 Oct 2025 09:49:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:51 +0530
Subject: [PATCH v4 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-6-de841623af3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=4497;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=nchSFZ9vMH7dW6216FZMDpCFBfk970TnOtt7Cg6SajU=;
 b=Riqdd/lGbdVHV/HkbroNwlEVSoXU6lfdswsqsaZ6y++Iec55eYP7vEXtIuloPPEz1l7xhLTYq
 7+AioLYGe2FDv29V1J9or/5Z3amr9NALrkWrkE+sdh3s4XfUIxDM+hn
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfXwljU1oME38BB
 y9uAkGjHTXONVZgNJgg/iZv1ZeOKrvYdGRa1pelmAKp9RloaS8GU3RI0T5z9OnVqADbx2AVB9Q7
 FZCoB2Z90+AVRgzmEIJmVd3ZgZR6MC8zNoznHvVzB/ZgQbsNNm5aZlUPF+pbs6lMY90I6UNONRx
 5mdz4AMKmKY/DFUqycSRkpoXglIfJlriwlbHc6YaUeazdeiMPpE9G096MmoinoTLRXg5O3Qu8S8
 0/B41HWL6MFO4WWpeJMe+bDgucpzTYaB4vlrsiAZ1sRiOrj8GJdGsvwh5cmRZ/uc2sTY9nKEB/n
 Re9Nc84Yo+yz8aIt6iitdoFTDMmydGwLeS35ADQa6FIwpw9PYgCn5z45wh5gpTmFr/rIhySrA5k
 f8OwMlonYWeM4FrKesHSKxsdITc0JQ==
X-Proofpoint-GUID: lwwdp1Ge77G7JlLT9SvVbvhyhm6oSRfE
X-Proofpoint-ORIG-GUID: lwwdp1Ge77G7JlLT9SvVbvhyhm6oSRfE
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e544a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=XGel9bHSJmg9pP0w-tEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

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
index 7b4ff3cb26ed..ab2543d44097 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -791,6 +791,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
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
index af6ab837ad5a..d6e7a6c9583d 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -78,6 +78,7 @@ struct qcom_scm_pas_context {
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	struct qcom_scm_pas_metadata *metadata;
+	bool has_iommu;
 };
 
 void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
@@ -90,6 +91,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
 int qcom_scm_pas_auth_and_reset(u32 pas_id);
 int qcom_scm_pas_shutdown(u32 pas_id);
 bool qcom_scm_pas_supported(u32 pas_id);
+int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
 
 int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
 int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);

-- 
2.50.1

