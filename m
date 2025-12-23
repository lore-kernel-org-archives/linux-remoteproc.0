Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68660324B24
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481266; cv=none; b=ujvhwDY571CY6pvkDNdJPTp9915KEcaT3ODsvSKOIctOQtC6Vl63lfmtO6gBoNasYFQLb+Yyh+gsheoutvQQu0ZHmKJztrmE01RTwp9r5h+YS60BgYHJVRz0dSFRHC9zWdZGiNrgOjjSvSAYPAoH8HmctaloaOjPXYeewlFcCHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481266; c=relaxed/simple;
	bh=Nqu+aOuN5ZaQ3gE/Xy46Qjo+os29grBY+Nkaip5fCwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK6iGSgPhOAdlBUZv8NhWNl/FEJuZWKkHQ7cTERIsZjoA2ZESVLhl7PdhrMeNs/lx7GxJlOzHEZTHUgMN8wXnvAR7+AaC0GfTm4om1gk/WgIQuSVL+AGZrVjdC4z7sGVZQyq8vQEIP5oM1zf9eZZYOHqq8eo7Cuemp9n718eSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tan1eRhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUH/QSED; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tan1eRhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUH/QSED"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7xqBI024545
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdgl6CNoit5FZtv6YJ05tLpOZmxe0FwICdVkx26WDa8=; b=Tan1eRhNLo4oz/OE
	gvxR7PRlSK6KqrA8Ieb/Iki/IF52nXjJ1uPJ2I3KYTqNVtUyqvBh7xPh+LrIuluQ
	rlWn9SyLL6CN0h9J3l2BDAd747E9KNOEr4zIZU/mhcd089fAp2j3KwkgSseZt1Nn
	ZjkXDof0z97nX0RVTmjLS9weFgtrUS0s3IUXqtykDVvj0fb/UMLGvIfXuidstfq7
	KmJ+X4x00wT9AOZmwFEb7b7vRPgGu0up2YVaJGfgVFuCol1JudqCANPPhWcXq/7x
	LRcF5Zn9qIn/23Nef7G+zlYHI8OPrBgxKCs1As5Wa7dL4qtloRWfKWN1rXD9shNr
	vu/OAA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha0cv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 09:14:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c1290abb178so8836337a12.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 01:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481263; x=1767086063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdgl6CNoit5FZtv6YJ05tLpOZmxe0FwICdVkx26WDa8=;
        b=cUH/QSEDoEg1kJjzkklpPk8t0+qlWTJM16COWepB0Pr7WZySaWLWqNL1jAI6z6mOdz
         JnPiiDN9PY2U0TMJftUNH9RWY620e9RvKJP5OjYXaz/P0a7/+DOhqarVxdGYYnMHHWXL
         +7qEB820sJ/t5p84DhL16+YOzF/rSH3Ox7pI7ARgNaW9y+Jhr5QH+TmjjhnQIto4RolU
         fykZx2FDWvtwnF1SDCDUJ6K6PiNmdAo3Onlu5OSTi6wN7/vvT59BW0oT21PHMa90crLa
         /RJN2jf3XlMUMa2o9sQSU/8peUIDPwK8X/zfjOO3CllgufAxvdzYe/9Dg2Rq3RcV6h7O
         k0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481263; x=1767086063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdgl6CNoit5FZtv6YJ05tLpOZmxe0FwICdVkx26WDa8=;
        b=tqooePGCLHzqSXkH6b4LjEc8ztMj348R/S10I6ia1X/EvKIpSbawj1OE9dYOnXNG5V
         xvT6O1KiGz3fcmGWeddIqBMC5v2pb1PP9s8o12kElhR8biT3nqFS5Ds70Ah0oQPF5Mk3
         V898+FLpwBDoz5eCIDEWSG1Rcypxc+K3yzGbYA+m+wmCATurOUwKqCArYoE66tUrupoy
         zpxPZx0cvndXkzy3AODbc2ihadAgp4nbD60zposgXMV3FH63GSbE4HUDkxgWDUNYYtFE
         MK5oeyJnvG5CERkMVEKLulfCsfOJe082LQ1bUjlqlt+nbGC/m5p37u6eD4za3FRy7ylG
         J45A==
