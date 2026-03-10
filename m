Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EAB3E9580
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173820; cv=none; b=E5r2phNpUvzPXkADhvcvGH0cDUKudaNhs8We6zqcUwfdu9xW/6X2usavgV64B5IT2PHp3E9SOkqAapfjmApk3v2gyOgwfZZfKv7tR0NxqCZ6i9qmDHm6sBWSdm4olAP67B2Yeq6dtx4sCJdS08QTlOLMPUxB9ZTFi0nwZs1uUcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173820; c=relaxed/simple;
	bh=ayFeigblzCAoyp9Qp6KiYtozlvf4+37AaS9qLsZ8MIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PlhWtbwVoiRKeWFwVPVohpA//M9km9NOq7yUsTWTJb76KV4ZTX//sMMhDNOPnLIN554O6dDHbS0nvYV5FvhG0iMlhClZ/yTuG4yIjn6EflXtUQg2WN74l5z/jvHLHVnij3dgNiYE1j543uy31JwyTUCRPYJCRoJYd3RHe0YaGXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+F18wF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i62DQosj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+F18wF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i62DQosj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIub0q3894073
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxwX2Y88T6y4LwZjHtHAx5HGwUr/pelc0DybJMU2hAI=; b=V+F18wF1TAP0Q2Ck
	lqU9astfKnwyjiOFMImTog9s0PfE+yGloq82sX9318GQImuTdNu1fKgoeC47LJSm
	3J6LDHLg8JyE5H6MefV5UKiJmlf2iLLqTySnJ93UwOwunil3J8r2Wy+wJkXD2RKv
	YSfbcuOWwGgv7Z9c3FLYBNpX5UL3JwKjRi7iRcb339jJaKB2ErSs/Zg1UMnUH0VW
	isatBrk6/GQGcMDr4479H0gbMtIw7/NIYmuqxcGiVKtd29dq6aBvSN/25HxDvRLr
	RC+X1AHmKE0fMXNPMr4b+/2ckH3EWIKdIyuY1/TWT2o904Mf//My74FF6m7YudWw
	b5YZow==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyst00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:16:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so145626b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173818; x=1773778618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxwX2Y88T6y4LwZjHtHAx5HGwUr/pelc0DybJMU2hAI=;
        b=i62DQosjFhuR1/P0yAWJQvj6b63ESZ7wTaTJKw0wkcNJthvzgwUVzC+r0krMqiDxT5
         kNFce6xwpF4ejRDN1OnBtKC62WDMs3vKjNYHgn+HOLhjkKi1RM10W8/o8SxbTLIN9BeJ
         f0ZCUKidyss0Zy5aB0sTTawKhHPCj6qBwrYC0Zji2TbTicp4TpptMOz8m9gxErQF5k01
         FxkEGRpX5+tps6WuMq8+UITWtKDwuExUENLUMgt2U2meVFvza7IE+sPhMwZ5jEClY5Ms
         4MIqvvJ6Rd624rWZdqg8YN7zSOpos2/mq9yoPUtPwnZdlAiqvtfq8DympWNQrsDUrN9m
         3Tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173818; x=1773778618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BxwX2Y88T6y4LwZjHtHAx5HGwUr/pelc0DybJMU2hAI=;
        b=RE2j/yrw3KCwo+IC7JZw7eqHt/Hg+3Czbz3qI/g4W/kaZjR8RqnvBIyyHuX5ZBYOeS
         X546ehqqr2dhR4/EhEciIWsjaKSkhk1B1cfGe0AEcaW4w+J8m9aE5evBYk3SYm/+YTKC
         x8y1yj7NfBdkR2D7n7EXVXVxVD7EZB8qGUPotBmmpf3Mh74G7Y1JpSaJof5+k7POCB7a
         mDORVf9+j5AKvNpJn6vyOw0qzzD9m1oHlTNETBNAbefzaqOCPagPwuaw+BXjt3mPr7VL
         L3n4UEaDX7JLGB0XwnQLzAZdZ8EGQrvd80NbTxVP7ZwBCkg7oCb97edvl7iRigNwEayK
         NnqA==
