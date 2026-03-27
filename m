Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796EA34E74F
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774628340; cv=none; b=ITfN3pzvy086xnkuC04dHWoel7TAbX5TmCF63FJly9F8kMoOpsdp/sxrDGfM3JLq4rDDDt8N0jgmlyIM4raUm7o1PLqyiAB/5cZkSrOyh4Yp+4CaujnKXUPjAxv9K1Y011b9DhnEe3ZqvpR3wUrgJCU9ORMI1YnHwoSwBrrXT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774628340; c=relaxed/simple;
	bh=++cKNIal19X4oEh8A764XygzDlFyLlTKyrf4nGOT7Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAGD1vfxghlNe2qFNhyhJ7fMrSqSVQrrq84p/sf/zUi8bk8AlOCpyWfk2Mer11Cf2/neubaX+LYZ/+/Km2LTVs+nJRAQoLhyU4S2gaFyivAj078rsGj9iwHA2g3RmVgIAN6YgD7H8gUdP+t0HWMC3AbUiyC7RkrvPCQhdWQTF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDEHV79R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdWYeqZ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDEHV79R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdWYeqZ7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDhTTk2615792
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mLOukGpyFsZeSsoE1YKizPDvlsXi3Qkt+oPdKTifW2w=; b=FDEHV79RCAg57Q/f
	dKZUqHb4WULXvR8WW+Lqnh+5CC8U79on2k9978A2FhWK0qJbdqu1bhtR0yBayTMa
	c2BDJDfGlOtJ2eY1cytjcUV+WxMvYP1X0qi6LQqLAdWHcuMfwJmTN0WgUQbcsmat
	12rLu5QuCzMfEsVu/eigKMk1oWInP8Y3w52W/ViGwiBd46DAVkirYA4O9g6jOaYn
	bf0Bzz6hxNOu1uTIYtyclIpFvHXzjtnwSFrmBcCwzzHtdTlOHEdGy2APapctSxAK
	Q9g2uh3IPCYkE/OvvY72cpomyjb4iMXqNE7586bnnjBpTuEMr1ILQTl+2nM3jLll
	M+W4hA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvkrkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 16:18:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so69486191cf.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 27 Mar 2026 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774628337; x=1775233137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLOukGpyFsZeSsoE1YKizPDvlsXi3Qkt+oPdKTifW2w=;
        b=kdWYeqZ7aWJuV8tc/UwKi7OKr2TTCIdXW2bNJMCIMTE+SDFbBVwkqY7hiGJ/1qHbUq
         Dt8aIy7AEcELiYiSII5rctT3gc3nfAOKTqzIW2IQHOoF22Ka6DoijaqP1dxArUW2k/8I
         Dxj36FznQW73hf9PkxvbSxa52qBhfvs/Vt81X+SdYhrhxjCdUOEhXr+jYECTdZVk89Ho
         NLr0ZlMHhzPHMXsw2MeBUCARX/smF9NDHCh5hYHx6rm/bCmubt/Kj+dNU4Kgtk33LJD7
         xDLPA8qOep1u6e/K0TuAMrholEtk3d5CVPSjXU39p9kN9LhZWTTUPwHPEIJU80hSBXra
         UmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774628337; x=1775233137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLOukGpyFsZeSsoE1YKizPDvlsXi3Qkt+oPdKTifW2w=;
        b=GV9kSz98s2En2jcHh+SiIbfXQGXHv7+O0aOSfRpo9HMGnRwE2bdlntZex8hZ0P6Mw3
         qOwYXKm1Oe3OktfLYS+BnEYD0jB/OOCOl5PIZ3L4hs/eUsT2Dm9yQNVZY0WHSQRraCHB
         JJfm5b2RQfhRXUV0JEJyoJJR55x85Bkvt7EeRSP9fkNbs+TogMNonr/vkLZnynY+iCzz
         dEhR9ghB/oK3bdx5UQPauKpxc5EGYP3WM3buGk0E8WcIAvmCChh6bdzM7fbUibQhURsl
         02N/iQv00+4XIWfYjb3SmOevU7DXqd5zssJ9Vm+k9Lz5/C50LSjIzOtmsiFOKDzXW1fX
         +eWw==
X-Forwarded-Encrypted: i=1; AJvYcCXZxzOrjKQwUMpm0Iu1p1a6aaV7SyPkH8LG/xV10IfsWOWvRMoyVzoSmpFjHLxdmLvgRo+8xporn1q8lkgmF4Tn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iR3GaYux3+WyCAcaZLvjOFyWxypkql1AroXXmMsYj34bgJSo
	bbuCcUxtYFzJiscGgJLnwZkIAJRVeVa8HECUhEiNhgS6kB+6wm7Arw/KsqgJO+cN8aeuve24M0n
	fpfKkIR+bepKBf/XwehyIKDjLndhuKh4zkZEkn4/z9e9cDWdoHxq5ue9e61miWbX3M9zV+eh/
