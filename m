Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164211E5711
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 02:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749695995; cv=none; b=jAF1P1CfbcFXIlkpvAqgaJcOIOootRKTg4huUkeRBfGr8gIMgyBnFPqHCH4H9Vf2AdOpIXBhIrdAZ94JUR2HLYL9fAXYbcZ3DQ5WsYkWY8gmF78lEFdSGwJHn/f28MnNIjFeyx4b3qFeLcQpxJUXQAoy7AD6gHkyujX5MEP6xcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749695995; c=relaxed/simple;
	bh=Z5wSDmQoCBD3WcBmNgudpYHLdgNfVwXXM2z01IliBJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqFRuUmMy2F336qffWbD7+mhxL8b3CNvemNiKaEnBLuHQuhmcGmx6A5Ei3LfSG6MMIgdE/vue94fmlbst/4kk+98I8iZCj+BWsZ0YVBiv9zSkeOKdyuVLyxyigGqDiTQhLU7d0fBqoQQmpt9dEripTW+8Nfms/zWL/D7mzxfuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuE3CMUZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BuE3CMUZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BK4tw1029720
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 02:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYh63pIwgN1Qe38nJQ4bBDn6pEshNWErTOkiIb/hpC4=; b=BuE3CMUZZbvG+IGz
	CNI7zggivktsgmtC/SWQFLskruIpNXtTozS/RHxnBtI7iUB7n0G8OxgoBQ7H+ypp
	kYR29MuwUgAuNKvf4zs4w68+yd9jkAOXdig01IqnSFcybfY+HLqMKZv/eoPoHYDu
	JcwJEXOORtsjXmAAGXTLV0/KhHL3lv8KmBe1SihC8ln57UC0G4xZj73NqRey//GB
	wUQOsW8P7nLMafjYi/v4kZxARYFWJ2bl4CohCcXFRgwfpqktdO0heW0GSqU+rF6i
	jDXz7KPKKZthrTeOq48dJxu+7CP/SmgeaEJVZWj8e+Ac7vLh3fe9NLn9fGhK6lIK
	mPf5QQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1270ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Jun 2025 02:39:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2ede156ec4so466435a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Jun 2025 19:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749695991; x=1750300791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYh63pIwgN1Qe38nJQ4bBDn6pEshNWErTOkiIb/hpC4=;
        b=tHD/zo3stm/moBFup5mxdFVQxH1GZE7ByYoMOGxHMTkfl3+94qEsps37gY2o5OfUQC
         l0LWepSK4dIaxYnBFwHMpD9P3GFFADypk0mkDpeiMr4Iat6z2gGq2Q7hvzFcXTSJAWzy
         AwT6gaowe3w2l82nVb110IvKVUqFdnCD0dz18O8Ff4OlVKfTe5eNDYu2c/u+wRxEp85n
         maIUBA2youbCBr6dEbmymF7CmfNYxm5rLkKvWzfguAOSNLjfwQeOxZGKuF7vhJUo1798
         T3p8AVGeQ8B9/0eV0q5NrXVljMrxMBZMUGpwiFhhTzJF83YPG9Q2U77c4eY5ci74dWLn
         oBpg==
X-Forwarded-Encrypted: i=1; AJvYcCXkGr3qLe7y20nti6lfWvHX1wL0+FG2AhJ11VF5Rq77ewSvuNuxv7Uxcf8iAZEGXh9/BelqQb1IsDwKyqO2FuP1@vger.kernel.org
X-Gm-Message-State: AOJu0YzhwnaifvP/klmv9nKWbnR/xTvkQ7uxTqSzlWl4R5b9U356Cwga
	mUNhWb0GKbik5AZHQe3VQ1VrWglPer5vpKNLIDNUSf+b8Va5MvIE7lCTukZvtp7Nu8XihQ3VkAB
	xJBn66VJb37HLoutUcf2NBaoq3DEoiy1omSCzCpQ0RZ5sE548mHnyHaTkauJxr7dDMnYBwGCm
X-Gm-Gg: ASbGncu2sMNpCOh5WqzW4mG/xo7chGVjMIxyBpFHUoXcmjfDqRCrYR1c8gs6gbfzFjC
	czVxx5AruWu60znyPatWfQJqc6innxG9j/G0Jz7WGkfBfCpMpv8CaQ1EGt7gykxLlm0DhZQNMKK
	WhuOZZpn3xCaBIy59RwPy+Lx8SY+9GIzCv/s1JwGHWIGYMAekokdyuoMGyJTI2lF3AKpmukGH2D
	tN12pT6X44OHWTjWgbd8+X3gbm3QE7s9biN/JsqYoeVhlApO9IeKddDy6i0iEUaLfTkWAfQxn9l
	XdJLwfAfzUas24lA8Tv12VkN4YDG/fdO3kHYmnl4nBQlBSpsC/iLf+9/H/P6c1Wn/K8xd1ubbGb
	UJcTzHefrbOf1kLJ3
