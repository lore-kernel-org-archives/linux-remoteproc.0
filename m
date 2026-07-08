Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19673BBA08
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488829; cv=none; b=QFtUZnvLtv6GnxP7Mam3Xj+cv1ZaD+fF2NjLtqKH14zCroSZpHVRhTODn9OYwrH0exaQfGVQuhJZ3cq8NrTmhVgc/rOFlRu75sqqlIaEOSVrP+Z0UeCPlQsk/cvksXpgPuRFJoxdOLgZbbakiEfymGdko6k8BtGo/AgzzGypK6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488829; c=relaxed/simple;
	bh=rausTGX/cA29KL+8ZlV/G0O47Zo2G68qaUiTzxM2SoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovCteqr85GnHJAg3dbqGWPI3krCAQEY76EtlI/3SK/g9pE7TzoWadsgxmvDInodK28oPfcfm8BCta+jzZ5KIAXVhtZg9A5AR9a9LA1XR6BAPSJfQq0ygpZiNhnNuou3GxgMtyVC7uTuVMuZCHcCQqaWzzaYhSBUkUtyrj4xYhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kis4SS8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BgQ9+Zdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kis4SS8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BgQ9+Zdt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842BwQ1508797
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=; b=Kis4SS8TmV5iP1Yz
	l7VP5KpLpSZzCD0HrWRlM9bPZ/SXhy/pzeuagg8DfSkugOIRNgwO+qGFPEI8UTz6
	xxQpKMEk3q4vPwwhSx2yHQIvCKGadfWDzWEVWxxZr1U1tAjm1JTlZhcuxJq/wHZU
	v5KN+a2tdu1/uxc1SoYHlL4x7Zm1t6TpzqRjbQrtGNZjDwpsvXYsl4iAMzvO/kTd
	fHtdDkbAxSVGRHy3kRK5EmfbHzCsONFcZa09PxBGA18MaN9K7IL+V55kZODy+bra
	MfzYkjW7Hiq0Qt7h8a2OhI8IXcXLg5BAILmPstdQeEwpidHjLbiSIdgV5v2jd4m6
	vvOMqg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be59135-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:33:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848474825ffso225290b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488826; x=1784093626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=;
        b=BgQ9+Zdtz83Ulr6SUm835C4Nxqd9yP1s1FR5XzT6neenmVXvmHpamP6ngLyywkXMMG
         t3xU+CWCKLi/u+N8DRxGeqc27x5brgEPsDhExjFgZoGdLTGjIPqsoJUs7Ir9R2aZ9ISX
         qL5InlPmVhk7E8z9+Ong7/St7FFmUK37ZP9J54blErteGVyxiDTCTQP7S4MpjeMw5pij
         +N0pHLD8fXvZ4EfnZLsULl29/TCVz7MPuk+IPtOla69iUJ1bz8e/zXPcWgyFzXX/Qygx
         dNNXT4de7QVnR3abyVHdpKaTSf8Qx0x3WBylACY3PMLaX5L9A8ZllTbb+u3XRCfLuIgD
         Q8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488826; x=1784093626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ITO+JE3opr8LgPgXIr5SaVvHjNfRbkajEoRTp9nYlQ8=;
        b=fb9NbIBB/QkMutkDKHgGAcNfFYjEPV+MFxek7DbhgE9QiilCPcb4BC1lQTVxvh+6AN
         V7aWY6HDs7+tVWUtLTguQLJ7G+CMeDTEBo32CXuQBe6BolP7kw2geaBaGM8QS9V6ZQzk
         reoPiPJbgrpkBtJX/htvebsUaqzhE01GwZ/X3pWUWSXu2c8zTVfvqvUPJ47fPdT1NYQL
         sU1yJLLeBy21/0hjs6u5DAzfI/cQHRuF/JPbcQCbeukYJc4MejcR4QzbjJtuUc7SSzCF
         zV+qgLQJaMfbsSlUJn0LGORPgahSkX6o9ugI01+zebrvsifww89qIfnHLNlEroLXGOGm
         +4Kw==
