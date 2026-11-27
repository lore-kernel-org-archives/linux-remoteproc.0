Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762274;
	b=vK7Kk61j6ooY3vAYkdux+qxzSKLeh7xBo3EsObgUHn0iYdG6AJH2AvzpPa7yNTy0XVtc
	 M+75cEo+azab2RzwYrb+adMGYqg105q2zwuPyaA18qxpPxDvmL7bmFvG0ZWOuaULHqQlV
	 syVijH/zIbBcpsY9ezQBFIKArEK8jdMCWBwyXtyIqB2hGVBU8drgvVmPHjmdpvd5j32V6
	 xaLkYchm0kSWdrmR+wCmF1t5SNjvEeGMLUK0udznUF6225HBc4p+qr8du0tMD53qtIilJ
	 2RhZ7+EgA9FL35m2wMqt7ChJ6oOwbrctuOln4oGsDkq0+y2wMfqoIV5xAFpqLlAAR1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IAh7LEGIKU=;
	b=F+gQFjSuq7K9R1McQ8L58zPO6cAT88jlHQJlQR6FXa5+4Sqev5/m7u76gpIJDUYd9wCe
	 vI8aW+SEsx5L+WHKoGf5ozEwNQhuIp0Lm+FzIfWIBL8cqvVzX8qWzaejqFXYBBeR406YS
	 gq2PmbrbBVPnlO4KSayofXwh8NGrfZMQXs12S9CRigvVPMc07Ub2Cv2890c+pAlavu60v
	 hoXvOxrAbEb3U48MuHFZL5vG7/talYUSNOMrJHFVEIaG39odW1+ISXf4Z4UbpitEpw1ji
	 AXXLw/dCoJZZjijewCIC7/1dQH3a9sAbKhcwSMnKsU9XWwhE3YMRkr5bPnT3CnY6UGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iBi0Sp0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evZ6B6Hx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CD8606A324
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 06:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CD8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iBi0Sp0G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=evZ6B6Hx
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6J9eH3634438
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 06:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IA
	h7LEGIKU=; b=iBi0Sp0Gsr4An6gp/iWBUXnCxDAr/7GUGJvzvUrxIUmueB4XteZ
	zNVaFTzaLiTdQFdFmKTgKYU0+J0I+JbEW28R1jv2oG/g+Ya/LN2dyfICWu/DR+iy
	my/1hSw2Yz/fkN70IdMfK2sCzak643Zv8+NKoOC85upVG1L3moeAY2W2BzvLo+DN
	mpMouje0O6PLZG4Nl5i3lQClmS9mMm9cNAv9Aoi1ZQ4aFVBITo3YRFCWl+5+k+Tu
	RpZz3aLUlHbu75e86+dRhsEb6IUVBmBce2hG7G7mDuIDrFOIWzievsBkQU5cbWQQ
	fMNedp7NM11UFgABFWAPn4jcc1TJrbGPadQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6r3cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 06:51:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b59dfe467eso22423c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795762272; x=1796367072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IAh7LEGIKU=;
        b=evZ6B6HxvVKi6WA1kbbKHuhI0PArMkk8qPogkCO/pJW0ShvCOj+7BT9MNjz5EqSA02
         OKm+9kL2V18dTtFe4Isy39B79EGs1H5mLh4eP2IfZHt6zIq2Lk1jxU98+eGgRFwEzMEJ
         k2aNzvUUn2duNBYCCYOP7z0GuV4V8B4COxSzOgsgbzQES53a9ttdzSaJ9xvmtApzHjHV
         o4/ZX2N/nwYABMOckazUI9XtnRsgWKq96v7plG/1xVqithlHW6VM4Fz+qBbp7iN5TIX3
         RJm6UdbCz+T2wp233zmceMZwgLGoh+pfx71M0/8XyDc+Ox8LNxg73SlMxrzhD6RFzuv+
         XEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762272; x=1796367072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93elb3xRtMO610ZGRWePKoBm994D3H+u4IAh7LEGIKU=;
        b=g3BSvYjAyZRgX2yGGBnuwZfD1oQYu06X4PBtwU1uLuJHqabem/HvijTWXQ5Y1EY9rE
         e7x18qdmtFRknNS0vD+YP1RE3yHu/O2DxQCpfJk/JO/XQjGiajoqH2LsaWZoo/Gyd+eN
         FnyNYPHebRzPXZxy1bIqYlkmOY+Omf85xEMl31B8aL0nFRtrwRW14GxT/eQ/o4rPYq24
         S6ePr0DWk917eT5mzCDwe+3PH2i2bsT4IZL3+k6r3wBnKtnwbmmIcvq47OLQd42wl1wa
         V+S1unQKMedXpx2wWyQ+1fgCIRCXlWqukhophfqD987+RloEmAr6obx/5gD5tIEwUYsw
         BGwg==
