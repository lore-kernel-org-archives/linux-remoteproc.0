Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD02A1BF
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645658; cv=none; b=dPRjgGGNrdWcauQJQ+LJPi9XU/Yzha5hb1QjtcApSKSH6q2PR4m2T84UF8cZrZPo+zTHrAHBy/f+dBcEpjN9ZTwxlN7+9xeMsLVcC9m0i+/rSMkRpM3/t5gYayZE9Wp7iARRZuk7ItgIIbgib/XNJcN2wqCYztwIQTaXlckrV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645658; c=relaxed/simple;
	bh=/mktlExfi6J+VTNoAOE2TdBEptRWSmxhz1fAVt+g4Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FIJajYBshW1BRqC7RSdxy2TZ92pbuEuBY2xFbi6mtFzZhO3Qf2nfXTAj6zLyzVh7oIjxTyZmNc9AbBj1fADzX6quAv8FIx16qZIPTvR9Fe0LEKG6OVPUOrvcKg5Mxi37ZLj1yMM2C34lW0tTVb4+gXtiL11/af4tHtXE3lv/vHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A5W45zGS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aivRl80u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A5W45zGS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aivRl80u"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH7j4I1129665
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uWU8cEg6n+p
	lWSlJaDPz2p2B5LygHk7I/F0OpCPVYD8=; b=A5W45zGSoww10EYhuFr121HGhMV
	vyI8E+3Ncg6dGumL9OSSXmZBp8Ok+9KQVP5skj6mQISFUkQ9PItnZVhGnhyBGREi
	6/YqZgulsAoMLMMSdyH5w2XB4dixjjNoAb0i21gGAX9WNRjSv1bP9nZRJ6u9lByt
	Vc+jqyXrDL1KW8+YrDL8iQAhLOAlzGhy7eEVogOPUWqtfEeLFZivNjoBmQ2PMm2P
	OIiGeF3MSD7K0gbrJmrryeEKK1bSSk/xwfzr2ZWGiFpNeylw1C00oYQXPnP6K7Cu
	g+CZkxK90vffsuhq4SZGlfZefVcPGndrah91fBdX3P2dSoMvZTaCVkDAPxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypk217kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 00:14:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a8c273332cso617195ad.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 28 Jan 2026 16:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769645656; x=1770250456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWU8cEg6n+plWSlJaDPz2p2B5LygHk7I/F0OpCPVYD8=;
        b=aivRl80uL31d3LPWxr624dsr/5I22XhgUSIQ/OpU7VK9DQ//R3v8rH32LBZkDj6w7s
         EPECOi5k5IkT6OtSUqtEjJH8nmRj3TYscJpMx1NqZ+g0nEqIjsG9DpjVi9/8b73fIYoM
         G64NSRFkstLT/VRe46BGVHJ6BbakX3pYN7/oo19cM052fSI8fMIB+uAdKgB6Y/yV/LH5
         7nZNjMpXz6HBMVDix5yRY+pmqLpfOenELcQIjzB4mLPSf25mX+sKR2XlvdI92spxVGGg
         aoaOyqJia1SvbV9Q29Hj+W+VaWQhC64zW3p5W3noqyETmvTy3m1j0cnYygdmvKW7gUgF
         srkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769645656; x=1770250456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWU8cEg6n+plWSlJaDPz2p2B5LygHk7I/F0OpCPVYD8=;
        b=vO92ekK2AkCnpzQH099o+5X524FQ8E2WN/VvTeAj82ab8Ka3ig8CoYv/rV9Iw7zdUi
         5+QwVv5+780YhvEuqIdonnw/WT1GZU7zBOhV3xt3aRipvux7+isEf7s3GKdKB7913fOX
         SEYJl3hCTJbSI0SoJNANev8CDjChYZUiBa1usp/mEklIdK3u3RObKqn9K/jpYlf9Iztg
         AN5amMHfmIDAbIjB81xtJ/iLb67pzJX4DDsoX+UKbsLM+7GGQ3fBQnqofc9rqWrMnRrP
         /huM9Q82MKbJBPeCUHUjwK/9GJVnc5WBD6izED+1bDAQwIyH5VacbAAuw82+vJZ2cK0M
         wPSw==
