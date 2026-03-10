Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0953E9F95
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174065; cv=none; b=Yr7iAJmAbzA36+2sCISFjr1ztmIwiTzE3cawZOwhIU8gin3fh2xnYfBk42uVGT8Jt4F7GqYjY9BEGwufv7fM2zKCu7D93+u8U4V3D/hoKoLrIGzjizvbaUhJwDwWD/zu/QcJ1XWSaFC/hyg9ppmWURymvMhGsAH4alztaVPavA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174065; c=relaxed/simple;
	bh=s2cfwUngtIxx2eV9eH8Dr8bBdhICSaTG0klgQVpqdHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T99xK2/ZE/QIUnhUPYZh4jdjyvX2HBLdt01KHc4i723QnHFIiPI0xWSc1XHoiK/2ZOPFubBPIwbZGMDeqcoJacGpT/cXN7ZdrELaojlfEo9nvuK1S2Z33iHboGF9USGMAtPV3IuvZGtuC9CEBDmdYGcUnr0/TvSwCkROZGpRcR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsqaEFjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9vOExKV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsqaEFjE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9vOExKV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJvdpb3296538
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8G6ao9c6IrCim/s3l50tkoj/aPJ0c8mCOq1F3OVXebw=; b=WsqaEFjERT7rg3s3
	Wxh4C+QCKApqmb0SH31sntHGAvWc+qf8wmPqySjMHCo1jeHhJI60NHr0zphUZWHZ
	GQosGveeaBtzUWQ7Q1IAkpdoK9yn08lEhaKJWCAufgufRB6Ior1EGFC2N09sczDb
	7/cx2WLOHllX2osb3iSyttxtVaavlxwEtzl9WjPZXcdjz6WFzIgmYLhGX8eL3AlF
	/KnH3dlStqUuteY6tdTF03fh8MY/DmVq9JpR31DcLm3GeTOhb3PIoEXaBkV+t5P7
	AE2LZZ/2jv+N4eRLEYL00c4jqi+yORHOQGiMaJOCJND+Gilvla1St3elnPg4ssDz
	G0nEOg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mtpmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:21:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c739120475fso3388788a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174062; x=1773778862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8G6ao9c6IrCim/s3l50tkoj/aPJ0c8mCOq1F3OVXebw=;
        b=B9vOExKV7A9d3anr4s5Fp7nbA8kV8qKbfWJMvf3XBHgQEW5Ur7WHRU5TlZNNmrQxh7
         oi5xX2srh4NjQAr2wezy7+RoJC3hCjm/HRl6kPpDkvQvZqeHuAUffjtPIL0uKB2t7/O8
         feseQLWT6SQhNXfyjQMbpg1FuWuHNraVMd64rlkq3I7kyR96O0+H2+VrML5xlL5yEnF3
         mMuoUozfZmQ4J2M2VsOtsFoFZbquXuh/60xN+R5Pfulcq/wBIGomishuwDAJaJbqwN9H
         nzWuxyxaGWjW+/s+OScU2hRzk6GCq+rQB/BSsRcZ27hHyaOMG7IsvJOWn4wr8V2XEJMQ
         9IKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174062; x=1773778862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8G6ao9c6IrCim/s3l50tkoj/aPJ0c8mCOq1F3OVXebw=;
        b=nIHJEpaG/B4WArjRp2xWD8mNGgGn0Igjvw/6FnsXPOZQEAGWyZSPMkkgI53XGs2dUh
         tBbcWUFlNBx3N9s0M9YJqQ2D/HA60biJxxnNzg97Siqr/HPBNkX6Y0fdBswCNRepHiqF
         8st9sAPXX0oeChN7LGuCG5ZF2v42Gzfad5cS6om6nSeMH1s3nZ+PS6lwHKPbTes+iTyS
         Tib578WEX7OReaT/o0WqGrDArYN064PpLKx2GkhZ3CvCuljKnDtiflaAg5EFaQ8aE7Lp
         qCIwMQbEDOSbI7WtQX3O3idUoFrfpjoezgGl6fEY7H374TH0Kw9sVydjol0aTaWtBceR
         7i+g==
X-Forwarded-Encrypted: i=1; AJvYcCWUQSmBUqqIH6em92bTIBv6xyi+xKH11sedaUNPwoITMz8ZKq3Fy4lvZGcqYq6JIWiz2tQsQoqz8DEaMK1d7kTM@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHjpm4ll/ylBCePC2WgegA4dBKGokivy1PsWaTOYkAqLBw41p
	7T3mKygMc/zsEXvbgNuHYIk21EHUqZ8wyeaPlm3CG1ih1VN0QHYhFDlogXVvKOBxhejJB8/jH1q
	WI87PC/xetabs65lHdqVHT1hFtBzpwWxHtyh5BWkUfz+AI8AYCuWbjNGvyMTfJnobEYndq0yB
