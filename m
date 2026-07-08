Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1DE3BBFBB
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488861; cv=none; b=LE52Q0hjfnxi3i8+GEVCltKR9mH8q9oqY0wAuj1D56QK4sELpEUspZff32d7GUQO5dEzp//vR8v82r7PFyfvYPpu/qF89YfRIQ242BsHgvajTQf1IJMGNJ2n0LLbWgOCoMOQGosAXMBrlvNS5NH210rnZhhHBjKcObkFtZL3arw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488861; c=relaxed/simple;
	bh=Sj1jdSOOXK5Nzs0wxXa1BmNiFoIG4OgDkHPeO2dnm2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jqiswj0/XvTmea0m7/O32s5hoG8ukY9/SpzGQFxSJ2ucecyMY41SqjQ7lviz0YzomHWObD/9JBku/t5L2sO9vnaMwgeF6SRNvVv5u8m0WeZ/Eg+VaZi6msxt+EmQq2r3Z9EC1A4ooHMt2bIgriu+s7VU+CVzXhLe6g7lZk1OuCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NT2dGDDE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUIW4Wzq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NT2dGDDE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUIW4Wzq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685Dqu21818071
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=; b=NT2dGDDEzC2DVpT9
	SrR/ynRKYJyvutjIvYhW8hdnUYlZdoJEk+AnEimC39KOOphBS+JrL0IvpMWzyJm2
	9UiFeYoWYnSa/7i/DVQH7J3ZSewaDtqd1lD3c5aOEP5DaWfdjHkwB/gWRC0c0RdA
	nBeCmtT/PY94Nzd/XFCdUVybp8N3xpWJR4Z8PwTH0AFsEp+Qk2dql+6pTYPI3HLy
	7L49ucsHiWU5wKZhkBXxa0qLekf8/fgpoY/x9pNsOMPWBeNx/GHuKS9t1ES5MOuB
	CAKXUZZzqHepgOdcWQD05u7ulY1OLpNlml38Wm4J/iovZ0+2gQMxrr1BkR0vOWyZ
	XwfwEw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hg239-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:34:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845317fa7e6so672967b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488858; x=1784093658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=;
        b=LUIW4Wzq8/tD9zP2tFABEVDnkRMsMCCEhWXlWabwo8VV5PM9x8aHJqM2KXOM/h4CqW
         v5q42I5bt2ej2yOOkgQCvngO8Ak5UV0z8rBwn5bNPhCXKayn7AUJ5HpFHS3+KtN5ohF8
         0zESkl4v+kL1HxwqAW6vw/JJxQ1G+SOgefYpHqyncRoQIxD8vpvWSVTj5sAGeyMIzPM4
         mIJ9Ii9etUo29FdxqF1DUisBifUIxKgkod/rap61YTHJ3LlPgyUTODNX4+WWGB+lqDdq
         iup3Tx7LUXP8+keh9C4lUXe+ohdqTBeT+w8qQBdUoqmVbXZGLSex+yqWbqc3Jm+qXHKc
         hlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488858; x=1784093658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JKSKEpCwUWulHpC5aA7ZnyWLgFgRV0CQRGlkqfNweI=;
        b=c5Rjy6We+qHTbQMOJpuno97K9jLdfbJAACRzC2nxaEvfHHmVDQniJfXyxAdy2cWNhD
         vyrYb88XtNP0ntx55MofWhmE4Rr0BT/ZYiwmlLLlD4oaiU/S9RMxE1VchvLiuTjyCMao
         jdI6P9yEPi1/lRYGubkphva46Itf1UzDCHqO+rLTdwDKaebdc4I2ncydK6gyZ3XKbkjb
         JAnBMmm+uJx1ezLfO3mdm9WJ7NDXCGCvjqIIfv4pdIjx5GbCkjc6pcRFnmr0s15uREor
         JLsilXooVdsHGzJFOBbQ3yCKKmXq4Bnsxue9POyAgVA16HN8p0ayqIdr62FAeG7HxSD8
         zmPw==
X-Forwarded-Encrypted: i=1; AHgh+RpgGks4/S6bdTpjFg573c0QiUBl7T8l89HtJ9XYNp+viPhY++NPu4afW+fcP06+tSsTMdImd47/JFWKJX3qQqu0@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ46vIIRM4ISSvtPSuw7UAPzwcz7PkCSsNbpLXl5y1BKEv8zw3
	eBbC6j5LdjTZJi7O3cwb5pjX7rdLyOn4PlcIxVGNXjGofN93HMGdJMdpFK7UNmFxbLg3HDmEFi2
	n9+LTrGVZjUSeCezoAYsMnCaMau7k+/UMhM9tHAvTzqUWdtXzrELYUcyqcTpTRPX0mYgzQpK4
