Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E8B314D12
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725156; cv=none; b=ELrZfRbWqc7a909CJsMTRZY/Itd0RiWwLTJrnSi2Q21FAkJJrmh/93MvXj3rJA6Q7xYKMG2OulqGNAGY7iVsnW+e2kHb/sL9PVp1dTVuGTyaSJyni298DmffW/SsUPOjim04qdNW1J83HDjBmwo+0/Tflzn13HfMWnxqc0aRG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725156; c=relaxed/simple;
	bh=CKt8Skmgsmi0xiNgmGVCB0ByG4/WRoa7PomttZXz7T8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBM+2JAVYUeA+DlLC6EZl3Afxtc9fEn0AMLJASCxgkxnz2BZh72ixX4NV8oeKeYrWgSwLMxCXLe1d3v5v74Y/9w9bhyWMMn3BApvEn7jcYFsbvhW6jqaTkZGcoigiUhF34uQMPY9WAT3e2oV8uX3nyGkvIokFoL0kWUxKP9nu1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUOFph9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5uTtXS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUOFph9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5uTtXS9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4urE23642849
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NX5wX2YhjlH69BNTyfzdigy0bOKooGYLfSt5kediBY=; b=GUOFph9WbtWcfYcn
	dWH9N+oLNxurnVngya+Plj1u7SIm/5vW1dtefqT7xFXud7iV6WGLhiHf3LUdwRTp
	ZpqCKYEd1K/8tjaY5JbIy7LWbV57TU4LqAMFOuBO/z4izQcPy5wdk6jktSOfT4Ia
	aq/b1R5+kZbIsIv7Pf0c0IFLwh77BJy+xYNOsWEt3+Le6OsyWJlJd/fPytZqNnLy
	4YPLRzlW5uwiBG4LzDP2uJh+v3hC9uoESw9/up321gb+5XrIh//8JWUG+aAqRMg8
	yj6IAUGEqpAIEbiUiyKJeUY0pQUn8/tLZSmIrGuf/QK6echwdgx2TS5JdLc7wfcr
	pqRnGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hqee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290da17197eso110803875ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 01:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725152; x=1762329952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NX5wX2YhjlH69BNTyfzdigy0bOKooGYLfSt5kediBY=;
        b=I5uTtXS9qNV0QVHGVKpkG9fwvDr3yp9oxJA2eRkkGSgkh9UjiUF8fsfFs+HLUpOEdZ
         GglU/fozFWicOm4OI8CUHJntfcOnLsRZhRxpB+Vudc6fyu9b44gH+xmjdj8urZtQgBGo
         /abc7RPczlOsZUQqZ7HR29bs7GaYXdB9Fna25y2A0utfrGohfDROHS1Zxrxq3yeWDP/7
         195MiEziePaGY+8FxALJSvm609DDjLNKmIuW/Ux6Z8H9vQzDLFZylLMPdyIYIdZvom4Z
         c5jXR1H04G8aIRvyMMqtzQPwJrxwDa42fjHsmBzSmMHY+isCcf2muC0cG5wXQwui6nOV
         7x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725152; x=1762329952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NX5wX2YhjlH69BNTyfzdigy0bOKooGYLfSt5kediBY=;
        b=u1LpvZyjU/mJPC78VcYHWi1tL4GeDgNVEEF7dnNNe5OOYFAvSS8HfnCOuGIK205Qb2
         UY/3DivON7MmrFqK3OfXQdMEP23kVr1trofiaT9AgwFSRvtHzFvFmqXAt//ftk6krFGF
         UfOGgWgt+xGSjLq8UKs5Sfid5cDDTD4XyAsadHdyFVOE0PJsNuJ/n11C4Fz8swTcsHBM
         z865F9JVkvacaPIhWiOz7JfMzu3vnRfLT2ejKUTSb/6nJiwhEBc32gv7V0t1X1eVXwuI
         l1x4nv4vsATF+fIKKyfsZ/FgyqnW/ULexAM4pcpPNzJkvzvpsOLaldzMZ37sMiOXHMEQ
         wl9w==