X-Gm-Message-State: APuU4Z+UUEXV5cz+rLcIqKe3iOc2D5ixD34eEilq4w+bBph4J51u37lw
	2sLicBO095nBN7AZ+OwaIM8pimJctgOwDVykJmqFrO4050XMf3ouaeR9jDkiBE1EBfRlEeBiv61
	90PHPkHyGOLl88MkVHyHDETYCNwXZkXHFJnuB/ap21UrH6eDV/+96IIH5xMM3A43674sLL+OH
X-Gm-Gg: AZFdTZdLi6qafPFo0jZ6d1zrggsN0R5nbIi0I5MGbq+sDQGIGhwPk3fB22UBZ7urBB0
	HoQcfggoGqr4Bf8h/rRKbyYhxVDzsuJ9vRao0GXe+T2+BjNE8/aED4Hq1paYE3GDo+x98gEwq3Q
	IbuEls0reIZcEmeD/MwzNQpvcDFSNqrjYfB6d3lo5eQBZs/H0GFuMlk/OwSvDb1n4BwVt+8c37S
	nADKo+4QhXgWatI5jKZI3hBRmOWZkSa95Gwfc94pp4m/76nbCBiet8Wm7+v5hgZGBvCXqhhaAQE
	3rmRdDyHXiPMUr4/I50l8GUGhNd0V5/GRQXV36bYMh39IRT+kw5Y6WSrXVlCDantzL3XToU9bZM
	hAnUhebOKh7sAOnH5dT3u0Eayx0rpJ9SplUGBtVkxvMPUPdNvHVAQ0e2JIP7z/s8uaDZgMkG0Wu
	cH3MaeGg1AGzPWhGO3eN7ZYkbmNKWQsJqumQqZ0g==
X-Received: by 2002:a05:7023:a41:b0:1b5:4b48:b9ee with SMTP id a92af1059eb24-1b5568c0ec9mr22808557c88.26.1795762271761;
        Thu, 26 Nov 2026 22:51:11 -0800 (PST)
X-Received: by 2002:a05:7023:a41:b0:1b5:4b48:b9ee with SMTP id a92af1059eb24-1b5568c0ec9mr22808542c88.26.1795762271317;
        Thu, 26 Nov 2026 22:51:11 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm53062320c88.15.2026.11.26.22.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:51:10 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        djakov@kernel.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: q6v5: Put QMP handle on interconnect failure
Date: Thu, 26 Nov 2026 22:49:56 -0800
Message-Id: <20261127064956.1950950-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zZw6SGJFF91NaMWM-4VpLMnRD-K_Diy9
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b092860 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Z9qQhxQJoVFeEDvJFE4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNyBTYWx0ZWRfX6XjvtSdpybEP
 jZDXyJjCIT3KI0W4tMfV34Ecs/N4sXV3nywKASlWNVPsNEk5bM29l0pjkGa4lOJUJZPVGfOTHJS
 ZvmfOFPWuMLucgOl6AmN0ZCpyfosTWg=
X-Proofpoint-GUID: zZw6SGJFF91NaMWM-4VpLMnRD-K_Diy9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNyBTYWx0ZWRfX1hNdXRs6/Llq
 XMspVa8Ax+qvLPqpFLXBs0rYTIfBiHl2Cv/kkvpA7o/jjpmI2Lav7Ms83LYqJweaCO1lqpZjUi5
 clzyOUFOiCbGlLkO6oY3WWLdSEFMcPEFdE9TiXN3oNNfoIeV82jOPuo/FgAc/lzpUGmz7e019GM
 lRTT651YTBQSpwhMNfqs1dd8e/jII1Hh2HXdUv+7TVHEmE0qrIZLsPQmBjAP7drb3/SjObAswnF
 WbwKUunt5WKh6Qx+E/KK338dGRDkJR76E1vNWDnNgFk/mkBuujuYeGE4zPUCkbSZYN6bKJukCOt
 hChmk1J1u4p7Nyk+vvpzKdZZEtgNth9K+7b3J8HCzj4G4KFJJkr4FxK+s4EdqX/6NCOjQCNeh4o
 8johCBBxwKTykbFAHWJ9N8aN+lIIRs4S1Znx/O1Su0RwvJ6YplgOhmmfK/qb40etji+ck9CwrRf
 0nBB3/eNnu8jKxr3fdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270027

qcom_q6v5_init() takes a reference on the AOSS QMP device with
qmp_get() and drops it on the load state error path, but not when
devm_of_icc_get() fails afterwards. The callers don't call
qcom_q6v5_deinit() when init fails, so the reference is leaked.

Since the interconnect provider may not be ready yet, -EPROBE_DEFER is a
likely trigger and the reference is leaked on every deferred probe.

Drop the QMP reference before returning the error.

Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index fe148b4b3775..71b79ab827e6 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -372,9 +372,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
-	if (IS_ERR(q6v5->path))
+	if (IS_ERR(q6v5->path)) {
+		qmp_put(q6v5->qmp);
 		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
 				     "failed to acquire interconnect path\n");
+	}
 
 	return 0;
 }
-- 
2.34.1

