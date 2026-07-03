Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4235CB6E
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 05:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055102; cv=none; b=PAcABN2f1FK9egJUeohIhQJc9dgzLPm1yBhkrR0qDt2TnerHDbkG0Qqr8QgMtOeN1f6kO5Ptjq3CeTbfWaoGlj90gLB8qmweGpqMkbEHh+8h1yRXRXiS4FmkVhd0BTUEFT3uBUAbKAoWM0FpF187/w+TCu2tW91UEg9qThpaW5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055102; c=relaxed/simple;
	bh=M8YZxWnB0AzPIjWqL5OibClRHhK4JBKvlyKlKEDeerI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdyTBPTX7s8taEAp17VzNvVzBOmdC53sBNuLtOMTHMHMpk0wZaqq+5LNvzKWbS5z294jzYQ79VZ9aAzWIb9ywuO+TTohaZHtJezeceVWwc5xdM64hpu3O0eNVgjWanANN+f4+B68njVpc/+5B84J75heft+PxS+wMttB6ApVgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdyClTiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIRFdjRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VdyClTiL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIRFdjRp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342dku2828945
	for <linux-remoteproc@vger.kernel.org>; Fri, 3 Jul 2026 05:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zICdr+vEr0mmN+oN36pGjTuJRAL7dBuDCDW6Sapxg7A=; b=VdyClTiLaxugj/8K
	YDtgOod5AiOUo+SPzRmwh1/oDXwO2iX6Z4GAovaceMgZTzvLeTqJHuF8bvRN92dz
	y4A52toHrWy1JQimauPK+qgTLCD+AKotExm9mxCapORPfiiqUFsP9e4NflojJJN2
	G7PXTutSza/AvC7kV8p325cp4Q5zGRVUM1+L/h0a3LxwmrDuGmEWE3d7gewr0Q2K
	HBy3LCyGL4CObZ4SS6dlw9Gyf/QMO0tX3rJgzy2EULz4l4fszmUJwW541SnXGAOE
	mXjIXSrb5K9r6QhgXWEGbUsDJdtbU507NK+VLeK135x6zeS2ZzdC86nJx85RFJOr
	FXUcWw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b58hqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 05:04:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381120d6d62so408010a91.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Jul 2026 22:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055088; x=1783659888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zICdr+vEr0mmN+oN36pGjTuJRAL7dBuDCDW6Sapxg7A=;
        b=NIRFdjRpXPO7n5Yfa9hXikwzq+C6QUxE6ArB8C0SexBHBWayxO9tdI/60JlXp+GNli
         jXpU3NBcFs37lRJ05pgdfdqBNnFLB/rnztMqnZ/4KdbvAj8nm2cBdJc8aLp5+SU5jkVM
         qB6HMX46/+6OT2HO2PRKA/hvxRqCIJ/BRQUP3rgOHATc19UWxP8zbdHSBSe150De8Gm2
         pXCrn5aucX7ggtPetvpMQAHt09yXZmrwAyq6HeepxvW4xIjVMK78jiNCylt0I9Z7EwCg
         0AeS07MuX6QkmLD2uTJgpj1IYj4PO7OQCZCPFEYMC8rlta13yEYSx/rh8eqL0T2Ab5d/
         iFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055088; x=1783659888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zICdr+vEr0mmN+oN36pGjTuJRAL7dBuDCDW6Sapxg7A=;
        b=bgJm7nNHU+agrVzpDUcwm6DNfPL4UVLD0yadb9d81yKODRLxa+rOwOQCv8hZ1t+7oS
         kj2uY+4zRbjpO5obeHbsJqFvCVoknlxvlcMlJEXCPHz0haQN3Z5u/JHHVgkieTdiGUho
         THBExS7oGR4V8Oj6AqzWaMNftjsNL0IQg/DAvvG806Qk6TOjNBrrk70On4wPYPsT3BW4
         7ZLJVq4t9m4dQC99ygX4aiEmiSCFDWOjl03NOwMc1ab0Q4yAjTG+L17HyGns/36/ilfB
         hKCQJM7IH9mNwxvzceFQoMVCDOD74vP11R1HCSL6FFYgRu/7gQnAtSXPRt+UDxXfxfEQ
         hScQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFdDfY1rPRu6uuhcHWUtcFaiUqKyuKu+gPK0mN2OHnXDwI7yj8q5qDSFZVoDz074XSxqcA9DuWcg3+EYXmcByN@vger.kernel.org
