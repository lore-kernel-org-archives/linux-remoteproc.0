Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABE737EFFC
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162223; cv=none; b=XMTN+KAzE4/Z6yTNjb3vv1BbSOCbx+kuZ6RHuI2b367KuFhv4C8MVYSmvq6LMzhEw2RPiQ7G4gUMcuQ3qSwEaSJh/GD+Y9COclBeIoV0kY9IQ0GmjTEHTzqERuHl2gAXyIVC2KcBT8htpNoLx9yCMg+QfDw20ttTOc9yuqsxyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162223; c=relaxed/simple;
	bh=lScD1mYVTHPDIA5+nO/0rtnhWpfCKTgRxBnjmtXshjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gvthPo5DxZ/DdgXtGULsZlAd59If8gIVHQr1/AkwZNxnZ0hhP60SWiicc3jAT+MvovW83XmZ+quxTAbRi3q8Z5oekfmBUA3uh8lnhPN0x4BIoTIf29L1UsZQ1XVKlslDUemPLHAq+bw7VClYZy4INZGpNCL0exUmd1HYf43gObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLaAHOsR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q247gR80; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLaAHOsR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q247gR80"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm9cB3823625
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEG/761SXt1/4EpOTlkQYSWNHItndDCKkZ3IOjii/k8=; b=nLaAHOsRYzgtCOEI
	cfDzrZsyw+kzq31+MpzQUux0YqJ00ZzRMoUSuJVkgvqJA9QmCa2REgSnIvi4zcGx
	q86vc6ldK/z1Vbz5MAHI2a9tE0/tgiDQHmzNWS9BcH1R9zV5Sjg+rEben4PG9sAG
	52fcKNTkMgztsz2nsFBCcOEC2R/XcKQUdjZMYLsRjzAQdIM8xXY5K/HKa3pjpY7L
	kl85BKL/GyUDosQdu6IJDS+CTNIXmOzIhlmocoMD+oUWV+PmR+3LZHIUJbVEhmZm
	ncn0D3YtlDOJXfVrbgE6dNJKFZRr/jZhrANvR/DtAtBucLl6t951zbhCZBP1qdEf
	+6z8vA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbs4gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:23:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so28077835ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162221; x=1785767021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEG/761SXt1/4EpOTlkQYSWNHItndDCKkZ3IOjii/k8=;
        b=Q247gR80BbpLVmMtcSqpPwj37RMT2Q6T4D9joier/ANBbzBFfE5JQrzjW6wGxnNUEN
         /HCs478i069ui1G4tlQs5KW+l2mkuRkgxSMeQarhPPoYzWGh1gG+ugxUZGP6NCT1tlIc
         QAkbVUdsCd7ynBhFFoZIHvQfKzOxbB4lof0hKXwlVRwXJOyaJyTXQvyy7sCwxpXMq6eb
         F+fdTSQ4jUY5GzvG4bQ9SZLsmxOrUFXGYFFYtiA6Pyssm5UmTKaw4SMcSuREP6HI9CpA
         n6vPp+BVG9WVdPFSa2Wouopol/HXKD2oMIM7inrjW3vIJwv8hrlhFbTfxQgqiW73vcuq
         Z6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162221; x=1785767021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEG/761SXt1/4EpOTlkQYSWNHItndDCKkZ3IOjii/k8=;
        b=NSe5cEytokevnzPRpzHQXRItfEo6/ZsX+z01vt0whw27fPcN1cIpF2n5hQSszyrd5M
         UDyQYI/GlqIilFGfg/Lvx8k2ble/TVopmO3JlqljNxghdpc1hw2PQ6+5NCmYbAGmW8Re
         YciePKIqroGzySZGh2oTene5ZAim3odYF8/OOBYiop0FVVoM5E/zjlJ3pWVoulPu9fdA
         uiJr0FqaBx+2syxEgE1kDfvbbAcJ+ZrlrlW2OfE2hNJWLVLF/tVzY2nHpVWcD2+XMVFe
         Z//uOJPrwuJo5yfDhVQIBkJTGSC7J12X0ybXYN5T97Zs/S/cG0epem+drTxXfKvJxRW5
         457A==
X-Forwarded-Encrypted: i=1; AHgh+Rpu2v+xzyVK2dE1lq4tStguc7LAXW8i5db3ZpTbADpt1I2reY/jYnuUDhPSbF9gXhVbqhx4NwpIuGn3KnEm4j7H@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLFpSFaLq0kA5b0ELb2iyhNCxB7Ecfj9ozr4DsDsM5ae/1hyx
	kmpjG1vxFg3H88lZek/hKhRBD5NyDSIblYnMBd8NRToIok6VlolHybnCg4RZL4Rm7UQgvLmCGlV
	KRxHoeLKkPGIidDuDxbJR5ggy1KO4IXhJxkd9UBpiSr+G0e+pXgACi9CdKGS7YQdN4gqei8nb
