Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD162C08CB
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757056; cv=none; b=tHRSaUpZNhsVa1CiMdDw0/W59F5w6+O8rVsbnYYBGNSCxv0ny5xbHa5NhPcXSX70SGa29pAm5gpmYFTpyA+UJ+Z0ZREQsTB9TdgQEZyWsHWAYDPdzqchFM8JWFfsd7dviStOmC2i2ki3ATMqD5u1vbKILuoMkrTevLMQVnSrsaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757056; c=relaxed/simple;
	bh=yEh271CzwWaC8AljYBxBXpSjh6rUZDtONCY/hWD2UMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tvwy7M1FgLtvAVZgjlsUb694yNHVuB8i3olGNaWAOBaeVbaGmMKXPanObI3fCMyEgg6dCNS9IBDb4w0Nl3UCizxg79i8VkrXBA194MRejH5Z+MprzJiDh+Y0cW5ltn2V8SWe8NH2TkdF/rzYut/A6UbAwn6PhOm0ZhUt2w8CWRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+Q1OWyr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+Q1OWyr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCKSZp025366
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVcW8Q66ceh6MYrzZqjm2SaMfynWCP8KmOA8erMrvnU=; b=T+Q1OWyr61TG8a2o
	f+XWNxmTqoegl9+fULRYU6QZ+hr6fWbTGsUZVIUVGym7pC+D4xYJpDe2PGB4jz9q
	wXcI0q61NjIKF6lScGpk5NJ5aL6wCF5a8RPEIAsZxz2KyCaaK8BWFrPSeMsc7StX
	yiHxGOXXHc71vaEcQMiwO3xOvcvIoGmMtlZcJm7l5LiVFkXE+3TjBBfUktf+iBsK
	VEGr/99ntAuiWjGvy32+wq7R3A9oKWHcFW+iG5C1CBAyTO6WQP4w3AVkRP8WqrgP
	lcmparsFaJgYrZcmIBDBJzQ20gJM/sQxtWc4EQcRcGeGbgdHoRO91mP9GvUXz8n5
	Z574zw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexccy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 23:37:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4f86568434so206350a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Sep 2025 16:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757053; x=1759361853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVcW8Q66ceh6MYrzZqjm2SaMfynWCP8KmOA8erMrvnU=;
        b=wvYyXgKwObQF4TqZP0V6mDPlr0/wl+Kv+kl8bulfU+fWI7xvnfEKd15/PWp+RnXV8d
         pM9BFmI8MsUg4mRi0kDSjtKyAcVBRz9GfD66s2aRGxfKbH1ZF6zq2+eHsL+TioJzgbDN
         Kik4Pc7PhEv7ffNM5jCoYuFvdjGKiRUGE+0zBIlebXhK4wfDQ1Dp+/Sw6bg/SvphlzHh
         1Yc2m9fD0ZH1Nmkhce2GUjdGN+ZbKMO/M+WvIGPXiJfZjAZUn2I0pamBUVou290Mpou0
         vODgyQ7oS4HbX6HZwgeksVZfP7hw1ot2VkCECpvumu4xRFCScuDIMrJCNEEu1DRADQun
         rGgA==
X-Forwarded-Encrypted: i=1; AJvYcCVNHLBP6CgdM5KJ8LjRL0bW4vfdKGugzLHxcARlpkp59ZS9Rbpn0B+FHkQC5dsGuSGldb5lPGfvp0Irwurrmvcw@vger.kernel.org
X-Gm-Message-State: AOJu0YycdIf0K3SFtxMkGCrefUcwdhP2UUO3O1fAOVvYoiZTQHOG660x
	TshC88R2lNg6NdfqtLyBE/XAXbbp4wjE9OtrzPPlbKxr2bjgL1K9HBkxnPoo1HpD6YIDZLTZ2GK
	19jS4afM2c4TX/PNvEm3KMnxomjmpnJhC5G5Lu5rLmcXoD/wGVuZEgYYwZ7dlXDJ2IWPUA2MwIu
	uMB7SAfAk=
