Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07E38239F
	for <linux-remoteproc@vger.kernel.org>; Mon,  3 Aug 2026 11:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785757421; cv=none; b=eDtV7H8ELyEdnmDGjZXAK5Hy8KhMyLufyx19Cj2RnZgIAgnVyVvGlGMwUKZntTCGlYzECQBKFU8WOGGsKqn1f2pLdpkGUbWEu0hbZfqzt2AFfSZP4zlyqANH0FY8GJppccomJniIeBiduYqTd6O2zaMo+mSfuFAGJkLjMtiiQoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785757421; c=relaxed/simple;
	bh=IntWzB387OWn4r5rh/8SxA6CeJkdQHKtYR95rft7l8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7pL5e4cCJzysAVCNf25yYphbAzjqypxVndVai3sp4M5+FH6wFnpKBntQ5PHHPi5iL/t7REdkzRmLe3mpG9juNL80hBCbi870iMq9/uKud0B3wAsPxBsZ0M0eVIIv/GlqUy/wbj4i2O5OE95r6iQLm2P4BhnfsTqPan8qB0avzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRbRsm6P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G96iBLRz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRbRsm6P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G96iBLRz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673B7r073934946
	for <linux-remoteproc@vger.kernel.org>; Mon, 3 Aug 2026 11:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DwuRmJRzblWZ/IuCSw0cNDpitbmnPsx6ct9
	TcHgDl90=; b=MRbRsm6PLXAxgJNz9NpOgj96khFam/6VX1MWQYLu3o0o0tADqpd
	Lli2/yj/lbLD1bOjOWexUY1cAZ8mypi/dpht+FHwJNGa3OtZNuKL8+AwFzexjguf
	nmBIM0RlgKIMmHkwgXvk3pMjd255/e2SFcq0aMCs44TINZTyJSnUB8qnPp41D3o7
	Lgrm8hcf32ZQEZEHKny/E1Xv6Xf42cDnQ/0k9yPE6jC8gRCGYLAk8tsB0FFd0flI
	2RaLlT2h6tec4HfgFGNraSh/+anGrsuRZVlWsMAyqjIT9klGqPVBoXGZb3Whqirv
	WSMuAeJSgM7wn/VTd0pORVjCcX39J16v8CQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkhc0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 11:43:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso49905005ad.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 03 Aug 2026 04:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785757417; x=1786362217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DwuRmJRzblWZ/IuCSw0cNDpitbmnPsx6ct9TcHgDl90=;
        b=G96iBLRz21shN2bOxa4H4alDAxe+W1/4kkATp3LQZ8vsgVoPUBJDJnTU9c8LrS8in9
         Y7L8FTyP151j60iWI/8gj94p2xyJnknPZPqflPw97OQflU4tsPVbH2vzfnC5wFZWjGaC
         x5lhHFN37gvF9LEhFV53JWsSK254sGBYcCQAsd9CKL4NWiFUx1u3JX1aBb3gHQidHwXp
         9MQ8jr5Uci2XzfX4Mm67rqaBsJB6L+KWNrNv3ke8hFGdpvbdC/PV57ZUggorb8c/qY04
         Tu/83s1FZ4dp2t0aKiavGg+NrfF91qGiwGZvawYCsHRVQ53Zd5wdY3HLfUQHYRhXnTH4
         Pyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785757417; x=1786362217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwuRmJRzblWZ/IuCSw0cNDpitbmnPsx6ct9TcHgDl90=;
        b=r46zwIpogluFQhiuJX3ojWoq8ukjA+Rd7biTnM6pxSCoO95aXU+B8pJ2zojKJvipLo
         2DqxCvBPBnp/E89qByVfVCwZ2I+Y2ykMFZ8b36kPY/JQsPYYO/I0RPoBk94km9G48wC3
         /UanQWnuXLcDoLQFspVPXnL6xgnXZMCUYJYw5po7ELkU9Yj/Z2FqFdcWk5M9z6c4Xdin
         PmcpctUxpqsWISzr6TbYEDCYuDaOVhFSb8f6HCCazi5IBtnaiHGGWRUt/olhhysAQ5yN
         QEU/cAlKQu8F+vmi9e5KJ6Xij3xiszyLsNfXg3IGN/P72xt2853u0RSGq+ZLqHvnTkC5
         0TGw==
X-Forwarded-Encrypted: i=1; AHgh+Rrx+zoSy7D+VI88fB32t2eRwuqLLc43flm2yqT5D75k191xoX0z0VriLtl1rCGp3ZjkvVICqdVRpLVl8MQ86T1l@vger.kernel.org
X-Gm-Message-State: AOJu0YznNlmDlKf7bq9bZ8GKAfnKzuU5eOA/qtkPRjsmR3k7Ksn6dXvS
	g9ewriL1UonVsUxzK9+9k75ipdB+l4JnPOpvBu1lv6D2JOyCIBrVP4lcnfFGFGDokM7CX1d5Fwm
	acJjuVvuXdK9/kC1OHKronRtJ9sVWgdr5aVlHvlWDgrTm5M9XSLOH3pQDEhjtfUdOdqF3o1SrZD
	XrO/+R