X-Gm-Gg: ATEYQzzUnj5d2medgQMlzRrseHByCTEJS+E2kBvmwRZaH5cLNDF9z8HtGNBZu5DBdnN
	IFWb8560cEOj934D9DwN1wbX+v/YXuedY2q/IMJZz1ISJPeleKF/XNfqjg7XPoTL1PQ8g9kKCvu
	oYsTXEy2T132z+I7nMCfaPWJYSeGNeaj4KxhyOKmBIq2c18PmA27tlOKIuYWsebWNDCPcO/wJxz
	wVsLh/3aqM4Az7lIEwpnB7uN4sFg/2MMISIxKmOObpF2eYNfEduApipSATONlvJSDf4ezi/IMp3
	CRhhSi/VpqMEwOLwfKADPhKycqeJsauud3hOc1bPEnyFbvP1jxAcpJD4S+0I7vC6PAdite0kyp8
	AYs1+0eAHRJfsJbo4CYVThiYKOyg=
X-Received: by 2002:ac8:6f1b:0:b0:50b:52ee:62d2 with SMTP id d75a77b69052e-50ba391e9a0mr43196641cf.38.1774628336788;
        Fri, 27 Mar 2026 09:18:56 -0700 (PDT)
X-Received: by 2002:ac8:6f1b:0:b0:50b:52ee:62d2 with SMTP id d75a77b69052e-50ba391e9a0mr43195971cf.38.1774628336200;
        Fri, 27 Mar 2026 09:18:56 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c6b495sm205955525e9.2.2026.03.27.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:18:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:18:39 +0200
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add Eliza ADSP support
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-remoteproc-adsp-v1-2-1c46c5e5f809@oss.qualcomm.com>
References: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-remoteproc-adsp-v1-0-1c46c5e5f809@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=++cKNIal19X4oEh8A764XygzDlFyLlTKyrf4nGOT7Ag=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxq3pBJsn8iH6FN97lVHi8+1lzSw6uelAHmp6+
 I1d9xl51GeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacat6QAKCRAbX0TJAJUV
 VtZuEACSrCXxyc9p+/lM+XJuK9Jx3ZUQuMV5x2Kb94bthX+zD0s9fy3I7vjPYIKRr8t3p2Y6O8n
 /CwGbOjZI+BuP1+5YG0RfTvfVCglT5Iq4XZoYeG4FZ+DGTbPk/a8+Tw7EQZHu281fvs2qJZbWux
 9kfDlGt/a724t4vTKwdsIobY6SajuErOfXx2c1qOl6KyMgWomSW1wT6UMUeaprY92ZOmmFMeklj
 kSvonvp+WQsF2O+TkyXYy3Zn/1HOd4pulQPzh54ppGgwVfsF8J0yw7TKGUIjcZ4iYRkqQX8G5hc
 U6MeLs6mhMehRB6Lg8Q2Xur3wcuTU5VRCkXTrbRxvJ8GXKVmwa4WpYmWctxAyWdg7bv5flWvNc5
 6vrYIdOsvYq2hc/OBBePLTDOVoy6A+tRxlNFKsHkVGOzA9e8I0TChKkQYv58tV5g6qokf1pfRGc
 UGmK8k72T6DbMaSQdZhSW5ihLfMIJUuqi2Cfjul+dHGm7P/szEVKivl0L1+VLnmqemjsfhVTap3
 KeGg1IsvHOphXLxPOhCDO19zgGIk8uvv3jGGsWr/LgyKshhLVP8kDZLi2XMwlo1N3uKe/n37lpv
 yV0eJeFBz86PNvj00HygnwnznB9B9UI1GeflMEBDv+7CoFdhmUVX98AchiLXkL/9Oyr70loJzt6
 O6pkOp5n5laXy9Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: iSdtQA0PNsUbcRg5C36a6Q1S9V_G24Fq
X-Proofpoint-ORIG-GUID: iSdtQA0PNsUbcRg5C36a6Q1S9V_G24Fq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfXzk6gvEXxQLza
 GCfDjD86iDaPdg/bFHoYesVEtOuf7JS1PxZxKdZRdinwDVNBMcMJ7XgeQQbMjCI4QDfJyEnjp4Q
 dljhI9vyhshuc65gbO7PZ40gcQDFo1a0Yte5OCBQ7Q3Da3GAa7ic98Os7hZp7JyXd1WfnUva4Xc
 HWfTlxQGNN96KUPaCOCE97NrsGJHj8ZUoQSGhDQiXwm5Du9uk7cgJ9ASoTVLTq1vHcHfshCtWDs
 Uc8ndm4MykEcZ+9clIHBmwpcXa8qZjBQSOTKwjxSFV7J9RWwS5bOAdxezswIR3jJhJdzqSXCUly
 rvl9i7/Yc4DWDTvuKzTKZ3V+NZtGr/UVlUKdAvEAZybiYDvzu15EHT4f2R/nFKn6qSPYfHsO3/u
 NLwQSPgOx31sxQgf5uh0Xe5YzGHXcSOsnXRicsLpSA8eAJg4z73yEidEVg+RqC7/pqI7jIpHIjM
 5wIXqwWwFoIJc+DQgSg==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c6adf1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=K58yWSdeSmOVA_MdiSgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270106

The ADSP found on Eliza SoC is similar to the one found on SM8550.
So just add the dedicated compatible for Eliza ADSP and reuse the
SM8550 resource configuration.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46204da046fa..671e57b47a34 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1531,6 +1531,7 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 };
 
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,eliza-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},

-- 
2.48.1

