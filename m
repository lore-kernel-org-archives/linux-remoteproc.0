Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105451;
	b=vqJPq3RMTJ99LwUpGguZvkzNVfByH5mIX7O61ivdkzTxzDu/cXcutfZh+1m3B56ktCwt
	 3YQwKnFLfS0GIXCTQLghP8cHBPaJCOhIStMEEkv0d0wT+0C0wrSM0DufN63LTmtOMpLrh
	 9HkePD9HX8Jx9aIokWiXOQNShFyoVyHK91Gy5FU9metMpUAKRkPTLFHhR3rK5XWTHVXPt
	 qCOL+ajyg4I+m+6tsBRVxSuzRSL5PICQxKshL2EAZb1bodyRu35WnZpERt94rMttsECti
	 C09eQ1w6OLyN/gCbU4KSXdVh+U6Ep7/rKDZRWXpj55QUCgdtIdp3TI3b1BA2ipnJarw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105451;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Gto0MvWQ08dh1O/9j/pvx5oyYTr8pVXPs0LAo54kLk0=;
	b=u2TsquBLLTduwFj6+WGJur6ftrV7p/1BNWUhPA4E1exid5Ooae+tFksO8kHn9JemPA/5
	 BmwiTu4onaqH/DKcbWZrIA1qCS8kYLY1vyH3PsyZpdat9iD1IIaBS8fttaVFHqtjmpBSK
	 VH6AHqwpHFVAb/5NJ6eXuANAREfUBVQcqiaSMrTKcMXYcmCVtIuBsiX1eT8cJOsVW6/xS
	 l3wmJeCb9MANGJzz6COtD2WnCWmT+MMhuOl5KX5S1q2bbGxe5gVvQ/SM/I6LYGgSP1wts
	 SAJPUt3jf/Zf+zHHPgzGLOhP5nvFJDhPtZjCQMc8mjGc+sva5cYOfQ5rDtfoiywM7wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="L/x3eArN";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41150606A336;
	Thu, 19 Nov 2026 16:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41150606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L/x3eArN
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF6ACW3047971;
	Thu, 19 Nov 2026 16:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Gto0MvWQ08dh1O/9j/pvx5
	oyYTr8pVXPs0LAo54kLk0=; b=L/x3eArNg5fDu4vLHS+yYgbC8ScRpl5fUwO86z
	8/U+8Oy5lbX/YoJ+Z8OQZWv1kQO7ypsrUGtBRa3wfM7WCO99Ou4McvIy9zA1UHQB
	9tctojKCptLKlMh2343Q0/JXvEG4NOmJ/fxxqcfQFtnG+vfeCukQaW+w9In/FxxO
	Kpeyr37Id5gPk8Fc2O+YS/aMySaZK7ssHmoxcdxMMwZ6pkRKDTpJZ0fyAHgtcc8d
	+tmOOJd+zYkyoMz1Dy5hw2ot8LUMKEicbLeTg73JO0KnrGgDbKutBpme4Mr0ANfX
	nL4x0gYJGEiFIz/JjaCy9ulve6h9pNRmAxtI4CVP0b1i9vcg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcwagc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:24:07 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGO5hA994296;
	Thu, 19 Nov 2026 16:24:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AJGO5qN994287
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 16:24:05 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 44E69658;
	Thu, 19 Nov 2026 21:54:04 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 21:53:45 +0530
