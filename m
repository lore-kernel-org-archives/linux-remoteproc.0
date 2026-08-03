Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C40C403E9E
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757428; cv=none; b=B2lm0sNj4zUAPIJagnZAYAFHe4gTz+EK81eNCsItdtY7Id0E6BxP7d2AFNrBicEGuE8RH2d2ApOLPTArwY11HSQ2TuBLhe3zNnnBfDs0CDZo1wGSUWlWseMYdzqv+TcPxvpiklQ2NXTLIXnDev9KY8ZEllwWf7kaOZo1NSXQZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757428; c=relaxed/simple;
	bh=3JUoEyMa0JKn72MvnaJ4d8JZLo3hjMy1NTJNOe45KK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmYCQLDpn01TrSH70/7WLDlC6kyYQpo7Q+wywGPwbRrbb56WrHXkcszJD9l9yLBM3HmkpCVmC0dhA2wPKxejmAnhR1alV6wVfCwwDHMaE+586tpI66DyIcVEGlCCnN3I7oBFvNSwH+6JXlKnA/C9mYdzTHR81B+zBnsUDI+zYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4elcgQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DqQjsMac; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4elcgQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqQjsMac"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673BDR17413950
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 11:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9rqzNBN+1bW
	0zeyui9c/oOu03uJOYQ4kZuyrzlXJujE=; b=I4elcgQAcoOM6aAPNJ0/R8PJEsr
	dJXmyAo9bEGvfQDOO+n6GMtCANDf2Qp57a2PNs3lQ2CzJUXH8liIdgCyFgKjF25f
	YP4bpo/gjDMt/s9bUh/FKE1oaNxpz9h9i5wzrgDZGBYNqQ0IFTlEbrqyLxxMjMVO
	h3e0arVYXci/6Lmyi+dMmC1pgsTRVekkFTVCFcf4F4jnNhawfrwCULIfpsqoqiqS
	UXA1M1ONJj2FLIeouOsvKr/yQS5imxoxeeMm9sndMIaBvKh+faK2PFt/KoVNrBq8
	8BmbizJK1vtFCepB3rsqYYcTt0D/v7sMLyjcZOybBo0QMrPeiSu9/0I8iyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkhc1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 11:43:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso49108705ad.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 04:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785757424; x=1786362224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rqzNBN+1bW0zeyui9c/oOu03uJOYQ4kZuyrzlXJujE=;
        b=DqQjsMacHsrMPnnjbXoBPtyffo1Os494DaifgXnjJAjsTZvYnlni1XnTqNXKR74FWr
         Q3A0SjT1Qwpa+6FnE1dGueQ94Nuxb/NeK6D/C04+vJGuVftsf4DGLAsHDC4dbuy0VL6j
         4KUx8NzRGwd1j36JtyTAH8RCIRom+hqh+xFz71wShPtbmIQRSXZ4SGyt8XnBM7fSQ3f6
         iYUMp0D+3oZSLtaAbPHkCmykdbIsW8TWkW9RON1+WtMYWNJFU9v1XKeYwZUruvDUJv2F
         bO5wIgmvtL8Q8vJqPJAiolE02dyvXtAoc6qFxLoXHcvfP/1a2LK/J7b+4GEeGJpy6bfT
         yhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757424; x=1786362224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rqzNBN+1bW0zeyui9c/oOu03uJOYQ4kZuyrzlXJujE=;
        b=ih3Z9greyxIJo8mPRmKOFeuroBY6Syfq8RnAcmD/Gn7GV+e0AQa+eD0A6XHdQ0i/b3
         kMnPtk/J7OpfPjgmrcXbiAKfniLtnYHZARO0WQHx5IB6aUxD473Wi4j9o6xPCfHC49zy
         BqGyMCoCK7SrrI6RektLhyznEONe+MM9HA7P7sOsH0vfW1k5NAzT8Z6mVOdlnLft+XXU
         YKNZummQrsM+GPWuDEw9PGM6K57tzLhKCfSW9Yrg9SuIFH68HpgckLmSa3flXzIOlKYY
         0Z7zZd7AUsROIitiAsCHULSV2CW7R07Or84AF1Rzge+j2t+a0+rPlqbY2qkUTKZqBvsJ
         WMPw==