X-Forwarded-Encrypted: i=1; AJvYcCXXiYwl8k7QeOuY4lp4N3x1XVW5uXqSEoXToXueaMRg6/I4hThwMrwwwVWMwtpqpd3QN4rh4UhjICJXc8bU7xA8@vger.kernel.org
X-Gm-Message-State: AOJu0YzRICYgRoI5ThgOHwqGfKD6Fyd1qDA2DbyTRRucvxQBJ8vI0mFF
	+3FuPE7U/73/4lNgkCjIvJZd0OEMZxS2RAXNoXYvjsYREqcBaXQL/5+rHDeRKNm4iVKsbMzOcr2
	wv5FK7RF8NtVqTEW9cXNmFRNBwAFKGiSn81GFxv7MzlSd376zzSQGjtGkknLIw8X2Xv5zp7c6
X-Gm-Gg: AY/fxX61aSCMw5qoUPWf9WzRCxYvRZgEZzL/thgJ0dWwCAmotjQRmJPsEFMpnyuatbU
	2yJOyFUP/B7reKZ7SCR5UDazfikLhgDaIUF/6T6hgRHhV0bwI5yCGQERRT+kQ2d9yZeTsRgr+r3
	cHzix9xiK/IYYJeVi+OwT7+cPTqKUqRUzloxBAfIReVKY+MqpbYF+7gwgy05MzzuSZoI4b8KMgN
	tgWzZfLWLmGhpPPtxqSXwz53aFQEIpBqgqPYtA3Rva4QIhq9P6SMLGIMyxSGaJVaRpyJv2FKOhL
	b1ND+Z3FXutyYwVvo81sEo8q8GcbS4OhRJx2sn4lE/yNV6y8cuxGxVJ1Qg1uiNYDVMqFOYojfcS
	wmjKnrY79NjLL9fxxhC44zpq7AYtb1CO1zLTL4V0Pb2hDa4XB/rwL+g5E7pGQ
X-Received: by 2002:a05:7022:220b:b0:11a:61ef:7949 with SMTP id a92af1059eb24-121722ac425mr15639666c88.9.1766481262623;
        Tue, 23 Dec 2025 01:14:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDGKzPr8T5IOXZA5LHezIEugBbVPAkJMkTPFlmVIcYmdmUJ+qW6gIul05+V1TWB5xZtLzhUg==
X-Received: by 2002:a05:7022:220b:b0:11a:61ef:7949 with SMTP id a92af1059eb24-121722ac425mr15639640c88.9.1766481262050;
        Tue, 23 Dec 2025 01:14:22 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:21 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:51 -0800
Subject: [PATCH v3 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-5-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=1580;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Nqu+aOuN5ZaQ3gE/Xy46Qjo+os29grBY+Nkaip5fCwU=;
 b=IgqiGhdQVv4PE18x02hoRXU65WTPD9xOkUEAef9Md1fHjJlYgEARRi63h34JfZlqs7S2ECCFD
 HXJFq+irlWwCCnbtEIqOiMcRvnzdOW5gR/8dNNY/+roUfPsPQYunVFw
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: RGEy-63nFa1LUyv1HAZeojcnVL_v2KrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX/v4OB2CwIJMD
 HoVaoyq4iN1nBcQVw3awPHL6nrXLtlCFf8IBtdWi5/e1w0lKZmUDOHExx9d48vebu0Ru4EJ03lq
 zslkfgi/l7fKNJ8nH14rRnzXuN345a8YRHV2pf0Q0wPgRpsIAc1x8BST+fSICyz2HTLWC2sUXbz
 idlyd1szxOIJLiHtGBHIeqYBPixfafP4XOyqxfeKLvixcek8ZwlvRTMuiuueatYlW09gpEl8ZNx
 iGhRbyIF9su/1LHejAiWjosXyx6NZalo4lJOM/ua4okmeSA0iImusb9uc9nFNMyMF5UCrqzX9yC
 RLNxhUdqt/FqQqzL6iv6nzo5krew9ihSdDBMoStfcomaGRAw6b3+9ADrPSAfscUOK2qnzDaLMHz
 QdO4VEAki3Z0bo/DIJjrNgxrGEkdrmAATUqQ6WRhuhcLfvge0XEyvK6+t1xAi/P5MjOiewxwkVS
 4QFVu/dDtjROBNjU4Rg==
X-Proofpoint-GUID: RGEy-63nFa1LUyv1HAZeojcnVL_v2KrL
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a5d6f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

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
index 7e890e18dd82..e0028143377a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1530,7 +1530,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
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

