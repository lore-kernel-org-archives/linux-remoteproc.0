Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CFE306B3D;
	Fri, 11 Sep 2026 05:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103002; cv=none; b=iOmjyQmJ1R1vQ7XfStcQqvRujLuBn08PTsR8/XQT3NR3GOws7r9PDtBe02vIaY3PLF4GNuWfgp0ei9uKhsVJgKm+aJk6WI5etyOrJbjqfGPb7AOeW8lIKt0rIe6vMqE8UNIr7RiwuTRjW72sQQiYBVEwJVDRHqPNT7ovkDQ//I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103002; c=relaxed/simple;
	bh=UQjDi7BPyi2x50qvkObQA2f3BzuWrh25X6hdDy7qi1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pjtPmRrA29aEkhau6ioZtnJrpoIxgsJuq20CbhXCAYIQ/QTcAmWchQYCxo84R9Zdvrp8JzfhLfE4lYqDivt5Zt6vrK2U2uV0wK0/WWmKarWkJa2ObyOozzLrxUdCjYB0OboSn2Rz6Uoo9U5rI7wj8Ppe6iXS7eP+PZyM2OcZiOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkgRYsg0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkgRYsg0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vf3N2452243;
	Fri, 11 Sep 2026 05:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLjIjaF7UiMEywMZq29q67MwBv05gEksepD2GVhB81w=; b=dkgRYsg0kSImBT3U
	7XfRpH0/BgzQUon8rItwv34BAoaZVLNxJzBevgQuNwIIcwjr5TOPQiwWkYqoloy8
	IJIjiIXxu1XL5et/f1zjaxgti6EMn7Z45nbhZo5/0xdRw9u941/TjbSx3xhbsYGc
	Zb7hcKIGEIYrj6qkuFVbHS31j7MBmZ7C2yxCA5d6PkIRj0MHKhFaenXQSzgpnxRG
	79oSM/Rz7IHTf2BD2YSgJR/0J6tqEwt7Evm3E00XT/0fUHgkOiyIsY8twBAeTuI+
	8L4NwKldbYEE7thvJKpYtHKRyPscY4YYvQv9eN1ziBwoWBk39JguztEesp2jtAwT
	HGnLSA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv7b0fu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 05:03:17 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B53E2S2535832;
	Fri, 11 Sep 2026 05:03:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-dmantre-hyd.qualcomm.com [10.213.100.203])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68B53EST2535808
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 05:03:14 +0000 (GMT)
Received: from hu-dmantre-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id BB330675;
	Fri, 11 Sep 2026 10:33:13 +0530 (+0530)
From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 10:33:04 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789102993; l=3848;
 i=dipa.mantre@oss.qualcomm.com; s=20260415; h=from:subject:message-id;
 bh=UQjDi7BPyi2x50qvkObQA2f3BzuWrh25X6hdDy7qi1A=;
 b=4mJD9RpgGmy+d6vTlGJ5wMW6UzE66+beEavh8CiA6VmdDqhtfIUf/mexCZGaIarqPtFw5pIap
 9ClC4CtMYoGCB9dTyveaviA1MYC9ai3tmxZszzTCvTInqQJORxl3EHJ
X-Developer-Key: i=dipa.mantre@oss.qualcomm.com; a=ed25519;
 pk=IcrgHu2jFHNILPVydQwFqCQq05WcA8wBixw5s+yRMVI=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA2NyBTYWx0ZWRfX+lDry/RnMlYe
 Wq/qAA8vRV8gYHB36qpKXJlSX7/Qia8I783ZhqImbkhr3SgEtXPsdDHXgR99Xp9GGVtS97NRimU
 DX/pF5/rYUMGR08j2ZqefBr0LCG0LZU=
X-Proofpoint-GUID: M_B_IheaFkxWtH8IE1myyxIiVe-AAVPo
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa38b95 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Y3pw_ksh26QGS_4PvY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA2NyBTYWx0ZWRfX4bc/2bqeY43C
 LW6X7HVWDvNL72ic6qiGfi8iR4n3gumkWBSgCj8sQgmCPnaZmKemN9WhhbVqHiOUGW/1KeMJzXU
 C9/Vv4tmsbGdk8uPqqlqot0Dddks3GU2eICsYAmZrEr2ipvK4iR0QIpSjBf6w0CbaNpRu+ymBCO
 TcS2HM6MS7ehyefxu+B1dl4QzS+Zg2Y4sA/MqywrH1MXEJRkukdyjlrcdctsZ1sbPIkDsLquR9Y
 XLnFNHNDqTPXMc5QJIzUR2Xlh9k/40AsdkoscYJ+acKn7epe9UPuRjkI759knm5eqSKLXXyoSqx
 oTbZRlLJybe5mIQERHhGWM4j5Ga5jZg2pq5iCGGj9vNlVgCZKxw/nhhscMFruG8frk8LXFu5AzM
 pyimYTvH4l9aJdKUlFA8wuaYC4omJM0S4IFkPFekJH/TnbIoSNxgM/EM7f3QJsCST+X9WJVRenY
 oRaMVEu1Xk6Kky9szZg==
X-Proofpoint-ORIG-GUID: M_B_IheaFkxWtH8IE1myyxIiVe-AAVPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110067

Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
when it reaches high temperatures in shikra.

Set up CDSP/Modem cooling by throttling the CDSP and modem when they
reach 115°C using the QMI TMD cooling device framework.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 71 ++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index c1f06f692f66..55bac1b57cba 100644
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
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
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
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss0_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
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
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+
+				map1 {
+					trip = <&mdmss1_alert1>;
+					cooling-device = <&remoteproc_mpss QCOM_TMD_MODEM
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		camera-thermal {

-- 
2.34.1

