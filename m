Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A33F076D
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000624; cv=none; b=aY8skrhXL0vObGE+WZoxbGuZJALAzOOmQ1nEHzILhgwqB1EO8e/B5QGyM1Ck/JrpID6LL0mrAeBjOVMAUMfjELsZ/Olf2Q5px+q45b74i7pQlqcGFHNiLoUAs5+F0wk4DlSV9qA8hFaMvJKi1cFNhEOEbQwuW6C6hqpGrklEN+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000624; c=relaxed/simple;
	bh=NKnSqFgZJGURki9OBgp3TnFWtvwAJBfehZR72tMLw0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jrDm4BwaWV7HmqSFcls3NEt1ZdP48L1RZZY1hzR6dleC3Mq+TosZiihxddwcf+if1KjuwXDq70KhfRzTg8d+yEFPk18duHoxvG6mbRjaK25o52SO3h8V8o/lOMiK0QSEy3jkPN/uH1Z3i3WEbfA0JwYICcdojOw3BeKrrR+AY0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtlrwfoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnADHsyN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtlrwfoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnADHsyN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vIuS1907433
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVPYN4X+tpUgUN5Ltr1p90uZpvz3ztuG0fVzZkUgoeE=; b=AtlrwfoKvqeyb24y
	AGXIOxIFwEwGhyKS8RkPACUFj9Bf6dZIXJbnHBFPDxobwskTvO782ONbKDE+ZcrK
	NJ1bnAdLz8uaQPy3wpqKBO0B6WaNOqQx0vgiKSAtqsglHGG3pNlMQ+6oUckyEUXw
	t3jFJZ+QhVvSuAGAAvxNyMuwTUXo1rAnyWUzaPadvHoKOMaZuo/pt/Un8e6tQTlU
	ZghzY1TbLV4a1o7X9OepufnzwaB6TtN/j5q8p2lST3ZRiItI35zoH0r9hKV078eY
	sYyeEnfcplYfBHeFkCNQ/WWk9IZs89f7WFT6YoEUblVjklH9Y50HZ5JEsRLm5Puv
	h5ePfg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jr8xs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:23:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c272e532so55712435ad.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000620; x=1781605420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVPYN4X+tpUgUN5Ltr1p90uZpvz3ztuG0fVzZkUgoeE=;
        b=KnADHsyNZOzB60VA3gZ1v4ef5XLHeqg6If60deBKOYDEis5BKMGmNwPWGtVr/UjPNA
         BG9YULidmJ8vve09/rGWttxdi4BfBQ/3hquh7C3Oomjb5jwigPfI4wxRR6DMpcanFeS2
         iCqzfvrnrjJMRD7eDFUESPcp18Oy049bvLH+j8mTKDuqd6h/uRSQq2rBfNC0BxKvusmp
         R9JwyPOYW21I0g1aFe7pZULjM3WzrGnOeSxltdWAN43l2jDBNg8j0IrZPQhUtY0I/8SZ
         Q7DqHXHgCaPYs8mMseMC0zfPji0Zclma11GdOSVQepuaPFMpG0omkRE1xbxOTrf9TKd4
         RbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000620; x=1781605420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VVPYN4X+tpUgUN5Ltr1p90uZpvz3ztuG0fVzZkUgoeE=;
        b=shz2ertE8brrCOmDPsObnuNH2rd+kWxksh0Hmug167JY9PrQjkyM96Wu4WFOkmEmT0
         jJ+DXK6CbzOtcWJ7cwFtnOlj/qoEZE/WzLODXb8KavxQRZvL6niaN1vqig7mJwO2NKn7
         bIFpAyiFq81QIDVF7Ydabru+WHGwV5Ezfux4JAQfNki1SGC0x5Jc3xktiAwZ5nxxJWdo
         XP/lpD/w7Np7/9WDYwBbDv8mQ3Ljd/cVozX8M5EHIPOvbHafZ6yTpG0Ecoc8WPD6lCeO
         Ji/rBxQHDxblnTzHaNH/Y+WoOz3mT+ag9djaWP3LEUh/k7TG9sGfs8TWAIp/lvs5OMjT
         FiOg==
