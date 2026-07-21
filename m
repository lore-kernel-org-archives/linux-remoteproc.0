Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BAC41228F
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615412; cv=none; b=h509DcKpo7d94BqERPvMp0rXknzJu2qDorG7eR7wBydJ4HiOJhF8JU0pEmG9xRgjzuuNEtYbHZ6YPuoYQBpdPKHiJpiJn3zKtrvuPfelteGDp4qQ2uamQ1QuwesLrwLSeEWNaJLwaNubR43nS3I1AvjMVzHUDu9mzXXDTPcPxN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615412; c=relaxed/simple;
	bh=8umcBmnbaWPKhT/bCG/xlVEirctwHTcqHHN3lc7dKzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q7F2joweOlR+gaWhOTQ7cc5WXQTqU0P1OR4Nx2Z6YCyI0MvuiWBtvVC0UP3HWgjbVAmcd0EEmUgjq+zA60AK5drOcFBBsl68p0Bu/JoWXV7jPOnNsatjPbvAiFxCE5Rn0QXh7cbqsdCqkowuDMpqboNKNUIWKTWEG6h+JSdx9io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyI3pMRc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3VzeQzu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyI3pMRc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3VzeQzu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L44C5S534726
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jRIQaH4oh+X5ecber9l1165X794PX07S/SROCQzKFfo=; b=SyI3pMRcr5Zdxb5S
	RE1lIgZ2Gi0iYF2e8bNtSh+7abPp5iFao00BUlPL6HjrxVqelAQubcFkI6dnFQKP
	IGJUo7S0X8iHxLov1CV1AGPRDahZqSdZX1y6SGaodFt8qxFzIMAbQiywp4bC7c/P
	BUOjQdNgWT15Jw4XXWcTu0OgjJN1x/5pld5b673THARMkjtge0wsgm4C0vgRHM1J
	/pH1n5UvZkFmmKccK925RXQCsAtBVx8qCtjcj2o2Fd2oC2HvnJPu7I9Gh4+S/xi+
	YMPClwHzKjDR8t6BkmN2VVL0r9r8Qtn2g4LanCqZvOtXT2fTOwptDMCxFVztgGXY
	/BEjOg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duggmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Jul 2026 06:30:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so237389765ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Jul 2026 23:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784615409; x=1785220209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jRIQaH4oh+X5ecber9l1165X794PX07S/SROCQzKFfo=;
        b=P3VzeQzuKANqS7yv4i0vT9ktY7tEaY9RmxZK/4GrUTIi5HfyZGWos9r98wBjQnOdYg
         2p1ZKZNPHmfYIWjXkJl0akllmXepDqdtZc0WQ0nKxO+725pDQgkDyg2q+XBxYTRpxt4p
         bl1lE4OThPXHK0ekhptBjE5i2Iuz5/WTnMIHhdWlqQmVOhjAT8yosmAQiQw/oUx2aEoX
         zW5DWhRQy5UHzevECod1tsql5JkNTHE8UtZhgm1lXlyfb7iHxlAqZQ5WKqqccz6jAcWR
         OAsyMdyORlQld3zWOp4znfTg2NzamSv93kp3yCK2ycQc9zVWmR9ZiGV1srwp/THQYTs+
         edxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784615409; x=1785220209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jRIQaH4oh+X5ecber9l1165X794PX07S/SROCQzKFfo=;
        b=O64qTFaYjSGE47kc5YhRkBKiONdpDlt2GyNPLoywLPSBHSBdjNDA44Fj7VoujSDCi3
         NGivPfLvocWvhkZwmrj3I0/YeD6nMYjq94avTmuweAlPOKm4kuDV2SxjVW7if1vuZPFT
         aQWtY10Zw72VCK2LSJoxqTt5fKRh2VrRts2oVq4TfRG6EC70RGlA8PUXY8xh2UM2UbCL
         M5lO+EmBtiMvJrcEwo+5EoE/Rw6fRvNunRXoqx6olcpFyLnQrSLO3RcbqxVgRgTo2ASf
         c2kyC/BMYnft5OkIVfAeTq3i/IOgXLq6C5UJXuZwa0pd28n9ngkK3Iu4mwvibdEYphMK
         7dNA==
X-Forwarded-Encrypted: i=1; AHgh+RqCcp/HlO9HT+7qA85PCeBDLIRQTfhpXmRciq8e88kiHJqPb/f/C5mxSenUOAOBHhBI9AMzz/uXZHYfP0grKY2r@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu25MFl4724hlThNlRcLAwNJm9qXhxmbYZKk/aQU3OYn6CIRuu
	pYCCVLFzJNv7q+20CH54VoN0GWeFQbpDnP2X2IRz6r1xlpgLENfvJLDN25JLuNTlZdFnlMj5hL+
	8spUVugfAYnfnysToaHpKqelvnHczX2yZ/M3Q/9HW4vdrC7iE7oJ7ELyZFAxaA5BhPFksJKAl
