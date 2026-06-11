Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F1279DAF
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201174; cv=none; b=nAmivEWctv2yalusKwM0EjNGWbMtsDmZgDBQi8f/CVKK++ZB12t9gW6U918fQiMLGMmZYyjtieDxqD0xolQ+XKsE084+IksX5D46RZ5igCUFcc3+k25tWZ7lo7OnL2ZVbIrTrLiA1iXPY6SGL8d0aug3QC7iDK5C5vTdHkUG6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201174; c=relaxed/simple;
	bh=aIk3TcChQ5IuV8IL19vVhpsOeAvsABtAL/QPCpV7duk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jz79ttwqqFEYFbbhwAM/lNVdGXLUnTL+WrsaeEx7Tv2MAU0tNQKoT7UDJ4Spuff1vfG6I/ImyYDkOgdqK/IxiZ4B38baji8k410k3947mxHFhWYGOQBljMAqNzI8kALAF+Ma3UpWgZwC+mAAVG4qFvjlHgOEWSqOgGCGv5QniUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTbkyQx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8eqpglr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTbkyQx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8eqpglr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BGrHdF1197105
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k0qbBT/9urY
	dPUg1RIj4+KymrlylDv6edhLmJeD+IfQ=; b=WTbkyQx1L8iqdxAOg8rjQXmQ7r9
	S+YpnQFN8vU3VBpkDiSNB4qBMRJe6PFYXo4eZlq8zabvhfzqXGppqdpBBXGTEfQr
	hHk5WY07DeVJeMwedp2V8VYcz7Xq05WvGPiT4xKIAKONoPrXeucsE/RzVDSsiooa
	kkH84awFsGM0VntTPFruKZmMKZJZ1y5mlwMgefsR71Zk/F1l8s7UOgTDN2M4pbX0
	V7+8Anc1DGXQQ3hcWRi6aVxaTa2K9KyhU+y+8MMOqJ0eWIAaRG+KogeZTEyLfGN7
	RsJwvJ2mF5wiQWKZc2lDWtcXVrwAcpUBkJTqfoE0CdRHT2sp40+MyesqgWA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0xd0bub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so61319a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 11:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781201172; x=1781805972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0qbBT/9urYdPUg1RIj4+KymrlylDv6edhLmJeD+IfQ=;
        b=C8eqpglrMCD8O8rsyPFJU3AJ2UfNt07guIkEtlsEYkN4VtCOZ1dESvNbjUgmhJhMp4
         gzl3J+ZDxCewffImGoDfStrLP4J2P3E4WFoEI2ONsqZVT1jTVixKUN29vxwVdR3SCcrW
         CUiOMQd5yEjhU47XUGCKILHdPia47wEZhU7HrGt1I7R/djETuPV9kr5eFIjRFXr/tE7E
         XN2cyB4Khr/XfqwGU5nnxo0MnZtQf2YXwIuBXVVJXOI8ARW2rsPUTkmFLB4f431hZxZi
         xXFJU5IYmtCW+J+vVJabtBEOEusP9rqU8aXv3fWCY+X0RZnzmE2Fb11O7DqkZRHqYwYB
         w3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781201172; x=1781805972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0qbBT/9urYdPUg1RIj4+KymrlylDv6edhLmJeD+IfQ=;
        b=nruo5WsPyle9MhiwdhrfFSCEORAOKDvKRZEMNJ6jrNFR9bXXer6Wg1RGmBO+dp3hHG
         7NYhW2bJZiB50Seot8zpOsQkJA3vinKUklR5vY23MR01rIZupXnYgeYd+aThDlgi+2ex
         yYFav0nG9+mJwJI9U7F55awYzrO7SU/6/Q1X2He6fNe3R6wzh32SbLmABoZg9+1nu80q
         YPX/cWi9hQTU0BS4CPOvMynyammFZzquhQBprZzNWWDv6qgUDAlEl7Ztd+R/3Vp6x4ky
         EpLsGqWl45qL+xBtCRQgKDMOTmmnjz5yf71N/jNCqPOByfeddctkALOC9/Syjwe0j0d/
         NaJw==
