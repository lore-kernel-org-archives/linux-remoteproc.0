Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9011F09A8
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173912; cv=none; b=OJQtCkyNm6ntAwlF8r3P+v2AaiB5N/EC+CKVNL7mQoiCaAi1x7sxj95hpjxsCOkoQnbhVdvdBo8j0IQPwefW7E6ettM+TwslRWpqZirbZF4K7dpwJo6pPxsKb91466UlQOFpyJKnpAuTruG1Vcw3P5xK7up/3dwE8X2FIlinWWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173912; c=relaxed/simple;
	bh=ddnLcCWQifntrskr0bcFbMBQGwwCpIQxRxTa/csgC88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M4omstQmLifFlY0L1ZuFL5+LO9f0VR/7uxV1jC8+osjrvmwT2hDghBdHkc51xBoaxU4jkQ+Y9JKKXB1/3Lls0xR3oYPtjCYy77xPFoQ8iZpvjFptc1by4UvqCHpa11xHqnihESwfghX8VcY743ezc9p5KiRhuZCiv5W8CVTj5ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnrC4NkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQH9j4+1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnrC4NkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQH9j4+1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJ2ZbF3297898
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=; b=AnrC4NkBToNr65+G
	AeOELDrpl9XgKlIS8M/AtttB4QyAglvTb6SQxjBuNnsCiDxLCeSoU5WmEqxThd3n
	q1r7NaFq7tri0wHflV+Z3u1FJeS4NCUh+YoW29ccfw+azNMLfQsyntExTh9g0eM/
	OK65QDkAjslsNMXN0BZIg5Zs35L3NZGED64QqDWnvxaOkQbYFjYXtz/2YHDRZZ4x
	d/i6zaSKGtTvF74k4p0sDUwgSutpk1nIU+WC11pYUqWQKNQWVXSoRlKiNN3DpcMs
	OyewJGRmFq0SSbpreUfhULNlhtKqRVRBf7e0xiXv8vwnmwA8wH/1n+oQZ2VCsAGO
	B+jY/Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mtp9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7385e8fa73so3575842a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173910; x=1773778710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=;
        b=gQH9j4+1pIqOtXrUnvbxJ5T4Hs8e2RzoPwJFH+TpBv3rzIKhsd9+e2RdNQehp//HP+
         65C3tsAV/nqPFGf+3GuloBbabroqz6IknjACFrp9nshA5oCCaKyMtJngU8pRol/TqADL
         +PY23xvSXJBIS3chN071KVqzA26CewL2LVIMd7ZnkVOCVT8rKzx/fwTdR8LE7lus/wPT
         VmsGOlJhdR600/c/1kBz11j70EVe2lXYRAS7a6ruIMHCkYZ7ljglUy4aYK7nEPeCxN1a
         VP3OsMi9NyiGTTSom9oF8Am2mZvHGRlz3NdooxQpnZaYRhC1k90oShfRAu7tW0vNcDHG
         X4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173910; x=1773778710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xUalwRtla+ayp0MJOatYREBpi53Z8RFSi3SjDfIMcEA=;
        b=AqZ1gmiogGde7Alq4Lw+RuS6yhgVlZ1/ichz1mvkNfSDnGusp+buAokCXsOhYtt3Jj
         8g60P7M0L2Ve8t1a2JsrMa/Uv8X2v0Gj7+V6t2+CzBJx2Xs/NhtSz6MSDShN5y9WPtDd
         wtAfUn6TGFXwuJ5doa3c0VAClVcx57NkqXy0ecrleD3p8mAv52lpgMAyt9WB+nLMasml
         xh2ThOOsM8AEUdx6FDN2IpQzr6lsanr5ukJPDwlmMY8ORqCRhrRz74rvJY66pfcj9Xok
         nGKjM1uP7zLsDt5/aAbbHVBRXEDDtOGNfnyN1cQoNZQvwjEFFKLvw0XurZEdiF5Wpvy+
         S90Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0XhCcLJWbshuPB3869DMjypfTt+kcZfUWjYhZP6ajNObjLAXSKur58RefFftYlU2ZbY0k8v4LxL9dnmUVa+xY@vger.kernel.org