X-Gm-Gg: AR+sD10+fBOWSx6Kpy6NOS0xWLxl7i8k+5PtoZbXTO8CdQ8jp7de5C34QHJYBG2GDvw
	cdM3LOFsnVeRqBTtqWmUWoV6/In50+loNmc5PkTwdeDHQmokWuDeptO+nvgbPZJSL/SgqRuddgy
	lYxXppvFDhaG3EBz2NFfoO1vKlbfwMOI4Dz84xFCgSTqBxnvwWXiIVuRzJX6T3NV6x1hMJTAjWc
	tNwmXVyn2uNf2J4Fgr5spriiMjRu9dZyQDKGy4DPtlXSuuxNrIOZnHAamH6pTwHhcGRVGcr6QkM
	8FkCIuvsA9dMEHm9KMUHpDANwPuqMFZuwoKd+rXL2vI16O/973k1gM23duYomVgqnfnW9tEvOcw
	7nrRHVj+mum884FB2h1P7xVdxLclWxA==
X-Received: by 2002:a17:902:f689:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2cf3462c08amr192048235ad.0.1784615408508;
        Mon, 20 Jul 2026 23:30:08 -0700 (PDT)
X-Received: by 2002:a17:902:f689:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2cf3462c08amr192047835ad.0.1784615408049;
        Mon, 20 Jul 2026 23:30:08 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347a1201sm69376505ad.81.2026.07.20.23.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:30:07 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:59:04 +0530
Subject: [PATCH v5 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260721-b4-qmi-tmd-v5-7-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
In-Reply-To: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784615351; l=1868;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=8umcBmnbaWPKhT/bCG/xlVEirctwHTcqHHN3lc7dKzw=;
 b=NEITjm7oqR+Rh45ak+Iz8YUMOCtw/iYGUukbUqFDiWOiCZIe3dlEL5M+xkQw/uHW/BIvDd0dB
 dokIFQIDjqlBZwJdtsjzg61dqbvcuXo2uSVHCzGtbbOsbMfEd5bA5fq
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-ORIG-GUID: 6z46G8E2Z0l9IV37zNOsnKki-3kc7KGe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfXxAer7oKm1OwW
 WSMm7zw4deEPGuCfz43gYrEWETxnfMxK5VcCvsHuOIsQ1EtUnYcqFzsOKv5FmFoZTHRntozsGL2
 xsS5EQmF7mrcIaWM4Lyrkbmk6sR/5qt2aGzKiJ1QcFBPBvlp0SVKZj3Flkd/g7uIa+5TG0Tamy3
 d1i8uMxHad46s1YGbSQa7cd+nsPe7DCNmstFWnVI+hy9HU4prRFizlg932pHaetRTzM/DCpWxEz
 UA+NrdL8kdzpPyH4++qJ0fcTRhEgQk89G06WPN4sQbgk09piBuJyM5GeG4uhTvTyv+paucKqBOt
 8hiBZhSswkd8sBjs1Hu/Vk/49Nq6FsRczQBcmV/GRbqw1pn7DNaIZZ2jf9gEldQoaSQYG40cB0X
 f1BnYIqjzy78ZXKloT2JnvFiWABY2ALa/GJa1XXETbJYlqHx1LaaWXsyi6OXgEPFt4cLXlq9hGQ
 dvPmyvOuNDP4jA/uVjg==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f11f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ptpooaJMTZRctn2qr1AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 6z46G8E2Z0l9IV37zNOsnKki-3kc7KGe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NSBTYWx0ZWRfX6zamgx8dtGvC
 PA6EFAwW0ONvcTM2hKFk7Ytt9dmTFruB1cCLAhz5DYEpJ3xOEhINKkINhnlyurhj4H2dFBdXJ81
 Gpq3vtfwv39O4fhy0zGTORcR1DhAMY0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210065

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in talos.

Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.

Add polling-delay-passive so the governor periodically evaluates
the zone during passive cooling and steps up cooling levels when
temperature stabilizes below the next trip.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index bdfb70ca9740..5602448f0e42 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/qcom,qmi-tmd.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3840,6 +3841,8 @@ remoteproc_cdsp: remoteproc@8300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <3>;
+
 			status = "disabled";
 
 			glink-edge {
@@ -5497,15 +5500,31 @@ map0 {
 		};
 
 		q6-hvx-thermal {
+			polling-delay-passive = <200>;
+
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
+				q6_hvx_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				q6-hvx-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&q6_hvx_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {

-- 
2.34.1

