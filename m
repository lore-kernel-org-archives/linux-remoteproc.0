Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4CA3126C0
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725152; cv=none; b=BZKN1PjDQXeB179+AxMzRTvtBnRzVJbhxg1RAWWOCYFnqtdArx262l3+vZHGXkm8CpqZce+49vAxbbTmFunmmHcn41QZY4IH5MSPvoSalKJJ9VjwjDO86pnLNSV6VYttdw8vasNV9KJWyUfuQwY/3rVDmZj+281YCfRvXADe4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725152; c=relaxed/simple;
	bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H/RIBV7QXUC+Mvrstg+KExgoq7ep9CnZz980FXzxbdWwkOR4muGU4vPgvb6IcoVJAGtuJRvPBwo7FAjGv06mq8GDoru+A+O9BDwimPIV6QwWobnxuLDbBVwC+QXq4EPpS2fYlOMidc2QvT5THUvIYbFXswiN27Piiw4M6MC2lNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIt7Z1Ti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilXPC4aD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIt7Z1Ti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilXPC4aD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v0Qg3663640
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=; b=gIt7Z1TioWnETg7l
	XthjNZfQUl3fSx1hbaKyQrRDBRIFwkQnTIFLpz8xfJxCTKjEXS7doe+VdLlMMznI
	K2KDH3M6HT/YjRFjGq9g+BKYiQ1mWbaK+D0i0VizHqXzwTmohdtl8q8ApJ7rYxpW
	JcSe465z85YZyhrS56OyUcXOv4YZKkoMppB0qWH/DVXL2WJ2olORgQDZuH7nQYZo
	eGMbSo93Cz4G0vmBaEZmFa8ZFc1LujmAADfadZsVXSFw2CQOndasBL2gtp0PwN7m
	H7CeW+KR5Azo7oH7xrDkvrJIuw/MhRICuykhEIQ6WIaNUgRi0Prlj9W7spZNeDdl
	kPf6Jg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1spv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 08:05:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290cd61855eso60194695ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 29 Oct 2025 01:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725148; x=1762329948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=ilXPC4aDaC/V/G+/mii4V1/2izE31w8b13EO5hUhwyHSwGw82LCMINJWRuIemB2iNh
         WMLJlt8wrT7oX5tOzPYp0NVqoIOZ+cwkSJkitvyvxzQWGofasrMRcIrgcCLKxBHyAHub
         WoR86KYypu/GfcMcL57trGMMDjRVX2SGqbLgCIog13sVHLVXuG0c6KJV3BRHK+QaaW/d
         anJN+ZdGkZCyix9lsT1vrQ4nmC2g8i4GSYWWJ5mZ1EpVd9KkY0LWmeJTtldfT5fbkBFT
         rgnSONjArUmFkh5iSG++Yg4839p7Y/TxE2fIy5wEwA43m3pplNUjoFsmpRX1R58sGC4R
         8fmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725148; x=1762329948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=fsgNmGMFLPKB/uZXI/tddX0/JKHlSL/pG5SVfbhmlT0UF6Wg2jmt8NIKmAojpxWlO4
         YhRc4n85En0Ha8dxf9ty6hIlBKYBbOjzoYI/qRCE/hxo6zbaAlmqCavKT0lBB/qkogy5
         gCi0onffw9O9eZeqEWF60vB/j2ry5l7mXaUG8lfsAWz0w3c2f9BFthbghBlmEMA3vAWt
         ujwiMUX5uKyJh7AIwObp4ZVtoO+Z+VUhOLj8AKfrXLo5RrtMzLTMr/F9UkvfOU8ZH4wi
         lGUGwkqkFKigxJUeUDISTomMWT+eQSTRwECODs8RtpA1whOfLuIBXJYZSMkI1dfFLaBi
         NSsg==
X-Forwarded-Encrypted: i=1; AJvYcCWqYhACAJsqDOsjNCJG4f2X82cIfajCXqw7k/7FlkKX9HEuRE1FP5aThtIAoCWwKHZ7+SqOmKWYmYN4FrgJnhJq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10NFLILSd6ibbWZvgrZ9wybzDyIyjNObfM9ajUqRj4CrjkT3q
	3ycsVvMvCv77UZa3kfEMVaro4U12tRm7/YSO+/w0aioPsup7AVx9VuClpoZdYRRgByTlRBOuHub
	BBVCwJs8v2E+n6ueHxi3/ac/HQfzvLoAgERwZBTyTPvdw1Z+3qSeIJKjB3u9gTHdeqzVMsCcurI
	GsH4LU7OFCRA==