X-Forwarded-Encrypted: i=1; AJvYcCVKktwHKxqR4ofmF6DJst9qyT7XOj0UANDaAR1YxhH7C7OoSeUNYmZfIUdAYCZ7PThhgBMINsxWkGhs/tw71vHR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9emkg2LfCPJD6SNsu12ZIREDYSsck2ezpYI6GrqjU+9Nxbdca
	H/5dhKaRiIdEyCi6faCSp5+ztwm9UTkvhyGBg+O2gE4zOw1XSSl93CdHOLRxBEo2pJXkr2pF2pk
	DdSs3PEuFp+1UDlWTAAivdItvP7CKLu/mWNZAGfbGp9g1EfK0rJtuLNEqdQOJuG1Wor+8QHuCnk
	NUQgWkEFG5ww==
X-Gm-Gg: ASbGncseqDf+R2V5+dzGURnE5fac3zfAs6M0aXoeJLqPCq4xDqYEa1rMU2VHg1B718v
	ZqysusXyuzMyxkqHbGe5KYPxyAF0OKY33qwVrGd8cDaxcayPHgShXbXS3brTwXhkIRWz0gHxb/x
	P4WkGk7yk5JEh0bjwd3PQCfo3CojSS5CNHJhcmJ9Pt2uoD7vB2I9w4tCVWRbhEHr5OBVt+xMtJr
	mqXDTIiPT0xAnNm5Y0yQQmNANtHgQLJY8DfeQ8np6Q8dBIxNT7/cmj2LxFxa1JEI/ZwV5+U/y2e
	ObD/957VgXsBkbKRVt2xKhN0q1eYR8RCHjP4nSrVfzt/sekpSmAcHCieKujygTWhzkQGkgQfaDS
	WSMNVunR6gY/gV6AXHUJdKxt7XjsasUBPg9SvlV4qwp/Km3AGxg==
X-Received: by 2002:a17:902:c411:b0:26b:da03:60db with SMTP id d9443c01a7336-294dedf453bmr24761525ad.13.1761725152060;
        Wed, 29 Oct 2025 01:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpC4Yaz06BQLmNZjQOHk+DUr2aZgqq8Ytc//6fK2f6hDjcm6LdFNuXkxUgm3UGJLFIDbAaGw==
X-Received: by 2002:a17:902:c411:b0:26b:da03:60db with SMTP id d9443c01a7336-294dedf453bmr24761145ad.13.1761725151516;
        Wed, 29 Oct 2025 01:05:51 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:51 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:43 -0700
Subject: [PATCH v2 5/7] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-5-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1580;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=CKt8Skmgsmi0xiNgmGVCB0ByG4/WRoa7PomttZXz7T8=;
 b=zraglLPDxf1FKILsB9DgQV6I1xCTmrtSZ7BHX/DHCEQ7LWe2ccah/FiVFuUGYjOFWgT4OaEzJ
 xFTNEcPE+NuBfoVVlXVkPoj7L5kbV6xN+1sm6wPn9uVHEhpZn2C+FVk
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901cae1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: GcgnQkWiTVk03iN88gPVKmYC0GZUqYpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX7/zNyL2QDlKL
 QpbTIPG8EYGAE/ZSH3AAJHB7Z7KlVIRnVj/0+eSy8fNUhW26YCOGOVYMUc3g0l+FF4q8a3xRcWU
 6H5cvLVlbz3ttqkyxLsmNxX8/UimqTLjk+MG5YwBhfLQtOuLdS/zx89AI8SSFB1ncOQS1w9sWxR
 tYMk8Egbpqbs33Ib3IF73GNJIEFl2YGZehnY+99dzJX2LRIL9ZDz/c9sOQH2Tq4hgEmE9NvbSMI
 oQ0cAc4f71rM4jeXENgikoBXtjrqZvPJSv9oR+H8wQuHsVqZWcnJ6RF75ioXEZRTEztgQGmuyhh
 nhr2ymWcZ3z7cuX2J6wn69ClLicsrPDns0GW5FarzltHLEycfHg7G6nk6cu82q8GW6mkVlDkc2R
 +YqOvk2y60yo1IG+wftzyd1ZOZ2jqQ==
X-Proofpoint-GUID: GcgnQkWiTVk03iN88gPVKmYC0GZUqYpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index b667c11aadb5..c470b139afd1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1515,7 +1515,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource},
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},

-- 
2.25.1

