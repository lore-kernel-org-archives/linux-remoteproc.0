Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E689C39BFF2
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643639; cv=none; b=Dcr9dA92pSiazFDviMvmandjr24EXwfl8FY0nqKghbB3TYzdwqzJoZIXmeAjKNAyQZnKhNIcRsAQpWywgTNEL8NlRTh3x7qAj83q31D26DhkNHGHBVvPyYiNMsrhw38hzHQ/3bNlNj9kRPYhRWp7gu8MuYL3UOX1Zd/T2CMa4/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643639; c=relaxed/simple;
	bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Biry3wezKUDI7Cnb46qDN2WrSeha8WYH3rgQgV12lQkD3wvVTsf1OYc15dXK0oehlpDY0Q6swR0u+6H2PVaZccmrFPX2JdawpyQDHX9yc9DZoKb1wc17C4/WqKseRtq6Ludcc/w1+8Badj7BJOaj3HwFRimmbmRF3WpBCr8nvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iYLwkYLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CDspQoe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYLwkYLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CDspQoe1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfpBm1938598
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=; b=iYLwkYLd/zRfawg5
	tCOYSyhQLNjyBzXo+6EQVobAfIPV9/P7W0oxy97dOIFoLLIyIyfPN6HPmKHUW7oq
	mrS/fSHtr9/xHm+l8o/nB1gEKtKssPGWhRJgjzVPuPZ0LvQpEEzWM47pMnJDaHQv
	uDaPzVxUpmw8j6bK1WzD1iwn/yWtPh426I8xqPdpcWnmu9NAhN+mWgkDSak5KmLc
	EPz2rILIXqAsUVD6lqrPLrcAYpwr7+eO650TuRrHXNR+zyp5XlZeyzYc9V2bfF/l
	q7/W/yELeqlmFchDDuKxHP0yWIJkIISi1Aylf28q/w9ADovmAciNORYgRUAmdfEF
	Zvoi1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs8axm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 14:20:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so195794471cf.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 07:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643636; x=1785248436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=CDspQoe1pqWBuV9mm44aWXjUR0cVEqrWqYe1zqiDlkVDpYd3mnPs4VujG4IuT8lDMr
         VQF2sKTB1E28hNw25wqEJ61KLisSzLITKATAxzA87jBKv9Avej9zrvb7aJChhPcB8OGG
         FUpzgTSDebdTREQ42fdastbuuppbQ2CAGAo40p1D5fghTiEc4xp1vYdX6oKeNHX3C0CX
         8iTGDKId/V6Xjg2teKMAP3IbhQBqPST+x0Ty06yHtnVp9sSYhg7FNKfHfu6f8GUg7pTa
         f//YAqiAQaj6Rb6K4P5GKlk0gKvEqkhE6berXGTp3uwf6sJVgv0OeNwDbtGBzGJ/74t+
         Rbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643636; x=1785248436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpeXjtCOffT6aT7diDbXW+/jlOZNYXt6w72O1CCdTK0=;
        b=LYD128Ve4aZSlouOMYn5LPMnAnq5Wgq/wvhTw5H9oT6Ehwxnk4i7PSZpJnFATjJXhq
         CPUfGCTBoSR4INEwuYYh8IWAV1ktyJfnMTdo9HN4wBBE2+vECQ04WLeunIhGY5CS3D/b
         SRt96EjYg19XlrfL8o6XThUxG5E7NAtJHjbX378xRI8onyEtRgVIl0twkDjgIBCM9z+6
         e+8cpj04j378RZ6s5nXvVK9gJYkmXscDNs8ZNr0TWJ17RCe0zIjRfWjgD2FUjDCV6EIq
         mR1gS+PVIpRapuMxzAhnen3xAufIhBvoi+qBCM0uhkihipqWgzL6ugcHED9uFu8+ybZI
         fz8w==
X-Forwarded-Encrypted: i=1; AHgh+RqjSOoqyAgcJ3lhq7vVTzT5gnR04bY7xfraD5CZ1QLf1BTxI+DnltdKheQyZjExUBBbQzIlHV3NUJM5Ovo1S1fV@vger.kernel.org
X-Gm-Message-State: AOJu0YzMa5HZkYuaLkgh/9zNHr7ZRq2JnTJWzHCc2gAJUtCW7nP/7auP
	KeLDmY+e0C5IyTUaDVXEYNXZNtISKMFfKxrEQu6byuaLhUedSaWQPc04l3Nk0wHU418SqB64AHD
	lmWDch9IYuEpJHLwJHSe8bYgmAhDJFOJMkXqcrl7lKh+du4OzikAmmzL8cJCV/UZdsAlv+gvK
X-Gm-Gg: AfdE7ckjHD5uRobUjHqEYDkn4zE8jyrrvV96C0+1wIgUPp6eplJ8SLIutFFQiJFXqfH
	jqU4RD1GFBBLEmfuMkK3jfxWGXMi2ggU8VcAtpl0XSKmIwb5nMibohBKQzkYNcUcXd7w64gmOhD
	XHQf3KBqYp72g1SJejVnrGi5Q3/QH8ZaZ58GUUJQFae+lGeNXmQW+oMR6y7aRZhrVeFuhNpb6Wm
	RFQ7qGvBTIeOb0g+TssQDfu8oYLQ+sfUSQong+jztAh4vO/lbdrLeHAbz5hyT/f42FDCPJf1u52
	nn8CJsKIIp7R2OlAZ7a5H5dXl6XPBr6BYRjuOzF7izzT2BghR/a/BPY3XY11HUcM7USKbZFoTz9
	flYw0bGc4
