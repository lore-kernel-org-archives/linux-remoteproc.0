Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C106B38888E
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162255; cv=none; b=isn00TDB/tv4fhqD9G2UE3BQ21Gh3+0HH3bv7O5TvjPjAlT8xNDD1TgC6k7xD+M6Px240E3BU38RhHFTFd7wmsGczksXiq3dcw7LV/tccR3TdPlHlubaTFgtHb9sqSR9jPQBnVJpKaXSzra1LjoSN4ermgdZVTdq/oTmU+qblDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162255; c=relaxed/simple;
	bh=jIQfZLMSJBzSK/iT0gE1OL6tn5ICoQylSUCAFTgngWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bya4OvtQyzyY6cRbUtwb1vrnLxL9DxOQrM/TSRLKaw7YEndqqZdIpDiHmogfxwWOeg+5SOOubN5XYmrTqoDMcJB7djfK2d/amrBT9k5JW77NphAFlUDYXlXTHEOddwwegyzVhHmcrE+mc2kIuvZ7RScJV3ZHjlVZj2G7+0N6Kw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUgQR1M2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ILu0FTve; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUgQR1M2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ILu0FTve"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDld5b3905535
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SxnXnJP+PJkcwf4BBFHK6cKCPrcBW1oXNVhH0XSA4z8=; b=QUgQR1M2q1mVbrMg
	BySwJPkUeOUQJVRXBrS0JBARpZjrTcMjds3Bq37bi7R06rLQcfYvAQt8iZXzqlOr
	OBUGADZfQOG4HDk0QhSO/MD+PyTkbXUNSsK+if/XJ0XS+gT81tr2JyZkiKLSuX7g
	E3ZtJ5zKF8ReBHMI6ysjfPF/Wkmj9yz1DaQDsm6HarWUo1T4wBaO/BLgd/Nr0+Sp
	sPx8+cn3/tIIXXusTxmWwRRHfyi3V1Vuh0kEGr1jMAFnlfZVeiLxwKxVknMtRWSi
	mJmKgRmin+tts1ZovrBh3A4SMAh+Rgcnc/G/4hX1cs5+ioA1dHcafWXVe3xhpdfM
	OIVyyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uks2pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 14:24:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so13550565ad.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jul 2026 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785162249; x=1785767049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SxnXnJP+PJkcwf4BBFHK6cKCPrcBW1oXNVhH0XSA4z8=;
        b=ILu0FTvePaP/a81i7bfOK3MpSL2YskWWKbnG4BLxpvxdFSYPAfNAkaOPVbBFUjA4Kn
         08iXnaknNpTuXzeyN5gHl1QH0gIN+/DOAIMfNPAsQVhlUJky94/iym/NoO1ZHhtt5i//
         BaFHF/E4IAs/4kkbW43as2BUxyQp1Y8EpclDIM3Yzyamxq0iIrvyp5ogMC0rbQ9uZ8EC
         QRlTJjLXFziMxhKumJg7c74pZL2CNlTIuc9Vd3kIlkZ6c08apvh5A4ZPEGnYkxobcdO4
         Oi4e2qSkC3Ym1crLnKk8X/m1Q/xMzP7LucwiFZwNEtTgAAoCLqmeQ1TkMzm+LWq/0/GG
         6BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162249; x=1785767049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxnXnJP+PJkcwf4BBFHK6cKCPrcBW1oXNVhH0XSA4z8=;
        b=TmNWj3CPGPWBcqkNbIctjk6oX7Bv8bMz9ActmAgv4YtuKxdmR9KealNa47UCt+PPoF
         PnFGKjAzXzs/8H17FrZ+5zqEyUzcUjKT8SohgBM9UNNDuX2/nKTdGpJZqbCC0+UfCcgT
         offy8oQ93W+5IbRL2FkiMnZsdfynE/fHMhsQGSUxifEUUVVslyI4GeLUkw7p6BPKn3p7
         DQ91P8waqI87LwH8d/3Ps0MNgTWV/E1Sz6/fTT1UG7vIbuQTt632gYxCG89Ll4o159x8
         0P0ZJrzzWc18CxjThuYo48yQDlUo5gGcNkJ0nTxpQHdYlj3dpeayP+DJaNsg5jdWlcVg
         XaNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRtluVDeDdHizd0LS+L6P8rOJ5C98zrOFpH6iCZ1tJtViiIPWqAUPLV8w7Pe0swdizfcxUVkNv+mFZ0jp9jC6B@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5LEmRcAC+EQ3ZQ9Mej2OVwru8FzUDQj7gjpbXvL3CR4sBi1b
	oLZGYWVVuN6RQYWK79BQp1MoXVvTSJhyTTes/ToK1CjJkHQmqe5C1OAwe+UmYlAEmw5Q5zxsxKt
	sV4RKOLe9C+0MCCxd5sAOT8VS2v4/cZeHdNJeKaSDApcQmGzELtM0tompbsXklzIVETKzSgSq