X-Forwarded-Encrypted: i=1; AJvYcCVRp/xu/hNkeuDbdYrFw3crSTyjI1CRgltAKWcCwfsn8J9frzLorwWQqXcQxUo7fUeQ4d572Vyqc6uyNEgPHd9P@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqmkkhe74Tegokk/xcyyVHlGzfL/guRhcPOX4oPc/4E/37oN4o
	lC3VgIhNKIhKXWXEEdZEN4IkUh6wc9b8DRR0PAlNDHspgowQEROx7WionHOUCy8v2Ws4dpurmiO
	eU0mF1otD4xlTGQf/+MEIA139fgZ/HoFOLhAvBBZLnqrcMv0VEqFeJsEnMnwmdlcihkaM4Z7a
X-Gm-Gg: ATEYQzxj/Tb7+ZA+X0gIe49SsUPFBTcSSeoxLSO/BMWcLe95bdYwjNPsSaXUUaAqNOq
	eilFkoD2jBlX//4N3y3ox2MoFz/K91wpG8REiJNTySXXbOIojK3T3zACORW9NScDVaHavAkvZOA
	DXC86Sakr6AoLQuEu58+p6vcVHQQTfZ83mxP3BLibnaRw09AGdy6FtLQerxfv4l1dsa3+h0wIsG
	wGj1MczBEu8WCWg/HWTJZZRT3Vtz6EcyWqMWXEj3acJWm+r7pLOE9DHONSGwPtbx3eyqmiZGBzv
	BBYo0Tvon+O9/AVqbDKP5I9k/VLujVfftGuAToVodqWw562/jXAxzeM3V5VXdomCc/wDf9rZqZg
	QBBPzaU8pCPzMV1TXr0BZfXny21WDUqnXWGeHD2HC1zNHauSM
X-Received: by 2002:a05:6a00:2d14:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-829e4077415mr4216156b3a.25.1773173817670;
        Tue, 10 Mar 2026 13:16:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d14:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-829e4077415mr4216101b3a.25.1773173817046;
        Tue, 10 Mar 2026 13:16:57 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:16:56 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:47 +0530
Subject: [PATCH v2 03/25] mm/percpu: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-3-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=895;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=+tGlmFyqBcoz7Ktr3AUpoQMVM4JnoUBVi4FO5/qneMM=;
 b=NvchOxzzO5I0OEPe3SoUqnDWDl/QAp23qS+G7CfJ1IKH1kWlIdZBO3QW8taGx6ZIGgP28DMU5
 qvn4YwBoiI/BuGfOm2ndKfDymQC5gVBdcKxJtVxj6fAwtL9RVgACP1C
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b07c3a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H2ztsr5sKx9LglhVgPEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: OlK8UTaaamCwR9-03jOTXjnrslcI-F2L
X-Proofpoint-ORIG-GUID: OlK8UTaaamCwR9-03jOTXjnrslcI-F2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NiBTYWx0ZWRfX4wXEFHc3Ahmb
 4iqHePR7pSxEDE1Na/cnpom5wiEpFC+SEMgUVoGajXe89QgnOAOARkb0L8OUHNqxgGs2Hm8jtxg
 +OtRGFs4nUl+qjRS4aHYApXCIYjLl4XWalApntG1d9SljCULGh2RicyWwIO2wTx3/E8KkpgNGQ2
 dQUSojDaeNrKSmzPa1+aroS3vwoABWZGKCn2fHwvoAkTKVAYyP+6aVPxkeRoC+N8kbaYEw3ZF+9
 26jNj3PvWXCdCNJtgoWQ9/6sZt8dqOYrvat3sPVMOsbQluK4s6mgk1+u8QeHuLEngug1BpClMwA
 uEVpg47sFGSv+wSIaWEbQ01NhY2kJTx01cXflS/qruUzhdM71jMdDyb7cqhNxlUbBDaf6q8IV9/
 /qanPd+tJPyXcUE3PYxkid5//f3E57zf9yNY155hrD/A589ToLC7IsvDRiaSu/Z8ecxFCvrg7Iw
 q/GYM5MZnCLIKk2nopw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100176

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information in meminspect:
 - __per_cpu_offset

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/percpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index b0676b8054ed..d4209bdfbef5 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3359,6 +3360,7 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *

-- 
2.50.1

