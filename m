Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4238238176
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397312; cv=none; b=dpL44wNVN58HCTQK5BL39K3tW5J+ctBZCf0/3m3NhrMruy9vARaXdgLUa6KLCZlhmVfvDZsTY8cJKt9bHCS+HNapn+qIee7eEy/pZZziRnQpAuc/txUdvrGspVBhCK7pHLATVGIK5KxyCF67X1Uh4ozEJBWBaeeKjBwjwYquev0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397312; c=relaxed/simple;
	bh=tSq2SNwEFNwiGMDSa+4QkuaPG2Nrg0N+mFdMy21QWv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IouQqowuWNpxIhurBJjXZFySZAZe6Q3wy8N8YVeMKgy0dlUAX0ab0eyqbcE67B8NX1quFcUVBPGLCIPhJG7Z1gV6JhRPmcS5U2cM21qDtm5L14RL23p6kbnaviL0Msn39nMn8wx1QC2/Mrszua6F+zSuw86Zu8lOyzYlejHK3IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxOt2bpX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxOt2bpX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KGl6mC013370
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bj4fuwVE2Q5uRTzWgOejIvsFJ5SHNp/2bx2S5Pz7mM8=; b=QxOt2bpXQ6RHWWSJ
	3xSBE79DN23f8bGWpBeGyy/Pc53AeznxTxA6oJqKchJvMkvTnfuU3PB57MypVB8+
	OZQ8KsSYRRk9pFoRXWGY5KadxNIPR7OeYWCE9hp7COSY4cS1hchLzDALSdz8xf/c
	a1yYrBhTO0HMCtyevbuCIcWU8C0qqtmpviP4j+ELv43uogVIosUBkOK0WQShLf3m
	Il3E9uFBiKo/M/xELi8o2XmVw1KsdvSFLRG0CnWvY7ezEb5IF2okUkm6OPygG8ZK
	8Al4oTySSAn6leKCRocuMTCR0J02dN4e+qD0tQGU9/38o/mP+Vvbqiu21bkYC6LX
	TqAZxQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv0s87t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 19:41:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f29f473a2so115598b3a.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Sep 2025 12:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397308; x=1759002108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj4fuwVE2Q5uRTzWgOejIvsFJ5SHNp/2bx2S5Pz7mM8=;
        b=hEXAQ0k6KqlV9l9XQtVQhgkYf48wDrCMRYw1f3D9DIZq4l0wFePhJYBQQ0zLsrZwbi
         j8p8cVYILVMoTfDUutR5Nvu47eVmyKCmCG0fw3Jr1z1yXvUWp9zWVJNoNTkb5gqfARLf
         uY72943dfL5wsbSiUGVSKcfGkD3mp/bN7QLiN+wzsvCX3Jr+E0hU9zdZ+QXuSO1fYJVI
         Vci9GlT5bdBHrwKRvNHcvkZQcQACuC2xDEG2Xq6i4HtFUOVyG8vayFw9rAhevYbOec84
         OeLPcUn3tzGs/nKnlu15IhqOC15gHj+ICRU2dbVMV4fw+b3ZVm7ck1yYOKa0PgtVm0rE
         P0uA==
X-Forwarded-Encrypted: i=1; AJvYcCVKspDbaFXYbf852PQ1spGgUupYHDKiwNTtJN6CraXkJaM6o5YZITP/L5Q7nDg5Z57RW9rcUeLLx+BXpIAASJ5F@vger.kernel.org
X-Gm-Message-State: AOJu0YyGGwzDMckYEFL2Lc9HWJVQVaYxIU2lLG7SEE/Yi2thUMC7SUl/
	4FrOUFjULznfcJA9ZyFvIGafFCUO8ZN9gpy+8qeSZvEHjWgaRLbGlOR3+4iDJwg2YenQreI8O1z
	vvslz8d4LwNETdim+oVfFEC+AXpGAkxYHZNiW4He6OsvBgeXT6TDP6CnMYfTejJiFk6B702CIPH
	86H1LY
X-Gm-Gg: ASbGncvHV62nZtNzsAvPlRpE7YDt1izUz1Wa3WeKekvtjsI2zJn/uh+UwG7esnSLDgJ
	24OyzmuaVplIVqINbYxsnbTw2+WmtWOOcBqlVYOgpykTVlseFh42geoLADVaWC2gBJziF5pve2y
	nhafvmZqXuw3zhtUmPb6OmRh1hyu0ZGaMxusbT739QILy6CdyQ3n3N1AGDRE4nes+GWFnEIKcJz
	RDRdiyVTPXvdpPZZ2zSLx1Zlx9Ss33ilwP0J/YTQ0uh1YsdDl04L8yacMYtthb4KMEVQjE3j0Uy
	8rHE+sEMDLT/+JI4wf+hB/KXk+GDsRPAP5jyIvx+bH7RJ36k3MYpB6HzJ0/kTxv2ADg=
X-Received: by 2002:a05:6a00:1889:b0:772:8694:1d71 with SMTP id d2e1a72fcca58-77e4a2f389cmr9025996b3a.0.1758397308199;
        Sat, 20 Sep 2025 12:41:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyHMvCfqQ7DljSEbSnDD9A3ZUWErb4ZcDZOGMOi6jmxDxthhfgBS5u6gNrbW8W2GNgCM7IUA==
X-Received: by 2002:a05:6a00:1889:b0:772:8694:1d71 with SMTP id d2e1a72fcca58-77e4a2f389cmr9025978b3a.0.1758397307749;
        Sat, 20 Sep 2025 12:41:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:41:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:10:59 +0530
Subject: [PATCH v3 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=1056;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=tSq2SNwEFNwiGMDSa+4QkuaPG2Nrg0N+mFdMy21QWv4=;
 b=+1DbyQpiADAbwBPK3OEENAcWwRw71lHn1Wwyfh45P2QlbbrgzL+dSsY94TCicZQ/YUxE6sc+5
 WVu4Cy0nKYvDaRwaiGDf9NWBZQWEB7kCVM3k2/LBJG0K13N2ua57KYC
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: qQ6NmN1hMH_m3fU1zfqH7gZ81hLSbJCr
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68cf037d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=yGyP_gyn_XtU8QVV77EA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX2S6RyxRc0sMF
 5BK8QYBRbHM2dwMiUaPuwzCtHZbMpj81umLsgUyRPR4/di3ZogKtjxnvHXQ1IgUFHW+PLzQKgJa
 2zpH1YwZPrgOTgcLhajXey7xPU+OdlWUFsvlimPZfJsRg2QD5yTR5pHONFxYD8BuHontNuzUT72
 1TrhNEuGXYP8KpOUt1TvuGogvqzDH+ZtjR6P1ZKkejp27OW0byf3HuG8ftIsraSaGJZeqdFeC8p
 IwfOSW8zUIKUKGr9WBihqwCHlvRTqs+WuIUFjyLrARS6+/LHSYs3cM6duQQl3Xz1uNRLTwgwdKe
 Jj96+6zhsO6KySz0b2ENNiObVfcQuQg7onwykG25r7ZwWnfQ5Aki0+37dV4lr+gOAFgBiZM8cW0
 ejkC7jeL
X-Proofpoint-ORIG-GUID: qQ6NmN1hMH_m3fU1zfqH7gZ81hLSbJCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
configuration for remote processor and when it is not present, the
operating system must perform these configurations instead and for that
firmware stream should be presented to the operating system. Hence, add
iommus property as optional property for PAS supported devices.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..8bd7d718be57 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    minItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1

