Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B450B30B535
	for <linux-remoteproc@vger.kernel.org>; Tue,  4 Nov 2025 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762241781; cv=none; b=PU/Esk0/MEu0f4PtKJfGaKOebA1e47t9znCd76PqeI3up4An5tsE7tiDVS01qy6WvCsqaNfwBB1PMsVwoD6VHu1YpcCDdLg/IcbIVNHuPE4rvmGqsUP0y5VN4i5XA5L0BGyiJ0Y5/gYHrVMiFFFgkkxk+FoHUKusWDTJl3Ival8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762241781; c=relaxed/simple;
	bh=FmKGIfydpIBvZwHLGbtykFwsfVO47sNP+uEYs4V3KtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iiw4UINk9yYmJj7BMsjlw5xqHs9SdF7bhXr6w0F6if5oG35/RSSKG2e71KB1+oPfbdzzJ16o03HnTZtjArfVhzA9ZUdfCOVkD5vMuzbXIfNokNLeBvu/hNv1ctl99SpAPy1iv8DvezWHR6B0b2hsXEuDeWmiGRuaTGE9GtMzKa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wp/FNPGT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cI5j7OYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wp/FNPGT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cI5j7OYb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42q7bc3659504
	for <linux-remoteproc@vger.kernel.org>; Tue, 4 Nov 2025 07:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqXRNN5WgLhy970VZ7+bHvuWbBP7UIoDXfqq5soCIW8=; b=Wp/FNPGTlUw0CQot
	majLNEPt2dZeq+WVsPM1J8lavB2b4ZupyDrhpja/jGg7y7ABn1wjnTgvhIcJJTGs
	0LpnPWSFd66YRrHiHZDVJZ+ZCYCq1vSNld6t/8/xjzZnXrzHAR0N8hul6h5GznSg
	04VLfGMSUr2r9KAHN5GGRIF1rfueCvnvb9Qdhuu7xjQuYdiX2y4dmk2I9q4Hbzat
	jujGD66rp5ipyAl3oY7ijCVH+M0RkeGu8RvFzgxTo8o29mP+pdVXSqD0c6rTrKmA
	9/BTGM1bGwX78bSPAJ7EBeLZGnGe/k2/mEOFyW61UHd+bh0xNQO/OBy6bOzNdI+Q
	qlg6hQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70gea2p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 04 Nov 2025 07:36:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso3923908a91.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Nov 2025 23:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762241777; x=1762846577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqXRNN5WgLhy970VZ7+bHvuWbBP7UIoDXfqq5soCIW8=;
        b=cI5j7OYb3eW6Cyt+HZCpTkne17fCCsiwMHG8fIUD58NXQWyvpAHf5biuum6F3rnTcX
         tIs40iKB80MbLGbtNkg2rg91WVwlINPWVPr+CiiGcJSNbhsz7fojVt8zcFtUWtNmdcSF
         nq+O9dT4CzxOCX+lxI2GHb0tf5+CtFv/yiHFLQONjpsw9yA/4gGIA4hxktBzBOlDD4Gm
         pRsBlE/OfzoN0ZY5eMS8yVQQhqOrA1+roKOtKaPJJvmljLL6uEkYYogLO/fIyZS/fUB5
         0+T+VralA6/5E+xumYmPSAhJsBpWN/TCCcd9zxUoAunaECbbNQGIehFYet5OBoDd+ahn
         PXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762241777; x=1762846577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqXRNN5WgLhy970VZ7+bHvuWbBP7UIoDXfqq5soCIW8=;
        b=GTYPJYvQUVxJIY2Q9qr260MPL9Ediaeg/0X+nnBZvJeVnsu3+jQsYJRvRPNngbUGVj
         8Qbv+g9UPSbqPiVn4ipjd+VtMV7vCkEFezVp3DUe1V+8kOQMemBKdNToDgVBaw8ZIwoC
         vnCpZlBBwLEoyFV+UdIgTL9iN23rrTFrvuWrXm6Pi0UM+IcP6dfp8tRecLA5fLCyCEbV
         y8wsUAZhIuCanpUKsyrF9IAkdivVQEzF1EsFKNXo914vGdVHqq7LkpSt2cctI3i3YXQ+
         otPpHrDCB4FVVd7puNqRnmKjtKqvHzCPRFy0Qb9tLBjy016VeIp1YZxx7JWR8VrkUQuD
         l7jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcTNhQrYFOPFZBZIEsRf8e/V30R7xgeKMAAeGg2pIYVuGhdxRjIu7NhrblOkC8LyiXUcPfDQNFWdiFipDHGpoK@vger.kernel.org
