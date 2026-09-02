Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1859147F775
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381838; cv=none; b=cth663bp5ABv/t4wJmlp1Jrdl0klBQCfWr2QSkf16rBnCBXZUZfPvSdYBY8+eG3kMhgVE5fIydBy7VnUKTjJzo/5CNyxrc9InRyNlJRLMKLbTWCpbUt20tSHqwsW3mHAdkoEJ3cPs8pvKMvAdglF/2SnnS998Bo9zzK4Szbr55Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381838; c=relaxed/simple;
	bh=S1OTlqKZWIb2bXyBhFfeNBeUssHFULWMwu4f5hK4JhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FLuCHwuv0vTJfp7mLxGKjHVgyTdsbHrDmGYK8Qq7NXMFBqCd51pSS7Skm0AAcP8U9XX7nvPELsrnLM5ssjoj332PgTJXt/wow7OAi3yRr4hMYrQr0XwGd8O9NslMrQBrlqRFOAQcTiH6lcPtULYexsx7ohbsOHir+kxWT09az3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC6cnACO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B31/TRQg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC6cnACO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B31/TRQg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH8aw1382937
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 20:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Vjkvx5+Dov7
	bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=; b=WC6cnACOCxyc4rECMNdw0abjDy/
	sftzbPalHPL3ebSDMVskK2/TX8eWLrw9Q17SZ1J/sMj1pMfh6oOoTLj6PpfxlLYt
	ef6xfxMdbkbzE+XnK+jdnlBDFH/yyjWdwYgftbTusQcMJ+hQPANl32ELxaGvnnh0
	5nZbnLQvDdEsoOnxZelTDZOh/r11dzmV8vCOs5Y33cd7Pt8TCytZ/OPKRbo7eNID
	KKJz/hNDEqinl9GFGKcfSohGxVbEl3Fo+oc4JAf2X+ZqLOmNjkRW/0GEcNuEWm1v
	1+10dRQlsUJUgyXY/RPXVr4GF3QtZuL0WdPyJcRAl/a1zdyU+C+gJBoNdRw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemja1vcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 20:43:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39906175917so2038710a91.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 13:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788381831; x=1788986631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjkvx5+Dov7bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=;
        b=B31/TRQgB6E4Jk4KMe8dYJO8w6B/IbQ6VJ4l4a0ijgOkgaEKB63OgCmUTGOIdvFOqU
         T5zwiRYqcrBUBs+GTkxuqP4wgDJRfP+BFdIiTCz2RrtSMrWYwJI84s5GO0R+W5QbGvss
         qEnJ7o6ugdz6lv5HcTMBdumcDCFv/GZ2PUJXcors1/7Ohnatnr4zhE9R7x6h/BjrYsJA
         kQDouQhLtJCRZmoorTIMIY7Ulrpr15pIB1VM0YzK3OYfCqEbLYmp0w0wamtxkkHCjgTM
         3HhAsX1bmZXiwByNpayTEkkp7cP3rE3eZ83f6RLRgHZ6eR84x+21IXtiDydhIJ7D8XGu
         cW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381831; x=1788986631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjkvx5+Dov7bk+0KCz7gsKQ0yLzwHYGcRcMlfcp0IIs=;
        b=bouEceCpEwGGpem2kumaZQscgg8gYONwtQe55d6DJX7uNAtnTc3V+4KrBYZBuSTpk1
         KH9M5p0OJfp9YQwpU0jjcOtkR8sUGX7gGl/llTADDxO+URdML9aovsS6YSNHl4gZjIYE
         YnWR/wTLV3eLOxVLd8Hjd4LbmenyIXOzEHLjHCbO56BxdxHo90xVyUrFAMUMipUs0coA
         dOEtx1080w0aBXR6161kMLO4Spv3H+MkKb19spTXWWhqKBTouwUT22L2LTOiplSWF8d6
         +sAsGHm8C0IwKHoQW1GWbHjNEMTbQ6+dlGmE/Y42lW5wn5u6sRUiYlFT8MJYX50QIjYC
         UfpA==