X-Forwarded-Encrypted: i=1; AFNElJ+dG3M9DJ/7JbAbA7WDLDi/Sq45VanN71icFFVwaqYtY0ATNN23iD6r7ccbRDl9z3mTdCZzRz86ggtFskfHXZp9@vger.kernel.org
X-Gm-Message-State: AOJu0YzFnUDzkNM7ZmW3yPF66hLAMNCg99T2JFKu3SXCWmFUKB7nE41P
	DHNffmPletAGxH8luF6/EmJRgcoypyt2vLxp01dCXLZPJNLUNnT/YHdLBkz3UuhUH0sHIZJ8RiQ
	+2EHPrFnTMtTcaf0h8SpFxpSc2aUmdv0O0hlIt5/P0DmJsVGjw3D170L8hDp/G3w6n7RYJolZ
X-Gm-Gg: Acq92OFPL8J+eVVeUwhhCBKEAqSsrMpJi2I0ISD+xlkWhdWluVwoKzdD4cl8+XC/Hdo
	0ffvbkx3RUeFrqF5VR5nNryWHasmcStpZTyR9PpYy22xYhnhXO2GBTbkrFuPfPVhn//DJ9zCXnR
	3BLCIBfu/Y0uQP2Sd/9fVcLGRotXwQt3RdZYe3lGbpKdbL9pbOQZs6SsiqgTEusK8Mnle84PypZ
	WDimY8lWB9i9pq0FIDkDKlaJ6zyGDuFCrQLSlIVvl8VfZupy32l3Zn6IiNjC0aAMXi2PhwDPViP
	hXr6MNe8DMUEePeMphXMyX5ZnsC3HqQgykA3zUPzwAs7yMwuWZXO8u38mpfNTZBD3YR/VeyZ8c9
	K0R00dfvJNQT9rscLauRnZ9Iy4I7GY38/+gthZC8BXJJFzQrzyQ6gZmsseiboOQ==
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr229849785ad.25.1781000620282;
        Tue, 09 Jun 2026 03:23:40 -0700 (PDT)
X-Received: by 2002:a17:903:1b44:b0:2c0:c262:b925 with SMTP id d9443c01a7336-2c1e7f9252fmr229849245ad.25.1781000619746;
        Tue, 09 Jun 2026 03:23:39 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:39 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:52:59 +0530
Subject: [PATCH v3 4/8] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-qmi-tmd-v3-4-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
In-Reply-To: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=9853;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=NKnSqFgZJGURki9OBgp3TnFWtvwAJBfehZR72tMLw0Q=;
 b=UBqmsG4KWK/vCEZDxippdCFvQNdBSt3VaGtSYqOpRU2I7aUy+I+F73YznlZQt3Tci4gx1TKyN
 6FbWp/qbb8bCrim0jBBCoK8R5xPGiB5xNGRLffVESU571KjWaZYRvSU
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: HIrDzOrjpm5p09pamqcEPDlDsdNHTIrC
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a27e9ad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bSVz6KLsRdqTeADLfOoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX6CBIITnrU0TZ
 Mr2BdAbwO13JagNn07Ixqgco4C8Jx3zgTUywkrwfTR5kMiz9kKrUYpTO0m5c03zDLOOC7HO8uct
 6vlSLdjF6GSDF7P/7ZlrqD3kPnAxFFNp7Rwpq7lqCLF3PKczTR2gNqmmBszKiJjyCHeWzWWq2V9
 S5imJaAfd+3bEL+zKzxR4bUAszAXJo8DJxQACpQCRhslY48IscZ69oYUqN7hT7rg5Ucxk+6SM0s
 qsDLOumNKQ0W18tB0JjsI5KU7YMSfWUU2JaqPBqaz1hT5F3CALk4KPKUT+Sf+iIrYENdsU/jlMC
 YHGS7+skqwLk25TPbrtUztcxWMljCX/wGTcjoWIc6A/zjWtgOYkr0hRGw5GH/OCRLeZOTNwVF4T
 VeLWATi7EucUiw0BTCK8hmR4foaDClWDH+OKzDezT/yhoc9wbjWCQN+jmNGmZaTLwpSm65+wZ/X
 LQAMl5gtzHvSBCFtiZw==
