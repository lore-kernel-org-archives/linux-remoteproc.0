Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4CF2C0274
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Jun 2026 10:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481694; cv=none; b=Zy5YiADIDoJPc3mslm/D0ieUjGGL9l54QYF/VdxMeDOYWyLprld+rOVwLAyzT7zLnxPRXmS/ZevaU6qLBO09Y8t8O0vkivDEc+W75L2aFOmIX76/uz+zk68XO2XootGBfExq63SRQPmJO4bBmaEXwncx9FpbR66luYHJ2YZNPoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481694; c=relaxed/simple;
	bh=OU4D6VlRdhjfTz2yiRjWGJXP0ElAyKuAC2J0p8/GCyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EiflZEu1t3aF/D7nygrhxx4aoWKlmFbL/8sQmrZ6nsuoHdTcvJZyt3K5gKSswDULz6SfNNUqSPczxSy6Nz4c7pEA8EstUPdAlFMBl9Q0GzyGNAGIjQQTGlDSIgNteaepe+oO+cD9RHJlzuwKA9xB+ubVNSR8dqxveshitbYJd3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KTiAZyRf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSfqtsAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KTiAZyRf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSfqtsAj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RJno873737
	for <linux-remoteproc@vger.kernel.org>; Wed, 3 Jun 2026 10:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8jbjEtYmXkjBNahyGDfrzMdPepXxsuU6kZsy0YicpI=; b=KTiAZyRfpUnB++l9
	LzgLfI/6TSw03aQNyl6h6MaKHkXOMsLzcvqfSFAbInMYFeVR5DHLyf6bXEGPvUqX
	pQyKYZzHGqI83N3arPTn2ZgR4Vi46fWGQEStRmThnv/ziDdK8MxdPzD5lbNri082
	jiRevfSW5UnD6giXj4K/BEtppK/hgLHM4fQ0tQw6K9SueHpw8I+i0NCMMUm/A3pA
	SuYs1VSPUlShr0au+HbPSW+hX7dY4rxVBCvrHrBmwxAXx84eQT5ojc8ILjLkTIdF
	zgEcFLlZA8oEpN5oiwnQ9LvbAF4551r6s0o6D/dJC2bAoUwWpNOjE8yuaXCIdD1j
	TH+QYQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ej6a9jxcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 10:14:52 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84245e2bb00so3052136b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Jun 2026 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481692; x=1781086492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8jbjEtYmXkjBNahyGDfrzMdPepXxsuU6kZsy0YicpI=;
        b=kSfqtsAj2h1p93BYwYqsivMnNflA95gwKGMnL90NA7hQqT/f+CZ7WZCpKgyVTTWiRQ
         vk2lz9ELnJsZx0RQ1e/2ogQXZCFigEfXVNBNtkxXQUWhl6ljbanCLwm4YuZnAj/S6aAi
         hOGS/8rA4yroaLQoAZ4cgsggXKgCrOFDJEJUJZvBR3Fsyg0t/vsW2qzuz3FP1oOn59XC
         /rwrBbVQ343aQH+e/qJwFchicvY/7c9CFMXpx66JCzD4GMRWVpxhfmvf6n3e9uaCk7c7
         gH7Vl/khHyN+bRHB6oVPLJAhjnaKz7C7r0OFRVtytXxR/uJw6/XSvf9PrJisjny3ThQb
         feLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481692; x=1781086492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J8jbjEtYmXkjBNahyGDfrzMdPepXxsuU6kZsy0YicpI=;
        b=KAB5mfUPv/M6sHUFBkh6Q0Q69Q9fXFjGqWZNK4oYm/n7oA/ihx1gU5eUyOXA0q3gQs
         8IuvGFr6wXh4vwXcZJZ9gi8G1SYM2ONn9GE1+kaqgpe3vU/DsklM5vDkJZ1XcDilGwSi
         C0DdL1b+oNzs4SKSVGOaZmSEKX6LcLxDchvQ3Xh75p3j0Xf6JLQ1aHUm01+bFKk04kxJ
         oww/AMWbznrkZsmB6YRhU9jI59zp1rOlmtRyKILdAjYSZ13U6fP8824EJWM5gY2jKT87
         cmdFEMScu3WKHhyDUXJ+pUfC2I6JV3Hzds7BrXZXy7LdyhRl5JpXwTBOM7HlVXPWU7Ks
         VY1w==
X-Forwarded-Encrypted: i=1; AFNElJ8TVcOkT4pojMy9ZHeU6sW+R+A9/jw0/o/2SGq1voynF5XIvOSaufxfix2Aj8c0XypydY4gzLDF5oEzLZGzc/WN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5OYkDba647uFCrEPQnIyZeuooceDCCnq5qkpYIfLkUwOfQ+4
	cBSV0AkQ2vDm8qcNfqO0zXlBU2sC0qiMnC2hURFN6uvXXK5h88zCZLmI29ftuVYI86pBaXvFXFN
	Rt0Avud4xnQFs47k7/yeiTiLLsme4YWM0y6G0lzyBia9QjnaQK9FQsl69CconG3D8gf/JrErh
