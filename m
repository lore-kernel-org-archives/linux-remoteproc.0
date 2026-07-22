Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C4481256
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717824; cv=none; b=HuQD0e0RGNwdcZXqD/ChXULR2nPS2RzrVIrSQV0E+/ybkYv6488bNCpIXfONpBPVHlvzwJPZAD7IpJpM9SDQedatXbBux0BGqZ/uYQSnhgRSAJs6El7Su9ls73EqGLUscD4OlfRJBI0MOMvnVkftOPCFApIjithElxMAPm8Sca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717824; c=relaxed/simple;
	bh=zt4ny4xMT5vbR/7m6SqjqzQSH2eBkyuBdY/TbSbT3rE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EqG5cs19oGJkUWoZ2OrS74UXO1ZoadYxWzfa44O8EbXfaVkKc71vGdAi9ka0EyDrPawsYWmxAQzfaHP/RTUoDcoqg/ffHkkN+8Sxvd7A78VOLcNSqXUutABoPIj+5bgpGyOZeNIz11COexgEYWTHcShwr33z5i0ZKIEvd1VidBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBIaeCCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d0NkHlfv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBIaeCCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d0NkHlfv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x9nW401210
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v7V7ynyyG+fnkYeEmnz3+0
	j0SXRMrrVmr2SSh4X0dFE=; b=eBIaeCCRLFu/ECqUjpJodOYk2vp5JQv8pM5ee9
	XZfwxYMBgXuLLEfWxCgdvnkA7rBZpuupQCeiIto14DR8cetq3eCSX6XpoApxkJSz
	19YPNeug4CpbyCXHfYzzYA549orEs1azEA1IQipMIHIE8KBMwC+HWoRvhXztDCO2
	Xrx7cDGIwbW+hJLxNsA8sUkrTOVMMz9nD7M8/YFxCzXIaSkjuA0DmBbjenJa9cvo
	aLl2zK//iEhh//Y9zrZr7h4sIqXr5XH5GPW3+JnzRyeY5D2/2uAPGaJYIdrpMRSV
	gvxHV3U23XLS+2/mBk7JJr4QQGTWsI6mQHG+X36PrgSxAsYQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt798mqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 10:56:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so8513631cf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jul 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717818; x=1785322618; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v7V7ynyyG+fnkYeEmnz3+0j0SXRMrrVmr2SSh4X0dFE=;
        b=d0NkHlfvJEe3aV/kWRq7+qDLum1dS6hokXwBobG0ODgYdGOUJOb4Xf4BUYBOqAh0o4
         H8u6zLkSXPnuLWERcj107kdIISB3j3/g8AHECXxZl6VgiHQGVBUv1dcp3FTbyX3vYFFB
         5b8ERnVkn8tZlisAFt9bvToSIbpHwIHYHsRXMQSQTiTi1kLdGmC+JN2N7XQwhW40jLG7
         5OVfgk+JrpCRYxm/nc8wxUlPmpPXA3Q9VwHHnvm3+rWH/Zq+HgnVMChLJkS+XsqCqUlE
         H9XoROIDvpcLvyHccv60fykJPirtn91hx6vT6CwOiv+xezJtl+mZTHXBkLG9LkwxMem4
         coRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717818; x=1785322618;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v7V7ynyyG+fnkYeEmnz3+0j0SXRMrrVmr2SSh4X0dFE=;
        b=bgG7zhVm14xpIj4gR4hm25Ne6zi1uRTWmdPzB+XFWx547jNS6td3XGqvq/UAQ5LzUT
         Pi0ocv5mCpXaRJW8hZozWIoP2nz5cU1Wn5WNF2Zspz2VkevoMRuBhlbwJvu6fgA6zqmu
         CFDOjEIkaoqyjGhVDBQIBzzBF5rIgxZQkL5K8Pi/gS4YQJb6PHHMnZnAO2vNzr9sz40z
         sPnZwuuom5fyggZBquUmCemfHLI2fUlS7NEzFq7JV3O/o95InZW0H/6CKCiJLNHheRk7
         hQCXOVnOig0JxQ5SCVMqagO8U7FTEX6jZGKEOI07T6T1u+/BsynGtSzIKqmpWkN79fSf
         bxKw==