X-Gm-Gg: AfdE7cmFMV8nw3CDFN+YbYVAMeko3LmPrDF261UERahZ4cr7q0TKOQjjVB7qNcj5RYK
	FnJLcppmjz1gGArjoUFx+eEuldUV8En2+7b2dVmzFyTa8PegP0dSUGVAWS1htlqOTI2MTaCcDDI
	IfZiy+CkBonJ6AKfTC9+1Rdt5w4xGTqaE4hFqKcQePQkt54Ho9vpfuJydzlVtpUfk/MvTw455Ih
	j12dtGNMXIH610SusBamIWWmSyRPre/JK4Q2xu4TQbrp+c/U8RHVrfGNU0l3svVExz45W3OgaRb
	3rEPsB3uRThQrbHQ0d13q7gy0Ef2vl1U84Y9qyR+RG76/jyXnOc+H5680L1w4X9odG/q3NrveJe
	f6gaMSSME+OJG6cvdxseoQN/dvclam5TmLYdppg==
X-Received: by 2002:a05:6a00:1886:b0:845:d286:1fad with SMTP id d2e1a72fcca58-84843232103mr1002177b3a.60.1783488858013;
        Tue, 07 Jul 2026 22:34:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:1886:b0:845:d286:1fad with SMTP id d2e1a72fcca58-84843232103mr1002094b3a.60.1783488857213;
        Tue, 07 Jul 2026 22:34:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:47 +0530
Subject: [PATCH v3 08/26] kernel/fork: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-8-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=954;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=tH4L3qrbhSf/V6y6KtMHUcarziHQ2L0/qqZt6IntL8A=;
 b=83U3lLes7ct+RTYAnjAk+zQH7f+zLTDcoSsWkgRb4n0jXNEWzZ2Nxi22zBFZqS5mjh5c7YHcu
 LAQzf7ye50qCA3/5b7cfLy4jL7uV11VSKD0yoe1rHcr7kFM2lXZj5Hc
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX/oJsLckzVuQ/
 GOmmB1gJMggaM4yCF9D1WCJd/++EWffRizHJKboL+JmMbdajx3RCpsI2A8zTG8FXsFRucyd2QB0
 0VUyi2AXESwm2PXiwlaJq9FfzBAj/ENmRXPiIwGQU3JoNGzzi4hY6LS0jq67cZNNceKISQGe7xS
 PVVlL7t26d+WKI0xFTNqhoOhTKqo+8fM5RMlAS4QBhIz+T//jYCYr56e3w2zF0kjfILehws+iGw
 lYpO2DRcb5SzfcPqY5Yqa95UpZPjikZ7e06/ACjb/XfohP301/EvGyR6IxTLOu8d77IsAt/G8G2
 5IsajlcBWSqha2osUm2T8mzY58qA1MuYI7AzoNMEdnOv80QpUzChc6ejNZNrq2Rbs8sopDX2ZXw
 ZNJrYQg7WRq3zYfkgD/tr03o3DaJ7OSSunT73EjsrdvvRVghGmFCJz2WYX9nxjsRvw5EoQxSWOX
 Vbn599+44Jq4icuGHtg==
X-Proofpoint-GUID: SF8gGFQ9jdKsOMDsa8MITse4XapggMTV
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4de15a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=A5cnksRAjNInYuj8VG4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX7IQ/NFV0n28m
 RqU3Q+fM2BH/xANmwMG5Vvyc9/VNmVHHf9C/U4DuGkpMdTBo9ikB4re+vM06SGrdDaS9Iuc5jdK
 nYqqrP9es+sDhndI0FWTCv3/BuPOeMo=
X-Proofpoint-ORIG-GUID: SF8gGFQ9jdKsOMDsa8MITse4XapggMTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - nr_threads

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/fork.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index 175c73bbe2bf..ec99066eedd2 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -111,6 +111,8 @@
 #include <linux/tick.h>
 #include <linux/unwind_deferred.h>
 #include <linux/pgalloc.h>
+#include <linux/meminspect.h>
+
 #include <linux/uaccess.h>
 
 #include <asm/mmu_context.h>
@@ -142,6 +144,7 @@
  */
 unsigned long total_forks;	/* Handle normal Linux uptimes. */
 int nr_threads;			/* The idle threads do not count.. */
+MEMINSPECT_SIMPLE_ENTRY(nr_threads);
 
 static int max_threads;		/* tunable limit on nr_threads */
 

-- 
2.53.0

