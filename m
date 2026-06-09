Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E883F5BC4
	for <linux-remoteproc@vger.kernel.org>; Tue,  9 Jun 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000634; cv=none; b=deZP46zKbrWFW6N0u+hZRaG5QtMKV3iBvfEZ0IqL2pGpV2MI+BaECOjydqp0eebM8HVhgUdmOOCQ09N2L9+jGcB2xGLZ9lLEiFEbdEye1wNrlGy/Yp6WvZ66gWk1xcMqz5TS/9zCnmwQZa83vn9fFuKvTvKw5XdD0gWTFquum0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000634; c=relaxed/simple;
	bh=a8Ddnn2Nc02nY8QcpqWNes+H/BxIoa1XcjdKvupu35M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmNAAvICExOxnPzdBxqd9sbwbtDB6vnKDbBAmrVB/JzuaSbeP1nkfKViFN5wwFVDonGmjrrvubxFp7mm9kFGciqxZUUs4pWKzlYRFh+9mkzc8lXI6jlic37M3o99fHGQgV4fwjMCqaXJ+e/cmPwUJiiH7zctkb7lz3c/E6eaxVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hgtixk4x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yf/VvXR+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hgtixk4x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yf/VvXR+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vIqX1869329
	for <linux-remoteproc@vger.kernel.org>; Tue, 9 Jun 2026 10:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NZ+KJCKJBYZ0I9hBBLCHrvszvJD/h6bpPe+WJahV6Uw=; b=Hgtixk4xHCl9Olbf
	2rEI7eAkXRxPojCOJAd63gayfCVoz/Jo/Pj3eZZwNuOXJORT/hW2aw5fRr9+9Sc5
	eAjqZKsy/IxFZFHNUmRN740ixbZTS9WIyfc26yQi3JYgmFEH06cDqHAeiiHQA25/
	RUnnN7HxeLihU9gSvVzQAcm6E+yV3zLZ+9U7nMD+OV3rOnHDeVxe6kTwP76znLR3
	0DguU5+KygXOL+2yU+hAa9p4q1doQJers4r/HxVqhRe0wdY3Q2id1fQn+ND7y+y2
	4gJNVJtrwr+oSkRded0HWj11BWPzX4zjfIpLhm5PKBefy97Qw8OYsIxv9N3r88Oi
	CpXPHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeqggn48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 10:23:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf08c2a24bso51580885ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 09 Jun 2026 03:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000632; x=1781605432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZ+KJCKJBYZ0I9hBBLCHrvszvJD/h6bpPe+WJahV6Uw=;
        b=Yf/VvXR+D7ZLJZjddzHy+2nkNALXo3AB6ltsWsJwOzEN36c1uQpFMBft3x7nzl13h1
         1tULJHo8bGB4zrRB9yMOG5mD357MiawXO7SlSoAHgTnfAUoXVWsYdSZz40vmexzhejaK
         PLa3sMBWoY2gat+1LIgmnhFVnj4v2w8qG89jlclOb3yKHJpG9MJTaadfGZTKeEUnpwW6
         LwOXbALtk7aQqrqaLOmEcNjBhdsrnxAEkNkN8i9I/1+Cw2ohBYr+RuHR+He4Hlheuek8
         OzHjnKhZjPK9XUIfmN9FCsL7s1Zw8p00Lkhq6yhUe0cw9M58WfrE+jcHWG7mbEGxS57a
         KQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000632; x=1781605432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZ+KJCKJBYZ0I9hBBLCHrvszvJD/h6bpPe+WJahV6Uw=;
        b=GSBcAhxA54fXo2B1VOr81ups8/ctQLaih/CWDMJgBJtKxnzZpRPcNRhe9I7odZZ2MW
         abnyzhKT+9DhYV94Y7b3VPHSqGRlegITELEmZLz1RbYsel3EzmSv8hgoEuXhsu++3VKN
         KPsQ+JyUCCYJKcK610DBwsKInOyjHI4mh7KRSrOaPM9oZqbSg0ZBpO4hmBI+5jn30c5y
         t7OWD/jWafbPTCyNbiPeJD+WkUx5eA7xfOMSkaGJZj1Rj4aJA+U1cmin/fOGWgGdX39D
         R4GSbBH3euy66gCY5FLuh7vQsKl1k7NJJvWJz+OOfYNZmoXGjbVlde/PEHVJ7Ggkq8Jx
         958w==
