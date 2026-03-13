Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A5C37FF7B
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403728; cv=none; b=UtX9nVjRAj7Fp0Ew/vdtCvp4RdQtpoyOJieKJ9jz/ZGKml0A4S4LXXGMNu025RcBMwHCSSIp1ZapWOwRVF0XJq68Cs0nZBfeyf5GZHM8vrpb3CphbSdY1jjesYrMhoSNSU9JdzcL+rrDubzB1lYALx/QCFxMdIrsYjds3ZVVEQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403728; c=relaxed/simple;
	bh=AGI1qt+J+7Qs31p5UHAsEWA+8jjp8zQwwy82JnSF4qk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dYX2OAZ9bPJytPa4ZlDbVycnbNSyjjYlE5Vsz8tF9yQ3AxOE9ZWLrJj3N9zpu49smGWI4h/NltOCw9QiKtvN6aXLi2VjHm/NA585MeMmogzIiDIIMEHFBE1HolZuuoIp5EBXR0eHl/aoCQSNnqF1d17XTpFuF2Fob/Cg5X6Xrpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U46QA9vv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PQSVGDK1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U46QA9vv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PQSVGDK1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v8Zi481447
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RWK211jG41Q
	SnlsskvL2jGr76sZdiXtZyotsC2UXfIo=; b=U46QA9vvomxNe2DWJaNI6jnPKM9
	JeYasePFDnTZM3OmzT6sn83YA1ijbCj6WYXOlu6mlyC0K7tyMmbQerbwcnuO1kXa
	owuV8QEvl634Vz+YeuWSd+4Tl5IywPys4kJ3giCA56AvynkqurfqSv/p3NCXm4N+
	YONaIWMHZGyeU7Sj9NbBKjDqKNl5hEx9JSKjqpPBXmRoYRD7pAq9nfXBF8E4SXQt
	aaYHPVJ+3nawbjTNjw35bNx3NFieTpKVav0ndVI3YJkbPN+mZylhe503bW2SwxDP
	I1osSFq2huckyoHi+bI1aAhHX2LL4fq4JptJbMCH+UQuKEhXY+MzX+B5lrw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7rm4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 12:08:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0998a441so12508200a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403725; x=1774008525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWK211jG41QSnlsskvL2jGr76sZdiXtZyotsC2UXfIo=;
        b=PQSVGDK1cMKl2Z6PpWUMsAaV7i21UHofbYjN9Nm+749dREbXoheHziJDWUr0yLyrp5
         mCua+Tl7sVwYmFyzu8kb0MbRN5Z4EWm+KjQG9sgc9xW3rXou2/ZxebLv1bPuhNaCgsRY
         3rTltDKe/2LgOqHUp0+LUZiJWwwBEFUGnPE6byiLzGdWRWqSsbMcJa/DX9Em2GCIqQnz
         UY/RWwTybdP5rgWanoazhAdFEY0mCHArt0zLO1wNQoyQsrTMRCTnRbrgeSCbYjk8hTxi
         ON7mz7OV7hgjBNWanrukvxMCkBcYcRy5Kwf/Ewxe2G/RPowrZlLF4s1P7nRAXWrTO+D/
         +bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403725; x=1774008525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RWK211jG41QSnlsskvL2jGr76sZdiXtZyotsC2UXfIo=;
        b=KvJpHFkDrvimN8YBunfGYoG6CeX17SVB92d7vkWQ/RGGXSSs+fK6wXJL7ACfHjoTCM
         NNPiLCQseFTjJ+YKZ9Gpx7sOZngk3qhJzb9TN0kDVX4pPslCtGoaSHevQALgI57sr62I
         VtcLk/quxEbzs/T8P5wGEnI23L3m9+CDex8oaXpRtTfYzL2svPrmER3sz3CU7rUXgsdm
         H0KeWtDEct+hjogk27H9GQuxcjS6l7gChj4GiLDxvwewM/zb2PLi4vA1OamNb0d7z0ld
         vlA9jQa7N442f9qD16JZHxFHsAcJawZ727WSjjjMAJKFSCfOZRKFFMVydheRf4PiT/SU
         idyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTjvEBDE+PHyjfHrhHSxdMfEDOM+u0MbPrPQHlUsXNkCSKsoJtB5RcMMETzm2IX0axRXvh0Ol5wpJNFK9c+xzt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Qy442joC5GkYNIbBGZqw3Xfpd+9X54JiCDIsuQYXgOoUHXB+
	ob3RriOL0SyhC8lauwoFV+aDWZQNWn7X/sS/pTPt7VwT/YYiV52cnwXSQyaYjO4JhnCQJR1db7v
	+xc0GZKfBiAeQ17MlYqQcVT+A/KNFYZYKmwmcp/FM4PtHllkiAO/l0nL7lX+ZghDAS017nt5G