X-Gm-Message-State: AOJu0YyEstGefTip36cProqZRYuqbrHNj7CwFwsRzFhdTFG0gNYYCta+
	BRwo13p+DQqWuYho19s5Ikx5HvKD0m27P1r7XaZqu/Jfqrt+WigdLdbMMpg/zTLfM91eRgR+Bva
	oedohqkPnyBemm1YNhh9Ozx0VtJ01bLobH3KNFg8PnD7jZlACYXj9SPdkWN3cxsKw4yc5qBzMVV
	6lFgZG
X-Gm-Gg: Acq92OEH2S0LzDB8OaBWa55mSY0mLCXSw7BAoU/8kQ/gnFDt4AtFlz85QoLgT5w12oe
	C7vRymMifLI4YxUpz1Ge0+KsCQFHSy1YutLJH/5jnIs1cj+sa2plYUtM0bDMjPY7sXXhOqmDS/+
	JWpILcz/SSJ8NFGIgcSX0zb5ux+HQivKuwxiIQ6g9H0dRmaDtr0mUf/XRSXXzk8uXauBe5bqySL
	rWwzB0SpmYyzYyZnx51zMguHojsFVYB2jhq89/NFL8y3InwTdYkHRit2fd5L6KipNHfly7fiWUY
	qjzj0JQOT7vZEKy07jITOIeOEbM0KTxyU02Vea2wvxi3/Wh3rBzEvfVfFFVQhXcImiwKtDYoC45
	yqSkcWFl0S0+8wtHuIGXtR2TZShYDTh1Q1Zq5Qytpm2RDxDyY
X-Received: by 2002:a05:6a00:27a8:b0:842:7436:657a with SMTP id d2e1a72fcca58-84336a9edccmr4550762b3a.32.1781201172186;
        Thu, 11 Jun 2026 11:06:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:27a8:b0:842:7436:657a with SMTP id d2e1a72fcca58-84336a9edccmr4550724b3a.32.1781201171610;
        Thu, 11 Jun 2026 11:06:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843382e6e80sm2597688b3a.42.2026.06.11.11.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:06:11 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/3] remoteproc: add SPDX-License-Identifier tag to remoteproc.h
Date: Thu, 11 Jun 2026 23:35:49 +0530
Message-ID: <20260611180550.2442641-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com>
References: <20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eZn_XTZq4NArDQeDa7AL5uslW83dA38K
X-Proofpoint-GUID: eZn_XTZq4NArDQeDa7AL5uslW83dA38K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4MSBTYWx0ZWRfX+0Tj4Yqokdgl
 t7PEtVQq0q8cdLdqIDjGBSJvHkfg05kS7D7o1qL+jzaKS4CoY51Cft2OGgL7rC3KwZlulYhAKHm
 isSeZTSmPhrNxujUKy5iiKEN/1RZB7UvpEARWXtcQeKtHM3kb8w5khcjDkccBmgWKhhoTwV+qYD
 Hy/ukUOgx3fgRMJyBK4QWQBzo0zKayeRFsPQdsGZvH3R6vFUAUoXyim1jAeAXGSxSV1pvA3et1t
 /Gt8HAmmFmADgxrUrkTC5kqq2uFznwvvnDVKeh1o5yZgrbXZyr9G1UYrTGG8S8R8ysPwOD+zAaI
 GhTG+lktbfprl/Eq5BsXIOrCEN3sHFsL09nYW8xdi4//0Cx64IQHYaWG5HTcTxuVpn+zkbzOmhX
 aTh21Z5Ur2BUk1XM10+B+IXAcX65748J2HapKFLMJM/HfFq3dfZyeFq+k7IGYo3tEC7T86/BHau
 CpkVuHYfI0iSAGXUdTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4MSBTYWx0ZWRfX5WaXjrWhvSKT
 kXKHFlgk8hBvriDxzbGW0WndRj/Z+AEnRAgwsKBnNojOCCH3dayE7yKiexyHcsW4vvDmRvZcqvz
 91epXKiaqJ1GP3+awa8I1eUwUBb/Y1I=
X-Authority-Analysis: v=2.4 cv=O6UJeh9W c=1 sm=1 tr=0 ts=6a2af914 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=T68lCUfF0cZtX5xzJ3QA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110181

Add the missing SPDX-License-Identifier tag consistent with the
BSD-3-Clause license text already present in the file.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index e0e212328acf..6a8c694551c7 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
 /*
  * Remote Processor Framework
  *
-- 
2.53.0

