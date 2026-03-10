Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A63BA238
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773113798; cv=none; b=QvKwQpyXte0MVpGDDhBE5zpX/CEjuD9faDlV2tSKcZrwKYr4wSPMPLDjO0IgZVkbKWGD4CZXD4vByszh6cjo4cMSmSos2n8+2gTrNM55Ww+m5wtq5wGAH1oCkpkuK5WcSAsec8Vx8akKiuFrccBnCXQYMfnO2gX4sdXD5H1uGbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773113798; c=relaxed/simple;
	bh=Q7s0mqqKWFHHOrkLyxUjB2iWjZt9Rs9T9opL5GXt9Wg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j819WRXWL7Tn0/VcjUO2UF4m5NeqyurRWd6hnN7d4uIxCLP1R7gE7xdQs46jIzL5frpV4/Tl/jKrTQpQV641q+owih6fo9TzTl09gyLj6yfhpoC5GQnP+aiFo2io5jV8t4UgpdIWAINwpm2YQDWrtlClvwDVyK/tqgxNP7vLUJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZUZunM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gWLZWaFS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZUZunM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gWLZWaFS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EdnJ3587453
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S4CmBsoTsTr
	95WUj0nXOAXNdt1TB+ciOmtpXIhXjCto=; b=HZUZunM758rsLHQi4T9oD84MLhx
	XCg79BdPKSCpH6DML1moURMllhs8WYxe0qt5RUIEZI48Wns5fyPUG1FTXydiVUUX
	wY1p88jwfyNlreYK2/VStFXLx3QwmX2PMXjRJmX4M4Ineo3JrBgfmE9mmwE1T3pz
	IrRYfyqNVX5yr3Euh//CkrwzwIozfkdbLvXxN8qqRiQxY1cxV0D+EOYZKvkrC9ER
	P/FjiZb7+7SaIDqVLuNPzjNj7+0sFGKAwWCLNJ5/Na8PvwDtWcrJ8pASET4DPfU5
	t2c7qlQPFdfbh+NWVNDsOEs8SqWebWLkGk+IK9GOeok8m0zpRWcKGPTKU+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekt0ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 03:36:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35984b91ffeso7938676a91.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 20:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773113796; x=1773718596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4CmBsoTsTr95WUj0nXOAXNdt1TB+ciOmtpXIhXjCto=;
        b=gWLZWaFSzLKE9JrvmOZJ4MDCVcGxMrEXZHklVM51Z+E2nB7Vy0mSMDuYh+Ou2n3VM5
         8fzSRBD4fTSevdCKpHi7cr8Hr7plC9KiGe0EEX3ijhUyUv3bjc+t11qTmLHyW7CIED4H
         9LB3yHblaHOl1bypj4G4Q1pPagbLrJCqifygNo/FemKqjyKOFTe8IRUWWnbozexjbXHP
         zkezG4GAyCV8yWZvajhHfb/7r2ISfrTBAjTxshGK4fXxc1iCcbO6CF6EVENx1MyFs2up
         mwu2fk8cd6AA0H0WzJqX5Fw9pDBXP8YcFI+0Qqcg6AYfNVGPxiOXMBK0I05s+v+lsqs7
         P09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113796; x=1773718596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S4CmBsoTsTr95WUj0nXOAXNdt1TB+ciOmtpXIhXjCto=;
        b=IffZ6NqmipZdPde03HjyY11aYSxLCqo/Wgyk4GsGOIFxhhIOXR5W6sgWKHYjljHV4v
         GXw7ERqyIi3EhzXsMq/1zBbxdXMYszrNGhZpbqcJhbwP1RSNmm3Z/KeC1rdG1JXahzb0
         CGoIFuxqScoA7iKTCSOpnT5zR64MZ08YSmMeC0wAi4kCNQmObqxkcjUS/zZqxOeE64fp
         xfahUTQA8nUbzBd0HJ1qJcVcY4TQZgMc6A4ubNYjWaeEld5qLo+Jsdv6tvjPN6kw4p4s
         uMXHJ+QgQ21Nb/vWJXJQNvqMk0+6mkS3p0L2Ru0oMWNfMXb8YQgye8JjArdLyRBBEyvp
         qmeA==
