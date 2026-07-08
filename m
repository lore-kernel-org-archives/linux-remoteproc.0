Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1439C24E4B5
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488781; cv=none; b=fPipx8DeByMWP2l2BLZtG3scJL7UaXBI13jzEaOh/ZF1g02o7/5TvztyKWkfBxJ7RhAqjoalsZqXg+Eud8k/qX3JI4mykxBb6reIKgRTOXWsuHg4EcKoBYm01OZauyx2nIMYuG67/1MHZymF/OmwMcjPB2XNSEvkdjjKKKtJhzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488781; c=relaxed/simple;
	bh=G8ZD6SxJkQCQY3/diCwEYCUua0qsDotQB6fGokYi3jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DACq/ivsgsMIK+kRMRXgW6iEvn1hDmgmO/9GyV7tb69srrVI23EYdS9VVqQUA/7RmDNkbpbUrTENn1Yr0T5zJQ/7hbVnD2jzva/4W4YGdG2qV1J9XlHW1Es4sggQkHqm1BCHUxSseEl1ahU0xL6cN7CIbgFrs0uUcXEGGa2HNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNu0KmnI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IM91fGyF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNu0KmnI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IM91fGyF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6685DiGk1817806
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3F3QI++Ymkl+ZTQbO8vQyeuk6HPuF8AuBjBmELT9jU=; b=YNu0KmnI02jC4yC/
	1nLV2/RFfnY2EHc/tlF2Cd7G6gUQ6Yl7zDMWuXbbGv61Rpd9zp/YyPQJSkghVqUI
	nCs3JSjPPd7L4zO0ZRkmIR2Dl2R2T2xXMVP2YhovRJXS1Z+2aTFT7sVFtFTX8hCx
	KYlBxK2SgwWfto4JqKcaCSLRtVUjyiAseaY0xUTwSu/C9Q1G6cU+OW/9YRKRfBkt
	d5Mb+80OZgAebHgZ39abhnUyjDQ5kk+BZmoKVouGOGL6pTdUpscD/kkkbHtxb0eo
	mBZccT7SGgSj+3MXqWhUszJXCwkH20MQ2ndtP9xfI00eRI9HRkUgBY5T7WGTCKTT
	eFzT5Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hg1vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:32:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8482b95574dso409217b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488779; x=1784093579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3F3QI++Ymkl+ZTQbO8vQyeuk6HPuF8AuBjBmELT9jU=;
        b=IM91fGyFnxMoq4YMqczBPGrzCly5GCTHf5aWKP8vynDg5j/agASrp7xIaeUVtuyQsn
         yhF6aTyr40XwrwmkJEqH6p/lLmEG3pcAnaUB5d/JbA35PdQucM/xEcE+IO5fm+x6qgu8
         gAatW35uWCXgKc5Ntue/MCpeGHFMeA5Cn5YVbUWNMMAMey3uajz2K/RfOu3s7cnY+Cy1
         l3ciurNKsaDExoODTu+1mlurm9BFeJ6iNKZ1akXbpwozd2y6i7VYJBHdrFUu0OTl2NsE
         G2C4UHzLrbFxpdlIqdjdRNRaDBmuTkIOn5QGDHVohC1i/17CjLyZXlapBZ5sp3EHmikT
         6o6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488779; x=1784093579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3F3QI++Ymkl+ZTQbO8vQyeuk6HPuF8AuBjBmELT9jU=;
        b=pDeuJAJ/v9oH2WS18P4AnZYBHpJqyaXs138QDgv+gEM9VoUDeCCvpjGte8q4owmb62
         p97+tGGSRILg8SJH7o1nfzKNkIMMsBoyO8Ccb92hSqA0hyZV30/S1VwJR5V7DCSGEx3M
         bodZga9zSxRVoD4kqeOJaPBWh9TVh7Jx2VvYH+B/F+uWGsHYRikoIo7mbccvCV0OU8P3
         3tKCR7WaPCLDDs8WQy8bhU6mePNBGHXvlWekRyIoKn2dF/Yzwt0S+g4fq33hLCXwQUw+
         7hyploNXSa6UYRsTwgCsAIKoJKloOhgkkn0RKLRagINLxjvjA4ps2oTaKOIUk6yI8qAz
         cyeA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1LtViVA85mHVJMOk/dNbT+EWf2OUfVVln0QLtZfGgWAXlfnphzvHiSREue3k2ca6uhjW2PBztHyVfb6vnI82I@vger.kernel.org
