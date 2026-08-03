Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC4404BD4
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757430; cv=none; b=gkclpLVUN/bhEhTUIzl8RMwzNFB7tZ9IQpI9tvwfVBiFJuQRT+IHDc8/t7Qa3TC4khJMr/8/BHP92CQHJQUVruWDMxUH4fHdt4isdDM7xmtVF7VEFjgghAEgHsg7JI9DfZ4tXp8PrBeKFaUhCI1S6vAPazC6cL/9gKTCF0FPgiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757430; c=relaxed/simple;
	bh=bLJ/lVvTRtDaUBWWKKiwGMk67AXAmfZRDKg3z7s9F+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCKDfQGdLKBGRJ13txqW3LPdBFGfwmQ9+odXi/BOtEw2TEKR7DowZhNkddiuRqeP6Q+GHHezlqX8TlQikPMjE0NxYsMNdNHro0n1oIzKQyMmEuFcDgv4TPCxoq3vwu3UX0i8aJdUgTcbXfRlQr3vVFaN0jHatUHaJ6cHTPdzUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIRCCzOA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RU1zY1iw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIRCCzOA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RU1zY1iw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AodP5051606
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 11:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BPrnpazX9W8
	+valBkge17tD7Sjj7HMf3y209HKTMU0Y=; b=jIRCCzOA1BV4xuyMxFG6n4TUwIL
	Icu4cw4IYztur5pxllfUDSCzMMawBjbjAaCjvmyHa6qgJJvpzkDU6QZLoK4unx9d
	0pri08A4pfB+3T9/vW5tsXSBiwbOOAF5lMM732ppVtauFl/CIkXLo/nF62pdNMU1
	F8y63H5cbM2zt0yNh4mBXViY8i/JfFnVG1DPFC67DKcwBO9T/D8AEhhSnib2vxBn
	i0iSWRuauxeY33FYJXOS8s21nM+7ZgZfbI05yRmaQqyv7fXJBgKeYI6Vb0+6NFBl
	AbOh2UcflhV6/3cS0GYXnKy0P6OcaoxKRnSRNR6aIXiWSqZjwYvocfytX5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrb9aux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 11:43:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf1c86963bso36529655ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785757427; x=1786362227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPrnpazX9W8+valBkge17tD7Sjj7HMf3y209HKTMU0Y=;
        b=RU1zY1iwMrKVLV0ibCeM3/ye0b/M/ySuufxRxKYqYCGDbgw32/gmoihYyxenc73jI9
         yEbUAGnen8ZCSF35gFEHvy0Xrfhl4hnhmS7PjxZRHM4dJk5qMfmZSCdLiBIOclmgiB2P
         0jWMv9sDhXxf8DBQZfgKSxECaWr+7RZuc5D3ZGlMzcW5qRXZa32GIOEILombQyFkdc5I
         432IkDQePSGcKM1sVQw+HfLgDyATCWahJcCvfVu/XzesGWBgDfMthW1/ZamSUlmzSIV1
         WiTudR32Ek6HSJWiJHfy+m790zKJ+dwXIcbmmjjo3z9FgI148vxCCc1eeSg+uZaXfiAH
         p7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757427; x=1786362227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPrnpazX9W8+valBkge17tD7Sjj7HMf3y209HKTMU0Y=;
        b=UdmYe8tUTXwYWA/PcxdVshMyUjaqN3HwoVZ5EySKHLYtHIsh4hHJpl3B9WNQH57/aQ
         36JMpR9JT3r/a26SGGG6ClRl7ERX94sgoxWbckELe7w/kramPUGbTFooneTbMTFL/nad
         EMXeSpqFj068ZzpRB518fUbjZaM5Bj5esdUtPUxQN6fCFOWsfLBNoI4UtJKTEDpWsqU0
         gkQxDBVWydvLX+mkSOYUxVqr8wU8GesvBjhR8LR1qpaYg2N8hgZGGE4dtEEDbeJiNJuZ
         gHPtf1M+HImZNcQ5oSzaZFLA39EWlYpUacqbn/A5gg/ksLPMiaN8ugjdqPZaGKaOoTwB
         Ti6g==
X-Forwarded-Encrypted: i=1; AHgh+RrHGybKUzRKFwDtpjDrzXXtUTcxDpCOFahhh4XkJ6Tu1P6rr5KQeFzdQ1VPXST08vEWwBvoHuEyPtuMPqfeK0HF@vger.kernel.org
X-Gm-Message-State: AOJu0YxFnVAROFjGDRGyd40882Yzmv8RzF1LjCsRYEjtBR6f7DGIlqVr
	FRbet0kKB2KZTPrahtSvpMGFvljNiM1j4dE/ITYkXFAcIfDq+8OwokMYQa3xq3fuLhXuqJNYtHP
	hFPPqJpVwn+YQO3CtSbMDgK9k2DSN4GwcD+pG5QiHq9yCBfaiCIrbEEATk99oJvTA9Yw+LOPiZ/
	/Uy2oy
