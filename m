Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6764E38330C
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 02:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292540; cv=none; b=h3ic0ehf6Hzamrb77oxAvedQOlRdfO2cNel3Ek+CkV82k2GmgksyitJgi/VANO5p3HKCZZIucZWe9nSNBJiJC0IDEv+rcG2a/R5eNZ7xl3KRs6OyKfB81k85tTCpGISppw5/fP+tp9UZmS5ePgt19M+071C9HVYWWl1CgY0gA+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292540; c=relaxed/simple;
	bh=8u1GSbsfaYTfNXrdQItHPwzfti1zilXJrY1mH0HuC3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QE6CotzgkNUEWNQrix1ZksWVMqSTwXh4TYhrK6yXtEXfI5wsUzsrHBSUXGLrqf211StJQ+KMff49h9UIexLTdrt34dISIQ0XJOJEhDASge9OZkhWYxMuFuSFMqaoAwDz6nw4nspIdXynvX8K58z7hovpcQ+KJZk3jGjj0dVc3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ooiBeaac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YM68xKse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ooiBeaac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YM68xKse"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Htxk4026081
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 02:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HZtb75BVxHc
	RQYXShTKNR4AwOf5NsXa9HffCC+I+pg4=; b=ooiBeaacZz8oLWTpSwOpjbAabAj
	L3dxqlR3Y3UQqUFqVMFNo3QeJtGW/WsQAQBVnV04/MSRihEw/dlo4FV+PEHyXg2x
	O/I9XOCUzmQ1aMNd1dHihISF9ByrD4sO+2RAaNrpCec754XO1SVouFHV2qjo8P/y
	+vjavzOzShMsiBZk3PErWsf+CtW/VyRXLTXOtGh7ESq/he5RSqUQ0FaSc9ryAvqL
	4Cus49Cmod8VWWI61kj3tHRvy3bO4/V5YkpnnBczaMTfAngaqqqbTbSfdZLIHcnN
	2kUydWajY3jtUg5LoXGOictqJhyTt4vfxuyLz6GFV0eO6wP9ktrR8uTSpdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0htkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Jul 2026 02:35:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso689885a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 28 Jul 2026 19:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292536; x=1785897336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZtb75BVxHcRQYXShTKNR4AwOf5NsXa9HffCC+I+pg4=;
        b=YM68xKseBCofzx9vlNo9cuE//LlUZc7U0iiO8EYM+BEY+dPqcyXji7EuGglxZGCLlO
         JHt3oD98CYqO8O0M3htN49k7ar+zO9UKuk8Wp7SJj9auwZTCRAnsn7oSx0Ha8M72omgY
         1PjuktT7tg/+kNLHXb8DBpYBs2/ouNjK5W5tMuLYuHJZTSw7DqO9rSz5ogk62EpMDyue
         m2ngUuDflJ5qcw5XVC3P641zxRcfg+gzjtI2BF55Lu86Q3KFUKP/TID+tDCqTzD/OOjr
         i1cahxKL9xjuqDuhxFyUO/pOZ2/DEkgbDiBkTZiR5enFB1QdgtsI28Vhm73gBJ0FvBWU
         FSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292536; x=1785897336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZtb75BVxHcRQYXShTKNR4AwOf5NsXa9HffCC+I+pg4=;
        b=DbKW/AJRpv8Te6Q9xj6iQEFvDihtrmOWESVl/nkcgTA45G/CuA+2qOrlEo6PbRTbiw
         E4prBzu9eLWOLgJqiUPO50LyZ9dbd6C4YXL2OWX7jiM0DNV+vDNC88x2/13D/ZjDR2F0
         QhgkGEjRRlzecMEo7EXVdYqrXutoI/Z862ESI6L070+oUK4RpfWlEa7l3z9Rx0DT33AQ
         r2AwbbMstKKy5D946EBW493sjD+BvpIuOn29txgBXGIRTophpwrtzJkS50rydkWcO1fw
         JIo7YlFDnUXRib2MEcJXuqtZMt6B0UasYM8aWpeAsUYetma34IyyhleyKwn9enLm79tD
         c2aw==
X-Forwarded-Encrypted: i=1; AHgh+RriuZw29H+np/Io4qofprGenu0Z/qe9zUrReINhAfFfaURFf7nuvGHsllKXV0/C4aFwi4OOVv1DE87pR80Y6QMI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4x/eqHspaW3JHEUv6tQ49d94dTNfERhIOKZJdhcGwwk+3jQmL
	Ctu/7cQQQtxElxdIYmVrUK7ZOOtKibl50YGFDc93hhsL6SIahKIL2hIM+zSsAmEU4iYBgk8wVwD
	SUker0WOaUhpEr/tOMIBzyAye/XzUsjf9L+aFDW87hmWM+tQvcmlxpM88Y0RX9YlPlDUVk1gs
