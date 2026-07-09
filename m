Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92916404BD4
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 08:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587158; cv=none; b=o5ZrPuRY5NS/zdX1twWdEbKNdQITMnU2DzGQYhmgo+6VXR4V64gTS85O4syqZazYv+oX/O9p87vHGnynWQU1Mksivg6agi5/5Emn2uPBrAk/I2TSEWJU0PgvyLD8fOX7aX5+VtZxQaHBQJRs2RuUMz59AHZsl8oFDo5Rt/aFLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587158; c=relaxed/simple;
	bh=mz/vbKEa3auNVvUlvqCxL4e+N2IxEzAXNSVtBInwc9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCov5dFnOvgK6wLQomPaDFDeXmpSNrzLuj8QvoyZnsb1XdU76FtSzd/cEK/G5HvhzaYxLFFAZbqHGRD0Km0+NadONuv5AEerfqZwGfBGAMMvqYI47rZQUApnYmXvAYB04+i+8J1wUFq51ms06IRsT2oRk+q0GkqxQMG24wwqLDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m3hwx5io; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f08hPR2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m3hwx5io";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f08hPR2U"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960aeC837403
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 08:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=chKC2qFBTda
	4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=; b=m3hwx5iowjIR0CB3CCwPrF3cVl3
	l08+CNRZGObfPy93qerYZAWbk6dlr2QGEiZJKDE/7Z0I5URxUm07qLxOGLJtZHK4
	Ta8ALdSPKbQ/3wxnBgY1MeTj32Hbee8OhgcQv0K5RgNO95hA8ypAafrfMCAVw4+O
	LA3aQ6D3ztIyRImKnFbfuvDKtIHUxGBM3NzDWM2XYVe89Xy9JZSz9jV5f7hBS9xD
	AxxaQB/XvpnrOdY1fY1Qu8RgdK+rHkQJQwZPdlFoVWebiOrVqrVetFqHg2v4PWff
	T8qBm+XYQK5EMEEfzlMYrf4ryQotzRibocodlLZi47H18IK/2zc635NZ3Ug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwb9u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 08:52:35 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848568a6f62so1331048b3a.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 01:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587154; x=1784191954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chKC2qFBTda4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=;
        b=f08hPR2Uu5X0Qhn1YmXB/MULAKjl0433+qVkHyzJeSoIBEn3BK5Sit3tm08cQ1thTt
         V63r++EYFv+ApznQ0IC4+uSYOQFCgetkuEFPs5zv6uAZlA3iBAxksQALNq26QFS/HLJX
         afwxWMf5oD7w7RNhk+GQG7GFaIwL78WiecTWPCEKrvXWHvtFbkRdV5fnzAxCUAkDH29g
         8pvmgzQjhttmYsMwf+GdVidOb8JFEGwvOYcJ3Ua5uJChEnWN9IgngjRX3WiXiwGX+fB9
         MLN7DmeVk/o2mhIDkO6PuWS0Kmag78kc/TNH9dC1toaZCY5mtoVpD9WKrB2VgUO1VU5L
         daJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587154; x=1784191954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chKC2qFBTda4mWD3b3bzaYis3+uHKOcfz43VKRdNqNA=;
        b=FweKLILw+nckS5SxWImOYElALpXDFgfrfIXs6m6h/yhe0Za3t7ghZIl2WsPf7y2TAH
         nsish80BL+AUrjCWsLwySGqNbhrBhf4Uwcs/dN26Aykrvp+C2DbblEzJlTODe+XVjHza
         Qj4V+LyYUapb6L6gy2H+/9CWiMxVAlWK/ktw9mAdIgam41wIhTVsOvw6JdyE6WZxN5ux
         +bYrXgd8qxUTVge+I70DxRYJ6CmzrS0Jbhmgieox2tpK51QFrghId496HdknrPx5LgLC
         KMJzpOzESqh4ycn93qfviOE6sOhZiiDSdkZBCXIe+fwxdbtr8sjFs9bfquH3OxpXMlIJ
         TkvQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTkVx0RBx9Ugzh1hdQOkrZJArfo3hjKcFj0URl44HCnpZnnOSnqVG4Se0TF4REmGRLi8BSCGxbeuraUcg3uAyD@vger.kernel.org