X-Gm-Gg: ATEYQzz48sm4vV5g9slPMWPEwRM3qxr18Eg/dULhBLRnOpDhy2AKUODN9fbCfkMk95i
	q5C0rVT9+ilX3eqvBH60Ijd5vamPoCd5JMatZPiZ+HIZH0+Ky6vxxexSzxWWX6l4hinRgNpbkiy
	KQmVWgC1w95riGY5QT50l7nbJmKnHF4nBNZwXv4tRcor8ha1+9t4gnG1vz1TW3B4lmr9ug6WUqS
	9lflMzJbIL4ZMHa812/+3Mc2xJrztoTMlYb4lCVTTmOZgJhZFB7OyttTlPlcKY9WmEeoMw3fAZe
	LyrgzN6KVvXP1AWl9xKF5uCssGGJ9fhBlVNXfIbsipDA6CCyE20D5BNykvMbpLcqIpBroHHyuu5
	CzykAm3jltqcpBXuKYS8VA2jERfmRU2bVvj306L0FcjSRFlKg
X-Received: by 2002:a05:6a21:a97:b0:398:b5c0:587 with SMTP id adf61e73a8af0-398b5c00764mr2440405637.42.1773174060646;
        Tue, 10 Mar 2026 13:21:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:a97:b0:398:b5c0:587 with SMTP id adf61e73a8af0-398b5c00764mr2440378637.42.1773174060015;
        Tue, 10 Mar 2026 13:21:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:59 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:03 +0530
Subject: [PATCH v2 19/25] mm/sparse: Register information into meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-19-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1623;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=s2cfwUngtIxx2eV9eH8Dr8bBdhICSaTG0klgQVpqdHo=;
 b=xNEeXQa/cNWC1GXYckGzvwIw/v3hCspjDsNkZyY1zYhqsFA/V37X9XsQTlN0zIgnx7o5WUfXP
 T8fHWKWsvkND5KTzL/sjt54KQs43AGyHROp1bjPiWExrBXQcpTK+mk+
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b07d2f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hPKMzws2jpgYMEASFUsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4GSiL3PihHzKKKWzRumFFTDZV_Kpyyi_
X-Proofpoint-GUID: 4GSiL3PihHzKKKWzRumFFTDZV_Kpyyi_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX3g/4X1B7qHDA
 I4Y2PeaRyrBMqHPpYHGIxKg0UDW/+EwNC1rf5IEzuavI7v3iW2j+IvVwfXTrOn1im3SQcRp3lYS
 NfQFC0/Yy8x9eSGkYNqC+quKIKO717Bi4RDBp6SIMNhNo7iRUOwEhPyVqjSJQ6TOORzWbk1i8Gb
 Nc5Vk9b8WeIN2Gf5s77MpNTtUpaUmonsnFsahXM+SHjoZby5GVWronHHBXzCpa1x9jLt2MBLxWs
 2MGDWR8vNxIPnuNuQ6jcB589ZOdPGL9jqozA/GjLx6rLJPdbYEcvg0hXo7TzRKGR/2YIQEIUXXL
 RSc3GkGFMNGidOD8Fbwa6pOF8vRN1f3lEdcQy09eq46yuVqSR5tQBWZvuyWZ6uy0wuCnI7yBex1
 6nuNhZM0org/THzlIr7+6sgA+iF4cI0yyOpx0++1Fn4Iph5oWwIx2FZTTTyiVCL7GpTpxu+5M5K
 wDMhc5DujeY8iEXmLXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

Annotate vital static, dynamic information into meminspect for
debugging:
 - mem_section (static)
 - section (dynamic)
 - mem_section_usage(dynamic)

meminspect uses a different API to annotate variables for inspection,
and information about these variables is stored in the inspection table.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/sparse.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index dfabe554adf8..38beae2d4294 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+MEMINSPECT_SIMPLE_ENTRY(mem_section);
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -253,6 +255,7 @@ static void __init memblocks_present(void)
 		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 		align = 1 << (INTERNODE_CACHE_SHIFT);
 		mem_section = memblock_alloc_or_panic(size, align);
+		meminspect_register_va(mem_section, size);
 	}
 #endif
 
@@ -343,6 +346,9 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 		limit = MEMBLOCK_ALLOC_ACCESSIBLE;
 		goto again;
 	}
+
+	meminspect_register_va(usage, size);
+
 	return usage;
 }
 

-- 
2.50.1

