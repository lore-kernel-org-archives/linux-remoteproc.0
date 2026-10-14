Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA524BD375
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978390; cv=none; b=Sh1TZBsWEY5iPJxD904CJFngK0hfZfRjSaBywu9YRRfCex8DtR8uzWuT/dx/qpGaXV83iHSvceEmzihNUzFEDegxKfe2m6FV6Pg7bOPq1wnGcUCIG7JWMbJrfksjIn/84Bg/MqNM8yEETFx2t0LbxDMneW4xIyT5aVzPOO6nzzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978390; c=relaxed/simple;
	bh=3pLGQfsx8ENltiicZlGQiUWAczEW5WkJbfaBol4boF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNG7EHeLNgaw7dquyOVfdTLbeQnyp0+r4oOCapOit90gSw7+cnpS+fXuLY20CLL4APgdKxVqRCoVWQtFiHhtSvC129sXtazrkNDrnBuRqNRQfL+Ysy8sBJrkoBkp7QMIgXwoyJ0sYJFqVj40BytlZiW+gV9UbLc+0rfZnHtCWJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0J9/33k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fg1BM0QT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0J9/33k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fg1BM0QT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eCEC3696187
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 11:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1RDyMw+wrGI5I+yueiU/NXwSTwBJYIf8HmETx2iPgE=; b=i0J9/33kfKkiBORG
	4K3En/wTBiY+BwVbZyzrHdevbQEjh2gFT4tSiOdLvanDmyppW9FiBMK8Nr4WUDPz
	+TMEgwPEiojWYfm39mzDE4W+ZsUA97VIBtOwceDMccZEc1H+NHcL/bFMc1gMDui1
	KIeyBKTdVBN9vhaTWs+hj/kDSUVR3MB5P/mbQcdW6bmZ89Hh8Fa/Leiy3BdFZ8UC
	EGap8bT9W+bocJ5jv9fyN9uv8FyiJQd7OnaNpWAvBE5XKrlhQRHqT/q3ZXb0TucO
	XrxdxzhdvZr/n2LVtdDhxwot+/Gifiq8rxxaCbE27KmoGRjk/vNtVRQn1T3v5Z25
	ojKyIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aegf9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 11:46:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso290970a91.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791978386; x=1792583186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1RDyMw+wrGI5I+yueiU/NXwSTwBJYIf8HmETx2iPgE=;
        b=Fg1BM0QTZmMXTNewaO6681MtSIRTmwLDu8gdRBz438zGCs2Egb8pcJR/wViatjnnkc
         sUmcayi2CrGiK/Dm/CNeHirXj5Lx3URv9Qzx2AVLAp0LfRCCSKb+13LhmEblbIdveBrX
         nMTVyoYieXBZF74lQqZq8IXuaO1+iePtY41yxq0Z54zS/NjSpszdq6eza87LeYqBEbXy
         AC7bSg4vmppMoDGwGAJgd0GYH/PLqE0hDXq/bzQ7Z6kNKhHWoBSG+p3uMEpnUDpUfjCR
         UeneqzwF0e3v936j1OF6p79A7H0acYvaBiXJ+tY11QYkO2BOxyFQcMIOB+3UYSlqxfGL
         uYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978386; x=1792583186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1RDyMw+wrGI5I+yueiU/NXwSTwBJYIf8HmETx2iPgE=;
        b=Kx4DaYRrRRld/XMSe0/5SoZbQxIqg54ZORlSR9EuwGKStLr6t/T9nmhzUk+8poZQED
         4x2iC3p0c1ZjK/owf+2dSYkD4w3ibJulnXHf5nXiZvhG4Jwj/YtxFwiMaikRt+qIKLjn
         RXDCBw/LDMSAAMMu99Bttw+XfFs2jyd0m321FE2U0xM9NnFGVZFLSULXeCjCY1JRFCOt
         ilOsGsf7VGqxj4ea7S5PpzNOR5l8m38GNsEj6E9kPlLCZahvOGL2UGQC53RuOUr1/xna
         g4mXIPi4oZRpzVgg/jFq7E1dyQ1gsW/EF5VoJobue5ekAcKCK6auPmMu9uRZc86s+k4w
         swLA==