X-Gm-Gg: Acq92OH3TuTdbc2pGnFRm21tuXnXSohJbIDWQNzn2F3+sYGM1olJONb+4LHR23IiqbL
	K/eTxPXv4pzNbu561Y3cir5m0NukZSAbaN2DWtR65y8fldaXBys8ROPOd65YcG8v/rzG6xb4kE7
	BaSDB2O0o7dVaWhbKM+or1MWrmFGmtPYZdj+4AotDvor9g8fp5S5z5EXQjZVOgbmnv1gtMLUyn1
	LC5I5mbaqZQE5DUedUOSqWMJWY3AEa/9ZDWL4wKepkAwl2yzvV2GWgLaz1QIeP/j5kGuPpkuE7t
	spy9mNowIIr3E3267ppH+2+8YZRdXsCwzMDU3Kq8qDxOZHt/VTz9GgDgiVqCV+MQbf0EMfkS8cO
	5TiIS5gnqs3DwYlQtB3R9LqVGJI6neKaWZL/AjlnFHmjNrHmH0RAscpXe4d4=
X-Received: by 2002:a05:6a00:1c89:b0:842:2efa:5fac with SMTP id d2e1a72fcca58-84284a85991mr2725748b3a.0.1780481692211;
        Wed, 03 Jun 2026 03:14:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c89:b0:842:2efa:5fac with SMTP id d2e1a72fcca58-84284a85991mr2725720b3a.0.1780481691743;
        Wed, 03 Jun 2026 03:14:51 -0700 (PDT)
Received: from CHUNKAID2.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e02f9sm2463747b3a.48.2026.06.03.03.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:14:51 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 18:14:30 +0800
Subject: [PATCH 3/3] rpmsg: glink: smem: Use modulo for FIFO tail
 wrap-around in rx_advance
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-rpmsg-improvements-v1-3-dcfc22ed69f7@oss.qualcomm.com>
References: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
In-Reply-To: <20260603-rpmsg-improvements-v1-0-dcfc22ed69f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780481679; l=1194;
 i=chunkai.deng@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=OU4D6VlRdhjfTz2yiRjWGJXP0ElAyKuAC2J0p8/GCyk=;
 b=GZnF4XghOPx2VQtWAqPUnarVMZF5a546d0cWm5HkCXIVLFf3ziF1A23aEr6ddnS2hs/gW9Gyd
 PtjBoSpM/71CztWFiBDFNMN0p7ZUIuDhGkHqLqmq8PbC8nBjLmfG5Z1
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=NfifEElkZxgJ0ghUBxNu1RTaEqtoCGYDb0k5UzIRXOY=
X-Proofpoint-GUID: 6Tn9wzM2AIUYOpaXX0YkzfQO3fA9kMSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX6NYbG/dCOIzM
 L1wt3DbROp4pddg8rK7q37xogMDO5T9pHLU2ladEVt97IRR0965XmYe8UmnyftNoC8GI52BnuXJ
 DTWLaLXiWPWguT+/KGHa00d3zZCQOENUjloN42o48n4IufOByfayswj2/ySqG4rMYQ6JMJ31Wsj
 UHsnwNLXKefLRmFEIqnR/Eho3SckqvmMOYR5nkEaZdGvdJMQKdbq8UgKlsskmy0mczLO9OOLeYq
 9xn7mxZwpiUTaNdEF6oqy//U3J0D+VzV32f4fCMMZ5983CPjDAicYLUeT8JVoX5yyHMlHnGAiuU
 SRGbIeC3JqmxDzIq0jsG63w0K0E7iQ4y6n66PaaAe0DJB1892I6fEWTDXkkSiA/OHWC/06Rfceg
 YqynlhViK93jckObhJjnOg+6rzp5kwOfuScu9Rh9GW+dj89l8p3jS/bXpXKEk+qLe4T3T91rRc/
 jK4Dig2Ss6PCzJRl0/A==
X-Authority-Analysis: v=2.4 cv=I/9Vgtgg c=1 sm=1 tr=0 ts=6a1ffe9c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r6yPUBAwCGnPY4Z8tCIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6Tn9wzM2AIUYOpaXX0YkzfQO3fA9kMSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097

glink_smem_rx_advance() wraps the tail index with a single subtraction,
which only corrects for one full wrap. The advance count is derived from
remote-supplied packet fields (up to sizeof(glink_msg) + 0xffff bytes);
if such a count reaches or exceeds pipe->native.length, the tail remains
outside [0, length) after the subtraction and the next FIFO access uses
an out-of-bounds offset.

Use modulo so the tail is always normalised back into [0, length),
keeping it consistent with the index bounds enforced by the WARN_ON_ONCE
checks added to the FIFO helpers.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 42ad315d7910..4f143921b719 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -129,7 +129,7 @@ static void glink_smem_rx_advance(struct qcom_glink_pipe *np,
 
 	tail += count;
 	if (tail >= pipe->native.length)
-		tail -= pipe->native.length;
+		tail %= pipe->native.length;
 
 	*pipe->tail = cpu_to_le32(tail);
 }

-- 
2.34.1