X-Gm-Gg: ASbGncupWJLPDlm1SE2kk5YMgMb3iOoypTMNO7ILFt8/atiLVzL8EwHEExSygmsLm91
	zk85zc3X9jAgzB3L5FzRVGcKubZolmYuL0uoXe5oKUM+QsVURP+BXreROM+L6HNka4uJ9HLAVVH
	JMAFesQ5Rz9YVmjSzQHnfwvIB/2P17MakIdpj18+26TGAJdaxsLaNFbmaB5s3lYr0YgtZpX//pd
	QHYWQ+2Fv2ZNKOzvRiL1a/hEUPRW8ZdQCWqRu8ndxkik/JBE1GW9qcJz1lP9ii/lz9d/dqxwb1A
	400anJhuJ7E9wwbZ7ihd0nbA5ybth9yo/BNxzqFx56iCCAxwj42tC7qbcf2RgrgPNgDDzA9GIvo
	MKBwQQIZRqRqPX/ie2ppn44sSBEdC8D5d1kQhSekLIpJQ5pmxhQ==
X-Received: by 2002:a17:902:e94d:b0:294:66ad:113e with SMTP id d9443c01a7336-294deed6989mr28798595ad.47.1761725148355;
        Wed, 29 Oct 2025 01:05:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/eNJvA64JnnnSsz7eBeEKbDI+r5Fc0Hs1GYj7WxkUZW45UFFUeGDw6W8iX17wmr/4G/0oQw==
X-Received: by 2002:a17:902:e94d:b0:294:66ad:113e with SMTP id d9443c01a7336-294deed6989mr28798015ad.47.1761725147719;
        Wed, 29 Oct 2025 01:05:47 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:47 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:40 -0700
Subject: [PATCH v2 2/7] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-2-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1361;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
 b=9ijeTFo6Hk5cJ9gmJvkjVY8Iso7IC7uBXoKqasWgrL4s2m2WP8/0Pxu2xQtxdlRZGN6gKaGi3
 PgwybymLq3JB8zfyPpqYlZXjm8lOFXeNEyp/sDLZkfJj/om+APx6Hax
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: zAXNBz4BGG869RB-hwon7kaXT5uJjBnF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX9YSW7Km/OrN9
 WBRSbft8uhu8R2v9gLsp3cQoa92xnM4tAurhswESs3ViHJtjikeoIVJC5+6HCzxQ9vlFWT1mIKS
 jt8Y7+jYExKm6y3IuS7agvqNk5SSJrMFyf83RY1MwzzOZWQpaVVwx51efLGdsa7cN6ADbKImnDe
 Sl3Y1CffRDrEPzJD+Q16I9R2MpkN8dyZBpSJinSMnmV3tG617vq8e8gJpB4BJwsGFHGAG0ZPJ3t
 f2+pKLmaN4lKFcRDeRfsGiPQ0eB0N9RLJ5KCLJEf8wzJE/IJOES1hUeW+xr6WVIrRKOO1/x0ymg
 XMmWPbBAPpew/NlrZvyNgnbvyKLUuIIonseLMscGqSKftYJl6cBlw5/Npx55v6B+T55dE1hsZfk
 0cX0JoV5x6JXcqjIi4SX1Gp+vSA2lA==
X-Proofpoint-ORIG-GUID: zAXNBz4BGG869RB-hwon7kaXT5uJjBnF
X-Authority-Analysis: v=2.4 cv=UObQ3Sfy c=1 sm=1 tr=0 ts=6901cadd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JO5o7z23AXsBd-kSPjkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt. It is not compatible with SM8650 because one memory region
"global_sync_mem" is not managed by kernel on Kaanapali so it is removed
in the remoteproc cdsp node.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 31dffd02125a..3b66bd106737 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,10 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
 
   reg:
     maxItems: 1
@@ -98,6 +102,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-adsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1