X-Gm-Message-State: AOJu0YwhUil9xml3kGztxLfkPcsHlXvBq/ZU4XJjZiAZKUlRqBvbh8bv
	e6U9slgI63QUaSBtxiiQk9DrXQAyvhmDmX3xEzcW6R4eodp2lzdP7Y6VIKpo3hDN9OAK08Mdsm/
	CxYk4zd1DxVh9SNDrgyRFRlGGzT+ofxFCwd+RA06o46Xqom53i6+KF1YZkyrJZErGEF0kQQRG
X-Gm-Gg: AfdE7cmHiq4A26kvriGa6Aiutt15D6bMuaGeg4y97CrBgAXsS7VvhflddjQEu9ceWVm
	R82zvD5k7GsAoyF6s1Zc9i7ylaGPfJz6Fxz0aV64s9VGcc5ussRKn3zOV/FIj6+a+QuKHGrgwrJ
	ZzgwrRSbMxmGG10AzJi7rcIXBpNzwsFQ48/sTViC44TiAAwYvsHf8poB9Eq9BCjmJkmrKNMcqtJ
	ibfTpAKDvvcZTkfyIQqYsEd7GPcz2ePUpp3PkNq5EEFkb0MtAiaXSxZOiZboZD2n8yD5VMN97Mu
	O3nW3obK2b90eVZQ/nCS1chgrs8AXzaF4iNCvTLQBXdcUpFt/KRN7+GHclfDZvQphopK4UrcYfM
	SdkLmZq6Lxh469CzB1HwpeHZi+49vyK1fsZgYUA==
X-Received: by 2002:a05:6a00:124d:b0:848:2ae4:d2ba with SMTP id d2e1a72fcca58-84842ee9a7amr1114025b3a.28.1783488778693;
        Tue, 07 Jul 2026 22:32:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:124d:b0:848:2ae4:d2ba with SMTP id d2e1a72fcca58-84842ee9a7amr1113971b3a.28.1783488778069;
        Tue, 07 Jul 2026 22:32:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:32:57 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:42 +0530
Subject: [PATCH v3 03/26] mm/percpu: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-3-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=967;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=J2rXid2SL0yrlw2fwtUaAlFG710CRNb9UrbWjew6KaA=;
 b=TD35QGzVjIwYZNf7SFigqc+I/Rh0Yjyom+K2CZ+Qac5akSllT3+U5ZG26sDsxkvfsPiyNpmIr
 fPjSUHrWCbcCSiASTdRuilYPVxFPmdtOf+xMfsX25dmzDI2XfDMmr97
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX70j8HV4OHQM8
 j3SQttHNop701lgD1h8a2wt6Y/qVfZ+XFzL2h2TS8Hf9ixR+qPVtMmJGp0GM83wPYZAwsdzQuMS
 tpFtV9/TctBvmCr39xBKYJBhr3pCAUeo/v7ysdmcnACHhpxUyoFspsrvtAYwMOH9k99ftsCM2D4
 gBpVQIijdOKsC3dDrIlZdM2uFa+phtzQ1B9pv/B5vElBNsO8X2/FBEg2m4uqgwZhoLcGazrtfdU
 hKUvwxRYOY8loJQ9jfMEYptn5EL3GydQBorIKQufjmBfKT0+wIIAs1tr0bXaiPI6wx56cLR9Mk3
 sCdDwlJO7Dl3zArIVPd/tBThBfC0xQZ7mTzYzkohqxvulptmeS8fGAKX2nIzIsUoJtJe5IBWtmO
 KAX0AuHCfz1i0pDTxeUmVeahk3EF2uRAVHeGTBh/451BFM7A4bx+6vHBIt7DkxD3irXO7vZ1zAE
 g9zWDKX+TVRWbxhuJ+Q==
X-Proofpoint-GUID: KzaebC34pMb3j-BJIwAT-bYUHShlf02Q
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4de10b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=5GcHMyRee5XsgDvb95IA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX45sD1wSruK9V
 JAdg+ibQQeocX2NB0Hwxzvip3sPG3XZRC1E6S/dDpZFdTP4x6HV0SaQFUOuxjlgXYwnXrjPzCt3
 lgHzgWtY7yLsifqaCm7YI4Uc5cHAcpo=
X-Proofpoint-ORIG-GUID: KzaebC34pMb3j-BJIwAT-bYUHShlf02Q
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

Annotate vital static information in meminspect:
 - __per_cpu_offset

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/percpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index a802d72c116f..5b1c87e46273 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/meminspect.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3367,6 +3368,10 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+#if defined(CONFIG_SMP) && !defined(__per_cpu_offset)
+MEMINSPECT_SIMPLE_ENTRY(__per_cpu_offset);
+#endif
+
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *

-- 
2.53.0