Subject: [PATCH v2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261119-b4-shikra_qmi_tmd-v2-1-87089ab2acbe@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJAi/2oC/x3MSQqAMAxA0atI1hZscECvIlJqGzWIUyMiiHe3u
 HyL/x8QCkwCTfJAoIuFtzUC0wTcZNeRFPtowAxLrXWt+lzJxHOw5ljYnItXri4rjbbA3nqI3R5
 o4Pt/tt37fmJvP7FjAAAA
X-Change-ID: 20261119-b4-shikra_qmi_tmd-c96712a52bad
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795105444; l=4359;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=rDZsl0/DwsZv8njihpCaUMCjgaSLyvAYSFlXtIyjE00=;
 b=4bWVr/k+v6YDX3W/jeNfzg66EsQlB9BLFV3ycSIFy3uqjpTa8bd2bt148QgWDl8GmohalGYeK
 dehf8BOBuvQA8KZ41jEahjVTZd67E1kiBP8xZEbbrQNGBN4SpKHDWaj
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6aff22a8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=D6w6C_8UWOwsJmlg9DMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: TVbxLBeUw7gVh8C5nCk0ooO3uAjEJP7c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NSBTYWx0ZWRfX51xOqoMAV5bu
 9wTcX7sxSAMZQRZJD99FfTzT/p/HGmRfP4upedvao7XqaH0l0hzcnh0cpcHrCHPaiEqDScxmqAr
 3T95Fjh8V1GGo1mHhrWAXgT3rptpjbtT0PXyZ6bDHbFiNrJgdXfc4nZ4Nm/2xK6T3Se6BLr1LDp
 4kHETQnOJrUd+klgmLaHbQsMggZOkDejztmT5nDBbwNg04pQhibku6c6gc3W88Fg2CM3HYyE53S
 C6BA2EYfP9FuExUYfK0WEyc8BHfwsLgqPbmk6nvJc/PXjEG597b+F3fZffu/ttn+va5EKtwIuD0
 t+zsHB2WoAJOLWOIIVode5O8y0bIps+GMzr9v1NMBE0KJcfCHbwaV2rKWAo+ofhkulD1VNnKAZ5
 dxZoi2a+nvXFW23ucoyA71W83VUiEjOsSYuhXX2ghhhfV1aljfzNzSG4iS1U836k3TKHfSSabsD
 Nq6mawnr0acbqxIIknQ==
X-Proofpoint-GUID: TVbxLBeUw7gVh8C5nCk0ooO3uAjEJP7c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NSBTYWx0ZWRfXy4wEQ0wwuW8n
 qWKQa59i9KskYpbIZqnQQICtMX5WL0CsNpbuuLUhOpeDOQyMuzg2eyQ5h+6LvxRQ0eHbBa31fps
 zzP8Yce5y/wY3vaTWm3Y9kd8Ihqyw1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190065

Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
when it reaches high temperatures in shikra.

Set up CDSP/Modem cooling by throttling the CDSP and modem when they
reach 115°C using the QMI TMD cooling device framework.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com
---
Changes in v2:
- Fix indentation of cooling-device arguments in cooling-maps node
- Link to v1: https://lore.kernel.org/r/20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 71 ++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..6e5b1aa37669 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/thermal/qcom,pas.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -2007,6 +2008,8 @@ remoteproc_mpss: remoteproc@6080000 {
 			qcom,smem-states = <&modem_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -2047,6 +2050,8 @@ remoteproc_cdsp: remoteproc@b300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -3868,6 +3873,8 @@ map0 {
 		};
 
 		nsp-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
@@ -3877,15 +3884,31 @@ trip-point0 {
 					type = "hot";
 				};
 
-				nsp-critical {
+				nsp_alert1: nsp-alert1 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				nsp-critical {
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp_alert1>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdmss0-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
@@ -3895,15 +3918,37 @@ trip-point0 {
 					type = "hot";
 				};
 
-				mdmss0-critical {
+				mdmss0_alert1: mdmss0-alert1 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mdmss0-critical {
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdmss1-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
@@ -3913,12 +3958,32 @@ trip-point0 {
 					type = "hot";
 				};
 
-				mdmss1-critical {
+				mdmss1_alert1: mdmss1-alert1 {
 					temperature = <115000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
+				mdmss1-critical {
+					temperature = <118000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_PA
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							  THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		camera-thermal {

---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20261119-b4-shikra_qmi_tmd-c96712a52bad

Best regards,
-- 
Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