X-Forwarded-Encrypted: i=1; AKwUvBxm6bkmlHqgYrPOHUmLH+JpBP39Fbn28+3bQ64YbU6bSswQ/pIODpBb6LG685pUDVI+YngHuTofBNfafbjHu2J4@vger.kernel.org
X-Gm-Message-State: AFq9FYIukJbGceWeiYz2lcuKj+EyM64PuAIOF/n6nmKHMq5dysjjAkpQ
	QoGh1rOynF//ejzvjK4gyX0ZfBIw5nb/+QBFoD9N9um8tKdpByKPWLm2AIB0nwv/ryR5yTdx36J
	lCVFDWC1bhf6MzfgW+Yh3wYfO3GctSBQ+b6IbB3lbIdb6fbP4nBnddANabfIXMkmvAh9HSCd2
X-Gm-Gg: AYBFou340utuZEcpYP/hgSq5C6XsOoyDVFLR/UwkFGtzSWZqwIOOLYTTFivhI4XfVX8
	83iRa1xn6otdupiz1i4LihJTrwFL/zSwR9KeC4ZXOXgaMI3cUDf5Eu5cv2Hp4+VXN4+G/MpAT+s
	nDeFdisjP6URHhBqqq/yfaDMeB2g7udQ0rBa7sk9Fsifjl+oY6it4hkjxJWZEBfQQV7WcZ1sT7X
	AlWGqLmSAS7aPadLYCY+lptGubTPqniHcNkXcS4bdoY73TubMSyXvwoi2X8DQHEhv0Tl7UQErUT
	52SWLD8RSAh9xdd0+GrZWrTI9+4V0a+DXi5goosnSrghUwhsVsT5dxzJmk1h0GmbZzkzLE7kbHB
	VK/asRjDLSnmTzly2Xgr63Q8DZapHbCgzR3Tf
X-Received: by 2002:a17:90b:390a:b0:3aa:548f:eb79 with SMTP id 98e67ed59e1d1-3ab3a74731emr14723922a91.21.1791978385563;
        Wed, 14 Oct 2026 04:46:25 -0700 (PDT)
X-Received: by 2002:a17:90b:390a:b0:3aa:548f:eb79 with SMTP id 98e67ed59e1d1-3ab3a74731emr14723890a91.21.1791978385036;
        Wed, 14 Oct 2026 04:46:25 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6009d94esm4219151a91.8.2026.10.14.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:46:24 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:16:10 +0530
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: b2JieiBueYUmAI0jsh28qGadeqHOWdsm
X-Proofpoint-GUID: b2JieiBueYUmAI0jsh28qGadeqHOWdsm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX1DzaLK4cvK08
 iNA5cDQ4XVaH0ZpqASlRSIhRX9XNzZsWXSvjU5s6ydeBn5GKXF3fCaVHZZm8ymdQFhC+w5OJ15E
 7TaW+3HkgQEG547IDyZ9c0vxJvw0/cg=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf6b92 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=mFOwqZS4PhHwTGmbvEUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX4M9mzkkb6WKf
 bnzrzHkV8IYT2V43G8aFPIPqUFJAX93mhXprEvybngQl4X1J8ZLfxoPVWApECCkcranmCx+43Vy
 /4/pJKVNosB2V8Ea8/uGeEpwFhDqWxNloMczkvdkZHNflnYqgP9Qh18vZ44iUX4zwHll2bmpaZ3
 YXmWEQoJebqEiXOTYwt6mtOvh4yW3OX0+aEcEY+HylsdvTvPbnatbyNiXqT3NTVRK3i5Xbmb88L
 lcMtirV/Eu7JXic2/gZj0bcejoa93hh+iTmtaSFMh0jTZMcbwyTTvu6bejuS1UaojJZk+ZY4pdD
 O7WkdWwJZ802gJ3h9Ota27aJZMVZ+3Ql4XbAi0ktgnfLfOjmWv8rIqH59gCrnRSd+lk/3NnChNd
 uNWSa2hv0aQNnKPuFO1Bxwn+YGF81KD9iu5AQO46kPH0kYFifLYJPoKCZ3piq2kM70Ym9z4LWkM
 fQ3RL32X+ZFq3TpW1lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140046

The SoC Control Processor (SoCCP) is a dedicated control processor
that handles hardware fencing for display and other use cases on
Nord based devices. For Nord, SoCCP firmware ships without a
separate SoCCP devicetree image. Therefore, it takes a single
firmware-name and memory-region.
Add support for SoCCP PAS loader on Nord platform.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..6fa958044218 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
 	.smem_host_id = 197,
 };
 
+static const struct qcom_pas_data nord_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.pas_id = 51,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1844,6 +1858,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
 	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
 	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
+	{ .compatible = "qcom,nord-soccp-pas", .data = &nord_soccp_resource },
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },

-- 
2.43.0