X-Gm-Message-State: AOJu0YyO90T+eAaT+56BX5ItR727qVBwxyHXbJqKlXHI9GZZgOC2faJW
	cwirQ9pXS9dwi1GytdkglCZRTbN27qD8FgPV4QWw0uUzi/zi3ZuJdAFg0B4PYhSRFhucdBwW3Tx
	dY+MSs//uoC2oKnyDs/Tb6qBJQ84Ukhv9wWwCHFwNw9Vh9ZqKsgz9pu3LLSfYHuA3RDA9aNjl
X-Gm-Gg: AfdE7cnoavAVr95E1/4AYgEUAxOGWa8PWUU6LvQoJWde4yKUhnxzD/X46JOgWFVGaz7
	t7s67CB+B3bPAFP3Wk+YVQmgKy/hKlaGtCbAkDDaIoitJzc9rn6mdYsp1i3/MHu+U7lrBRtjSKP
	lCPFpsuWgC+Ab83AeAFDCMICSMsOTeFK2SziDwupSMfSXS2EfusPxzOeP8diHK0p+jfEUP1OGv/
	D7JsUgJ8FB6O3ZMx/+Pn1IfLIrhltqB/k2yuAwJG6Q9brFxdpv2HmSamxqiWqWsTxdAetJMR5GQ
	tvKQVXnV4Ex4o0TZIPMIxZ4i8EHSdqjfzuu+dUq9UnQfd0H9YJEJK91K8BwZ+AVwQuoNWFdeSmE
	RhvQZb47jg27vddDcH+ABvv0z5Ap0kGU/jOuXzxo+y8gdk0IgPBbQ+14DzLW9wiPPHUR6s9E=
X-Received: by 2002:a05:6a00:3996:b0:848:3ef9:395c with SMTP id d2e1a72fcca58-84842efccacmr5786509b3a.27.1783587154318;
        Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3996:b0:848:3ef9:395c with SMTP id d2e1a72fcca58-84842efccacmr5786481b3a.27.1783587153747;
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
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
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: qcom: pas: Add Nord ADSP support
Date: Thu,  9 Jul 2026 16:51:49 +0800
Message-ID: <20260709085149.4072181-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXwcsSqv83qOUl
 vQoREPKYDNkG6F0V2YhIQ5+ufN7jDT0lENOG0BGhPeM7gC/DV8CcME/mE8vO4lApkOTMbtV4lIX
 UyvoOD9jvuXsmWFFlpqYLFg81z1VNXZn0fx2/+9SG9msqeBCigfgdNYAbZYlkinAtGEhR4FO442
 9kR4xxQGJHeBVn9z/hBfBaJhg4y6SQUbDzc2KPj5cfcnwj/wOXwEXIeO4CyxzoMmARAB4BONYeV
 DwvDEWY3bkEPgfOkNV2EXvkf/3lrDa1t1CmN9st7C9eD3VKjLypIb4XMOQvbhqSv1nRru8xwLtK
 Ur6DnJn/RnbJ8waHy6or7PTf8oTqS8iLPS2ZFfaMTSrZM3dXET5zO9OVaj8aVhXTKpLcrWLjHgK
 HWe/p8Cbl6VDS6vqlzAaz+fCKdrH3iPGUTDUAZbQ3+0ooWl4zfraHAe07WW+9FuJRrJ5MJmRcN+
 6cnpO3laga3DSp+qK7w==
X-Proofpoint-GUID: OxPDfrEKHl_BiR7141g5WILK_7rcHIfq
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f6153 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qFrpwd1egEKAg89pRWwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: OxPDfrEKHl_BiR7141g5WILK_7rcHIfq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX9oRuKCcbrgET
 hPGiX0iCqhvcvoRnHJIn6IXzXbWAtbkshTgNwgL+ZMPEalXkJNE9ENV3T4l5Zka3T+1whW6QnJh
 qj3HfHLY7QCVEl9vdt7/fes/z7fXy9Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083

The ADSP (HPASS DSP) on Nord SoC is pre-booted by XBL before Linux starts.
Add ADSP resource descriptor, and set early_boot flag for attach path
rather than a cold boot sequence.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 60a4337d9e51..486d08e75cab 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1422,6 +1422,27 @@ static const struct qcom_pas_data milos_cdsp_resource = {
 	.smem_host_id = 5,
 };
 
+static const struct qcom_pas_data nord_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
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
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1664,6 +1685,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource },
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource },
 	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource },
+	{ .compatible = "qcom,nord-adsp-pas", .data = &nord_adsp_resource },
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &msm8996_adsp_resource },
-- 
2.43.0

