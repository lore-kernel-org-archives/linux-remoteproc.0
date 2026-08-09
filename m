Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C8175D53
	for <linux-remoteproc@vger.kernel.org>; Sun,  9 Aug 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278652; cv=none; b=sOWdsCd0vJ1TnwjZm0yGZQqbIDquKYH+nZAuG8h4gDfCPF8hgXGi8PkPI7hkgzI2Cqwn2PaNkzoD+ps3LFRA8Zbut+Y3DtuISsWLjjaDiGvWAf8U/VHbIJ6gI3L/NWjQq3+8qs+ZVmvPpMj4zHmPrehoePHIXVXJRDBMtfc1pSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278652; c=relaxed/simple;
	bh=69/Nw/l2Pjw5IjdOIVkv2Ao4l0Ioh5cQnspi7SqHb80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrkymqFua51DlRRhskjWSK22zo+n5cnZ/hqYmmg2qg9WWMUx2DRgJ/v3VteWhXy35d7UTxulHZDLBn41rk79iUMutZS9G44UXtPmKYjT0cDcwiv2ZD5pXEIUq3aiJ32VRYP8ojOjKJMZ2n8e6pCbis8/9jSJkjSox3+xLJYx8VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa8sKOBb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N782v2YR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa8sKOBb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N782v2YR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C3ErZ2678053
	for <linux-remoteproc@vger.kernel.org>; Sun, 9 Aug 2026 12:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	meyc3mG1hoZYt2I76X2E0RPX3lSg1aWynwrQK2v/AGc=; b=Aa8sKOBbPfSwv3r4
	CHfoKuAK7tNW2aIWbcnzWHZHqvqyPlEl9+uaDpNb0TgbmpNmrJK3jFSHGY50O2aV
	xgDd9iSWqdezssLczg9NMp2gVvVea6xNWVktjD+aAKxP2hcpYHE0TDqtCyPqmC5l
	uKKfzWKLv2HCcI3lTrqlrvz0tTzIwGAmv/qi1cOTQgyxCXXf3wp73iCZSUY9gJPJ
	ppTQETwsvRBSeZ1uPu302vYTrRX9Ph+cdQp5RK617D0gC2nXqRu7zhwOp6CbShbT
	sRnm7qdTj8fxXUFc6avO5UmM4GzrAvygQvH6mI+ZAgn/hrlOCc/goiMfnDQss2fn
	mqzslg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvatxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 12:30:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so10478665ad.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 09 Aug 2026 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278648; x=1786883448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meyc3mG1hoZYt2I76X2E0RPX3lSg1aWynwrQK2v/AGc=;
        b=N782v2YRO+ab5yQ8cb0LXysZgeDL32li3AmNsedETdqxyfwPVDwf1/4jKkdVJIweyp
         /t5HZF/Dz+Zja12flhtYYcEjIzQTCOzbLYGPog6t7Obij+iM+CvF0kKGMAcTa6B86HeD
         cMCimOFd+O18eDgWr1ibO9gEfxzgoAcJj8ZDTyNxfXLU1SJ/HTB1JXZUlJBxQtyqPepQ
         F3i25ew94M3B9Jkqp7OP7XjYBCH1xynCiTQCwmggxeR7gJwQL58F1cmCIzuRteK2ocmh
         DCo+rO3vzrGL/Cw61tLhumIE1rd9UdS+ymP3zIZ5Ct886t2lEUG6FOd6BW9Ukn2Gw6Ql
         SI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278648; x=1786883448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meyc3mG1hoZYt2I76X2E0RPX3lSg1aWynwrQK2v/AGc=;
        b=QxigIBxookYUJW8+AUPU4+bkBJbwkK9bKICayUwPtyTBu64OtUQ35BnskQi0PIL2Kf
         Ab9pXvUyjDYOOqzE+UR93ImTPoUTeQhhhXFc7LgN3iKdr7YhnE8Q1MhO7KkEIjlTQpge
         g/jE0+PmbMgg9FN4drWRtiMdzkrccTfe2kZfiHyYlDOxDx8qpNItHovlhklPAyyPlB02
         7SBnUkMjpUQ6Fqpzy9EUXQevEXjOm3lGv+h1oBAWNPOFxUjjNatxAm0kYIzJ4ajHFX4p
         EjiBW90h0tyEMTxuOocjMx8r10e2S3+I5qWYUqS09OeWd+rUTQc2V6E2mwxX2l0+Ejkr
         gEXA==
