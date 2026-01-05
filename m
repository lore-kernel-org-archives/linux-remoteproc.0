Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70FD33DECE
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jan 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619435; cv=none; b=pQUsbo0esbxRIvtgXR76ba8uqqlOX2ZMzSOPqeFY5OTZLTueLbf8kPMgMzxuSrSnSfRtNY4ncHhqRq2szIyJAmHOhp7+ySVuNeHvgMkP5WB80JP3As3aEl08/linSd1n+iqK9gnT3iETCH+63QDLzt4ByqWrl5/YtDJ/kOv/h+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619435; c=relaxed/simple;
	bh=2DBhRl0IrbEGORjCMRdcnMv1YwAZ0EWa5bKeuKqAi0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=na97O3kQtpyYLbIVgni6Ue8/FrDIaVNO5oTgbaIHhfwnQjZ4qLA0NWVkw5FELwsAwiOxPtdlxAn+PCVTl7to11WYRRcWwJzIHZx0yrENI4xHFN9/MUg73tUXunOsW/zXivD15h9FWIiga+WGm7FtfQSnWRbxNRkoFa0lxfq+z04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YQghvKkv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdM9YC2G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YQghvKkv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdM9YC2G"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058wAXD594030
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Jan 2026 13:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKCQ9aHSsPPhuwQM80Usl9MqjI0vkKaSKtbQU2Gl8os=; b=YQghvKkvvjzLzupo
	9LkSb8TKXS8QqUK41jbJRGJ+Cqnkf2SYZc61XyCiShX9Cc/I3iR0xh1Ye3Y4DCVM
	Pk4Q9YLrqdQyKXDejJnkv7b+dbWIgYY/ztB85H4lbacyWE+r8kaRBSYX+Uyb8R6A
	zOsO/OI0q3NcORekiW2YN3rqqfJ9NtD/jk5/3KuY4l4SDEYrGZiT3I3dLDfp+2iD
	CG9u/c2vvMCtMGEFaf0/1AjQDxDd7dmfE4Jw1zmZngzZibK9LIVmR/DOQpuk937G
	mxqMSWVQdDwrey9IrvOlL5fLYlZAqrUhktbaOH+qcJLTDjOVNq/EJS4yknGeRTto
	rFRvSw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pgnne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 13:23:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so15485581b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jan 2026 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619432; x=1768224232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKCQ9aHSsPPhuwQM80Usl9MqjI0vkKaSKtbQU2Gl8os=;
        b=cdM9YC2GopY4v/vStpJFtzQnlM52tICTIW4DkFhTf1lLdjWSBEUd1DvHMCl4zbzwLm
         HYwq0g8ajOQW7hBFMtcV92u0noosD9wtne0PHezeIj3vn1LLTIGyB99XiTHsCOg9ucDO
         o6RvJcg3p84iE7zJ1Iaf1zyT/B56ijoZs9mxwExva+r+leQ6blpn6uaXEQz62YRtWBzl
         DyhIETYRQZRKmWhKaa+QSv4QthHlCsBDhp/2uF4bBwwNyT+w9YzN6T6FLbmKOpbrPb33
         BKe7xHiqzpScQX7lce8MWDXfeyRpANLastTG03dKqDJXM4f9KJMTG15aMgCCMugv3D4v
         0/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619432; x=1768224232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cKCQ9aHSsPPhuwQM80Usl9MqjI0vkKaSKtbQU2Gl8os=;
        b=VB9Fv/zeJLcBd6CB/zDsqzjx+yZ1RupkBGRKazO/Kw3J/4jfHmpBg5x/0he3qg6t7W
         xnnR9xrg2vxSjtuUVxK4S8B+HqMNFjQD0m84E4L9W5KASGV7nMR3VN/LA+4xcYdl0gmC
         LE9KceNL2gsisciF11HZjjcysD9hq9nfSPM1+0wnLf6u0flvy3KtCsZUEje6SeYoYnpC
         ToRVfoKhjD35hm0fn1ub7YIVImcPtxb4zc61wNjnuwM06uakRvtBNbFqSjLFm5340sDd
         PNTMDHYuDitmC+U1fNfCL6p9tIhQj3lpgO0/YcxQJRpkxP9wwqF7Kuf+e0sprxOLv4iX
         ekYw==
X-Forwarded-Encrypted: i=1; AJvYcCWN7LNAj+t5iuOssAtaV9uoTOdk/YTmChWkf4vk5MuRNo1ghfX5MZZznQTOgzezzr4rM9Dx8KGBy0MTVNu0lKX5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++5olutELcoHD++WSnZ8C3jwCFBNSJjYTi29A6F9d9Cpw+e/m
	IWUjCHULX4A3oe5oBSQEyCogdbIMO2grWBt4jAVgPAdoFzEqnUihHZtzdiWwSOmINhikrU1/WZm
	a0Hg5FfO60NXeWXCxaxHsdxkIPcPe0MU04a3GfUy2T9PCptTuaBVX1CPVWIoMazb3sZs/pPLy