X-Forwarded-Encrypted: i=1; AHgh+RrK3HCDAvL7HdWDnwSMGEz2eIOTfPQLcvG8qeSROOhDfr3+Q5WtCvWuQA88k23H4BmuGRK9/PPx/0MZnhkqqJ1g@vger.kernel.org
X-Gm-Message-State: AOJu0YwQdgeUN41PPRp141Xl4Gzr/vnZu+JK9xuIdX5sscTQH4ja9s+1
	YPaI2+uPuQtezkPJbTP6mqD5cCH7waydCRADVq8AjQdHqXLCPMB07RbVt2Upri+tq+Rq2LcJWe6
	T96T8lald6/Ifss44a8XE+vE5bzS8EpmFea1MPPeYglSxi2xDnV7w2i5etkEY5zIrLqOFVmfE
X-Gm-Gg: AR+sD11sq8kCPy/dnPFP3W0HMJdWcCbtJQxNSD4wxYQ6814V+2y5iW2nUHViz7zawsh
	GckkIpmVDOj32kUZoCQQYKljG7oTWeHR/xC9F63rsBlCXYAAfz2fs6IY5kBXHa9XFY4bCrePAuh
	y4SrTVCAh5kv49H6DoOu+8FZTqDRw3Ky9LhQjkeqlIMS5Ws4YsgpOmf0zVDm7Jf74KRgdXZsy6p
	DmyB5CVs3iwpvKmymgMTDxoaIvxHyELfBwqqwY+CFNklSLZiCBLPZxiNYGfeQae0x8rQbyuBwNO
	Ui2T6C6LPeieyxKLKfxRw4YyEKzbknOcQWOzVGqf1sIMyPq4Lp89EIk9ykXtjRHuSSLUIY0Yiq4
	jG0wq8kXVSXH/HNcSI/jAHW+soKQ=
X-Received: by 2002:a17:902:da4b:b0:2cb:2b69:8d53 with SMTP id d9443c01a7336-2d0524d97afmr98489055ad.37.1785757424249;
        Mon, 03 Aug 2026 04:43:44 -0700 (PDT)
X-Received: by 2002:a17:902:da4b:b0:2cb:2b69:8d53 with SMTP id d9443c01a7336-2d0524d97afmr98488625ad.37.1785757423748;
        Mon, 03 Aug 2026 04:43:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea83fsm37110735ad.45.2026.08.03.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:43:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 3/5] remoteproc: replace BSD blurb with SPDX identifier in remoteproc.h
Date: Mon,  3 Aug 2026 17:13:29 +0530
Message-ID: <20260803114331.3277263-4-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: N82hljeXFxip-knykz2SWLhki6YUfacL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfXxK6HzUKEnTyB
 LstII7ENie3wsT+/4dq4Z8DKEh32Bx2RGvG2TIAqbX65l6S/SVNKOwi1FWzP4AX7CeebjVwyHl3
 mE8GBjNzKyJotCVPs3x85TViyDylomvurgyP2ytAafMwimqVv/OGEjMOQZe4C5bVxt7wW3zav+B
 iuKVfXqwFmHPeabNf3F5wbPlTJ8sz1/Kz9FsY1gsL5dOT/WVJCBiUv+ZYqJHwLRN4idXtNqGGP3
 j6Sx3KUGmMd6wcb0PvqPZTNZ0aE99Iu0gOiMdaxzWjj5Yix65teJUnHBal//XTsVspXguezgGKf
 77+1RsMl+R7NecPNNgxo7cuaSQFAbMkJNjlvoqKY4YoTxUZMJznehKTpuMKrEXlcvPEXrkxF5vI
 k423YmYsdhJImAc5Gj49GIhefNjtfQwpRaEktX7bSBMpxQ10hlDI1t8P3MyEqp7PWleN+YjTg0A
 6JBMuL9Wbto1lZR1Vyg==
X-Proofpoint-ORIG-GUID: N82hljeXFxip-knykz2SWLhki6YUfacL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX/KorGP3LKHFu
 DZk5W9e9I8qEDODGKNeOcy8bnv6ihsYa7J3+onXCsiyD59JxzUuyQXhjBN+2kyt3FHQ1VP0PMDZ
 xrQ+wJNyDNUkmrndoE8j6SeUlk9VrCk=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a707ef1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=D1lyqigDe3d0dfEs8yAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030105

remoteproc.h contains the full BSD-3-Clause license blurb but is missing
an SPDX-License-Identifier tag.

Replace the BSD-3-Clause license blurb with the SPDX-License-Identifier
tag, the standard kernel representation, avoiding duplicate license text.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index fe77436677f9..a44368737b39 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -1,35 +1,8 @@
+/* SPDX-License-Identifier: BSD-3-Clause */
 /*
- * Remote Processor Framework
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
 
 #ifndef REMOTEPROC_H
-- 
2.53.0

