Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B6E3BB10F
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488798; cv=none; b=BZr/sD9CDLUd2cGk4lA0KwG7t7GCERbp9HMm5+U3+AN4nWK/tnUooJaqq/+YToot99dR7SwxkEQwBNaiwwQ+oGw+qNumTWU6ZhmRS5tqfucFUb4ndTb8C8rJUBCEbc+9ao+l5fJPCLu+qvrHORUUd6cG7HJUayEv+wtNgSiEJa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488798; c=relaxed/simple;
	bh=271DJ9jgC45m5gX4TZNLlhbT+pwRoJn+F1VDPJD1wOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2lWhoHn+OL4000U9c0pdve+gM0MrF2VRc+HGRZGifIb97g5bdByQJvT6yJDWQKKu8T/wHuMBGIq+go2N4HWsQDMRAqtUIHocCFWEcMHGQOnaLXrbdqSes7o7A7TrXYJOoejIhpTwkJy5IaMwimsSM9WVpo9MJr53+NZmc76tA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7BSBhmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xg7cziYx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7BSBhmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xg7cziYx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842BPm1508741
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=; b=A7BSBhmnYL9DWL2C
	l5JDHhwJ7GrYQHhPPKjA404myQsOdZd2oyRn+UsW04vWmNE7TR6RTv4dXk+7gp/W
	3y7LDxyAXAauz6Eua/VvYIpk4vTPWLT1P+6f3kJrlN3vryFcLA2EkxxJBRVZeR0C
	XIW76Mbl7R7fNY2naLO2rYODQ3AAMHozxgt2IhBGFH2mQJf4H4S2sxqSH6zxuT1O
	XfaZ3LN+qpSMwaexOrXBNB5vW0FoS88oVDIKRiNzYTuIz+vgY9Hj3jeupq4y/6BC
	q3ZS3yRSpez49f7J/yMTrYGBbGA9hrUu1U9DFw4X+jZKtpgjgo5fTKGdSYV7oNtf
	oRNmsg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be5910a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:33:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845e6a11332so520226b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488795; x=1784093595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=;
        b=Xg7cziYxD0IHZZulvIyRyTn46JYdUSTlh/dx5kz/xyxhTHrYpqFAqL/+z0iGAYWVbC
         9FrTyTkk/N8aXeGGBvsympoNp11m2E/pXkBza3hhZmtHL4m+ACFr9KPDLurcEBavRhvt
         Qj68fCaVn+peYONZ11iepNkWEjAURQtE04DGp6wE/ZL3QhdUzAMoiA7kMHVDIxOEVa4n
         0871jR/+ELA6yXSCQVphdVBG52zT7lW27OogVcfo1dkdOXbWaw4druNVyE+8/G/TzGwJ
         utkeIeDKMx7UWvZraB1F5nNA2FoQv3iE4d1vVkVIFDe9dU6zYUfemsqBP36YmGZbtWrW
         eVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488795; x=1784093595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=;
        b=ShTjVl6ZZ31gh3uc+gVf/f34KnvtlIALEtGKNUUUdhfkP9QV+Bi2EukDueTQJeMzmA
         E+EJzUqDkOJH7egdKCvD4V8N4mWl0WdQH18xx4IyA6NZPyWDeWLgUP9G5vCci0jOSrwO
         MjkoK5jlBsROB1ntQeNM3lWDf6ruJXFA8Zo1p5cCvm5tFwTDYXZBNyOrWfpAdiZqjpBr
         sNy/Fc2jdKfqYSheICC8ggyOz6Q20hh1i3Vb4xqbQQpqrnKvDa0UgQh06kyrQKKwweVX
         nXYssPBr2DLmHP4IhAg4Q5r+u4tO+dtZDvp1xIMKcbgUIZAJPufrKn8/blsFANCpil4G
         dZaA==
X-Forwarded-Encrypted: i=1; AHgh+RrFxwzi1zzuSuQCT6l83td992zAnfNe96lZDvn34bbKo1a55/a84oHtTnRG6mimCkF+Ibnl272JK/h6qF7ax/bE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78pEJ4gDGDjxfvBOitQ/B2QfMHiPJ0At9H8Qmyxa9SnLVydZs
	VpxNJlVnwGJqHMrjSUyxDAq/sJtr2TAtJp0bQV6qPKchwYlXmqP3uCLr0ACpLK4pj+FtJIrldGi
	v7ViJo/pddwab6tRAPyxuXcRur7/O6A7szyXEB4Obbk+RXbmNn9pP2gOL9c/Mt624kXqwKdmS
