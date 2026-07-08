Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118D2377558
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489083; cv=none; b=rvjip/rS5xafgj01OQ+d08QACXSsRpUPGexcnKwWVfabX1P6rM3J6WGOHhwmJLZw/w3P37FQ7HETidxe90GzvqILMxT1zDWS72PITP8hUaNT8dFClzxtyiMNLLHe4qSJcdop+oVJWFltq8xA/DXjA6A1nz8YjufcTfJ8d9RfCmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489083; c=relaxed/simple;
	bh=z1ZsDtb3AdWukosz6c8vmkJyyuvespbAakGiTQ8hg/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJJsNaQ1RB6/xsOTijTp5XtBzM0jXppH2yBjyhAMy732X7rnZJnkwbVt5guDbqdhTh7VDSmYXukGzv/8Q+58H8mcuAPN3zgJQ2+4Pz32QWC+3F9hbwr7wVBbM7W94XyqfmFpwtqG5AICSLvKNKs8mv9Bfwdkg57K18ulsWK5lcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FfzuHjvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCipTncA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FfzuHjvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCipTncA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842GZi1695176
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6tQhSIWI14qqnmz6kQc2gEQdl1vvWUYPv8dRt1VJvvg=; b=FfzuHjvm75cQHZf3
	TCN9eJ1x4s7H0avZYnpHrX0U4q749iAj2TENyuuyKJE1sjE+UdIN/2rsFExFjoTh
	CI3ywe2xNZ/eZkaOxt6yCpn9a7u/O3vrsWA9AUZtB2UIsE9xo/GOseBFd+VcNwfg
	+hxjGwJzz9cjDnygtg/MHpTXucuO2kdVmd6930H0oqVrh2IAwMr8UcZGNPaEJDvx
	lIkDWX+ZZdokzTR/dRXDLdWw4OQRVdS0tSp+KwLk3eN4KyrGcsI8HHOhUOxX7/xd
	0izWDl06giRUT9qFU1ujKNQfQZqHSxO78F71U9MNLaA/ooldiHZMh7mdgRhovq2c
	5kHv2g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw8t2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:38:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo757117b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489081; x=1784093881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tQhSIWI14qqnmz6kQc2gEQdl1vvWUYPv8dRt1VJvvg=;
        b=HCipTncAaotn7SHTQr9v6Q6kTpQO3WNQqidyL1/dDzix6njKD9e6PKcoxKXId8sS1m
         wbmXk49bvFPPxwpws3EBW7f1UUt/Yi9aktJB+aFRstjfIEk47bkkXPjIfVCVZvx5AKWS
         V1rXiO40JZteUu8KeleRD8N2UvBJBJZNyLbAYQOA+VGi4TH8cvxrPnMrkR+HwPMe9aKV
         2XG7WfvViJo30sVyrRB/vCPiPcDgtZsxuGcbhijDumHIkyPefcemTL4DXO7kGWMpItl4
         M4d1YNHd35OVs5w6/Tkei5CUzR/m7LQojWqN0d//Y9d2TdMkuV+DTszgY71QOS8TnuQd
         XekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489081; x=1784093881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tQhSIWI14qqnmz6kQc2gEQdl1vvWUYPv8dRt1VJvvg=;
        b=CQNFC5BX9VcLgARqTWeYNr4piSSxn+NCSg7cqV5IrPmgj2DJ5IULwi8uWp7fWvRlmX
         1tYcPQfcKCXRc7R2CN3o5uxCVk1DzUnQbucHZYvtkuzN++KcTW7JzAMyY+LUslc5JMo3
         olZGy/cX46lW6yGcc7355fa1dSTCPxD9isZnl0jmjHRh3/IGmMkg1lysnpKcUFnAF0lk
         5VNRhQ98LPeiYvcjbupyS7xfCFv6CCYF/d0DMH5ghFNcRjpqphrcH9CszmglA2NGxgAX
         ssTsfYRk0FXGpiVeVYdOfgA6eFBoUCZqAoDhYV1B+4qEkFKoT4vYvXywX4LXBeKP13Xi
         3oMA==