X-Gm-Gg: AY/fxX6iENSMeAkrgD1j122hsnh4OdSlW3xv62l3NeQ+ynsDsCWuMl36CDtatwGA67a
	8vOduhxhjkLiYZuFzEQbTuDR22PICgTbeTyXBPkLQJ0LWPmiyKTr92j4P7aZ5Bys1f0eZyfU569
	coymJ/jFZP5Ad0BxWnSoP7j6C0VAJ7FRPCwsFafjZl31FnVnqd1/4VkiBm6/vMsdvun0OE5xMuB
	B4Hbi8TT2aKblbdNjOBb6QWoRn6TG7YUCG422UvikfmI77KcAeyUWqRJIJORGZ7//4AALjHQCBg
	hGP8y3H9TZ0jdTDgxLVduRmTlDi2hmSNo8QkOu4JD6RIB+ewCBFS6JH70QCWrKy6k4eUs5nAOW/
	siNizajrmDgM6BC8t2lpz9PQUXwlVWGpbpaXO
X-Received: by 2002:a05:6a00:3286:b0:7ee:f5d7:cd9a with SMTP id d2e1a72fcca58-7ff6725628cmr36269418b3a.46.1767619432215;
        Mon, 05 Jan 2026 05:23:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2XG3XjN5QeNn1sM3zpPqePFCmYcJHIrLCz+qQAstP8Q2dqozx8LgASDzhYYNzS05njEATcA==
X-Received: by 2002:a05:6a00:3286:b0:7ee:f5d7:cd9a with SMTP id d2e1a72fcca58-7ff6725628cmr36269384b3a.46.1767619431344;
        Mon, 05 Jan 2026 05:23:51 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:23:51 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:52:57 +0530
Subject: [PATCH v10 09/14] firmware: qcom_scm: Refactor
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-9-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=3096;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=2DBhRl0IrbEGORjCMRdcnMv1YwAZ0EWa5bKeuKqAi0Y=;
 b=Lyd/uSQ6N0rBu5eNzSv3yVQuuAHRJmikgJvMdfs4glMVU9KhN8K6xQu0RIj4ymj7pkx7/V4L8
 R65ryurv6zbCCumT5DbWMcX71/4ATIOOVgwIcjv8/tbLRapWzlRAdbH
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfX1/4xGFBFjJmB
 wG5Q9gHZ+dgdYL1+2ka2ObOVilGnbYu/FcA8O+5IiSvZnNrbFN9+dUE2JDaYXT464o3wb5ALALJ
 N9rKJUWS7h5vW9MLy3V3g8DMYSy0Pr/bhaSv5aKhAYuB/xBx5k+kWDTYyfasK+QqALD9RaJYMxS
 hRMK0IxqtZR7NP12G9OdaoqyJqcoWOc6wfSuZsGqkoFtu/iv4WXQqoMmkT9nIIuyVhJly6SRDvT
 M4ZI214h/Sm3mXhWwq89m2zEGDrBRAn/TaTAWoQkQMks3iibKNacbfls9q9OCS2yrrUnJm1LTXx
 9+gpmViqd+qKv4HHwW2OsteSMBFMjnFsirhthISTcH0o5T2UI69Tqyj+f0no0X5ynHU6N0rIzW8
 sidD2GNFkR9/w+ZuxWuacT3OMrlELLIpnR8CmiE8GESWwMKPClMv+dy9DHI4BQZLZQe21np/NTF
 gMcLmRz51ollhVLJ1Yw==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bbb69 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EGCBOWN0xxkO3F07DQYA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KacBAdMAbx3gIW25q41-5PKigIspT9aM
X-Proofpoint-GUID: KacBAdMAbx3gIW25q41-5PKigIspT9aM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

Refactor qcom_scm_pas_init_image() by moving the memory allocation,
copy, and free operations to a higher-level function, and isolate the
actual SMC call in a separate function. The main intention is to allow
flexibility for different allocators and to respect any constraints that
the allocator API may impose before invoking the actual SCM function.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index de71536ef591..75a57fbea74b 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -592,6 +592,37 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
+static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
+				     struct qcom_scm_res *res)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	desc.args[1] = mdata_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -612,17 +643,10 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_context *ctx)
 {
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = pas_id,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -643,23 +667,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		goto out;
-
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		goto disable_clk;
-
-	desc.args[1] = mdata_phys;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
-
-disable_clk:
-	qcom_scm_clk_disable();
-
-out:
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {

-- 
2.50.1