X-Gm-Gg: AR+sD10yWcE4+2mgMfs0NkSrqKcNhFptU6vGHw0ceLzMCwtv1chka9D+PWlGJe9tX+K
	T3ue8rtB+EMVq5leEN0zjlJIiqvDNSS5VKjPFnhWzjg6ip1iw30jWIX9iyEW+fx96jGe9XU93cP
	vk3tmZgOQEsCGWp9bSfXRM5N8o/+Tr4ezhMGWxUrd4/xr//MgoqTnvWd+R2FtdulavicDDqAp3T
	OKR6FXGa8huz161yhJ9fWQoznXmXzPxzeZzTL1FXQ13F9G1wsEqBOq3xKBzmwebRQy8977dIQFA
	bBLrG1ObkKmsDbSIBlXsix/FgSK1quJmuB3447C3zRUN+Ga5Azu9qqtlCriln1cGqJldEzO/7Ie
	oNwnE1m3MFxD3z/GqbdLpz+ElnbSHWg==
X-Received: by 2002:a17:903:fa3:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cfde795b79mr79412975ad.9.1785162249249;
        Mon, 27 Jul 2026 07:24:09 -0700 (PDT)
X-Received: by 2002:a17:903:fa3:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cfde795b79mr79412435ad.9.1785162248644;
        Mon, 27 Jul 2026 07:24:08 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81d7f5sm36608755ad.83.2026.07.27.07.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:24:08 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:52:26 +0530
Subject: [PATCH v6 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-b4-qmi-tmd-v6-9-973cd3a226af@oss.qualcomm.com>
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
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785162177; l=4870;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=nMWjqE9gYPP4NRs2/TABP+g2MZuRidiDIRPtjcqunkI=;
 b=DgrzZ8hAzRKF14a5SEFAe1US5PjxLhbcECKfFtFavD3UVHyYFqK4sGlveVDNk/BxMmHD9i0lB
 +ZsWZA/kzYjBTnwf5znnfKgAFK5ePO44FbeNbwUKdhbyvQ/IKi447Dm
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-GUID: loqtvrrBrN_eh8qCvJTw--7b2PTwwArq
X-Proofpoint-ORIG-GUID: loqtvrrBrN_eh8qCvJTw--7b2PTwwArq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX50mOFsXiV1Q3
 NE4c9D6aNoRRhTwT59RaXn4FuDhlOWa+hDb6/QFretiBcFkPR1obpw2iuEKgal+T0sSEyOIyOJ7
 HJn4oFpEcZJEuSU/KatZ1PzryGQkv6M=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a676a0a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ND7YSEQ52W-Uskv0B9cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNiBTYWx0ZWRfX+1A1nmmu2TuY
 9bJlp58eZGkdcnkgUdZnAWy6T3PWBfRrRIcrrAXQaFt2QDHOu62qFMM3DLB52UY5Y4JbpCSckih
 eMkuXyuWDjCWThveAsM17QWOrPiF2XuFmV5k0ziLH8t/gu2Ctv1uN3hSFyM0jjKPbkWNRexVI4M
 2xD9cChLidEeLl0vkm6R6bYKp+cWGGtgVJxxJZhnEs7kfsE++mW+adBpFXRJyKPLSn7dZ/jKiFA
 /8z+DbH94Be1kQ8w1nlk3RyPOIo6iKdAY8FUk2wFzyRLsIQTNaMJ9mGsaEU28dfgtm4jpBZosVf
 txqW3x5j+1H8uy/eBeFbQl5as+fRB4P89VDGj4riKTiNmnLO1TFf4Qj441cUmSTpf1nqXqZVOVu
 F+ijlG6lq9mv+NB1xY3K4153tcQ6RhpFUz5EwcSVsODDNEhRse00clapxsv9iL5nzUrQCsyrDrr
 7XPasJ24hykB9muxaEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270136

From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in hamoa.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 95°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..a146be1cb5fb 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1684,4 +1684,36 @@ trip-point0 {
 			};
 		};
 	};
+
+	nsp0-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	nsp1-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	nsp2-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	nsp3-thermal {
+		trips {
+			trip-point1 {
+				temperature = <105000>;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 09527dcf9576..ba453c8ca80d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -23,6 +23,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -8971,6 +8972,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 
 			status = "disabled";
 
+			#cooling-cells = <3>;
+
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
@@ -9558,6 +9561,7 @@ aoss0-critical {
 		};
 
 		thermal_nsp0: nsp0-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 1>;
 
 			trips {
@@ -9567,15 +9571,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp0_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp0-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp1: nsp1-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 2>;
 
 			trips {
@@ -9585,15 +9604,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp1_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp1-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp2: nsp2-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 3>;
 
 			trips {
@@ -9603,15 +9637,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp2_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp2_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp3: nsp3-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 4>;
 
 			trips {
@@ -9621,12 +9670,26 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp3_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp3-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp3_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {

-- 
2.34.1