X-Gm-Gg: AfdE7cmaCh+cnKrjZ7/MkxbNMZbHL7ImVvFoZFB/RO5j6k8ajjwPePekxPcXLEOKCgd
	pelvaDz4blYWidINgm1Fz62h8lNbe7GC1SaZUqkTyW1fi/nqAbEF1XiKxGcmnib4d5hXZhHZRX/
	09SlNbPxik9aADCG+psQMtdzgoTW/9C+u2Np4BPShr6V49stX6AITEXOuSFcL7YDyoLisWgTqll
	4cDSVwPofSbzOLcsPRphHYWhLrKyhc8AxqHe1/+L4OdbGmDw0lkaBbH+8RPTT4EBMpGLuBmgIwM
	yYw+EnWFJPKJ2t5bRbtKppv8he6EwcaQXW24PCD8F+CSEZYEwcalez6WOTAMOIY/AoETl5NbpdK
	WLFX5j0IJKucK5Jzo4boPQ+UaEiAGFsugx6MaRw==
X-Received: by 2002:a05:6a00:9510:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84842f090c1mr1174818b3a.28.1783488794564;
        Tue, 07 Jul 2026 22:33:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9510:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84842f090c1mr1174746b3a.28.1783488793925;
        Tue, 07 Jul 2026 22:33:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:43 +0530
Subject: [PATCH v3 04/26] cpu: Annotate static information into meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-4-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1623;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=7tcV3EojDUJDYXtqUmecbHdHj5TxMJCFkfbTBXEPzZE=;
 b=uPlnXmsDJ/5XV/qNRqQUBd29GoRnPLMg69Q8kK5yzcp43jc/cas0ETVH8wiJJdiYqnzbfi3s9
 zEovQovAgGzBkEvohecMwfP1GUVvyzxtLtHFt9S/LksPawXMLNMVZUu
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de11b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3A8An4GuCW952TOlvi4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX28oOmChJGrjx
 gGZQNBXFUbHhAI/0cMEu3nDq7mKd/0XE4oxkzVSEP7vjw+sdKABcgfbEmAIInCtyVb+hTz0GaUc
 FGtfcfAyIEt02fBQ/2uqjT+8TPqitko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXzrtWA+wl+u6u
 hlIhwWDZOb65NXl6HmOrJTSBfXNaTlHvg7pFX3EvzKjdVLlJtPU515gKaFhdYmM7B7WzOyeJ/Z4
 FvAN7vw3b8VYrSO+l7bC2Mz6/OpqVvPCabYejcD023X7WPR5fZe4woNi/ji6/CVQ1TnuzeYyAIS
 tObKO48+iY2IxZuG9JNzJ4TwqJ7uEyrBGA5QiAWAOYgoKCWxWLRaTfDUayrDVig4cJieKl4ehMZ
 hualkvJyLWybRd+QX3psnsJnHbsHMdgBsZoWFzeUxq9hY1zzdj/YKVDzth4VaxCe0sVQL6vFOhq
 LYHET1pOnGRJmaCLN87ugn7m5cUNP+hiEkXODoE0bas1krfOBvb/CaX/yGR7qyze3NFy6fF1EF6
 kLPnW3inYpMg8IZuZtYKntU/O/uSgIBNx/HMbSnQp/eGYavi1o9NPXNtfKTWcdTnDcBel0D27Uh
 rqRc2B2mS52p6TGwE9g==
X-Proofpoint-ORIG-GUID: 2c23cwjaBxhw3luqFa9LIKgvJaPy55L4
X-Proofpoint-GUID: 2c23cwjaBxhw3luqFa9LIKgvJaPy55L4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into memory inspection table:
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..01c86510124f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -37,6 +37,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/meminspect.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3083,19 +3084,23 @@ struct cpumask __cpu_possible_mask __ro_after_init;
 unsigned int __num_possible_cpus __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_possible_mask);
 EXPORT_SYMBOL(__num_possible_cpus);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_online_mask);
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_present_mask);
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_active_mask);
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);

-- 
2.53.0