X-Gm-Message-State: AOJu0YzsY2shlmrJUCnXvapoYbjjTe6+8bVNDrpk34EJUSTZFhDuCWEQ
	ddoodygorMGCT0/U7A7P/sdiXJiXFgO0SyBk7z6Gcs3hfK3tSiZAaLHt3qsZ2BvX6TJ2/FPK238
	3zOOWvYhrKKuRz2sg2kDq+552rET9TIvWlYZkl6mie7h0GAQQVCleJzAezdssBcbRsJRDoZvK
X-Gm-Gg: AfdE7ckXGiThYwCOvrg09Pihzk4SneSakvCz+T/B07h2swWjyQaHn2XBEjv5GkFMdSX
	x5Ikr1zvO72xb2RNCO4q+TOV5lHaTbyi6xA3aULTO1j+76OnTmc2SwNU6qmnKPGzJXAGF27teWE
	jELb9+lSdyKVE7pTFUZ5e0HI3dUN+Zi9y8Lh3erbf2exXJ2SZC1XDgEjvfMbNDcCb/8FADNWZs9
	BRCR6uYkmjvoPA0crZBqdr2QO+3fVJYsm47Tg4qu9OoCy5xHcHGmoVIjG6+SL26kDtIHmONGkhj
	GKeJ49RPi7odm0P2cpo+XbhvqPt8xouq3AofK3P35QrnaNi/uXwf8KBIHmWpLpYyjutD1VtS37D
	13EUEBevaIGdHCdPIJfb4tmqyCjeoV+3PAq0qtDT1
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr8753799a91.31.1783055087548;
        Thu, 02 Jul 2026 22:04:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr8753738a91.31.1783055086945;
        Thu, 02 Jul 2026 22:04:46 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:46 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:13 +0530
Subject: [PATCH v4 10/10] arm64: dts: qcom: hamoa: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-qmi-tmd-v4-10-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=3918;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=Xwl8eyOC8ES3VqB9mPM2hr8gP/1CW/uw9ZVxGihPU8k=;
 b=vg0rFo+N6LIj/TQkcg0Zm9fnzF6Xr3KxFeoie+aH2fHi2td3rxumjgOf2RIysauPCVXtpU2BA
 WltYikBYTeUAIKrqUx0s0zfXMz5x83beD5fIEw8nWkSmhDMCl8UmBqW
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfXz1HIRitJwLU6
 X+hGyKlp3J8hRhrGmh35qYZ5hPPIrCEvHWMUvsInr7SEAhyYT5qu/Bdu6R/u6vAMAWyKrM005G0
 1C/RqC5ZhT33aIpj8oUMUSlTkn/ZGTo=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4742f0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=l8n7A-dT2XO7LBAajUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Mj4rdAf956qMoJdrD7RH60CkgAuzhttM
X-Proofpoint-GUID: Mj4rdAf956qMoJdrD7RH60CkgAuzhttM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX1nGFqaadnXnd
 OdR+jBooWX9uHebOlPfKgz4cEnSKVL3jWqEEEw1aH3WeI4QSXo/WMlZF/A8tl0qbIZpJxzDzIq8
 R38zouW/Mh1dVtNVH6IWcKjdOzr+KvvO4WhwnWJjCzZS9fYpapLhijdVWcS9intWBS+fkV3Ik1l
 cDRgGnfboQ9s7S1GRxSdCyA92ssrpIBRZxA6/F4RGzr/WeHtdr29gmNl1d6DVsbqHAwOJH6k4cT
 Wx1A1IavmVsRNJGDYcZShzy4TFm5Sn1iNb0OrwFi9iFTajSxHt1SkhelhMC/7R+ugUU1zbB18WH
 u/eAzsrBtmSS89AIy6XpWttKpRj827NJTwet2aDT9CK7yECA5n5A4ZJrI8r5HAr0LFiymwNOW0u
 uFD/HZy/Nw+Afj4F4gdLGMpeNkWEpOYFRauUqaWJd5DtsOzzUSuGr3qMG8und+LjtC7qQF495qU
 ezSrqycwW+rtwRHbPRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030045

From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in hamoa.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 95°C.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..397049d2d238 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -8815,6 +8816,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 
 			status = "disabled";
 
+			#cooling-cells = <3>;
+
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
@@ -9402,6 +9405,7 @@ aoss0-critical {
 		};
 
 		thermal_nsp0: nsp0-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 1>;
 
 			trips {
@@ -9411,15 +9415,30 @@ trip-point0 {
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
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp1: nsp1-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 2>;
 
 			trips {
@@ -9429,15 +9448,30 @@ trip-point0 {
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
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp2: nsp2-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 3>;
 
 			trips {
@@ -9447,15 +9481,30 @@ trip-point0 {
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
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp3: nsp3-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 4>;
 
 			trips {
@@ -9465,12 +9514,26 @@ trip-point0 {
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
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {

-- 
2.34.1