X-Gm-Gg: AR+sD12DG67ETbskTR42FLWE2x+YScTsQfDU0WG7JTgXTX8ojxn/PRInodZJSzSRfUP
	TUDZdzZiU9ueZmMESZSxkZlbMZ1WmD88KDi3pm8rXv/cPxexvgw+C/AvzOqfRzya1aTFgHY1rPi
	yH8lQZfkuMRcu6uG7gvr1id0/dSCIMWnCjGFWdZuuGIF04zQTZOLeaWgqG5gsQGjx2pt0dN/va4
	cmlTT6PSiysUGvLFYrIBBJDrraNMhc1Dr+EMG74jutkfEeXS5o9RXTP4yIvktPxilo58bv2+ZdF
	ELQlm1B5e2+eGUDX6LOYasSTYw17PQOO0KD2FetLvHM89IBUR1BRExmV6zQJUan9tx0F45x+evl
	NZ9CundCvn9PtqCpEqrOyQZJb+fkNoOeHBr+4dJ/17zGrCP1dQGv900Tr2mEw
X-Received: by 2002:a05:6a20:9f09:b0:3c3:a490:9674 with SMTP id adf61e73a8af0-3c8ba627b2emr5922384637.64.1785292536041;
        Tue, 28 Jul 2026 19:35:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f09:b0:3c3:a490:9674 with SMTP id adf61e73a8af0-3c8ba627b2emr5922348637.64.1785292535614;
        Tue, 28 Jul 2026 19:35:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265be48sm3899837c88.8.2026.07.28.19.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:35:35 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
Date: Wed, 29 Jul 2026 10:35:08 +0800
Message-ID: <20260729023508.879752-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX58dkknOSHSCV
 YDaWrU7AJf+B91o9rwAU3JuoIPUjrfNQlrW6JiPaZbRK1ja05WWJdOknWQNJy4jUGxIfVJYqIeJ
 ZBJH2+bF0rRu2sgxdRQ67zYCxmwm1YycT0FHFlEeCeMfLG75wCEkbzFiaPEbubIFS8urqUahweT
 876TB7Co+lpzlchtIcZ8t7Qev6EOwgzjRdw8uumQbSIC/EVXwNApv/yyRCpYQxV8IXbzsHk54kf
 S1q96pcY60RkF2id9SbeGLS0WaGbOWGE83SrgrIFpdEGZyOozDKvQhmGi9kdKJmJkIu1UiiwmOq
 34I/rnjkyTzbtMGV0VR+u2xs04KJlWS4LvaUSWJYAS7SqvsaIRGY/P8dges3fIu8M1P7RmSsJga
 92kNnA66OgYwvHVTPW1j8S7BDo+JoIFwBsIxEsmAG//PARgZFO7+AINu4pMJ0Sk4U6AgP2B5cBE
 PtfIzUYhjtld0wqaw0Q==
X-Proofpoint-ORIG-GUID: 6maIbDn_L8zq9DsYp4Hrhgt5DKPw2vV2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOCBTYWx0ZWRfX04ZLaeQ0dVab
 5eggloxXt0+1BMI/FhSZ7pQpuIdtg++FQMWwt3QW4gsltSsp0PoBoiG1xM7eyGB9lGRKXAgi/y7
 34Ossk+dV6XEzxs6st4Gu1rUpwOarVw=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a6966f8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wKDsrv0q4RgBVPAhY5MA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 6maIbDn_L8zq9DsYp4Hrhgt5DKPw2vV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290018

Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
is pre-booted by XBL before Linux starts, so set early_boot flag for
attach path rather than a cold boot sequence.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..a4b233d92efb 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1434,6 +1434,111 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mbn",
+	.dtb_firmware_name = "adsp_dtb.mbn",
+	.pas_id = 1,
+	.dtb_pas_id = 36,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.early_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.smem_host_id = 2,
+};
+
+static const struct qcom_pas_data nord_cdsp0_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 37,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp0",
+	.sysmon_name = "cdsp0",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
+static const struct qcom_pas_data nord_cdsp1_resource = {
+	.crash_reason_smem = 633,
+	.firmware_name = "cdsp1.mbn",
+	.dtb_firmware_name = "cdsp1_dtb.mbn",
+	.pas_id = 30,
+	.dtb_pas_id = 59,
+	.minidump_id = 20,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp1",
+	.ssr_name = "cdsp1",
+	.sysmon_name = "cdsp1",
+	.ssctl_id = 0x20,
+	.smem_host_id = 69,
+};
+
+static const struct qcom_pas_data nord_cdsp2_resource = {
+	.crash_reason_smem = 665,
+	.firmware_name = "cdsp2.mbn",
+	.dtb_firmware_name = "cdsp2_dtb.mbn",
+	.pas_id = 57,
+	.dtb_pas_id = 60,
+	.minidump_id = 29,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp2",
+	.ssr_name = "cdsp2",
+	.sysmon_name = "cdsp2",
+	.ssctl_id = 0x1f,
+	.smem_host_id = 133,
+};
+
+static const struct qcom_pas_data nord_cdsp3_resource = {
+	.crash_reason_smem = 666,
+	.firmware_name = "cdsp3.mbn",
+	.dtb_firmware_name = "cdsp3_dtb.mbn",
+	.pas_id = 58,
+	.dtb_pas_id = 61,
+	.minidump_id = 30,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp3",
+	.ssr_name = "cdsp3",
+	.sysmon_name = "cdsp3",
+	.ssctl_id = 0x1a,
+	.smem_host_id = 197,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1702,6 +1807,11 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init },
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
+	{ .compatible = "qcom,nord-cdsp0-pas", .data = &nord_cdsp0_resource },
+	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
+	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
+	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
-- 
2.43.0

