Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884D33E9F67
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173851; cv=none; b=bUaI34h8lEcGN6GQYaIi7qpNTdFmdcqPUi+18ziExigbsxxRIHcHrUcGU6pMuxFgTe+NkJIrdF8LnNtma3mFEI9T5HP2LKOIFOSkYuARg1g1/SgnPgha+8yfVSFhnKgVWxMvpiwZ0wApbTssO1oALM+Ka8anuq7xaYK3CmrV1rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173851; c=relaxed/simple;
	bh=/g8HEiXUYfa3Zq5UeMQE3tUVgKrL8ys+bUgFTnVC3x0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6BnS+zrL4FqXg5rgnXPyexpSxztu+tvxN6wBmfyQmLetJ40TOwrADpFnibkfU00P4LhB+dRr+QEhZKJdimyZLW3EaaIdeFkzumqpIIKkbdU4Uzn1BXOlblOFnHylh8XCxVjXqa2bbpb99Gn6fqWVgvfppALe8XttQdZAXMt1PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=by4B4Kk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hU3TKpNN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="by4B4Kk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hU3TKpNN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHbba3248937
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/p5bQNtsurS8ELLM8cfGcTYhFbVSlQNGcc/PqunPdEc=; b=by4B4Kk5+VrKoSdS
	6QyqTOk4zerpxFHN9awWxqzVBp5b3Mbr9Z2OSzscqVAx95NlEcLuGCeFrp5wkCor
	c4u8y1+2cddOZHOuCwlb4trlfPIlcBqsiLktXdRhu26uZ7LrcFQWmSSE1xgkztHZ
	bRkzfwzAfTXWaFbv9/xATSrCiv2I3Wfn36Loaj3XoBEioFfD/2E6fsm63URDyl2y
	nkIFioEFaNvJKMYKFzFHpmIGQL7IU1jCt2ZIcL9zpLf2QlAYZrKj0XqOF75lafAU
	dJwLzxk2YiqgzWwu7Pg7sSwVEv2cgU23b9noj6vPEkTuFMFs2LXYtiNLQ7ovBjj+
	SjLD4g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqv10jp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:17:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7381a95fffso3694264a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173849; x=1773778649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/p5bQNtsurS8ELLM8cfGcTYhFbVSlQNGcc/PqunPdEc=;
        b=hU3TKpNNJ001yX2DiFyaTw4dzs1LcUKPlbeShEYB1mM/k3aw1BYqXUkWlJDuIcV7Cu
         8cJguLTa/cMI/Os8l+uQxW8WGd+UdAETzDAj3nfVKUlA/ppjx0zZgcBQzoLcPVVTV2Gf
         aBAEarGR9wObJInuokzQ5S7B7hr0kOeHGwJpzgBayMv61hM1hB/CDZ+xT9RQk3wtpowC
         HIkjVSgQobgItO2BOWYXRTVOIw+0S9Oy1y8Ii5GLbJyq/rjDivc6hfnpuIHLYwMcUKEc
         a/dS8v18OEzvKaO89H1NhqD9jM/wRuwQ8P2dMn+o1WY+xwh+gLKjA1Wad96PT1ehfCna
         41KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173849; x=1773778649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/p5bQNtsurS8ELLM8cfGcTYhFbVSlQNGcc/PqunPdEc=;
        b=RtowuJpyPaDMRW712kF++OGY7JkYJwJOgvohPYDihkb2bEkfLbhV2kk82iv6whajlm
         aUjG4AWQ+iCiHCrq7w42ADX7+E/99lCgWiR9AnqcjxP4vsxk9VM+R6jfpbjIUkmPzsUS
         BXmg/4Kpzib9bftXhsrhvFOz41f3ttI5FA3BWSARHa+LFL/6RFyxoA46Nt2XFcBA1dn7
         goe7cNr1V6txidwkcoWBtzNK/pwq+1CDqyVHKRMHRmYgKcnw33YGuO5JSUaKN4aSAa2D
         8RiQiTR7rZBjIU/3zdFuP1axOY70GpbPPou5v0CL115Dtka3q7aRTqvoR3lLFmcQWbCO
         6hRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9oUBqb2g37wK2mJOnfjo/0gMCwzeYKMqHhVUzKWOYutaKsst7KDA4uY9pamzIsLNAAe/fT/rhoGQBxDXHXndd@vger.kernel.org
