Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE383EB809
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785401697; cv=none; b=P3/wPA6jaagqfm1+hcOgDTbjEbVfJ1ESV3/i6lILgMr8DGwlRJdh9qOoCGA23Lj8uEQ44NdCNDrEbxRb43F727IrhCZgl5w3SXYT+CmfwKqlHIJYU+eODZYrcDusGPoi8CjG8RQNVSoqNdIYLSfn7/YNBhC423iWb6bWrSoCYuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785401697; c=relaxed/simple;
	bh=CnQaJ9M7AQRn0u/p+5xJ4R2DqZFz+4O2wtS0X4rLdEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LFrnFYaeLx38Xvq/vZ3s2XCVEI4cdnD0hvMo3DooHP4u+Bt69cWi99x9k5VSB+7GbQkMo83Dqm8z4engJfr8LlaXpCOXyQuFlx3ts0yk7SK7t0q/JfnE+T4ukEe42y8G/lrTFpdS2xQGUaez+IQnIRv7Xq3zNMNiFMx0+9aA16U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmVhrnpz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnnooMSF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmVhrnpz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnnooMSF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8cBeC090939
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9hetR+Fi5h7
	Zl3BRc/p7pscXBJ4xZ5nsM7qrQvkF0dY=; b=NmVhrnpzLSxWS0ICs8s1TlaPZov
	Bi0fbovJe7aqDTrLwV2/92ZPsT4MktcamyT4x8ZyN3SuBfkyAYUzyJFUrpz2D+Z6
	0VrOtXHkWvwVfbubozm5ckJk/Ufojn7sLXESQUlL7z6kQPzHKPnFS4yWlOYcj3XL
	fyVg6u5VAWOn/BxI6jf1k3VzUv0XdxVmlbpOFlOAce9duvkAsgRu7/7o+RDZ7kDG
	5Plo42zKwwQsjsOrrBtp3Y2oteyHH000p1CKhq0XKNLDhuCfpPL276Y/fCBwh4ve
	LPxj9PbyeMWGNjF5JSHEXhYTuXWZCdi8fMDl1WQkj1/XKgqH42U7JStxVBQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr39802c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 08:54:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso2437194b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785401694; x=1786006494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hetR+Fi5h7Zl3BRc/p7pscXBJ4xZ5nsM7qrQvkF0dY=;
        b=NnnooMSFyVKf28iLVkSLp9oB2oidPrlP2w9wW2NT7y7PYXs9VxhzxCBgQxKhc43Noj
         /4fOc1w86XdfL3vYKd8TYD0I8MqRXyjUl4bwgxqaP2yVPX2BKCWm1FubNPJ8knlXNOAO
         onKis1FS2D//amYzOMfY57u+kblP9iwmDw5Q9ig9Ejer/uLmiKImlNJpCq8JyUpu/yFm
         /ArYsrKvHl2dLo6H2i7or6JqRS2QSnEtO0TSHP3zH6feOjnUeqz1EglDTf+Nf0iJKXn8
         I4MEk+swl24iESk9DrHBAoKn0ADxMJo0bFM/x1Bxl1+c0tQGvhsh//RmmyKKklFqTLVN
         DWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785401694; x=1786006494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9hetR+Fi5h7Zl3BRc/p7pscXBJ4xZ5nsM7qrQvkF0dY=;
        b=EUs8ylNQBeuwHhfANuPZlY1fyf4iKQHJyBstycSuUTww19vlVt/Zz/8Fz6FEEwJwlC
         MuoiIfBH9UvCeWsbBMWuZk1aqydcz7Dyo8LsOz981gpfSZdXv/PBYS74kjiQ221yWscC
         N7/n+SWyW9O36sIy/Q+Dni8NxsAp5eiVr0MjKb0rkJ3BrQX87qL7ms0LLkJUIsfOn/QH
         ekgCbm1u/1Y3iQJR7u3/r5E/ZN6C2ESBR9Jti6oxCvs/RjdgLwgqQqILYeE3ukjbqN3w
         b1vw9lMhGIstz+SUyiHJgPJpWoOKcoypGUjhiGyU2fd6K9j5/NGq1DduEPcxCOkYP2+o
         8VIg==
X-Gm-Message-State: AOJu0Ywoa+j42NYRSnS33M5My1603FMav3Lv7RxYMIXb4jy18+sJAoCg
	a180MjuUZjFSObKiSDziyyjE8UafK5Bh+dXtDK0bkQQSHiJu3Z6ulczBghim6AT7VYCFGM9PWFg
	PG85yH9uS7tn90n1w7UphmLZah8Oi21TiccNnTAAyzhuPQ7RRNPdmDH8Ce2F5EumTVbYP7I0P
