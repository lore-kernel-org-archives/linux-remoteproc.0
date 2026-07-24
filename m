Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517C44E644
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918509; cv=none; b=eujUKuKrJ1bX8RDIMVNqscm8AX9lTWFG1qnwMzXeFdBGBXuLstOptzul6M++yKwDrl5IBmePIEZorqCRfvvh7cNHVDIhGU9Lsq5URIyrCEjezHCKXPxso5OA7sSOcLdPK7wlPbR+I0u2N52vQ2NN+THn1Zotm7C1uve8PmVne0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918509; c=relaxed/simple;
	bh=c2slXN7ih0C1nIba+fTCtKxyVFVl+MumeVKpwrfQeg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QY9Mq+ljg/Dp30/H0xV0tlGpU1F+VQcz5EAwg1R2zk09AGd5EDCxJabysnH6ZwYMR6yNCxOX/ToJ+67LuVz0CwgAAlZ5vkuyrS2Mozr5+Z8hG5K1J1Etxp5Hh1Rk3/jzcTSsHw6lPeO1Gcoy3+7wiXlbZZBtBzenGuXYHheo8RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GyqDPaFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YfQsKAyt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyqDPaFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YfQsKAyt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqeun3793568
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R8j+rbrLP4k
	LklFjyak7KxB2vRegoDdX9d/0n5LTXnU=; b=GyqDPaFlOhKN0iy63fSHRKgRDOD
	yO1UiRYEz53HPqNui9qu+TPwohOU+EDPbWAEpX3EiDlqvWi/UW57gWLDANIfmmpZ
	1j7XTkDOOOFxrAgvYKnGcdfqPCb0ngQ5fuvxrQL+M+kUOYVw/BK7gKo0y7E0d5zV
	q5tIqyT9EzSkDt+HXImhrvQ3xpiumlYot9R/qzPRLZg3xYiUx7FfGyf/AhLLAZFt
	iklCA+1PL7xvEPik8e9whZG31BdahiuoHLMSUgiKzQ5kz3TBrMWtDie9k/1Se1nu
	9J9/zPG0QGZQlgZOYi2WGfArL7Xj8QwA1Tp4cqyFIDKm0BEOXe2ZNpN/DOA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf19w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso911682a91.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784918506; x=1785523306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8j+rbrLP4kLklFjyak7KxB2vRegoDdX9d/0n5LTXnU=;
        b=YfQsKAytPHfriIGgmEdrGM6/QDyM/Yqcdpht/QgskjhpHB3Du1RY4y1P6Va/ODlmZ4
         4ZE1J8iZkY8/4SYCGcUgy3ji80ztB4BX2wNO/7BqYXJpytAUihvWm3S2Zn6gSYQ9uUx3
         xChHcY4YOozJARNs5YIk/obHe5P+Y1CKNdXobcw5mUvbc+5371PBhEp/YIIJ1p5u+wqR
         aI7cWUcX8dODRTKIZzSA8LHWTiB/jldBaxPe+zbZBXbg8mxNMFpsvuaSQP5FO5/tuHHF
         oD72AXL0FXQejNEiMw3P0wnuDWm1DKSr1aauDRogbPzhBStwSUJt7wmwzntmdgcMOeT3
         iZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918506; x=1785523306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R8j+rbrLP4kLklFjyak7KxB2vRegoDdX9d/0n5LTXnU=;
        b=SgWfCSs4RYI+OcgkLcTljgPtpYIUjruN1b2VXc66y1y4kfkBiIrcdOs2CjBqaw62lt
         gF0ZwVLxdPRRLRxn3qIN/ASq2No3K6LVrbjuYXSM7gUiXP0/ITTerfGZhp8y0pgZFB+y
         N5Uf0XE0CH4OK7lYR1WR1jQC70Il4KOQ1DyL318m7Q1hQ+PXZrCTojXLivVS3kft+iOg
         53Hbb9Dw6r9aCwsJ+KiD2+aLXJazFVpyQbytOHCOCKsYv5QJzfVUJ2OMGcbGsOo0DPak
         RtuzAUiqnnggd1bXq/un/rJAVn0aCrorxc3jRyOUeYmz6QJV+txb/29CjGjLhwBHAOzr
         9urw==
X-Forwarded-Encrypted: i=1; AHgh+RoHwwq2nMnge8wRJ1Xn/7tBd8lhvrRZQBwncPq50yaeaFlb1KNELPN1uTma5PLQ2mWhFnTEgdAESu5IW13ulSDg@vger.kernel.org
X-Gm-Message-State: AOJu0YwaeBLw6MxzldMXYsnQkMUG49BF+BmJ19nms5/N1vgy8m5ZmYFA
	lBEo0CRno5+mi3adJFwWZgfLgL0KAMfk9XLG5lzt0pGerPaGr50t0cJlqZVktDM/xm+MeDodHlS
	yb1MOx8mhQYsdLqpLvO1OfouKiKkHqtwSi+ZuzngmR8iXtM3rhcBVubHIJjps8xaSptsU2yZV