X-Gm-Gg: AR+sD13Zd9OK9sqDbclEnUUVP4E2lYvt6GPq20/77eyBdV6uPNKzH5AGD4i2AYWqvG9
	l6PDQzQ02TbsJdb4ERFY5+SsZ/oyY+vOvRsNinhAM+yMLVb9dGJTXg9EJ9hngeHqFGeZzPa226j
	jwsb04Zd5kFo1hZ9SOwY69/fjzqcdBs3+c0HuqyKFsBpnOrUYt0EF1GfKM2rAfQQ3h/X9iBmU89
	PdWxZ2DuDxnHIc004gKvMLUF4ZqBSbe1JxxSdNGDUuATDAaCAe+GAXlayDJLQcBs4NWVzVj7r0+
	XjUmFljFU8tzmbVJiaTONss/H7V+V+nZXfENPMVwmfwizdoHDspfbcH3qkbTkMlMRAKujAL9wll
	zB3MMCJL+VBF2AQdfGLEC8MHQN3g=
X-Received: by 2002:a17:903:2c0c:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2d0521deff8mr88859545ad.18.1785757417365;
        Mon, 03 Aug 2026 04:43:37 -0700 (PDT)
X-Received: by 2002:a17:903:2c0c:b0:2cc:1452:a014 with SMTP id d9443c01a7336-2d0521deff8mr88859225ad.18.1785757416564;
        Mon, 03 Aug 2026 04:43:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0ea83fsm37110735ad.45.2026.08.03.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:43:36 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 0/5] remoteproc: Misc. RSC table changes
Date: Mon,  3 Aug 2026 17:13:26 +0530
Message-ID: <20260803114331.3277263-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KlkefjUQlUkcYo_Vux6nvyTriEMkRJ2k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX+GFLR37R7fsq
 qNPuLUUdCf6R7h4ohcyRBoNY9avQg+Th0gM5wncgwS7ZBH/6rlfef2uuL2cAnu8y9enO1AcXiL6
 38io22DRZ2k7xPZXepbemsLFhUgEM+BzcBwmIfsELILcyS3hlrbo6eA9y+a65VCxOiXIpp6I6OO
 9weoXuZOoU5KImVH/Zon6JZBc1/IZS0wVt5z/BI0Au/HKk7rN7Uz9HY8YU6UBMJebiLPyFQE9x5
 x56dX98v8d8wShkR2ZZXVpBwZ7IVujE8wZXHQwcORkqYKLubHD93NhupXBA+C4Ykkga2rmxEVpK
 N7dfqAtfkqNMecAfo2pBtsRl7f1XzvP84QK/8Vy2eAbzXCwmCblIiol0mS4rbS0TX131FnO0REe
 MwatX/B9CUd15ZZBV72+SaE5sYA5LZ4JtmuN9Jte/izqTNpPRAEb4k1WjELXh6x+28+ctmtOZt+
 xB1f5EIir9Om0kAIlxw==
X-Proofpoint-ORIG-GUID: KlkefjUQlUkcYo_Vux6nvyTriEMkRJ2k
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwNSBTYWx0ZWRfX3+IAgUcK+6Eu
 YvvI3yczmD+qEE1s8CEYN+dyrqPScWCV3lzgq+Rm6dIlygI0vM3+x43RgqJPuc0SVRn96pMthP2
 2ug8GJ0gfbXE9bQthG7eKfWGyPFll3w=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a707eea cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dZbOZ2KzAAAA:8 a=CyG9taIBJdoUgHtrk0MA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030105

This series contains a mix of header hygiene and a security fix for
rsc_table_for_each_entry().

Patch 1 adds rsc_table.h to the REMOTEPROC MAINTAINERS entry, which was
missing since the header was split out from remoteproc.h.

Patches 2-4 clean up remoteproc.h and rsc_table.h: a checkpatch style
fix for function pointer alignment and two SPDX-License-Identifier
conversions replacing the verbose BSD-3-Clause blurb.

Patch 5 fixes an out-of-bounds read in rsc_table_for_each_entry().
table->offset[i] is a u32 from firmware, but was stored as a signed int.
A crafted offset like 0xFFFFFFF0 interpreted as -16 placed hdr 16 bytes
before the table, and the subsequent avail check was silently bypassed
because the negative int promoted to a large size_t.  The fix stores the
offset as u32 and validates it with unsigned comparisons before any
pointer arithmetic.

Changes in v3:
- Patches 3, 4: Per Bjorn's review, replace the BSD blurb
  entirely rather than adding the SPDX tag alongside it; preserve the
  copyright lines in a separate comment block.
- Patches 1, 2, 5: unchanged from v2.
- Link to v2: https://lore.kernel.org/lkml/20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com/

Changes in v2:
 - Rebased it on next-20260723
 - Integrated multiple singleton into this series.
    1/5 was part of https://lore.kernel.org/lkml/20260506050107.1985033-6-mukesh.ojha@oss.qualcomm.com/
    2/5 to 4/5 was here https://lore.kernel.org/lkml/20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com/
    5/5 was reported as a part of https://lore.kernel.org/lkml/tencent_53F3322FDEB2E45D6412C427B8D1C6081407@qq.com/


Mukesh Ojha (5):
  MAINTAINERS: add rsc_table.h to remoteproc entry
  remoteproc: fix coding style issues in remoteproc.h
  remoteproc: replace BSD blurb with SPDX identifier in remoteproc.h
  remoteproc: replace BSD blurb with SPDX identifier in rsc_table.h
  remoteproc: fix OOB read via signed offset in
    rsc_table_for_each_entry()

 MAINTAINERS                |  1 +
 include/linux/remoteproc.h | 38 +++++--------------------------
 include/linux/rsc_table.h  | 46 ++++++++++----------------------------
 3 files changed, 18 insertions(+), 67 deletions(-)

-- 
2.53.0