X-Proofpoint-ORIG-GUID: HIrDzOrjpm5p09pamqcEPDlDsdNHTIrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097

Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
when it reaches high temperatures in kodiak.

Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
for modem when it reaches to 95°C.

Remove inherited mdmss cooling-map nodes for Non Modem kodiak variant.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 127 ++++++++++++++++++++-
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +++
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +++
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  18 +++
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +++
 6 files changed, 208 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index fa540d8c2615..d345add2d8c8 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3427,6 +3427,9 @@ remoteproc_mpss: remoteproc@4080000 {
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+			tmd-names = "pa", "modem";
+
 			status = "disabled";
 
 			glink-edge {
@@ -4787,6 +4790,9 @@ remoteproc_cdsp: remoteproc@a300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			status = "disabled";
 
 			glink-edge {
@@ -4906,6 +4912,7 @@ compute-cb@14 {
 					};
 				};
 			};
+
 		};
 
 		usb_1: usb@a600000 {
@@ -7716,6 +7723,8 @@ map0 {
 		};
 
 		nspss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -7725,15 +7734,31 @@ nspss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss0_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss0_crit: nspss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss0_alert1>;
+					cooling-device = <&remoteproc_cdsp THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nspss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -7743,12 +7768,26 @@ nspss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss1_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss1_crit: nspss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss1_alert1>;
+					cooling-device = <&remoteproc_cdsp THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {
@@ -7787,7 +7826,9 @@ ddr_crit: ddr-crit {
 			};
 		};
 
-		mdmss0-thermal {
+		mdmss0_thermal: mdmss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -7797,15 +7838,35 @@ mdmss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss0_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss0_crit: mdmss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss 0 0 2>;
+				};
+
+				map1 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss 1 0 2>;
+				};
+			};
 		};
 
-		mdmss1-thermal {
+		mdmss1_thermal: mdmss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -7815,15 +7876,35 @@ mdmss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss1_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss1_crit: mdmss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss 0 0 2>;
+				};
+
+				map1 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss 1 0 2>;
+				};
+			};
 		};
 
-		mdmss2-thermal {
+		mdmss2_thermal: mdmss2-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -7833,15 +7914,35 @@ mdmss2_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss2_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss2_crit: mdmss2-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss 0 0 2>;
+				};
+
+				map1 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss 1 0 2>;
+				};
+			};
 		};
 
-		mdmss3-thermal {
+		mdmss3_thermal: mdmss3-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -7851,12 +7952,30 @@ mdmss3_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				mdmss3_alert1: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				mdmss3_crit: mdmss3-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss 0 0 2>;
+				};
+
+				map1 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss 1 0 2>;
+				};
+			};
 		};
 
 		camera0-thermal {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..400d128132fc 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -24,6 +24,23 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..1e190ed18ae5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -22,6 +22,23 @@
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &mpss_mem;
+
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
 /delete-node/ &rmtfs_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..8e8dd4efd8c0 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -23,6 +23,23 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index b721a8546800..e2c0a317ecb8 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -26,8 +26,26 @@ &ipa {
 	status = "okay";
 };
 
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 &remoteproc_mpss {
 	compatible = "qcom,sc7280-mss-pil";
+	/delete-property/ tmd-names;
+	/delete-property/ #cooling-cells;
 	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
 	reg-names = "qdsp6", "rmb";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
index 3ebc915f0dc2..6642076f62c4 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
@@ -7,6 +7,22 @@
 
 /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
 
+&mdmss0_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss1_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss2_thermal {
+	/delete-node/ cooling-maps;
+};
+
+&mdmss3_thermal {
+	/delete-node/ cooling-maps;
+};
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &rmtfs_mem;

-- 
2.34.1