X-Gm-Gg: AR+sD13cZLwBLdrjimjGiCpAGuGCtqVKzqMQyWgLR8HUlDKjIv5K7NA0DrKgiYM+aTW
	CXpJHK2NFGJagO9M6DC5tRW7aL/SkDfVw3imTw0OWZhRp3+HdbXPQsoBdQUrj9oFEEBBbJoFjeR
	sWm7QdZjeamKfHYM5kq0BaEZk2FeuikW/OGD3Ny228RjVdruTbuXYfDE8yIT3dO72KPiD7jOj48
	nCS4E4ZqDyReVnbI3Wce/STKfmnEZNV1ADEcCHKqCp7J8R5dKp/pUNl35xqA/8f8r4y7n6qv1Pv
	FfpCORbBFhY64n5t/3JGYnvWJLimORqs3ASg+a4vKa+nTgFfvFp0X13MrdkgFeBHGKpQMi14EX/
	BTaxpnAY2XCJgrimooE5Rk43LNBg=
X-Received: by 2002:a17:90b:28cc:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38ec6501601mr8759505a91.11.1784918505700;
        Fri, 24 Jul 2026 11:41:45 -0700 (PDT)
X-Received: by 2002:a17:90b:28cc:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-38ec6501601mr8759477a91.11.1784918504933;
        Fri, 24 Jul 2026 11:41:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm2222283eec.31.2026.07.24.11.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:41:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 2/5] remoteproc: fix coding style issues in remoteproc.h
Date: Sat, 25 Jul 2026 00:11:29 +0530
Message-ID: <20260724184132.1878077-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX4tjiwJIWM3DN
 yfn9EluGq6W4ME898QZHAhjIVKi9ANmKGzq0JRO3AAxfk9yJGkmM8Gd4layc7o7l5az3iLW9GpR
 FEQDCgFv3EbTyaDbExRLFdU1Cvvk3DM=
X-Proofpoint-GUID: mrPhlwKneYBSx4XtvQ5jtujpqwQeWJLk
X-Proofpoint-ORIG-GUID: mrPhlwKneYBSx4XtvQ5jtujpqwQeWJLk
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a63b1ea cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=PIGfwsdRRb5bziVgSkMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX6fpxCcBVy6F2
 kz2R5+E+3jw8PpAZxOTp1YCLCbSQnxTt0XlEQFhqkpwN4GbFkJGRd94ocdM8aA5ppq/EThGqdEs
 Tq9tIRusY58g4CmMuY+Xh1hsT7Oy0dMxb7OthM0fach44uSkBiE9TOIPuKnqXd1tlfIfkf+lDYS
 K6xnMc3yO3OEzk08/MwCHgV3JB2BrIst3DbgQBk2lsYBvvyeorSxbmZF05/ulcZXiZtv5u0OqIk
 tD8jksB8YwNtO0Vw6718VoY9TwoAcy7ZP0ZNt81MUlXU2DlDSR/R5Qz7GodIFFsbDQlGu0vuYTR
 Dpsre+gsvhx1yO5yygwyGaq2FcsLCQhHdzMSFF/A+uLXqZr9hGMroKkPBffAVG4DVBv/Nu8/ctM
 ipNMwOM45fX/rjLErKvgtVIICRr2LMcnJye2DoCZkD/TQ6lNxUEp7rtYmngfkq9gSOtQaneN8VG
 kgfpAOGtCwlVFueoLRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240168

The function pointer declarations for find_loaded_rsc_table() and
get_loaded_rsc_table() had their opening parenthesis at the end of
the line. Move the first argument onto the same line as the opening
parenthesis to fix the checkpatch warning.

Also remove a spurious blank line after the opening brace in
struct rproc_vdev.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 17ed75a11e15..9cd0708d5ac9 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -127,10 +127,10 @@ struct rproc_ops {
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-	struct resource_table *(*find_loaded_rsc_table)(
-				struct rproc *rproc, const struct firmware *fw);
-	struct resource_table *(*get_loaded_rsc_table)(
-				struct rproc *rproc, size_t *size);
+	struct resource_table *(*find_loaded_rsc_table)(struct rproc *rproc,
+							const struct firmware *fw);
+	struct resource_table *(*get_loaded_rsc_table)(struct rproc *rproc,
+						       size_t *size);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
@@ -379,7 +379,6 @@ struct rproc_vring {
  * @index: vdev position versus other vdev declared in resource table
  */
 struct rproc_vdev {
-
 	struct rproc_subdev subdev;
 	struct platform_device *pdev;
 
-- 
2.53.0