X-Forwarded-Encrypted: i=1; AJvYcCUX0QsPc09HAT+Sj6N7THnbkY2bCIym3GQbe4nqnlEwIIiNcFeJkJd/ogdASww9vVdNu7M+Czx7xm9iDn+o+zdA@vger.kernel.org
X-Gm-Message-State: AOJu0YwePnPMo0i9tno3XvaBol4yQxeg5daO8JPzWkd008xKZS0z2ouQ
	wYYBx2GMFf/foWd/MaVfg+BofgVaJcSY6uWFjHgIbiW8DOosW3K5jA05txiBodAvtgY7RlXFcSq
	q9u/610o6zQBVohtCsOv9n4FT8ioKWmu2pKgMpCzqeXNh+2NaZM7ZdYEQH4WGCJbzTFNbXGqj
X-Gm-Gg: ATEYQzxlasnswThEVhD+nbk3h3zZ6UCN55QhjsX9hpulJhxpCOjG5Pj/gcXDK/4UYAq
	xyrPHesgmqx7l8Hu6eWF3FF4XFgD2AwurW7jC8IT/BdOmfUxD1erIb/xdy9anFwD1fBaPs4amBl
	9tgljC9p4Kb1k2eX1E4hIxlqmtWxbA4ue1ae8V6WaLCYCCzRpYGtOsnEvBCQm591YTA7dFxJvg2
	9IxLRa3pytUcsvCozATnosKnS2cq4YDpDuamcNb4zbCpw7CCR87pETtse3zGGwFntqJyCMoq/TY
	fGs0lwTsmwHwbIPSrOMbFbMssZg7oLhIiV66O2103+kwTm5KIJRXns6K7lkOecwMoJZ5/4cZSik
	3AtFmyN8VFJTL4tfMDqE20UWeUrzY8YdxMiJpuGHUXlsyGxQko0/lgnBH3vhPXkMBg73FFDLrIE
	mH2VXvVWUSiBZzLEfQZqg3qdOy17sKHCMQhHDy
X-Received: by 2002:a17:90b:48c8:b0:354:7e46:4ab8 with SMTP id 98e67ed59e1d1-359f08125a7mr1738459a91.18.1773113795756;
        Mon, 09 Mar 2026 20:36:35 -0700 (PDT)
X-Received: by 2002:a17:90b:48c8:b0:354:7e46:4ab8 with SMTP id 98e67ed59e1d1-359f08125a7mr1738432a91.18.1773113795298;
        Mon, 09 Mar 2026 20:36:35 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e182d72sm10272923a12.25.2026.03.09.20.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:36:34 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V4 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
Date: Tue, 10 Mar 2026 09:06:13 +0530
Message-Id: <20260310033617.3108675-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RA_J7WleQ3VFQL01AVmfhOu2gv6X9BK7
X-Proofpoint-ORIG-GUID: RA_J7WleQ3VFQL01AVmfhOu2gv6X9BK7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAyNSBTYWx0ZWRfX/GPvF44AQ4/t
 5jvdR+p1WJtWISctxknh7pF+HIH2YPiWfwh6s0g5Z2ILo6vOj6SK3Ejns1V3nMbhKbQ/C1wo+pS
 VANp+w7lJEwoLK/FW6GSFu0c6ChJWnJ7fZ4NNc04rNLEOJiCrz0wvtEv6Yw+J+nnyEQzpIrh45i
 +tDhi6otyGssgkijoKfkqlQARR1pB4DeQdJ5mb/UU18IvnfasjDZQtJizIrjZX6wFCaSUE8tozR
 sDthD9vB85AeQynWejcW/eDZCFMbcDRCTI55kypiES8SP/UqL0zAEJwfow+SMYwoPVZ/rAwLVIU
 /Ur8mR6za6UogCWXsteaYwrUZKyvl+l/XibzN/Fremxc4ZGKnXyTktqFywt9d5C0OhTeILfmexg
 Wm/UckInefOIAoGwEcfuOIe7RTD1YTs2w4sS8B4rM8oSN2DW/stRUp351d8CGhEQk6g3dSWM9hf
 xSJkj8nPGNwfdSNb7Xw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af91c4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100025

Document compatible for Qualcomm Glymur ADSP PAS which is fully
compatible with Qualcomm Kaanapali ADSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index b117c82b057b..fb6e0b4f54e8 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,x1e80100-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
@@ -101,6 +102,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1

