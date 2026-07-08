Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455623BBFA0
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488877; cv=none; b=IXSWSNFcJcr5wKl4g5i5mY724oBk6KzRFX9T10KRQBdUmLLeBhROaemtluBxaDHnUStmDV/crZPu1qSXT0f/hp+3KRRcUB4SQukfGu70taj11RgCpSluBXkIBrT/QC3QHxVsibbz0f6bU6PqLweCcq1fgj+wl/dWUHp+6QASzyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488877; c=relaxed/simple;
	bh=RL/Wvj2Mp0n5HJ5Cy6pG6HZOBt2AowIl22lTfZqvl/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSx18m+Wyhj2q7SaD4io+2QuZwWrnG4K8nbdH/Y+fwoEo4F6jD/XBnZZIpS/3uynNodzDm/hXdCs8I46j6+14bfZxzIjR/bYQ51cvPBHlXK25D4W0ViwozcSZanIXHS1QUq+2LtuajjfgCx2brSIuW5CqPUq9geJo9awbz3uI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqtfYnE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4mTZxwR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqtfYnE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4mTZxwR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842RHL1638136
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCieFDn9o1/mTKBwZokgs/AnxZFC6Cu9M4cCeHRgDUo=; b=EqtfYnE9jR6VGU4L
	YvdI2c1EaI3rL4BCZXWS7Zo3iHKZIqpJQoNZfsSUxo6NEe8oRbLa5EMTeaRu4voU
	IY1pIizZJPRrLq/hLiu165f0oCyIxIZz4PmDh1RLDU+G31ae54kVZkpL8H9dzi7N
	qUxd9tE6S2sdcUCXsus076nYopGmu0k//mgdILW/Cbpyv0LiKG7ZXO054xRQwWgE
	QO+w2lP8mecmRm+/MjbG17xHONiDgyJ+CAdJSi0hv8CtmtfEuTh370P5IgAuM46F
	h8tCLgRzunwaNw28X3j1P2+8NJGdqyibeRrhaGsHbkAMaogF5HGPvQrCQ9/IHRh8
	USIY6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a8xqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:34:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848452dd146so761025b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488874; x=1784093674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCieFDn9o1/mTKBwZokgs/AnxZFC6Cu9M4cCeHRgDUo=;
        b=S4mTZxwRmBpU6rTOF7ZM31N0VoZfIQbMg42c8OCp/NX48VINCPHV6K/3rnMi+OTEKB
         NlUm0H60/AFXQ90ozyNiZpBvkaUkUtOFdqyQnrLNKy4Fmb5qakT1fL6A/+/n3PwWGX9b
         T24bByzAY6uHrDxbJDstWad92Fg75LZygoT5bRdoDccXDKTP5afn8QW+fzpxgbMlhHf4
         sRdW81O1H9n+BiPuZVZC42aYvl2zi7Nij7YVxY7Q9HzSKQjyFVSwZPnkpjjxgr2IcVfA
         x69PyIpUswftToK+1Lz6t5q7wt4zujqVxQkvj+CTMLeaORih4QB3vOa0LrMPBQeUiCPP
         wpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488874; x=1784093674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xCieFDn9o1/mTKBwZokgs/AnxZFC6Cu9M4cCeHRgDUo=;
        b=LVITXVuzrxMIAw88fqbbScfXd6nNfx8C6gpxmTsFe2Cv5SmnDLZVZN/+VM5CCHQmu+
         gQ8P0Hdu+GaVHvo35JN0IVfl67adiaF2m6/6aiz8Jl2l92t4Vq8Yr1OwNGY5tZPW6reI
         E3FmAa9IfA3P5gBKrjGoGCcKpiPyhmAXeM3hdhycERzwo3gDZnbCsOlhKgZjZzJipbIN
         wrwT7lRlgS3gjloFzWLzOf4/QEOvHOZgHtB1RaFknIuQeLq04r14F2sZZB8OTcg1PSZw
         UO9ZN53dlQoP7Bkc+/7JiGeJYPqy/8e10zSBMoFCZZZr1BA0SZB/kw7V64FETkJ1Y27H
         MDEw==
