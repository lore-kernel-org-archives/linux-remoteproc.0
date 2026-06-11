Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5E481FBF
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201177; cv=none; b=XtDRwqVkXcb4x97bX7V1FNNJsYwq0/E+gaylamiveZCSs2ryL0WgORtaXdzlQRo2lBgtkoX61sobOkEqMWuyJssjTc6a6H1qG+Pl90VCYKIrR18sN+6PIk6JX86BENsA1rhXndFyu/VSAQ5DP5P2TZ9XbVE8WgaTOZg/2pUsbVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201177; c=relaxed/simple;
	bh=Ci0FyeTmDOFK4LCTh8I+5CcNNYaAgABUA3xoYj7FDFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CN1xOuteIbiALFZi4eH7EvG1QFsaNGgxxXIgOt/Q0rAj9kk9vObIXtneSA5Fp0c7iVmC8jEtZuleCMUZjXYMnrdTS4rjgFpIVLyvhFaD5u+LwGiMMnoDh4LjEqQBhHgWpSSMhk2lIAYlzYm6+HQj7fbqgEsSSAxP8lg4akeKS+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pELygab4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7+avxxS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pELygab4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7+avxxS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErvKB943291
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CbrOr2HxeGC
	QdMPjyIdRiyuBnhXm6DSlAyF7/NFtfp0=; b=pELygab4a/sQsheO80sNobp0q5O
	dcbu+Yqxd6JYNbx7OffcotAXNaqxZ1Fj3j8biV8ag9h2Y4XQRlEhDvkKBM2CV7aT
	JWuJA5tIrghsevDlzpEoXPDSYHfZ4WnANM9hpRjXY2QAD/qg3MYd3iA2ckBHNT0B
	sOnEoo2muxlGHfvwPWuhogZuGvTC8vokplQjbQYGN6FQdqBl7bwNVnsC944HTZah
	Pe26wdea3N8yFTtxloy/XFYhKpSheU8LJZL6AiBDtvOWSuMakVjCHMvQtbsNqi3H
	m0ZUpvCD0ndLZRq85BypZ1mxH4htU39ZY4g3DsJynNTvgy5MnxsxBunTd1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6tn1a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 18:06:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c85a2c0b56fso75532a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 11:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781201175; x=1781805975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbrOr2HxeGCQdMPjyIdRiyuBnhXm6DSlAyF7/NFtfp0=;
        b=a7+avxxSe6TXMu7JtidoJpmj88R4C14iEJ59Q/RuGBuDDSRd5qFnGBHV6Asb91Joch
         2OB3tPrE7vYKS9t7ekNDWA4fuDSd6WCpDHFqefpYiehr7P93og2sCnWRSn68UrkUqbzh
         CU1YY15TzKWk2P8O0i6q4L4QeUy0fPHCKj3uYqattsuv99A6qGLVAFziU14rOVQbhYAn
         92Za998X7UAa6pSmgXqsqtHPxoM2iQ/KAOfTvUjugGGjMgoWoLnL7QkUSsnjZypGGYst
         Kg4kd4ROCkLHbll5Hc06XKKnFKR/gMl9Vaqe9wIQk7aZIkoEb7IVNuiaJFvSa87AiLQr
         wEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781201175; x=1781805975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CbrOr2HxeGCQdMPjyIdRiyuBnhXm6DSlAyF7/NFtfp0=;
        b=a6cq0WutDZugr86HC9OdjzRYFfU/nHbM/KAcBeKW1rE9Mbi56N/NP/t+ck03Bs6vmI
         w4QnT9KWjm3M6S6zFtQYGOwswq9agzdthx0LpqEyiVHGlm6keSEnKU0lwezQJ085Y4Mn
         v9TOjFUKiGs9BaviHWSVwXeb8VnGnrrUrnM8Q5SomvXYbR0llxRit0u+Hr1M48scyu22
         2HN0hbgMBGtUlkSfW5FuY3VPXRuPbBz8qn2iNiLyuCxh7+fMNatYs0nMhYdCERJonZk2
         toAP1bk9ky11a7dq6HAZd4Tlwxy7jNSd6lI9lhcQatdKHpmkM/ktHrrvsBSVQeQZKEUc
         gQRQ==