X-Received: by 2002:a05:622a:13cd:b0:51c:7b11:41a9 with SMTP id d75a77b69052e-5213f959cc5mr175277791cf.86.1784643625506;
        Tue, 21 Jul 2026 07:20:25 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:51c:7b11:41a9 with SMTP id d75a77b69052e-5213f959cc5mr175275161cf.86.1784643622840;
        Tue, 21 Jul 2026 07:20:22 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653687b2sm84762025e9.1.2026.07.21.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:20:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:58 +0300
Subject: [PATCH v3 2/2] remoteproc: qcom: pas: Add Eliza CDSP support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v3-2-557b5d02fdd9@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wGSZ1WFBCgglA8Tat+ZxlrpGgLQ01a0Za7YsMfdV3XQ=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqX4AY4a2V5yZC38XsdlfyDwSXmOz9wrRRsQyQ+
 0s2Sxl9RCqJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal+AGAAKCRAbX0TJAJUV
 Vu6FD/i7KTv+ZNkQNQogpuSPC4E9k4iKNx3wCZbiykRxr4jH/AQOuc2O0f6FZ5xrrZRLOP9lC9G
 4m+MVgMwX/nnmoPZjdFKfDtCxbtR/DFKRCUXEv5mAqjF7jIJG3SGqBdc4JYnPoPdfQ2u1lEMUGF
 //7/CkZ28QvN1NzuRaQWzc0t6ljUZFFKRdt10Kii84iSROSm33SVTFz0NBYCORzOUiHg9WsGC7i
 AxjrVJIVzQbe2x8zPaMllBMJi8Pw7T7VU4IX3eCHbDALbYKQC84Ia4S2jDXOs5Ic2uGDotitlGz
 tNoZ+LU5i8dhpmAE0T2CKFoyfB7fAA0P2BP1EnhrjG2ruoC6zSEZi1XNduLgwWDrpbaDvGsS0QV
 cnGNPen8WLHhfue/nuFejeqPYquTWA4vaedFg4sc/4xdmZsQP2euuA7I3Zt4QlFixkgauu94AO4
 ab7YtUOqpE5P2t5ZcIAoJ7ZABCeAw84HxiYkvH88r0IrtuL0JBYcTkRWtSkFcp0uIm+NPLX5U9r
 nOD+Sg88OgDnMT7RQel+bqZ7sIoPHkwzNDSKuhOmGkSqtZwceWlWUrScAq0d7om7VNvEUV2O9d9
 PaDI9f2UE69punqTI0qqStw9FFAsmt2BKKb4z6EiX32XVSJ0BbdnBpqYsWlwSr8YhfL+9nxUuf6
 lLUftiziV8oCc
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: Ksx2SU3oDDr60VXKRbSSFpHO0dS4yRyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX9YK5SDTn/fCU
 f7v5oULx+rI18fpsZ9G0Q2mIF7V9SWWQrQ2Cs+nneOxBjzq9CQyfcgo5kSqL5SNP/N0xWqxu4Zl
 6WvbrQVrynheXATfURZwspfhccYJxCrWX4Za5U6HIzL1pB6hsi7ax8fmVbSCjwukydX7MfbnTQW
 XwaAfpMa+WipTCygb/1T7jBLM6XSPYvySJ8iaH3ObOmQVXMVcGunwDNmLAKGZ/AX5QvlDjUpWak
 zl1gWoiRKeLL5dS/J4TWgLeX9Viey5OdeNbu2Sbz2lFcCydTpTqVDHyISTLhA5QSQgKXrrocm6M
 yPdq2vAZo3G8WoP8962+P+vha8VDAkbl26A3YNW14QnKrBSarQMKZw0o8n0jQF9liua4xJZ8LFE
 636mR0G8MI5fIqg7mYRq+K+RttDi/STopqd7McB7345MHR3SfWwlMWt10jFeh5p+xTnHzcGBW3s
 NMEB8aydWI8VKTwF7Sw==
X-Proofpoint-GUID: Ksx2SU3oDDr60VXKRbSSFpHO0dS4yRyG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX71QWzHMBpPXZ
 JniKkkKtJfEMarT4plVy4yJP3aUT69JWVnl1+V7Op8c+8wDdfa/cEGmgnk7wMqPY5Jz9VaFIvDT
 D6jY4y3iB2J4nCR5U0rOnzsYeNiqUec=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f8035 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yW1A7ns81NOMPIjzjlIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210151

Add dedicated driver data for the Eliza CDSP remote processor. It looks
almost the same as for Milos, except Eliza needs region assign.
Tie the new driver data to the Eliza specific compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 25599d728208..c8313c61da94 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1687,8 +1687,34 @@ static const struct qcom_pas_data glymur_soccp_resource = {
 	.needs_tzmem = true,
 };
 
+static const struct qcom_pas_data eliza_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource },
+	{ .compatible = "qcom,eliza-cdsp-pas", .data = &eliza_cdsp_resource },
 	{ .compatible = "qcom,glymur-soccp-pas", .data = &glymur_soccp_resource },
 	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource },
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource },

-- 
2.54.0