X-Forwarded-Encrypted: i=1; AHgh+RrMX1UWNET3j4qkK0PzfgH+QP2Q95UEqMGzTRME/FGoYa/WliQ+Bsg7xFC5Jw78mpTj2yn5qFX1oJEPWq85eq1R@vger.kernel.org
X-Gm-Message-State: AOJu0YwqhAR2TTI9CyqXpXUWPxzlu03fkqdgjq9hbUell+oKTJaHrHiT
	yiJcTGmjlC3vc2Vyd+Ks7K3hqHZ8X3/BNeJPAOlF9ty0WolfoEk9IXVTlofOsPVD2+JuECHcSh/
	I5Phly6/Dfq7XghqBaivNM8nQ+WqW2M7ax+oV8J+5CeRnBrVrdl9ckdps+7Pbn6FIBC5WNhV/
X-Gm-Gg: AfdE7cn0NH0Q8K8M01tEUjnpmPIOl5HZjKt3AV3IRZtlsr/FGsklLtAh+VVl5n8xyY0
	sD0XatdmiHUqQJEAAcohIipAukc1CKhNuHXszmRr3SVlkJv5R8/+Mh6ApNDIVTyRnsVM7jZl4d9
	AXG7BxKLwBYCIC0CQC1myZ4OAIU3DqPD706GKflvsqXXnFoxbCG0Js4MXam57VME8rX7X5PdgqD
	lE2GHreR0z0qnX2gG8rkuiLWrZQXe3J7YpgWW+N4s9sV47jUMQyUGPnaqjXWTuJdiyN4arMboRh
	LEbwGkrGxHW7btQ1U3Yl9YLriWce6hhpORV8QI0ztjJ/TofbG1eUgkPb2jKMc14tqsEl2vibRSZ
	bg0bfB4HqAV3vXW58c2dv9lkELZ8tMaysu9mLMA==
X-Received: by 2002:a05:6a00:c8c:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-84843675521mr1352973b3a.35.1783488873951;
        Tue, 07 Jul 2026 22:34:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:c8c:b0:847:902a:57b5 with SMTP id d2e1a72fcca58-84843675521mr1352904b3a.35.1783488873305;
        Tue, 07 Jul 2026 22:34:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:48 +0530
Subject: [PATCH v3 09/26] mm/page_alloc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-9-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=944;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=L6c+15QWfJQlsN7pofG7oj9ERof+W0cwt812FgtujDc=;
 b=l1lEkLsA4P0Av7A6H60+TWCYPTjtTVceVA79u4NAHGXJ0OzlnegIIncayRRiyD3tgW/XBu0j3
 S5WBgcBHx3qDeX1/wpk1pjLIXGINMHFVPzaNC/c9Fa6/35YeFUeYUZv
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+Om1e0GDij7v
 vY3yr7R89QOsC9pQQkrVWO9oJ5OZYzIk3dY5QOPTl50A8pYA48ZE8VBDjBgMSbnF00ruEoG8VX1
 uh57HP5SZ+RIrtEl1YjKI8AnLVLiRSKFvCSeulgXOWdRBI2WcHiQBYoYFOBOpTmKgKcLwoace8e
 iQ4HoLQthdBLrsmFo267RBGHloEZ/iLNfCc8bsGFd4q6WfE5JTbwdlhO2UGBhjm/3Idyuoxwkef
 kB/WsYhfy412GAvqFWm/BV5tPxwd6DkstOBUnNOiBNVF0Oo0z59uPHmqcEJ7H+gMuazB0cZHG6I
 9dfOm8qPrF5jg0l0Y7QFcbHQKY5MjDndP7nlDtuG0tifCpbJjGNknK5zcVeZ55cEbtZonV9FUMF
 QJ0uze/NgA5EhgRj681egp7qlqQlOem0EPTYuILq7N8dG37V27D7LLYF2ueyiORsu1d8uceA5ee
 FE4V0t3synIMPIxNgqA==
X-Proofpoint-ORIG-GUID: kmyLy677RtBm-d6MgAbVkAnGh-LGz7Ho
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX9199ysDb2nwV
 rI5DqbW78QrenF+JAuD8+cn1GDWenoWZOctWj2A6FBsT/9hNVNAxG7Pr1fST3JwEvb730DvGrnx
 N3nY9cwiRSDyeyEsavI2ZqRXnyDa/os=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4de16b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TiJDLkziv7N9Y1Svq3wA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kmyLy677RtBm-d6MgAbVkAnGh-LGz7Ho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - node_states

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a63733dac659..70c5e0794efa 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -54,6 +54,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/meminspect.h>
 #include <asm/div64.h>
 #include "internal.h"
 #include "page_alloc.h"
@@ -204,6 +205,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+MEMINSPECT_SIMPLE_ENTRY(node_states);
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 

-- 
2.53.0