X-Received: by 2002:a05:6a21:3944:b0:21a:de8e:5cbb with SMTP id adf61e73a8af0-21f9786f977mr3588419637.25.1749695990919;
        Wed, 11 Jun 2025 19:39:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXNaEP9bL3w2Ql6gpal9btVWdSF//oT5Sp3FvCTFrPrXXBjxhVGcRIf4j3FXfRSu/1/fs/tQ==
X-Received: by 2002:a05:6a21:3944:b0:21a:de8e:5cbb with SMTP id adf61e73a8af0-21f9786f977mr3588364637.25.1749695990450;
        Wed, 11 Jun 2025 19:39:50 -0700 (PDT)
Received: from lijuang3-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087e640sm315835b3a.4.2025.06.11.19.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 19:39:50 -0700 (PDT)
From: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 10:39:33 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: Correct the interrupt for
 remoteproc
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-correct_interrupt_for_remoteproc-v1-2-490ee6d92a1b@oss.qualcomm.com>
References: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
In-Reply-To: <20250612-correct_interrupt_for_remoteproc-v1-0-490ee6d92a1b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ling Xu <quic_lxu5@quicinc.com>,
        Tengfei Fan <quic_tengfan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lijuan Gao <lijuan.gao@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749695977; l=3017;
 i=lijuan.gao@oss.qualcomm.com; s=20240827; h=from:subject:message-id;
 bh=Z5wSDmQoCBD3WcBmNgudpYHLdgNfVwXXM2z01IliBJM=;
 b=szuvl+dx2J1Lnz4k7Ejj/lmOzre/XMgBjEQVK8QXryFdI2Bw9GQjvtroIRV2v6gmzbkLzMrMZ
 MY64GcEmla2Az5LTlmhCFY7Aap0J4Nu56dEnjDPkZPphjcM00RqeJHY
X-Developer-Key: i=lijuan.gao@oss.qualcomm.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-Proofpoint-GUID: 11gG4_Rbeh1RG-w-FXRs0USRKO17_VXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAyMCBTYWx0ZWRfXxkQGeYfoQQyV
 4ISTroV8Dq/2dC3UbQa10TQqMukZp/QOWAgPWLeEOLp76O5xO6uaUvr72v65MVELzyPrhgJSsHn
 tQESM/X62XG0ejwZgY07yo7yRTyTEqh5lj2P11D3i9knV3Yu+fzYn1ccaq+OcIcXblb/9/pI5On
 0e/VqrgJ0ISza/PGiltYYB468TxCip71yN6tvheeoZZ2dhTlyJXxDHD6fEtTOurIn5/udG/yHXS
 I+swuMK14m6oOGWqMSffpvdXSJR4XRbmZaV41tf+BzLMf+AslgT9Fs7+GBh5DwTJhGZoP6hrYao
 nDMl0rJ599UyaZJ9pPoEbd0LTvBadEy5p8LZ0LpciqaKzUr5yTYIRhTn814/iqiAqP8e3TNSVca
 ThwuwoNg+uKnIyxMWNEG2zePI21MORcNOJRvP1phwOLzVFjzcH42otteMsk33Dwna5FwbSZa
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=684a3df9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4RsagAfGKZGQ4IWNqzAA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 11gG4_Rbeh1RG-w-FXRs0USRKO17_VXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=692 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120020

Fix the incorrect IRQ numbers for ready and handover on sa8775p.
The correct values are as follows:

Fatal interrupt - 0
Ready interrupt - 1
Handover interrupt - 2
Stop acknowledge interrupt - 3

Fixes: df54dcb34ff2e ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
Signed-off-by: Lijuan Gao <lijuan.gao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 45f536633f6449e6ce6bb0109b5446968921f684..f682a53e83e5be2899922f177837c21ea09096f8 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -5571,8 +5571,8 @@ remoteproc_gpdsp0: remoteproc@20c00000 {
 
 			interrupts-extended = <&intc GIC_SPI 768 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_gpdsp0_in 0 0>,
-					      <&smp2p_gpdsp0_in 2 0>,
 					      <&smp2p_gpdsp0_in 1 0>,
+					      <&smp2p_gpdsp0_in 2 0>,
 					      <&smp2p_gpdsp0_in 3 0>;
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
@@ -5614,8 +5614,8 @@ remoteproc_gpdsp1: remoteproc@21c00000 {
 
 			interrupts-extended = <&intc GIC_SPI 624 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_gpdsp1_in 0 0>,
-					      <&smp2p_gpdsp1_in 2 0>,
 					      <&smp2p_gpdsp1_in 1 0>,
+					      <&smp2p_gpdsp1_in 2 0>,
 					      <&smp2p_gpdsp1_in 3 0>;
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
@@ -5755,8 +5755,8 @@ remoteproc_cdsp0: remoteproc@26300000 {
 
 			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp0_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp0_in 2 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp0_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp0_in 2 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp0_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
@@ -5887,8 +5887,8 @@ remoteproc_cdsp1: remoteproc@2a300000 {
 
 			interrupts-extended = <&intc GIC_SPI 798 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp1_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_cdsp1_in 2 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp1_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp1_in 2 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_cdsp1_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
@@ -6043,8 +6043,8 @@ remoteproc_adsp: remoteproc@30000000 {
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack";

-- 
2.34.1