X-Gm-Gg: AR+sD12uEL7PDRW1i0RtP56xEb5fu9RA7t2DlWNgpQXKiUJFHWRPpWsfHoE7uIuJKv2
	4fo04ZHXjfM6qxdvZWH1j87tbksO8sFqSMGtmrV3FrJAkSMfvY+NHomCsxIuNIBCQgOOLMDtqY/
	KkG8bBUOv7p5GOZkZYycgv3OzbaDSi8PrzYMNyWRRPSla+C4ToErqmuyTqyGcQ9O/al0yL5Tq9A
	8ojtsgFfwntLuRBeZpkPPEzicm4mCe6kPDbCpHJXA2zcP9+FJCXtzotA/vkPYnJ2kJrbrlRf95/
	RsscymMMJ21+rOmUi+vvumcUP8RD3YQNcBVMuPv7iRjk+QkGlZ+tn9chyfcZWN0xTJBTbH64LxO
	fOrVVpPa2CgqeZ5xa0ozlJ95L/Gw=
X-Received: by 2002:a05:6a00:982:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84ebc1fd581mr1730159b3a.6.1785401693873;
        Thu, 30 Jul 2026 01:54:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:982:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84ebc1fd581mr1730136b3a.6.1785401693315;
        Thu, 30 Jul 2026 01:54:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe23120sm2774402b3a.11.2026.07.30.01.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:54:53 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/3] remoteproc: simplify rproc_crash_handler_work()
Date: Thu, 30 Jul 2026 14:24:37 +0530
Message-ID: <20260730085437.1240215-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730085437.1240215-1-mukesh.ojha@oss.qualcomm.com>
References: <20260730085437.1240215-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WOtPmHsR c=1 sm=1 tr=0 ts=6a6b115e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=UMyycK4ZA6sHRx150I0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2NCBTYWx0ZWRfX08R/jzrLiZAD
 ZQVF4JZeJf7KWvZDx784ylo+umMEyj/CMdgckRxeWZMxUlS27SdMytAJHnQodvzAdlQJn8feFld
 q92BFlas4TKqVthDy347oMdTMvVaEMZxMxaC3nJco8orJL4AE4vCWtbxSK2TEnzeLTtgKyqPZNl
 d+1IdQBQd4N5vGOZBq0XareEwFnnJtQNRqvr/ko5u6jkbKonZN9k7NnyXJUsNFmoAdsnYjXjR0e
 /78QWEjDrbnWObyG9lf+e/75DBC7H4d7BJFW0jtEG1G14FwO0cvQwrnW2R8EQUnaP30h9Gn0t7y
 FU72/wOsuYko6rS9LlYI8jGt8n8KWxzgasDTXjz2MiqBv62WQ+wAzF88WjHHwSoh587X6LF6FMB
 PjDDJ7bR9xCn+Op2x7DFovKQV5iSMq9FEYvsQq7YtU6yJFg+aRV7TwApOiBDetNUqf9ylcPxsNU
 ufNBE/gnZfWrTfO3Bgw==
X-Proofpoint-ORIG-GUID: 65e_T-zBkNr2QUdCkq-5kdyLlfHc7ayV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2NCBTYWx0ZWRfXwj5rQo9eQsk1
 SGVOPTuoysUnt7SchAlXRX0V392rrsm/snkKT+J4Z2PlgoC9QyxXx/LVcFI1EUoNI0llNXWwlDr
 vHNdStiP1luuCVjvdBDO8/+uYGs3xPg=
X-Proofpoint-GUID: 65e_T-zBkNr2QUdCkq-5kdyLlfHc7ayV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300064

Three consecutive mutex_unlock/goto-out blocks guard against deleting,
RPROC_CRASHED and RPROC_OFFLINE but differ only in their condition.
Collapse them into a single if with OR'd conditions.  No behaviour change.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9d36e2f06348..41c2d3ebd568 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1888,19 +1888,9 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	mutex_lock(&rproc->lock);
 
-	if (READ_ONCE(rproc->deleting)) {
-		mutex_unlock(&rproc->lock);
-		goto out;
-	}
-
-	if (rproc->state == RPROC_CRASHED) {
-		/* handle only the first crash detected */
-		mutex_unlock(&rproc->lock);
-		goto out;
-	}
-
-	if (rproc->state == RPROC_OFFLINE) {
-		/* Don't recover if the remote processor was stopped */
+	if (READ_ONCE(rproc->deleting) ||
+	    rproc->state == RPROC_CRASHED ||
+	    rproc->state == RPROC_OFFLINE) {
 		mutex_unlock(&rproc->lock);
 		goto out;
 	}
-- 
2.53.0