X-Forwarded-Encrypted: i=1; AJvYcCX/2D3wVatiE9qMKu8OgMOUld0G/rWgKYSdc2UgzDuNZutyysKOt7OajzUetMIxjrhs6zjHwpTOM/0uiXF1hRAI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Yhletsc7R4yNd4nf7xcZqcZcv/4aGAHiqQdhJAsvaQAWXy7V
	If6GlhEIybo6HsrTolzVhjKvcILJlB7iCjbDFSm4m2zU2r/U3ivKha+Aj/sEEDmpPpktCB0T/R9
	EVr7LdctZ0aSZPuChJKAhXIkLdJ6H3ccseuIcI7KIKaW4+C1LW8yUwLmsZfA0wIYBiz7m1XFy
X-Gm-Gg: AZuq6aIovw5Ml6h6itlGO2UWZnY5FearyT1cdWVmpnNMlkq9uXe5cRNiVVJFOVdpdoz
	i6yx4m/UATpThpzoj7Vqa35ciiEdS4m81xE/arUd3yM4CfiosKdUk4XJ5BM7wyopczwVxPSWwD0
	kLrs5zD12P9EWCFC6gvVOhXyGCLsx9E1ThBDBZQvoBgaFeJi4tffs9f6LN2TTD/+VUIJTrsncJa
	2YcGsjG3EwN2EasL3JFv9JZh0QXJ5myKbkiFAkxBhSrsfXl8brKZhIX0r5e8Nte5+2vuM6PHtaQ
	ZP2V8kKiZB/CDCez6kLDVjdiBVXExuLPIjNJmd9Js7cCGyzBaUCn3NFXH2rXzN8MOZpWy9WretP
	+ks3wrzhlaSn+9Iuiwwt9mezh0DTUUUGR7cnQWSpWmGaKBzqLd73cLlZkWn+tLsxUtgodZgDCTS
	HmIUlKTRP/H/oD2uumAw60t1rP
X-Received: by 2002:a17:902:da4d:b0:2a7:683c:afb8 with SMTP id d9443c01a7336-2a870d63794mr61400135ad.16.1769645655633;
        Wed, 28 Jan 2026 16:14:15 -0800 (PST)
X-Received: by 2002:a17:902:da4d:b0:2a7:683c:afb8 with SMTP id d9443c01a7336-2a870d63794mr61399845ad.16.1769645655188;
        Wed, 28 Jan 2026 16:14:15 -0800 (PST)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b29sm32055845ad.54.2026.01.28.16.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:14:14 -0800 (PST)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH V3 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur CDSP
Date: Thu, 29 Jan 2026 05:43:55 +0530
Message-Id: <20260129001358.770053-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PfvyRyhd c=1 sm=1 tr=0 ts=697aa658 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=I8BSNejkaQ8d0caDSfYA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: r2H-Ao3pYhpmo1PuQ1fnpnx1VDFIXQnQ
X-Proofpoint-ORIG-GUID: r2H-Ao3pYhpmo1PuQ1fnpnx1VDFIXQnQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDIwMCBTYWx0ZWRfX2s1O58vBHwAa
 rdsA+yO8VqtPikAxsf8R9DUC1TYEnr9eoO5mwvAYFgxcDU+39XwTpLeyZe9wV5GQs8Pzbnxmimq
 SZVjTB2ph0xmcQ+P6DXGfbqNdUPYYGGOGqtp/YQHvwfj2o+LTkG/Q7GMhJMKVQnUz0WRqSmCUAk
 qtWOfS9Y2HWLla08pt8RKHiCZ9156XdrBG3zDX7UMrhtzVkbI7pEMuSi4NLB3qbOvPpOZZiApn/
 dTUIhmLttniAWZQAtPupAuXEPWEbl+SrId/nQ2XIG7ONgdGchYuWt+p5MLaXFn9bGPMwhRSISJZ
 I9tbY5DiPKbpNH+10R6aX/XMCJ7Ii2y1R+a6/ZlML5A/2R+8lhYUPc6bauvQ9x3yrRuGY8nSyWT
 19P+3aVZtHWLu1JUCias/bJoIWbsngnfL3+vrNjRCk4OAPXBXhniAV2u4KJEVzPh9nx0emxWryU
 GlllxkT/QjpDLafGKiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280200

Document compatible for Qualcomm Glymur CDSP PAS which is fully
compatible with Qualcomm Kaanapali CDSP PAS.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---

Changes in v3:
- A few variants of the SoC are expected to run Linux at EL1 hence the
  iommus properties are left optional.
- Link to v2: https://lore.kernel.org/all/20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com/

 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fb6e0b4f54e8..6a29d239ef41 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,7 @@ properties:
           - const: qcom,sm8550-adsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
-- 
2.34.1