X-Forwarded-Encrypted: i=1; AHgh+RpYNQfhWoVkYQ5GPu9/QlbHl/uqZTNilESx0BiPBUAx6ysU2qSp00nKyG0Jba7OuLNzasfBRzfc72KmzJny2uzi@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz4zWWWgdXIhXUUEez24so+soommYHoDaf5r4GiWMaEhHmHZph
	2P35vfKHbtaCHIuMUq34WRSZiE2s4iYj+cbfIFcOUcXetjaHmmz+Pn/QO/Sa2sG4rUR1Lwm7uag
	MMJvMFXvwCfU6nt1I+4vL31KNOHAQZHHZSydoiu6IL1tCzS7VYBwvpmiMMO/VEihxy+POYt4K
X-Gm-Gg: AfdE7clNv65dWeU4jWw4rz8sbIspKkQzMpnOGhzo+zI3+j8zRXmu+oZC6hMvIkKxWIk
	Ow4iKs597XrZY3th7Kyoa2ga4BL0low2Mop2CsIoLxr2Kg5/8bks7Jdzzpz5LbMIgtgjg4f5omt
	wibHKU03sU20mkoAqiS2VHKG7BzCA9u3DhhWjj8UEl1Iij/w6yrtXF2nf/E1Ytp92ZsV7QVsC52
	KNik+1ZTKywI3BxIEGMiBOZE7TDvEh70k+Bg+3kOPQE0ePxjU45ho36radcqESSlfTeUL0B6WCP
	WiJmki1O7Whsv3fo5ZJqVPnh16Y5FR+qdRMCSrYNf7c8McH8jGXrtl4S826pDZm4/sr//3dCqQA
	6IGz0+HgNpn0K2hz9+Iz17vZT0qYLQvWNbKnJjQ==
X-Received: by 2002:a05:6a00:8d8a:b0:847:8791:f54f with SMTP id d2e1a72fcca58-84842fe321cmr1182145b3a.29.1783488826159;
        Tue, 07 Jul 2026 22:33:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d8a:b0:847:8791:f54f with SMTP id d2e1a72fcca58-84842fe321cmr1182097b3a.29.1783488825439;
        Tue, 07 Jul 2026 22:33:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:45 +0530
Subject: [PATCH v3 06/26] timers: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-6-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=952;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=dRXeUIpIlzWe1LNHxoHjAVpHzKcKSqqlKNhUPjx2KTw=;
 b=FTqRhuK4jJoW5z8xkIzP9taBuoDPVq9v+EOp0exYW2spJdYWD+lEd+oHVaecDxylcFpv676MQ
 j09Wz7/ilg8AWemdOCnZLhJohxL16BOY0AIU6SL7rCeCEXHzowGgz/i
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de13a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WZmkKkIAQcJSthQVk9EA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX3FRTSINrUjHx
 sl9UA9X3NMtA8KkNb2TxNZPS+KF4a2kubKtaYnOLXb6vioifQXxv4a1xZBmNz6I38RCo0EI5z4o
 hHf26DXyBASQFk9Bt4M+RW0b6gGpER8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXwtAUCE0frEyb
 O/sHu78qiMfGiUKDDD5AzTHIUwxlvChJZxOIiu1/om6RzB7qp6HP8f7KVIxE6ytaSwjOJ7zYBRJ
 g9eOa+YMbxMHpR3d+n9zjxdFL5L5KPG3lSAbSxNJBJAqIiH8Ri8/Yc4AgyBl1GetYM4L8Iw369a
 Sjao2/Krh4uoXhv1lwimxH9oJZZ/l89YnCUnlWccg+Bhf38h/lpSTDAbFPu6oL1RkJL5BkI4tFV
 JAO5QmcN2HeV7cDTsFo/ZEpWVOmNvy86Js6V1+Rx+esbGwF37Bd++7GChocxwbww4f6nN38Lq7T
 Cqq2SSPTS94Pv801ZZlm7R7pbastmnpWI+tGPm+T6XR7gG5aoBb9cwbCkkd0EAMXLz6rQaSALM0
 49FFSAbzTDeGp6m0nYuY7U44Bf+W3cLPhjIL+JHVgVo5Jeix79N/6jTw8chZRXWvE/RW6yjg2DH
 uAGrYfbMQrPgtKOGK1g==
X-Proofpoint-ORIG-GUID: SOhG-33O7xoyfUhpYYIvyv7u-QCCUw9I
X-Proofpoint-GUID: SOhG-33O7xoyfUhpYYIvyv7u-QCCUw9I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 655a8c6cd84d..6cbb054c7c4b 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of

-- 
2.53.0