X-Forwarded-Encrypted: i=1; AHgh+RpVhfszyENnYodjrs20+6i8MtNVR43IY6Ufnqw4o7SgntK8fYTXxyOMbJU0a6e8FNtin4B7H42+0xvzczwitaaN@vger.kernel.org
X-Gm-Message-State: AOJu0YyrGUUlX+vfW58kPrCvJjY+GVdt8V7Xtpk2Zmz6nuCLNYPzc4VB
	j20T7E4EBtZjyb4aJtRO+WZRC/g2lYHvXW42xHK9kttdnXGQBI6qiNTE+YY30lVnqt8/Mu/Cav+
	kUvLZG34sWnNagwvca0wpOYwWZI19jYAiOH8vPfbkvH1NhTjr3lNgR4NI7UsOLfmKAJGTrPMA
X-Gm-Gg: AR+sD12gqlFeRyvjGLrk5q7LmkTUciBWq9y1Nc1lzNIoRD0Se3bCCJdgsQ3TEClDLVa
	IImOH9brwywGDL+cIl5VnlQTJUNi6JJXziRFLYtFJbGxcBpuwpYa1rYgDBPHcfv1dk+5XDv8OqM
	RIa3oWfegGP6tC3gcauBKg3WcVsmxAOSFjyQ+rCh5t+jFtS/ZnhgiC1G2GmKlAqA3bQd9SRPr8S
	IO4Kfhgy3aD7up2rC4g+ym+rkQdacqQjzPqLvblGSMb0A94lUqVHBXsN7C+fcQqVTPcDKfvh0Kt
	j2qCV43N6ZRoTj/PBvmvadCUdQ6Bgi5JZ/s0/MWuGFrTByCIQSQwuX3/M16tPsuAmsiHz7wjltr
	SIzeXMjPE/snfp5saKxTvp0wlY2aD/g==
X-Received: by 2002:a17:903:3d05:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d2a888b5damr164510045ad.8.1786278648092;
        Sun, 09 Aug 2026 05:30:48 -0700 (PDT)
X-Received: by 2002:a17:903:3d05:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d2a888b5damr164509355ad.8.1786278647574;
        Sun, 09 Aug 2026 05:30:47 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb88413sm51842997eec.18.2026.08.09.05.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 05:30:46 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 17:59:01 +0530
Subject: [PATCH v8 5/9] arm64: dts: qcom: kodiak: Enable CDSP & Modem
 cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260809-b4-qmi-tmd-v8-5-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786278595; l=12091;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=69/Nw/l2Pjw5IjdOIVkv2Ao4l0Ioh5cQnspi7SqHb80=;
 b=MPkAj+GoaRPiG5HX3K4sttXuIv6kA4leWD8T6fzWnaRRXIEhWDzZtKcAwqvU8dhGeONjp50Yg
 iMY35O9hixpBVU0QBzvZuMG5lQz1Wqjb2dpv/jnziFlg6VBMwsrjA0P
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a7872f9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2Vcc7Fol4T68P4ep610A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: guOBR22DMcPe0gnwIMht5B656LHS554N
X-Proofpoint-GUID: guOBR22DMcPe0gnwIMht5B656LHS554N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX8Vu0171GvsHx
 yBt5yJjwa9fiCfJbGdbYDt3x4BBj1PL7OYRyPKuVveMKXnPQUOli+uZNPkD3WGIqN2i0AGms4SO
 U1XPEkvKmgjTes4k99h7TCgVmZcoJi7ejp0pLwAkrNBvbZ/8XXgaY40+D8+8WprsKOe05pNOMYB
 UCwRBpBwfirH6SRnvaRP77UhQklqe2Fd9eaa7COouZX4bjWtMKXWPjoweE9Bg/gyV4CgMiH1XMN
 OS0ff8Wtt5yJuTCOq9biqFmDp78yU/TuVNLBrIzO2aat0SToaZ/BIMA4HoxKcVoHew6QlUWpRJk
 sE6UnQ4Wnux6WOOxsKJQRqJ+OH/mcchLzta+laekozdJY7iPJMsLbkNHNO6OlWEQAt2EweYIOwT
 Zc2bk1PaB5kff/ITZgI8Ryel8i72vgNKEvnGmBVAFVmsv/RsmqaBTuAKWIwpngnkwtEtmuLrBEh
 O8L/Ao3MWIC1drWIpSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMCBTYWx0ZWRfX0Wbjz0phSbmx
 YMbiUyGhWG9SXSr5Uy9mA2IY3C1Uyxasi09/VSc8ZL1AM+xBSm+h6nbNwvnb0eSW+skIJ9vxjOu
 kJjiNnUXgzT1xkCmf6aHYR82JMWeAqI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090110

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

Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
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