X-Gm-Message-State: AOJu0Yww9EomNgjd4w05mztDVbaQe5JdRkrERjuOiiNU75IQoc5A1VOl
	YsknZXUJoE6frPHKUif/935Pol6uouMzuZmS6lMk7rJVMbBi7dIwgjcBkHhcD/TYZ3TBVAni7Ll
	QPcevS/5pjIhnzWku28R2IZsimCAvRuyAtIpOfg27FPDcBf+ySRx/vJDrxdBP/ZmKZedZrxBC
X-Gm-Gg: ATEYQzwmwnUR3NoIK3IItO4Cs/0gHwq1PvaPUnYecRie7d/sfB4ZSkEnTBW/QCSECDf
	VnREOuOsvpt6yv3k9Mn+c/ItNJcpKHuFcsGndfJGZKkV2qYVfTzEwZbZX6OlOicPMLX5TJO7NyI
	r1la2utX81GvOKVd1W9ElKKLmqUEb9tPc6jM0nQaYQPIGCs7iKdSAJ2AATHjSubK/lRI9TTUJ1k
	KfxnHAt2mq0btQTFalezcVxSygBq3iilHbZiiaoFBnTbv5uBPtI9PabUWIeuc8gkzq40zg3karG
	nGh2+OUg0MfwpRsNC+dT4k/NHZtzUKyeOY3ppiKpvkadqp6iFSrl5kWNSM58MiZWMJ2SEyVCBD9
	PwPKhukcoRczCoCsosP6zMaRPkfFMsDcVpbQQ5DYPIebM2kIE
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr187982b3a.9.1773173908894;
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr187951b3a.9.1773173908318;
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:53 +0530
Subject: [PATCH v2 09/25] mm/show_mem: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-9-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=896;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=hnWgTs3BqNwkuy01WGRtLHEmLnAWVLqGtO9y7HspcnE=;
 b=uLHZ20TEam9IFeoPaxYKND50xjzJmo8/66x/toJROlPuRsGnYldJCrFNEUSo9htPmJgsz83XB
 h1nzBbPPYs9BIy9KMclSQJQfzgEIMyig5knFQTbc87F6JhGMpL4Ps/A
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b07c96 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ayq6lH46roXo9nsmW_UA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CB6zUuvMnQCOH6CqPXVUu-HdSYGnizx4
X-Proofpoint-GUID: CB6zUuvMnQCOH6CqPXVUu-HdSYGnizx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX58dF/gWnwMiM
 3lSYmTSFfxFgSAl/lMgPkEyL4yZPJEtBhOR/RdC/3fg73c51feJBW+vv85wbGH9CZX2SUeqATWa
 mOg64gQjC/KVw5KmKNFOqgeX9+a7/YWH08rntoXmEwOuYSG0r9P+vhg7fvQWeI5A+7esRhv9GTt
 yZQ2V+qnOQzboG7h7rSdngXZeBilxew6jY/NK7+ZSadkt/1olioz7uxGB0+2lbTTmfF56ZeI44E
 hDtEGlTlLwOnldZqYVAiNw66InmomwQ/XEDJNXa5ce/h2UmJFhanLyRfBBl69deNKv2FfP6zVVH
 4SsOsc2n35AFIw8l+1IgzrRV9KXp2rbdNwBOqfSCJsMNt6RV9WvVTfNks8rwKkYKaxl8SngFyQv
 4oeXzoG5eypxoLcw+AbNjr6qb2oxesNOFQliUGyNN6VHlzYgYqB0u54GL7kC89/B0TvlNHkgTNb
 irJ2gL4d1qSXuk9Xlog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - _totalram_pages

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/show_mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/show_mem.c b/mm/show_mem.c
index d7d1b6cd6442..f6a92c7d9d1d 100644
--- a/mm/show_mem.c
+++ b/mm/show_mem.c
@@ -15,12 +15,14 @@
 #include <linux/mmzone_lock.h>
 #include <linux/swap.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 
 #include "internal.h"
 #include "swap.h"
 
 atomic_long_t _totalram_pages __read_mostly;
 EXPORT_SYMBOL(_totalram_pages);
+MEMINSPECT_SIMPLE_ENTRY(_totalram_pages);
 unsigned long totalreserve_pages __read_mostly;
 unsigned long totalcma_pages __read_mostly;
 

-- 
2.50.1