X-Gm-Message-State: AOJu0YwRTqNWdHDNb8mFcZLfsDIp2dtxTKnv1spqTqHd2j+Ilxsk3rXH
	7aJskGtc5GVEptZMX/CG8Qhcp9VkbDAIKFAgOGiDkHhrKWfaJsmdyR+JmRAAJiK8oYNbhcly0W1
	7R1W5Wn1CNyKZ87nlXup3KCbNHGjNIih3oVkiBr14zxafg1UF+2UxaPOAkwV0W+LPOXtPqb6z
X-Gm-Gg: Acq92OGQh6vL7bE0/3mvEumTJN1hSjO/j7S2x55qd7vmqE3Fr2Y/Qh+aKjbO/IvFbGX
	nvuXD1doyWRSRn1A/F4mQLAkpIkXnAghQ+H7mcuz2fe0C0KixSx2eq8ObQZ/Z28cmMJRoCrtAD1
	ISxTlOzVM5ylYpar0Akie6OA04D9leBXktsIAW2V/PesqBnvN1tnA7FOUepzpaq3Y6/vieQYkpp
	/BUiDBMAaIcNbZHL+6I9FMUfC8HDylLBx99rzD+hEa5mpmELd+q89+ZxIT1vtrJRK4TVwSCQNo4
	Ao/uwMHwHwTlEaeFdlqxKK9RCBH1G6wzj2KSoeBHRKDbfq+XimjNNJEdZwWqJVsVbFKCCpP6faa
	jqSj+fsCNMbz7W9Lx8I5U5yehafb0mdo36iqK/8vhVCWYDwsc
X-Received: by 2002:a05:6a00:4199:b0:82f:7b98:e499 with SMTP id d2e1a72fcca58-84336de3d7fmr4462718b3a.31.1781201174753;
        Thu, 11 Jun 2026 11:06:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4199:b0:82f:7b98:e499 with SMTP id d2e1a72fcca58-84336de3d7fmr4462680b3a.31.1781201174293;
        Thu, 11 Jun 2026 11:06:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843382e6e80sm2597688b3a.42.2026.06.11.11.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:06:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: add SPDX-License-Identifier tag to rsc_table.h
Date: Thu, 11 Jun 2026 23:35:50 +0530
Message-ID: <20260611180550.2442641-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4MSBTYWx0ZWRfX3klDr6j06W1+
 NwTVwktPbyp8Hd/bdftJPrmA1GoY2DQgEaEjdhwuhqxfmP8t70kyrlw23bXugOeFeneajWN+Uaz
 KG9gqUbtSbUZaXvoTM9DIH7i405GGXEDMlP3N2cYXtUhtVFZvwGmDkHzFEj6E5JCKpdGaW1Ik50
 44K6kE0uoiSflB6f6NEO6umf6zrsYXMAOHem6hWaQsT2FSWsqfsEkLUZ8Vz3ksbsbzuKmUcxmGq
 ree5mEWg+7399exdQ7wkfPG+q5R6uEcGZ56xrZ9Xly+CoghkCj1mj3vSYhs//4dUKLoeXNpHXGh
 pydRNH+So2b+121nYhCIw5FwaszniQ2stcjRpPBZgVEcX5F0fRhcM0qFndZsCZ3vYj0PHlZj3RQ
 H/1aWb6lucelAB70I+c+W/Q/n8txl4OlSqh4iCwblswXSwiB4hIJxvkSv4Do5j8e7bg08ZcA/ET
 B0fsSzRV+VwrIsYq20w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4MSBTYWx0ZWRfXxNjp+IF3JV8i
 xuLoDpGUInSMF0bnrPJib/8DTWfgTqT3fQrTt5VyBRxfzt3psQ5EReXtsAaZh6b60ZIj4jvXg2w
 QaCQ9ye9+2FPGjPu3JchBIptlDK7zFg=
X-Authority-Analysis: v=2.4 cv=AaiB2XXG c=1 sm=1 tr=0 ts=6a2af917 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3h0Hr_wx8Ew_Xk_TzlYA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: _KHv8sOUqvSDfGlXewBeCLX76KY2IStM
X-Proofpoint-GUID: _KHv8sOUqvSDfGlXewBeCLX76KY2IStM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110181

Add the missing SPDX-License-Identifier tag consistent with the
BSD-3-Clause license text already present in the file.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/rsc_table.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
index c6d6d553d8f1..b78c4760d83e 100644
--- a/include/linux/rsc_table.h
+++ b/include/linux/rsc_table.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
 /*
  * Resource table and its types data structure
  *
-- 
2.53.0