X-Forwarded-Encrypted: i=1; AFNElJ8ErSD4SSxPiOGcNYW2/ySnBO+dFID3J7HQwEuyWOf4ZJmqdkwrisj3L3Q3Ww5Sylcy5+CVwWuRQwsyEIAGzsak@vger.kernel.org
X-Gm-Message-State: AOJu0YyBS/i4WCGvD9USdLpptLwq8vB+FEddqUN/ZEsz7batLDpjMeDv
	lqI/2H4jx/W5HH+KAdWW/nVIOFA5nPoNfJvMsbMY4FYXrsPM+QSE9DYQxDuj4eVfM/Di4PS3TzV
	SP7zpjHcCObgj+5XWQ+lH9B5WFXjZsLJc9mAXdpLqODlDpRuzxa6cN4dffXlpwfckg/Itzj+M
X-Gm-Gg: Acq92OF8W7uP6xuW1sQp5IZKxvBTA+BmTLOUo+QAGRYil412F0MxETj/tYiTzWIOokT
	ngHtF5rjOH8QsSuC7CBpmzgLh5caylvtcze7HvxW3mCe0pYnhxkSVIVOR/HoTgKRDsmqX/sDDKG
	VKoKscdIMIyrAKybLWCrlDOBjicOICbmEzYz2JWc3LQQL2JPyZM7q/oSeavPgQXGEMEJ/kzcSMr
	bGJcrIJSYZF2M1j+nhDLEGer2YL04uSY5jLzrYYipmvBGbbcrIkVFpHsL3KnNsvnrcqazwRtAIO
	p7BNVXIxhaoGww1Ong8X7RUIYr+ex9fmRsZ9PBgjldvMe5qjCIGe7JHVKuyxcv9h7ANtA65H5z5
	FuTvaAcqDsHJg/3hyVi26Fhvqji/8Acwn2Nu62LBWdi7B5XqmPG9ahhpMnFnqHQ==
X-Received: by 2002:a17:903:908:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2a1bc8420mr33578275ad.9.1781000632350;
        Tue, 09 Jun 2026 03:23:52 -0700 (PDT)
X-Received: by 2002:a17:903:908:b0:2bf:2d0:887b with SMTP id d9443c01a7336-2c2a1bc8420mr33577665ad.9.1781000631863;
        Tue, 09 Jun 2026 03:23:51 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:51 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:53:01 +0530
Subject: [PATCH v3 6/8] arm64: dts: qcom: talos: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260609-qmi-tmd-v3-6-291a2ff4c634@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=1451;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=a8Ddnn2Nc02nY8QcpqWNes+H/BxIoa1XcjdKvupu35M=;
 b=GgB6T6pl0JCdOhwCam1LbdsIaZP77JdccYjBCz/aXaONH22w1yDzdtdx+y+w74SGKIA9OCbsj
 W3NYdg6SUVJC20gru/sXeAX9nui+Vn+2F2ljYGSmMuB3soVhTCyZEjL
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX4cnWhj2NcRRY
 DOpXoFnhVTpfJh9oQi2O6KTtL8jvje74d2AigeXA2kZ5dLeQMG/95PvU8hXfScdHt8S/tHR02Pe
 1iFeBSSP6kN7tDnqUUv8eJ5ngJLnghbWaWQmzl0fFLKb3WdLd7uwvxbCsisXgCOY4Sc+wXvW7WN
 coduw8A27dpOuOFuGZdafJiw/fgDittGzwIxCFEMDvXh4dvUT4w23UWeHXPgWrYMbafJzGc39LI
 oI64cjKXY3lOCjY9NNGmben8xVqfAq2FgRC3ZGwF9cbINMXphQyoDpEc9Ecdks8j8gQGxopwQiY
 VIWzuxpyKjfktLapCfCal3NOPIhTlTEPz7gYEBFeJqvvFKKeJYtVEHdE5hoSG55wI4rFs3zNLQX
 kIY+kmZ2jEaYBGQptFw7dW9WaPpgXRybIAfeFlsRIjYwKFpLnqLW4Yzw7TpGEA1mxvUhtjmL90B
 miSTihIpvj0DbXjbGpQ==
X-Proofpoint-ORIG-GUID: me6_zmJ0X6UDwXq_hzk5vpo0r9jgQ5ML
X-Authority-Analysis: v=2.4 cv=KdHidwYD c=1 sm=1 tr=0 ts=6a27e9b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Sq2dutmKN4KAylfvdeAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: me6_zmJ0X6UDwXq_hzk5vpo0r9jgQ5ML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090097

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in talos.

Set up CDSP cooling by throttling the cdsp, when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a..c105743764fa 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -3772,6 +3772,9 @@ remoteproc_cdsp: remoteproc@8300000 {
 			qcom,smem-states = <&cdsp_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
+			#cooling-cells = <2>;
+			tmd-names = "cdsp_sw";
+
 			status = "disabled";
 
 			glink-edge {
@@ -5425,15 +5428,31 @@ map0 {
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
+					cooling-device = <&remoteproc_cdsp THERMAL_NO_LIMIT
+							 THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		mdm-core-thermal {

-- 
2.34.1