X-Forwarded-Encrypted: i=1; AKwUvBxbgVT6MqguAbUkWdlfRFu9vJJ00SdvC0/7W0vtn9uEVFTsnIJ+T8eZiOxtA6flXepBiOV1I9hgxCe9NV7OTdpD@vger.kernel.org
X-Gm-Message-State: AFuF++kmj8qiM1jZOavoOXlniCJivlXh8FCVKqhFEFKTTSPym4InkK25
	4ipY15DZdXTvy87Sb/qUfAhzaBrwU43UTKvmfUwo6ACi+wbHzmZvdh+wVqlUqbXGq+dStYa6n+t
	cIgosit5m+/JKhuyEb2Z3ckW+efFGgocWZN8wPvQRzvdo5gTLqgQsvg5SRTuxt1gKjbBiDg0h
X-Gm-Gg: AYBFou10Uc7oU0eLa0r8T+uy/PXuyOGJH8TUMq+FFg89xZgbKn+CURNws9QA9TEe9cq
	bxwMOC8cOV3nnwvz2s3smxyxYCROISgsuKi1u3D9k/K1oQIXDq1ePCmirdzoS2qJmCkBd20+QG1
	qUSf61wt4SVkHUFbpDLbHaBfrRJrsSu3/DAOs4vapyZMeqpZGM3HIi+Qt5S7SI5YHbiPQqX7D/i
	cbHyzcK87iMqlPQ4Fgu0D5adyriu6aJwV0eti7V+BFO+j8JuMBwqcG/43BkluW6l9+yBmuDMT0T
	ztLuwvVWe7FvygxhhIdNiAz5QQYNJpwpKOya2zbb4JvnEYAmkylQaiOgeaBwOTyXIpewBXhPQMY
	3MeCBzBefv7ZDt8D/snrofQmRfbA=
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr11376825a91.14.1788381831513;
        Wed, 02 Sep 2026 13:43:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr11376772a91.14.1788381831013;
        Wed, 02 Sep 2026 13:43:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255d39d21sm613338eec.16.2026.09.02.13.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:43:50 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Thu,  3 Sep 2026 02:13:33 +0530
Message-ID: <20260902204334.2061226-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q7Mk6iUGl6KG94t_lc0SeeWkN7Id77ae
X-Authority-Analysis: v=2.4 cv=FeAHAp+6 c=1 sm=1 tr=0 ts=6a988a88 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kGc2aUUJYeWwMdlnZD0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfX/4r29kxtG3ca
 KKytNo/xpnYdFUt1ci8qFmy48CH8rZIDKmzBPFG/CfEyu2q7v2Ic0Rttd4JTIKKChn0O/dumMs5
 ljVyNeiERB3chKPWfxJttIp3KYm79AI=
X-Proofpoint-ORIG-GUID: q7Mk6iUGl6KG94t_lc0SeeWkN7Id77ae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE4MyBTYWx0ZWRfXzY8kj6FmMKmV
 OQzqQbyebyFLo2gcaI6ZFcvVF5JcqLzEDFWm+jhrX9nv1V+NaMa4MvU1kTffKSzejlR7GiMBVAu
 i3LXr8sFKalEmmbS5MK6Sd4ehKBybeFQ8WpnXCNEdLfsE4OZPCsjg+JByJrgg9oscG1hD29rmLq
 0dt7Yb9vXy6h1d4bs8cM7tf8uJb3voy10PQHYofUvkVqhtX5bZMpSoOPXCz5Lgu+sKQBZw3M8Wv
 Da0HGYxr/f/0f9dcgcM56/3xn8xbRyfy2Qsfq32IAW522xpg0A/JuA3ZDGspF8IlubyTx0WxBsB
 p5BBK//4xU/x+3kvjPKIZ75dSjxCnTufD1T7uYZNhvONDbbyFb5WimemmJ8nlpnYJqSKXN1oFfc
 B7/Ktj2VyHyAbS0pF6igXy+rUNvne3DOt7UQXHRq5liT0DwGYGRKUBEXAbcB9WDtQJIwgBNL+oU
 W/o34Y6ykhLYbz8bttw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020183

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index c58e8a6c7fe1..cf57095cd49d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -40,7 +41,6 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
@@ -273,6 +273,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

