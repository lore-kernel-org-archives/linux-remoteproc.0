Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580382;
	b=PTCFDCN6IgEfnrtbtVuLsB4NVaUNq3sEVPdaNSRE+05PgUdl7UIWq/WQ+j8PGtJ25YNt
	 UCVq+RinSgcWlwxvLTjuPF5wMqM4g6RwHO2yUbKXNEkY8dB38effYFfgF4HBjF8TxlEP+
	 c3jnP4YKYa5Jv7BM/j9lJgXar5ieYV9JxbqbhlQWXUKFPeMFy2BVQRJCLx2Mbgqr/uSbW
	 IrO7aFRM4EL3FR8TGWd20I2x3GmtMeFrnHtKD/57vfmv2HxPf7+s7eix7v27uJ3riMGJH
	 g1I11uxZzhW1GzCOu+Ty0WPbet9IARCYsV/mL+xVuNBcVZ/n1B/YW86c+fuBS4+TCZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
	b=EUUfr3RXYpPP5A7dDgE6Oum8JRMiXVEjBEvo2GY/IK93LGv9PlV20k/TL1gHHnwwsJB5
	 8GCavSwks3fr5EtZ1d+577/h6EFt131MMfdZongytsK9cUAodUwLnIprK7sdUU64zyb8v
	 vGGW8/oVnPpi2r3x1mrfuG6oaylO4P/Pj9Fkz+EJxz3lX3cr9rKFaC01cz4FV48OVgkLo
	 DDCW6hXLt43sY0H8k6Cmwv5XALKeFb9amhtLk/lmPAx7SLQATyTEE07VwKXu79M/QpF2J
	 PUiDu1y4A71dYP9lsMlWRiudLbdHJvzs6zmtAgDlBiuvVZPtH9ZqGJtmXfBlt9433fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C63606A882
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C63606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p6LcTAxS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCzP9o40
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJVQQ3771919
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=; b=p6LcTAxSLBPS48Cd
	MH3YQQ1EsSIZjcS2uPf7SdzFAu4A5RxpP2eMpW56ge6qo6vfDIhLmF03xEqv31x6
	14lWdjH88HiDAd+UUR7HtMHeZrIr5xhHfLgjQxdGkgpeet7X3nEXLBGs/eEk6B2N
	nHfIl7NAPKN5KaLX0hjwYCrk8GVDTRVm3kHR2uOSggAyeAfS7LTeOnpBU4IXdfwG
	PHgL1oAU0eYSVC5QVyfNbPu5gHxZMn98EspesPMD8O9VhgWB+ZP8egsyOGZAsGHI
	DYIfHf6xqfteN/8zXKBcO1y3p0vw2otSOKiYwwPSID0PzVzEwpRpBJjl171soltE
	rGNbow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mt4q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 14:33:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so212618585a.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794580380; x=1795185180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=JCzP9o40ucS9Xd8yC6Pj0Sg4E6M9RNEza9icZkrlgBQbf5pETQvpsPhnqoSZNvdgOL
         cC5PJAxpWKt/X4EJbNipl2YqsEGwEFqq8IjZEm31PHJTwD/kr5IdOxF4g5FZhYPhpan5
         WP3dmJtGDk187w3/ITY3DcbJaicK5SJRFvseQ3oGq/Fllu4Yp1jGluXhYpI3YqtB7ud/
         kSAPZCeGHuS5ivpVo7WEqnxwQC6TfdDFr6XoV/qeqjXufgx0duAfH/Md0+zSLlMVn4+c
         PBOERuDvZwd7LgkV7BNUMaM5vyehSayp0UPk5cZkUn2X5u6J+GQbiNAOjC231XdTO9yV
         rbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580380; x=1795185180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx91eDJpaU6S9gSHrYisO86Vlpx4mJs+TeI82IVUj98=;
        b=k+PKq4L6nJub0WOnVl7d92wofTN4EGhkBgQhIl3yEkmIJ1TSio5jOIdNXZ181enVuF
         rMOVlNZI+rNJtMH28P6XeBYWgcqk24fY1su+iQRY0poSadalm/hyTCEHvBkAC8toYhMZ
         mkGHVHi/cO4CsB3rVlSdTEg1FneEYDMvnE+vpzFNQgE+2DtGMdwqp1TO85Oiaq3ZaEcc
         1dPJBKVULoDqpFrud105N9D7sPcmI7+jm56YEfD1IaCucuKykRFcqg7eKXo9NRC0Mv4t
         yu4wc0QPPX6d0ID2Cyx2CFzp8GiB4sN2D4Y8Pa0Dbsw6fZR7rkvCiKDq7jZ6jLzsJgvQ
         dIoA==