X-Gm-Gg: ATEYQzyH12bYg5oqBkJ+cIIU2vxN4zrYtMwefxggA9+zd+O9odY/xCiojueRMpFAP0n
	UT8ltpvzR5f3/OBFQA0j4cyH7g9biSHoeAkDnriOdqMkF/q8zrMvYRufdNHOd7Bjdz/sONfjr1D
	tgvLYbeYLvnC+5PH+BdWQCcyTY8qJSC4kL04dFgeZg1Qq/95Ahpqj9G2+jAeGSp5fyP8Vjb07da
	PXWUqhNpPk/pEeatZ5D0KqgU5K1vZEg36f8RDnW6Yy1iGSZ9OKR3igoSzyz4F6iBgeFuBkfP0gK
	adwTk9rD7SzFAWrTODf46UVHhGHtc90JaFPCoQ+yDdiuGwWnss+V6IkEAE4/+LuRcqTiXZ4R5by
	RpC2Jr9yJe0mSqPRCCi+VUQ+EwmwGv2N3LefnK58/GjbZ+oyCGnkm/Fh8OyF4MC6IejzcJNOISB
	QjtpR32viCFDP3Rwc7u3L7bTYlohSy3DCuJrhv
X-Received: by 2002:a17:90b:3b87:b0:359:9073:c368 with SMTP id 98e67ed59e1d1-35a22081e73mr2728860a91.28.1773403725469;
        Fri, 13 Mar 2026 05:08:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3b87:b0:359:9073:c368 with SMTP id 98e67ed59e1d1-35a22081e73mr2728788a91.28.1773403724362;
        Fri, 13 Mar 2026 05:08:44 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e18f0asm8421945a91.1.2026.03.13.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:08:44 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mani@kernel.org
Subject: [PATCH V5 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add Glymur ADSP
Date: Fri, 13 Mar 2026 17:38:10 +0530
Message-Id: <20260313120814.1312410-2-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
References: <20260313120814.1312410-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m64Yfh6WnvPnGhfYWWLDxAOGuMPrSjE9
X-Proofpoint-GUID: m64Yfh6WnvPnGhfYWWLDxAOGuMPrSjE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NiBTYWx0ZWRfX1UaBBngsDWyV
 UzjSWQPVRZWS7Z4qZKVXx0UFkGN59mrXYpgvz2PhX5GEknPeRXd37d+aZHDYU39OFkbbAYZ+dEm
 +fxAbasq/GYf+a8pRuuBY+LOoqXfS6Pez17OabuXoO2XAaEa+2qXV0B+tJ6eCIkIsiuz09SxbM7
 kNYlNOSkA73OSMb+tgv9190iRsiWMkEQX7rB8vDqr86MVJ09iSNcvWhf9Q60hdL3RYaaIjkfWky
 4xyFzEQEm4MqDq4U+t6s6nMJZU3BKkuGSKM8VvhVRrnNvXlJfug7nWvrsU3OBYP2taJzkIgGbVm
 n0kHG2SKw2DesX5dINo/xMwMYx/D1s+h/0hAmnyWEO8W1iU1CQ6ebihF4NCSIfInIQKNLhaEVQh
 Za7EQG3MShAtfUC+9rkPAN79sbW6P3cyIqtvRiaTuKO6g1lRxq+nXgt4pK5hol6lh7m29h3Z02p
 lLYYXA5tbQ4TguMkG9A==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b3fe4e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=iOP-JMljhTESenzhlaoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130096

Document compatible for Qualcomm Glymur ADSP PAS which is compatible
with SM8750, which can fallback to SM8550 except for the one additional
interrupt ("shutdown-ack").

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