X-Forwarded-Encrypted: i=1; AHgh+RojNKgF7Ag6AJta7Bv23A/7A7Osy12LQQwt9ndtNVtEOi67VfB7GKbTmSvwAvmk/xcrF6mFRcscmB6MHotE3HKN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GTH7p0LK5++TAOhCoCm54GHyDvSwoZslIzogqbA87k6TBuEY
	wWPo/ueW6qPXkSuBBX3wrqkId9sVql36/jvsND+EWqAWcZ1diCmdbkNMSVp/q1aYMPbWlnvyB4q
	4b7XS70em/CJnnW8hRrN1vr8f63h/lFNPlYxLJE02p4lDUXvT1lxpz2AjCrts2k99XdYpYdcl
X-Gm-Gg: AR+sD11FVnjp2ik8CDIJhG0b5FV4ZDjLo9sOG0XQFpHpV3JJTc71o4WMPTUaJcUd6gT
	GIJx+rqlPXAm5EW5CmmhRANPXYn/auEur/EznKEC5TElM2S7uVoltL54andyisubDUEYiTuUBDM
	95RRKnTkwz+FLRAdKiEH8pIaU3oDFAcN76yelTlZPd9n7vnUvbpJUwgWTWNllB20Pi+qEO0XNnf
	FHGcYH3wRb2sk6u95SPhRD/9HFsllctgeVzh4LjjAMP6gC3Utn0Z+BSyEv1E44msV9lYESSfFsv
	Jz0bNc9fPYDyFVdTGBeMJ4wbSBoNuRY5MKSwE86UAGC4dBdXvsoHR44sjrYy1h1SNnrc7vEsWOG
	K5s+Ald8b
X-Received: by 2002:a05:622a:5813:b0:527:6d0b:a632 with SMTP id d75a77b69052e-527a836e0eamr34076851cf.27.1784717818269;
        Wed, 22 Jul 2026 03:56:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5813:b0:527:6d0b:a632 with SMTP id d75a77b69052e-527a836e0eamr34076631cf.27.1784717817665;
        Wed, 22 Jul 2026 03:56:57 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0571f5sm36240285e9.4.2026.07.22.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/2] remoteproc: qcom: pas: Add support for CDSP on
 Eliza SoC
Date: Wed, 22 Jul 2026 13:56:47 +0300
Message-Id: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+hYGoC/42Ry2rDMBBFf8VoXYXRy669yn+ULvQY1yrxI5Js0
 ob8e2W7hS5qqBYDA1fniKs7iRg8RtIUdxJw8dGPQ17kU0Fsp4c3pN7lnXDgJVRM0ID9mHAKo6V
 48Z+aWhcnClUFzGhualWSfHcK2Prbxn153fc4m3e0aYWtic7HNIaPTbywNffjkAeOhVGggqOpN
 Gu5VfV5jPF0nfXFjn1/yoOsqoX/gnF2BOMZ1gohlQSF0ukDmPgXTGSYUpVRDnjr3F8ve+wtBLz
 OueS0V0OMjkjXkE9NMeAt0W8VbC3qZLv8AU1hnhFFHqAMB0BWO5Q1atlKXWINwFrF89HZ8/gCK
 xUiCNQBAAA=