X-Gm-Gg: AR+sD12OsN+woppVMA+k/rrhToiOVOKJI6lmZBGRUgmX6v/k1Nj1PvBc0UoLFjJ7NXs
	ThZYdMgA42mf765Tk/HjkZ9Sa4Elfknix3q+/kyUPMCInscdsE3IWmwPrH45mG4NY4OXw/7vujz
	v93gcCxIRoSdzD59rzPiDRwRrDmzQ+dRKN+QMwIhOm75z+0HOjF/tQtu0YM5CR6njS7LN3p7rLz
	JULivTRwMSg13AapvyN+LZPBAR6OX6FXRcECM18yKZqA54ZssJUyp2x5bjQ8mPO8JP2H5FVWN2b
	p4bNoWI6Vms3E3LEjuzOZ4fUnsQ24tRr0KUhTGkFu3qWxBYtg7byXFc9OfmmR1Jom5ftlAS2843
	M1wIb9IkdgV9d0lTjK8r6an1Mftk=
X-Received: by 2002:a17:903:2392:b0:2ca:c847:8e41 with SMTP id d9443c01a7336-2d05366bd47mr87194495ad.11.1785757426725;
        Mon, 03 Aug 2026 04:43:46 -0700 (PDT)
X-Received: by 2002:a17:903:2392:b0:2ca:c847:8e41 with SMTP id d9443c01a7336-2d05366bd47mr87194175ad.11.1785757426168;
        Mon, 03 Aug 2026 04:43:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea83fsm37110735ad.45.2026.08.03.04.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:43:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 4/5] remoteproc: replace BSD blurb with SPDX identifier in rsc_table.h
Date: Mon,  3 Aug 2026 17:13:30 +0530
Message-ID: <20260803114331.3277263-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
References: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX+z6eZKN1NQg0
 2HCkVA6nUO0VhOC1QmqJ8VTKnwYJSjd/Irm42zH+2QXfYkD4bKUphPHyKqG2D2iqdR/oXyHcr0t
 hQgWsgivkiS4ZtodYY7vya2mU8pNEtc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX7txmAab6T7qO
 6OYyC7aeQuFsQjOntQs8RZ6LvkVDaHXI8RrMhKqDcqesLF0sCNnklH5FBuga9xitJf5+1244hj+
 N+ykvde2zf5LtJIOvzFZ1ctXhbOKAdvCchdW9HME7sdF4034/ThpUS9972UcrZEdJAkto8FFZ2i
 1lzrzhSixAU2ksF2UhLRWWHzajWzNAMxT6Bc4PNALMLZgcncqGI8uiOaFIy8wxuZ6o0nQxTgmC8
 Ur3h3D22QTjRkxVkpAbj4A/R/RHz6mM1g7p0SeZF/Epo4+yAtuOaP24D4ydZzZlCwqRkRKUbJPL
 yTO6t7ONuPDShTPGZ6Z1ipZ2rpwZeL2Oa+o3AMgRkJzQPAanU2C78JsUAaI5Mu8jenNT+cZ0ZRb
 SySOVQRUGzKv/kEvJ9SjfP7EIVAlBTikXFgkVJnMfsK9Ljpya4eFP2mXJJSKBHHuG1A01Y4dMmg
 pMvQyWlqfOllAbsTEVA==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a707ef3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=D1lyqigDe3d0dfEs8yAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: AkGWh_QsN5LkPTebHs_j9KQpHscm0ek0
X-Proofpoint-ORIG-GUID: AkGWh_QsN5LkPTebHs_j9KQpHscm0ek0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030105

rsc_table.h contains the full BSD-3-Clause license blurb but is missing
an SPDX-License-Identifier tag.

Replace the BSD-3-Clause license blurb with the SPDX-License-Identifier
tag, the standard kernel representation, avoiding duplicate license text.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/rsc_table.h | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
index c6d6d553d8f1..0ad9122c22af 100644
--- a/include/linux/rsc_table.h
+++ b/include/linux/rsc_table.h
@@ -1,35 +1,8 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
 /*
- * Resource table and its types data structure
- *
  * Copyright(c) 2011 Texas Instruments, Inc.
  * Copyright(c) 2011 Google, Inc.
  * All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- *
- * * Redistributions of source code must retain the above copyright
- *   notice, this list of conditions and the following disclaimer.
- * * Redistributions in binary form must reproduce the above copyright
- *   notice, this list of conditions and the following disclaimer in
- *   the documentation and/or other materials provided with the
- *   distribution.
- * * Neither the name Texas Instruments nor the names of its
- *   contributors may be used to endorse or promote products derived
- *   from this software without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
- * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
- * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
- * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
- * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
 #ifndef RSC_TABLE_H
-- 
2.53.0