X-Forwarded-Encrypted: i=1; AL+hErEnI2LE0+FskuCdL0cN5mRtznPnGzOnB1b1SXCNKes93aRxZuwQPK1eurVz3kIyB9E14PdJAMFLQmsTI6nOoPQ3@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zl9Hq0GRr49CwsNtZDvtBJQyGx6MawTRsFCw0tuA4Y5b9WzIY
	R2+ZKVxpDtNYRnukSuQ5Tl0Z0FgiOVRz88Hei9cg6mawdrFVLjDdPTvFU6e/cbmmrzIGocapOeW
	jQaJK6Av4g6SXTJ9IWkff3wZAkyonl+VtmgKJu/dkdm16gpohy6BQvvQa4iFPxVAoYCfauAd2
X-Gm-Gg: AYBFou2rH3T466KbOofNC9sjKm+VfrXIRpMsxOzZbg26Xmhg7g00CtMgTz20uxK0NZ8
	Rf7iIcgYySdAgRKoi9ZRwAkpzfsockTU+T/NZUQQTX6AUEMX19gissitUVQXIIkyGuPolK5HmQz
	Fr1D/kJ9AQooXUJHTopjpAwuzWdaj1n5oIQt7gwyDmkfVoOcOqxI3jrjrZosC5GI/GnxM3Hzz4x
	ODckNE9aO2ETeN4H+woI+XejPDyx/RUPobbaZFpwhXjSCC/xW3dcwu5ImuiUJRNMTo6DVk2uFkI
	BCR0ll/bSc/wNy2Ur8hnyV6ThC6Srwlbihk8Xd9odS0eqeyGlVtpqe2uHbwmyc/GpubDCN720aK
	/feFwhjSyk7tMC160TNgths8xQY/+hBcj+J1lqqeFgIi5p3wCB9PAZAn46V4+N48=
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83105185a.22.1794580379745;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
X-Received: by 2002:a05:620a:a719:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-9495cb86f22mr83099085a.22.1794580379090;
        Fri, 13 Nov 2026 06:32:59 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm71948685a.6.2026.11.13.06.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:32:58 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 20:02:21 +0530
Subject: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-shikra-el2-v5-2-8aca743de97f@oss.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
In-Reply-To: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794580360; l=1410;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=AP6m7K9bcNvLKnjx7yin31NugzckAmQBmT7FmQR5FW8=;
 b=3grAOrtRV282qWHFnvr0tb1SE6cYWndVBqaZAYbo7EGP8AmopSFDhWgbOvmACGOGHjHaUAlCp
 RCF5uyMrJ05BQEUzi2/HAtn57bemSJCmsfbesJuzu59nAB5M2jy6YwJ
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: dwn1YjQrfVmoMzVDuUeZCw1txZ0jMxXy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX6HWPbxAqJ0+1
 vEMJlJ4MxNmEEF0Mo9uXcfRqSZDqW6j2kA/n/8SDEWmTUiAm1UYkxVmbJ0CIgjXrkSPy+i0f5cQ
 LgdEjhJZL3AXxFsnk7hzoeswgtRdiBxrLQB7VDdqvWQLifFDwKbTEqjL/MfG4XcU4lpXRyL+2lB
 Nf+QjmRrl5K6KKOgvpZPJO7thuhAdpH7XPK7ZkGeLB3C4V01w0OxH9Kha/o1KYkrQKqq5HKzIWf
 mO3BBQYrn1tFUzc8ivGv1fDCTvHJR45XD93b0OACPP9ancr1rMvDeea/yYpxwb37PtyRNHT2Ukv
 RpkZ/Atxo9a0LdW/NxzLQE0lGlsZHG2WDaVzK/Td+HZyOXIq8G5jOtCDCyi6o3AFcWvIIJebZU4
 A8HByoHuxEmWw/s1S9C2kUFFgfyVV69oCclS9WHuS+DI5EXpcEVn835jnR15xdUfXSV7rXN6uMh
 wrSZGkHS5qNAP2/IsHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NyBTYWx0ZWRfX1KgxyP4z1iEq
 0gWXja6YZUX7ve4VBDf9zGjyJ6QNzvz+yirjIq8+Ud0nsJLftmNKTdHbS7Bzz1fD4LflxW3FxSh
 RM/hs4Rf+N/gru65Dqk8cMmHbrl/xGk=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af71f9c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Q89ptBQ9mced--_tLTIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: dwn1YjQrfVmoMzVDuUeZCw1txZ0jMxXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130057

Describe the iommus streams of the Shikra PAS remoteprocs, needed when
Linux boots at EL2 without the hypervisor: CDSP uses a single stream,
while LPAICP firmware uses three.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..1688d198cc5a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -119,6 +119,17 @@ allOf:
           items:
             - const: cx
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-cdsp-pas
+    then:
+      properties:
+        iommus:
+          maxItems: 1
+          description: Firmware Stream
+
   - if:
       properties:
         compatible:
@@ -134,6 +145,11 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          items:
+            - description: Firmware Stream
+            - description: Firmware MMIO Stream
+            - description: QUP Stream
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