X-Gm-Gg: AR+sD11rmoFdTuKlUJMBEjCCiDe2szXoTT5yhQULZfbjI36s2HODCAJ448Fiz3hMuXi
	c79ChaylREK1SblvrLq+A3+Qb6Ht4GMIHanVCl1GYFPBfNV+BwvWtT6Ml9y7eGNyrBBYMHBK9u1
	zN6cMIBscp7U4JEVf06Cbmv8EtVqS82Sl1+P4zU5ThSWTdZxSDfTXv3eFD9s1wu69OcoMDlUX8/
	HJXCC8nSHgTxhPmRqYQmb4PuLOF9lLzMCe3KCrMsCb8Fb31QKRTSs7PF1s0pux3ZznGPb3T+7Ef
	qSlfa4zg0Umdu45Hi8N/py6e6SrXfdAJLrNLE/TwPS+qqkEFz4srUmOANyTlsAaV8xTnSUE40tE
	7GZb3sBPvrnLg2bxx9wih57gTMy/fTA==
X-Received: by 2002:a17:902:d48b:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cfde7a79eamr85549865ad.15.1785162220547;
        Mon, 27 Jul 2026 07:23:40 -0700 (PDT)
X-Received: by 2002:a17:902:d48b:b0:2ca:b8fd:f31 with SMTP id d9443c01a7336-2cfde7a79eamr85549365ad.15.1785162219915;
        Mon, 27 Jul 2026 07:23:39 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:23:39 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:52:22 +0530