X-Gm-Gg: ASbGncsjhzgnL3eCWbTnDv1m7eE6qT8f3byr3WL2ISVj93Y1nCUC+Tna0Z2bzjywXzo
	6pVa0tiGU1NGQsACeDbfeVrPsT0+TjMyZ/I1IeBa0+MmVPKXuFxsyq+NM4OyAT4bqkU+XpO8ETU
	A6bBmjI80TmeMqvT50jcUFv0bngW+tiniKp1bXDU3grgUKdAtVN0+psOfRoZx0e+V0mzqR0UqXM
	YbgzZ8hXIOXqL68zaapzf2nb5oT4RvyK/LaGrrrGM89bmA3q0qLzuBNVB3F2HS8vfk8PK6yeY4T
	d+GP6hBkKKtngeVLLfsmVrfFKgBdMUYMoUwQE6618XEu4Wv8aa2yvyphkWyzivPX1OXoZEoVMfV
	4S2/CkOvcgAT2b2A=
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr14564525ad.22.1758757052697;
        Wed, 24 Sep 2025 16:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXmjvrEnPvGjw08T9XlJAG8e9A/cjwzkIN1aq8g/j/hd6m6hrQcO13lIbbk2ZuOVJncfQ00w==
X-Received: by 2002:a17:902:cecb:b0:269:8d85:2249 with SMTP id d9443c01a7336-27ed4a0b73fmr14564295ad.22.1758757052285;
        Wed, 24 Sep 2025 16:37:32 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d73550sm227187a91.3.2025.09.24.16.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:37:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:37:24 -0700
Subject: [PATCH 3/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali MPSS
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-remoteproc-v1-3-611bf7be8329@oss.qualcomm.com>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
In-Reply-To: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757046; l=1334;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=yEh271CzwWaC8AljYBxBXpSjh6rUZDtONCY/hWD2UMk=;
 b=WgDbDk1afzYHwLEq85KNb5qbz0+EvdnzpgXWnfc3RWJBu97y3uO3RboLzFk3znzNlEShHGrwa
 mRri/sVeo0rAbUjCUirYvhiXbK0n1FQI9Pt6nAixhXy9r80MswFJnqv
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: f975LmXBfiPHfv_5Be8DTbpC-bf9lI9W
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d480bd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=nKf7ylKirmyFfaXDjPgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX5Bwt9r/zsPhJ
 MUdINFWGEQiF5+6T72z5fWR3U1mM2h/d/XwG3YkqCbEUdWAu2qYMFwi61uMzg+Fk+2wm88W4sxc
 2HF4gMXzn8b/jAApY5qT8Dw85b59LcLEimpDVwG/Ig0fwxdorqH/IL8Xm6LGOwCNjxQyUPIURwa
 ufbUbHdbGeHhn/HCVdIc9TXAzImmdVvWAyxq7ad17P+xCUGIuGM811oUD3xmjYMcj2Rw65wFYF6
 leYS5QKbIRYcnphgGQWBHWxjbDNK5gSpyRj5bnvyB4Pvmv9RLT8nKw3tA1kytBbfmAIxPBArV5s
 jpAoAXP1qFGAN9VAzyMS3/IUSeqZexZUcCwuuzGx740Otc0l9w7kJDPqmd4ulugftMidE3Jet1E
 gh4E9cju
X-Proofpoint-ORIG-GUID: f975LmXBfiPHfv_5Be8DTbpC-bf9lI9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Document compatible for Qualcomm Kaanapali SoC MPSS PAS which looks fully
compatible with SM8750.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 031fdf36a66c..b0d2f0371e5e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -38,6 +38,9 @@ properties:
       - items:
           - const: qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
+      - items:
+          - const: qcom,kaanapali-mpss-pas
+          - const: qcom,sm8750-mpss-pas
 
   reg:
     maxItems: 1
@@ -191,6 +194,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,kaanapali-mpss-pas
             - qcom,sm8750-mpss-pas
     then:
       properties:
@@ -227,6 +231,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,kaanapali-mpss-pas
             - qcom,sdx75-mpss-pas
             - qcom,sm8550-mpss-pas
             - qcom,sm8650-mpss-pas

-- 
2.25.1