X-Gm-Message-State: AOJu0YxjLb8NJ/NyNaiYR+LdsYhNhEeM4cy301Zfc0K7ODE8XqW5CwKe
	UqLj33JD0/TvPj27aaA5N77tvX5hvj2WjR8iZ/iuo7PjjIQDAAkZAyZySzVb20UCOo1pHtagBrY
	1FSBg80oLbrtpi5IK4sEMo4Oxz5RJrCcyhb3iw8tNf75uaHV/xKBpZSR7uAlkPtCV9mEvvOd3
X-Gm-Gg: ATEYQzzT6xv0zqE3dLAdMdJmFdfsc9oeASs7scFk4rb2DeJnENppji/hFgPTAWeHZrF
	4+wvkpXWzcYDpNQxo2qZquMsiR6fTOP+UCNVpJAtH7GhXHDvgf1kXwNfkedgAgzv3ugRnJPMznj
	A/Fp/bg4N1Px7TD51G2r2yR+O+EnksfpZLBxM2DM67PjutMX5Meq4qethhbZQBwBXJSiRE7bEFw
	bTU6EIGfO5PF7bgzZ7fTAxE5ZN8K93uCGH932q0jANC9v0QWG72Cm5tDddTqya/0isimIqcJ87T
	/hAms9ObAJCbDe5P5wFl54LvPhpKNN4ZumnOU4TZu9vS3KMW/lMfs02E8A+qmJRbEzuuBeVNnAq
	dd/IpKDV5Qkdtf6XUrAblWnlRvt01s8m46aBs7ymiX/lLg4LW
X-Received: by 2002:a05:6a00:180f:b0:829:7e6d:cf12 with SMTP id d2e1a72fcca58-829f6ea54e6mr176868b3a.18.1773173848466;
        Tue, 10 Mar 2026 13:17:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:180f:b0:829:7e6d:cf12 with SMTP id d2e1a72fcca58-829f6ea54e6mr176795b3a.18.1773173847792;
        Tue, 10 Mar 2026 13:17:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:17:27 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:49 +0530
Subject: [PATCH v2 05/25] genirq/irqdesc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-5-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=961;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=UXg1t0l9m5ubA1qVNL7kczvqoaB7NuMSr+jbvqU0OqA=;
 b=tpLi1SDrgekMvdM7bSodVPbvBq2jkmRJ9w+7dr9fMPSvTOVcpu589oNcA+Ssz2qd7S8Bd4rG9
 EZ0hqpigrLFAIbWc52tOHGSzhTc9cgRgeA1CcE72coJ1nJxp+QVKA/P
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NiBTYWx0ZWRfXwd71QW5ThfHA
 jdj+XM0GVSFk1D5shj1KsQ88WfVcf5smTBSCps1L7sQ8ecK741W/AKbQv21U46pxPLSugnZ+cu6
 EOMaM3NxYZg5x0tYQVDhP9xC7MPWH/sVRK9CZUxNZQ1VOI0bAXKpDFSLLOto9iLS8hPkvogHvrr
 Ey1BAwselOE+eBqjwnIO6gsRjvZumxJXhG1lxukG7Lxb1690az/IbybLP0qKwS0RcSvSpVDRafO
 ROX8K6FCz7FAEX6aheHT1wn13R8pDCI7KJCIfPRMvLGQha9iWQ2Hf2SFJyW69zI0Spovx3LYyzU
 yewvmpMhj+skI7rdkjym+l/sLZiGGQy4cSguNEIxAmjUSl9Wzcu+pRRHC9XkU3+gKvWu22vWefT
 CBnWVLUX8/uFwygZOy6Jm7KvuUIKK46U/FRt2ewy+T52LoGBMV9yLpqBsgFEvEXRtcDO2stgN8S
 nTDEnkrOdbUBQsRrKFg==
X-Proofpoint-GUID: 7hDtN99rkSIdFY8qrNeLrlhCHMrlZlSN
X-Authority-Analysis: v=2.4 cv=S5vUAYsP c=1 sm=1 tr=0 ts=69b07c59 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=W0BCv_TwhUmk0ohr3HAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7hDtN99rkSIdFY8qrNeLrlhCHMrlZlSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100176

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - nr_irqs

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 7173b8b634f2..44ef0ebcc3ce 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
 #include <linux/string_choices.h>
+#include <linux/meminspect.h>
 
 #include "internals.h"
 
@@ -141,6 +142,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 static unsigned int nr_irqs = NR_IRQS;
+MEMINSPECT_SIMPLE_ENTRY(nr_irqs);
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.

-- 
2.50.1