Subject: [PATCH v6 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-b4-qmi-tmd-v6-5-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
In-Reply-To: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=12028;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=lScD1mYVTHPDIA5+nO/0rtnhWpfCKTgRxBnjmtXshjo=;
 b=kBVzWuA07eLMe4pjJqtKK3wyVzcxkko4QJUgXYJ4HBSTDRWAeSuplhqMl13RfmgHO+CS4GuZA
 pgP9uMNIpnxCAVKrteJjfrtRIzh3uWB0cEnSy2No+kQhncnvUu/SN2J
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: rtFMHI58dCWa1IOXE5fXrRZNnEJc5Ooj
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a6769ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2Vcc7Fol4T68P4ep610A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX8UrFe2pCc7fm
 MG2xMVb1IISgRBNR0H8iED7Kute072hINoF+Z8XLdizWA2KKo7SJXWeZjfHIJhMOLzprVYpYH/D
 F/+dXOjCotr32CVtsVn4IE0EDaDT/Mw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfXxkwN81PPbeaM
 3F6zyCSAioIL8ExvfeH9d6TLBCq3m95lrgAlXZnWJhXVn4qsQYiOmLjFcw2/pUKr/0oxnGSSrMA
 Nv2YV+uCar5adna028ToeKpGw2PwTvi/kTfT8kYTSNg3rzpgxoKt59Eh0tfwN/BGI2+g/ADrNJI
 poDZywyPs0LHY8KIW4mKSTqrKP0gWjc+5oJdoDiP/lsllnqn3zQ4Ktm8uCC/jThNj6ivy5MaJMf
 d2pDqeSwHsunbvUI0Md9g5cbH2s97gbvnP71A+kRzYrPZH7qAIUxUgaWfiud0TWP9h/pakNzUQy
 T//Qy3/mxilyxHfGcZUwQ4P6hEQyfbzFSk4P0lbE3UBF/PGh17ZNGVXnL6m1LtqSiS9F87eIQGE
 qMi+1try5KMmmZ7qNbw3n8Ka8A2+LOw3nB6kXWeqomv1tplDP97+M4mO8OOUP+KIfvYtCyWd1sj
 ApiTTISNSQe8Pf1NldQ==
X-Proofpoint-GUID: rtFMHI58dCWa1IOXE5fXrRZNnEJc5Ooj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270136

Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
when it reaches high temperatures in kodiak.

Set up CDSP cooling by throttling the cdsp when it reaches 100°C and
for modem when it reaches to 95°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Since the remoteproc_mpss node doesn't exist on non modem boards, the
cooling-maps that reference it cause DT compilation errors. To fix that
remove inherited mdmss cooling-map nodes.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 125 +++++++++++++++++++++
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |   8 ++
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |   8 ++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |   8 ++
 .../boot/dts/qcom/qcs6490-vicharak-axon-mini.dts   |   8 ++
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  10 ++
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |   9 ++
 7 files changed, 176 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 7e73348fe0d0..53dcc5ebacd3 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -30,6 +30,7 @@
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3431,6 +3432,8 @@ remoteproc_mpss: remoteproc@4080000 {
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -4803,6 +4806,8 @@ remoteproc_cdsp: remoteproc@a300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -7732,6 +7737,8 @@ map0 {
 		};
 
 		nspss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
@@ -7741,15 +7748,31 @@ nspss0_alert0: trip-point0 {
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nspss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
@@ -7759,12 +7782,26 @@ nspss1_alert0: trip-point0 {
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
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {
@@ -7804,6 +7841,8 @@ ddr_crit: ddr-crit {
 		};
 
 		mdmss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 7>;
 
 			trips {
@@ -7813,15 +7852,37 @@ mdmss0_alert0: trip-point0 {
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
+				mdmss0_pa_cooling_map: map0 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				mdmss0_modem_cooling_map: map1 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdmss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 8>;
 
 			trips {
@@ -7831,15 +7892,37 @@ mdmss1_alert0: trip-point0 {
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
+				mdmss1_pa_cooling_map: map0 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				mdmss1_modem_cooling_map: map1 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdmss2-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 9>;
 
 			trips {
@@ -7849,15 +7932,37 @@ mdmss2_alert0: trip-point0 {
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
+				mdmss2_pa_cooling_map: map0 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				mdmss2_modem_cooling_map: map1 {
+					trip = <&mdmss2_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdmss3-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens1 10>;
 
 			trips {
@@ -7867,12 +7972,32 @@ mdmss3_alert0: trip-point0 {
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
+				mdmss3_pa_cooling_map: map0 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				mdmss3_modem_cooling_map: map1 {
+					trip = <&mdmss3_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		camera0-thermal {
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index 82ebd88f9aba..e3ddf47ce421 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -24,6 +24,14 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+/delete-node/ &mdmss0_pa_cooling_map;
+/delete-node/ &mdmss0_modem_cooling_map;
+/delete-node/ &mdmss1_pa_cooling_map;
+/delete-node/ &mdmss1_modem_cooling_map;
+/delete-node/ &mdmss2_pa_cooling_map;
+/delete-node/ &mdmss2_modem_cooling_map;
+/delete-node/ &mdmss3_pa_cooling_map;
+/delete-node/ &mdmss3_modem_cooling_map;
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index c8eed8ba93f5..8ce0cf23deee 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -22,6 +22,14 @@
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &mpss_mem;
+/delete-node/ &mdmss0_pa_cooling_map;
+/delete-node/ &mdmss0_modem_cooling_map;
+/delete-node/ &mdmss1_pa_cooling_map;
+/delete-node/ &mdmss1_modem_cooling_map;
+/delete-node/ &mdmss2_pa_cooling_map;
+/delete-node/ &mdmss2_modem_cooling_map;
+/delete-node/ &mdmss3_pa_cooling_map;
+/delete-node/ &mdmss3_modem_cooling_map;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
 /delete-node/ &rmtfs_mem;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index d8a9a7e47bdc..abee1af19c23 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -23,6 +23,14 @@
 /delete-node/ &adsp_mem;
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
+/delete-node/ &mdmss0_pa_cooling_map;
+/delete-node/ &mdmss0_modem_cooling_map;
+/delete-node/ &mdmss1_pa_cooling_map;
+/delete-node/ &mdmss1_modem_cooling_map;
+/delete-node/ &mdmss2_pa_cooling_map;
+/delete-node/ &mdmss2_modem_cooling_map;
+/delete-node/ &mdmss3_pa_cooling_map;
+/delete-node/ &mdmss3_modem_cooling_map;
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 4f2e0109f49b..d3f558596ca2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -25,6 +25,14 @@
 /delete-node/ &cdsp_mem;
 /delete-node/ &ipa_fw_mem;
 /delete-node/ &mpss_mem;
+/delete-node/ &mdmss0_pa_cooling_map;
+/delete-node/ &mdmss0_modem_cooling_map;
+/delete-node/ &mdmss1_pa_cooling_map;
+/delete-node/ &mdmss1_modem_cooling_map;
+/delete-node/ &mdmss2_pa_cooling_map;
+/delete-node/ &mdmss2_modem_cooling_map;
+/delete-node/ &mdmss3_pa_cooling_map;
+/delete-node/ &mdmss3_modem_cooling_map;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &remoteproc_wpss;
 /delete-node/ &rmtfs_mem;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index ac89724ee099..891941906a46 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -28,8 +28,18 @@ &ipa {
 	status = "okay";
 };
 
+/delete-node/ &mdmss0_pa_cooling_map;
+/delete-node/ &mdmss0_modem_cooling_map;
+/delete-node/ &mdmss1_pa_cooling_map;
+/delete-node/ &mdmss1_modem_cooling_map;
+/delete-node/ &mdmss2_pa_cooling_map;
+/delete-node/ &mdmss2_modem_cooling_map;
+/delete-node/ &mdmss3_pa_cooling_map;
+/delete-node/ &mdmss3_modem_cooling_map;
+
 &remoteproc_mpss {
 	compatible = "qcom,sc7280-mss-pil";
+	/delete-property/ #cooling-cells;
 	reg = <0 0x04080000 0 0x10000>, <0 0x04180000 0 0x48>;
 	reg-names = "qdsp6", "rmb";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
index 3ebc915f0dc2..296c72672ec5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
@@ -7,6 +7,15 @@
 
 /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
 
+/delete-node/ &mdmss0_pa_cooling_map;
+/delete-node/ &mdmss0_modem_cooling_map;
+/delete-node/ &mdmss1_pa_cooling_map;
+/delete-node/ &mdmss1_modem_cooling_map;
+/delete-node/ &mdmss2_pa_cooling_map;
+/delete-node/ &mdmss2_modem_cooling_map;
+/delete-node/ &mdmss3_pa_cooling_map;
+/delete-node/ &mdmss3_modem_cooling_map;
+
 /delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &rmtfs_mem;

-- 
2.34.1