X-Forwarded-Encrypted: i=1; AHgh+RrHXdJSOLzXOx7WLdksf0/fbIDlENM6V6xoZzMFUjgg6ELe/jsLZJHMIyTwUhbM+uWBbLGI++CnyinbVMeO8XQw@vger.kernel.org
X-Gm-Message-State: AOJu0YzqOA7nGtsjI4VHuUSkYPeUhxMUuG5CDs2TiRaodhumekOrs73+
	ttApapYiEkOBqufG+gRWtGutZiv8dKMqvw33lHp+AqlZwMBSMDhBhHqf0W7IyzlF1KYLyX9q4Kl
	MtvCwlPJdQgHBn8KeZrYlP5m+2TPq39G/0bHIW21mVg8/7TdOPM0iRcAamNZEobaUtUPiBoVU
X-Gm-Gg: AfdE7cm8s+7dIJZoSfrzR3wL666fmZKDbHwHrPJscj+aaP3BnqvYKAOb9ygePrjqS9S
	l2TWEZxOjyz5gp0yCGOINfHZpFA4Cs+aavg8QlB0VkPWnaJLqgcDFlyCbYK4Wa+W1yY28PSOJGQ
	5f9sO15OC+OZa/ULS+LpOMUcdWA6KoQf64235+2iZ9yfuMUj93TqnN23scm5gMSeNjW22GZorZs
	BKLE+OxbNNRVlILVB7qPCYxSG4mNLfI23wjSsue/7R652weahZRq4V7QedSsT6D5SZlaj75JQWr
	oexaI5ggZX4BEjsux2QkeEjXIRxHi7CygLcxJ3y+U0RKLT62foPCvC/VuI3Evd9OoznfdA+xu48
	YzYE4lvLfjqE/deK+bLObhX+O7gFdxgIFtZG9Xg==
X-Received: by 2002:a05:6a00:1826:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-84843273dccmr1108595b3a.24.1783489080606;
        Tue, 07 Jul 2026 22:38:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:1826:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-84843273dccmr1108519b3a.24.1783489079953;
        Tue, 07 Jul 2026 22:37:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:37:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:02:01 +0530
Subject: [PATCH v3 22/26] remoteproc: qcom: Move minidump data structures
 into its own header
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-22-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=5306;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=/Jtff8M2EKscXA/Je0INbgmO1YS6m/R2F3Zo0Iz1ek4=;
 b=xINWUZfMh5pzjvIvBrT7eJj7xNvbLw2tKLmtZMw6qxkQ1gC5A0Ib7M6fYtAHV7x10PU5CxuEP
 JzEOyAstB91B4AE5pg32ds/zx+eCqBM/u716kEL+09/CtbaoWEyfJmx
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: c9meKO46Ro8MVyo0g8xbEF8lZjsSiiKj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX4MrhzwaJEY2j
 z0ANczhwKo/9EUpBbDOF/EODrs88AqryAnV77W7C8YdOOPHuNjKqymNCQgwWFmZqIyKddxDiQtr
 ocjx/CnjGzUFrJQWGpWQByOj1JAE0DA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX/sJT/EAm+W0X
 zBJ78FoLs4Pz4keHzSRJpN6zUAzBIZZtnOJGbqAEKjh+Mg9gRGo6MX0/9EXSsQZU0fNYQFQ1Su5
 wx/ttB/HlsRsDQMfU3eKpSeYQlDEeJNjT+jikhkIhs/aJ0b2n9BSlr4ea2CCths2hcYxH+vCza0
 3IxU++S3227yLfGTuwE66qTxBsUjwI1iBzHGfwWx+hW8rvROounARLEbEaXsnAOfj60Gili7WmJ
 twKWtjBPGCYr4332D5tUPbnWIbuNpJHnSz/cT+5Bbcavm+eF9CO5vERRVC8OEymce5oWtfcuw2y
 dYzuCnhsDgt2v2O6KPCm7owwue1fqphVNEdSOWsU+dGVqtpeEVDKFLZr37YnZGsfmAVnM5wDobC
 X8VsIkTSAFOKbOJZDs1HhHtsGhHh/QE6649e6PJAFMclmRBhLtFjwmYSO+5D3GJBGcDGkNnm9Eo
 TzYdfULtI4WO2k7o6UQ==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4de239 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=b4h7NkmuwT24Zy2QmmkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: c9meKO46Ro8MVyo0g8xbEF8lZjsSiiKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080051