X-Gm-Message-State: AOJu0YyIpbmKFI+0iVNnlYRWIo1P3p7SX2NljL4bbfeFwXTLOvLkrkge
	94MI44lKosPdKE9B0c1jzsM2zkPeZgypQsu6HQMTaYdPBCgGMTPlyGgpXa5+DVFoTQKyySu5P4L
	HD41PJB7+EzONoGcFFM3JAtWHx4l6SeEAORTvpyYK0UCEyA13rJRPrj/gsxkQEblDjhTEtvYc
X-Gm-Gg: ASbGnctZrGxriDrqQsK7huIaKcUN5hBAhI+eQk2wAcR98+/izT3oHVdqaTlusn9gttu
	s8kX3UGTnq79/MLPHvQzntf81Pw4w+pYETBa/rHsIJtUV58ahwswFPHPQFHfj1sc03+yM/mHune
	U+8Ld//8VFlAd53+QsClUwCxDCc+J2D8uo/mzl5pFOj3JRFYLd3pIpopwTHtW0xQMVHczmpXzsJ
	yo/qOBpo+rrAF3Rs4RpzwRIdXaLzsPN8qQm1d+WU2wvaykeKpt5jNGkkH7j3B15GUlj47WRqfYS
	KpkDqRGjvVgu9wA7b5mlt9nymI/e4S77l3Eq7n6jMyDUFEstx1BQXSKTeSxByqJyRQmL3nojueK
	Y93oaRa38rsIG2WIrj2w38EXcEg==
X-Received: by 2002:a17:90b:2b44:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-340f05a4111mr11890998a91.17.1762241777217;
        Mon, 03 Nov 2025 23:36:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC0zzraVPxykKEoWBCgsKtSlR9peX7tZKI1998OGHVxAi0b3AuVr6yJ9IR0P1G35ZoVuRFiw==
X-Received: by 2002:a17:90b:2b44:b0:340:f05a:3ed3 with SMTP id 98e67ed59e1d1-340f05a4111mr11890952a91.17.1762241776608;
        Mon, 03 Nov 2025 23:36:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c8b5cfcsm3484367a91.19.2025.11.03.23.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 23:36:16 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 04 Nov 2025 13:05:42 +0530
Subject: [PATCH v6 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kvm_rproc_v6-v6-2-7017b0adc24e@oss.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762241765; l=701;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=FmKGIfydpIBvZwHLGbtykFwsfVO47sNP+uEYs4V3KtI=;
 b=JaZMbmQPwIaJzEwbqi26osYgo8y3y8kiIBl0iE5kn5gZ4x4ye9GXg/gks3sL/Cs7FcDBR7nMs
 zO734FNyCQcAIWUJKEm+gpEv0OfPdPdaWUU5dlR2GEWi4HhpZmqmNwx
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: OmpVdSxzutY1msGk_eCBa5xmI1UjYNzT
X-Authority-Analysis: v=2.4 cv=bqBBxUai c=1 sm=1 tr=0 ts=6909acf2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QKOBHnd7J3GditHIzEoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA2MSBTYWx0ZWRfX5dMhFHNGFndO
 qdL0jfqv2o3A8KewLP1280asfeLiDzHCvY0n/mDWh4XZRexHGJpMFglJix4NMj+12Tnt2UosrAw
 R9gS7AIJqih6HKzE8JDglbiLhHIsV/2V2DvZEsyvIUj/lS+rolgGXvbiwDkv76u2nbUprXoUCeZ
 skOx30+ecEp45XZltsUmhDIAVLLf+Jhgvzic9GqkrlIHbpmvwCZDtiDIPy2LDQZDcYLRL4BWYgg
 38gCctLC7c7y/BAmdcHgwqdwQi0BNZkOjK9HJNz7dJX5vn+YMb4tJIZseowCTbxKL1f3uWGDHwK
 Ek/c7SKV5cMAN85+W4/1uY5467IdWhAuKment9gOFlrfZqOJc6JkWdzBES4LnmNiuxWHf1YqVHN
 1I0i8pWcZPrEMuEj20m4Q7oJuywyLw==
X-Proofpoint-GUID: OmpVdSxzutY1msGk_eCBa5xmI1UjYNzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040061

Remove some redundant piece of code to save some machine cycle.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..26969bcd763c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 

-- 
2.50.1