X-Change-ID: 20260713-remoteproc-eliza-cdsp-07701ba2b956
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zt4ny4xMT5vbR/7m6SqjqzQSH2eBkyuBdY/TbSbT3rE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYKH0jS1LknkjQsmg8rrP6tlItkKzjrFzFxq9/
 9f4hE9kLnGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCh9AAKCRAbX0TJAJUV
 VqilEACtqTcbDOG0pFNkm8jSAsPTbylyiT891GbNk8RnSQUwrinsMafLTzij8R3uP+oGnG4C117
 D42G02DzqRC4q/idaTtoDk9l7alWzlhgjx22y5kZ1tbtCcP7d9zlepXgmeCZmcnM0AcqraJBrI7
 c/DyVQOf1D6K1kEKOpfl0bQk2Fut5x1MxoPbma5F0IpJ72/jAPU+aL8LSpOBqe94LSZnsOZtkso
 BI9jWo+CjlmppmGmTPBr3hlRAyFYoU4A49uoSM5icDAemyMB7FUjmZymt5wYvTv+fPnF6J4a6dS
 T8XnBzZn1Qk44xelm1bUmnFVFzFDWeqnqtWOaAIopzjChGE7H9AzbMITkw3/yYuf5lDgGxZSDMt
 upCwA/nf9C/8GsUlR/v6zlvpc+zWmEHpbxUEMINAJZu3cj9Jf3BnoAZ7622mW+ZVHBULEld0S+D
 AKToWNCgWZsbzyBHLFSji7XCawexCzkAKIT1LVr8klnW2bJMzZYzkiEJNP2tSGvkqU4XyLSm4rW
 zwj407IQHabZ3s6EaQwdyjvlYym2nq7Gntn8b0QZsLaVGW1jakS4Fv4VSoVzL88pTYKOSJseCDU
 eDpgFzG8U23KaK+qG4DCbPfZ8nt8JoOAqI+WLKInUOsGLK3XaOsXW8enw1mqaNbyDVeOZ/TEz8J
 7nGqzGxsM1P0XZw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60a1fb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=UevxoewetnaWWcJ7pQIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: hd7SKU-o7txQN1MiwkGOfkroWHtAO0nG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX5yjiqo7oIACg
 prXf9rTCGX4pp1t3hkj2PPGxR7jfUXLpHrJ6mDcKN+1aX2UJZMEIwnAdtOZAJMB7nsUENntTrYm
 rFcDkmZwCpIPKLDEOUHJ1pzWH3x6RTZqG5ztaIjQoZ4VScg7PfKHdiaQmeYD4QoERlzfndkATab
 Ihf/u8k7FKhSI5vb1uY40PQ50eyoKTXZNgN77w7X+vwEu2UCt1VkMcvhNbFZc3nj8tECoNjlHC7
 JqRrcd55os2eWmIwntqfynApGebQfbhZbmz+QNImZ9qN+MryFSHPV6Ium++RqaM8BPPVP5DDNww
 4DHVtZVIRQTGpvP+bxwOK0tpptNklC9l6XY6kMoQpSPIIDclFqKmk87SvY+wCGo7RPw7xOeEFZg
 XRLMyW24u6Y0Ueoga6jZU93aJz1r8ur9G5BaTNLbQfjleYbTwxVYN1nx9GRqnEOUlBbGx0hkNaO
 7boVABVwpueydSAg2nQ==
X-Proofpoint-GUID: hd7SKU-o7txQN1MiwkGOfkroWHtAO0nG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX/ZjHq1Q1j++p
 kL/tKBMeM+FNysVjjacJdDHGOUiQX6fYzTXQd74HSYoHAOX+6EqA0vqqex97Myc/1ADadqdIAWb
 Z5srS6Dx9H217Ts0Nd9JIJzzxEDuSis=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106

Document the compatible in the SM8550 schema and
then add the driver data, tying it to the compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Rebased on next-20260721.
- Picked up Krzysztof's and Dmitry's R-b tags.
- Link to v3: https://patch.msgid.link/20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com

Changes in v3:
- Moved the compatible to sm8550 schema instead of milos.
- Link to v2: https://patch.msgid.link/20260721-remoteproc-eliza-cdsp-v2-0-f3345405e4da@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720.
- Picked Konrad's R-b tag for the driver patch.
- Added maxItems constrain for devices with only 2 memory-regions,
  as per sashiko's suggestion.
- Link to v1: https://patch.msgid.link/20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza CDSP compatible
      remoteproc: qcom: pas: Add Eliza CDSP support

 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 21 +++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c                 | 26 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
---
base-commit: 03cfefef0119410fc464d0d56e83626cb570b7a8
change-id: 20260713-remoteproc-eliza-cdsp-07701ba2b956
prerequisite-patch-id: b8ee3b8e05b200e19de49ea4f4a6e9001f52222a

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