From: Eugen Hristev <ehristev@kernel.org>

Move the minidump data structures into its own header such that it can
be reused by other drivers. No functional change.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_common.c  | 55 +-------------------------------
 include/linux/soc/qcom/minidump.h | 67 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index e1a955476c9b..a5ab9f024e64 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -18,6 +18,7 @@
 #include <linux/rpmsg/qcom_smd.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/minidump.h>
 #include <linux/soc/qcom/smem.h>
 
 #include "remoteproc_internal.h"
@@ -28,60 +29,6 @@
 #define to_ssr_subdev(d) container_of(d, struct qcom_rproc_ssr, subdev)
 #define to_pdm_subdev(d) container_of(d, struct qcom_rproc_pdm, subdev)
 
-#define MAX_REGION_NAME_LENGTH  16
-#define SBL_MINIDUMP_SMEM_ID	602
-#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
-#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
-#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
-
-/**
- * struct minidump_region - Minidump region
- * @name		: Name of the region to be dumped
- * @seq_num:		: Use to differentiate regions with same name.
- * @valid		: This entry to be dumped (if set to 1)
- * @address		: Physical address of region to be dumped
- * @size		: Size of the region
- */
-struct minidump_region {
-	char	name[MAX_REGION_NAME_LENGTH];
-	__le32	seq_num;
-	__le32	valid;
-	__le64	address;
-	__le64	size;
-};
-
-/**
- * struct minidump_subsystem - Subsystem's SMEM Table of content
- * @status : Subsystem toc init status
- * @enabled : if set to 1, this region would be copied during coredump
- * @encryption_status: Encryption status for this subsystem
- * @encryption_required : Decides to encrypt the subsystem regions or not
- * @region_count : Number of regions added in this subsystem toc
- * @regions_baseptr : regions base pointer of the subsystem
- */
-struct minidump_subsystem {
-	__le32	status;
-	__le32	enabled;
-	__le32	encryption_status;
-	__le32	encryption_required;
-	__le32	region_count;
-	__le64	regions_baseptr;
-};
-
-/**
- * struct minidump_global_toc - Global Table of Content
- * @status : Global Minidump init status
- * @md_revision : Minidump revision
- * @enabled : Minidump enable status
- * @subsystems : Array of subsystems toc
- */
-struct minidump_global_toc {
-	__le32				status;
-	__le32				md_revision;
-	__le32				enabled;
-	struct minidump_subsystem	subsystems[];
-};
-
 struct qcom_ssr_subsystem {
 	const char *name;
 	struct srcu_notifier_head notifier_list;
diff --git a/include/linux/soc/qcom/minidump.h b/include/linux/soc/qcom/minidump.h
new file mode 100644
index 000000000000..7449a04e6e15
--- /dev/null
+++ b/include/linux/soc/qcom/minidump.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Qualcomm Minidump definitions
+ *
+ * Copyright (C) 2016 Linaro Ltd
+ * Copyright (C) 2015 Sony Mobile Communications Inc
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __QCOM_MINIDUMP_H__
+#define __QCOM_MINIDUMP_H__
+
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[];
+};
+
+#endif

-- 
2.53.0

