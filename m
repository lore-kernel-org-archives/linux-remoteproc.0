Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D23BCD23
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488957; cv=none; b=NVR8fE+EashXuh6rR0MjRcCXL838V/GdkT0fd0FobATxzwwp7H462lbSD+lJcE3TVGXqjPNoY4KoJP9Dp1wtjKqZFT7oNJVj/dxcDCBeWP3NnUuB38Pfw2tbB4B9GBnxy1TjKaKxAOCMuz6rip57FRypQDgDI3Cl7g7ezgrb4iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488957; c=relaxed/simple;
	bh=XB0hnr+SeoDNBsLD4keyubVFabUM7ZTQY5JWjuUzUR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZI9KMnyQV5mz8P2qV/ecbStA/Pqui+76Yws1mtp0xNWkvF/RvKvttNmfgvSzVcOjZ8VnsnF6m2YP3FPJ1JjZRm8tuSzQ939AeSlbCH0zPXavHO/CjFp39DWbXj3AKI06Qh+4elO1iPHvNl+FUu9EyU5J/BoEjfIK3U/NoubDrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyVGMjHS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JeiEXIRw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyVGMjHS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JeiEXIRw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Ac21572648
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=; b=iyVGMjHSYXLMOvvb
	whTK6oJiXUtt4IV+/SzT1wIWF1tRxXGFzPJB5KDz0Fe8VB+7px3ddcHqPJp94fgx
	Ze5L7Vr5soKn+zKznGYkt98thcz+2A1Gq2WZBO25klO57cRwKc6RPyi5zY8PkyES
	pvG++Irv6hL5nzc3s4OWjhuzUexAuPSgLt8ypxUtXHlbe1ZpsPfnrdkS73qp9xNl
	3T3NFIzF7q2wemmc/4H9IA1i3tN2GPs0fXWn+/ftR+t9FeInphgSkGQnLHsM9sVg
	+xYp4XB3BkS/hYwyLcQxUDw4MIeT1AAxE01wXzb2Gig4tlJhnHv995tiIJoogDk2
	ngKXnw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgshsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:35:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847b8d76e3dso453623b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488954; x=1784093754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=JeiEXIRwWAtjKHYOWBWCyRPYbYbvtGqq2bF9cGxxzuLI3Xk7M5jtYbeutdKm5UvAYb
         +zEgspPkZ4V35gU7bCm3vji7EMy4y6Vvnf1cwrUfUMXu+QDO1J/pfMD2dBSTK5IZ46/k
         SA5jBPUv0iA0XGVrCELWHBeQtz44ByaINvXFWDLVeIWaVdt+x06Dc8GWbIf6I3buwN1D
         9Arpp65wrXkctiR6+8HiKuCWNWdV11jLsWhdjYE3VFK6C+nRGAWAMeHX/3zedCEZNURJ
         88NYr2eFqaDKbkn/kJFsDq4h7Vwr0x7wo1vuxKzMNOsMfTNHpm/i55PDhNpN/Uw9Vunf
         +RXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488954; x=1784093754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=Fez3ffquWj158ocl83aQH+k9v5Co+YcCGvrTni8tzI7jf1vnRz3sOVIFPgOAhaN0zW
         P4MWhaXlt/JscyRfqxniAPnRzHk2LQGqcmOPEPwNfjW5DJ3/Q3Bs6WFBR4VSq6it4lTP
         K3H80kDljkpH59iAxWWdIHHASYjJVFfnio62WIMCQEFGJYTqA8sQ7gMQ5lmfBWLEeTbV
         58p3Jcp31nXbPlxQWarQXkahpFdv3+X+Yy99TcTWceon31pXlt0DZyfmawGJC88UALwX
         2Wn9bbM+N+BAhWkCR/wlXUAmblsbYFcve63We+QWosdezY7Kqd/aIBNclEee7urQDhrZ
         dSxg==
X-Forwarded-Encrypted: i=1; AHgh+RrYwf5uJ35ifauI14vbrwKIM28OKi20tdaZ1bFGjuTJOBZw1bFWCOJt2+6faofrKpmvBnWe1u/2uFtSWJMOgKie@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/fldd0Zzx9i543BzkwlWJWhMpLaoOj/XF6OC5GlAvxOce0BBv
	Ucp56HvooFw2BohvIZzFv5bjdPAp/+ZamekqAirkdFFkTj0RojaXGvam106ua5A9seaz6uHDOme
	J0roRZYmC+4ZL2gaY+bzG3lbm250XSt0DdzWbnC+rm4OixnzZCOSl/3eZKIecAjZ0NJyJmJdA
X-Gm-Gg: AfdE7cnsxQvYS3PiSo7rHUNuIP5WTlMeMhRW9FrIvna6mERlclXQvPGScNZk2lMxidg
	TUHben2hBJW3MfVExfbtWgpigq9of37KsexYeMuybgWuiZ4L1Mo+Q4P0D4nJgg+FCyHXB58BUx0
	8SPPiWEKoQ3dGiLybbt8J7WgGY+1sFV9d6qnlwF5WKqW9zzBhSf8pWelyyCnQfSMuStBAVi8wtb
	0l/FRIGVf6FOwY58+3xaKJ91WZ2Yg32dbRjXrv0qgVZbhtMLOoqKp7kRCO1e3fg2Gp4S1lRblQn
	qcQzO4M7SndrGrV0iw8j5LiEhFmHs99+2zGkkypNvBhKJ3dVGgd3XRnUC8tBBtDPLeYJOLXQ+yA
	A1MDQfKesWn7k88tk0+ZpA98fXH4dk23wiFeSLA==
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101683b3a.74.1783488953415;
        Tue, 07 Jul 2026 22:35:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101621b3a.74.1783488952811;
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:53 +0530
Subject: [PATCH v3 14/26] mm/init-mm: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1627;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=C66R4z8t2Qna/gYEl08YE1zQ0IYA/DB7tbhATdDv314=;
 b=a4ZKz7sKq0X3Xk4djKf4AkkMOFWqa+Gt3qunjb5YpftQ8eDqQGmZHBmWWdz2ObrXjPZiVPIj7
 /TQu22VS0TvAfSBd7UB5LIi8aMhGbP2gVYcpIP8hELXfmPA5AwjOiwA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: QS8oXY_ujPU0u6Qa9ku4pu4GAZWObe1l
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4de1ba cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HJIP93yTpLwjP442z3MA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: QS8oXY_ujPU0u6Qa9ku4pu4GAZWObe1l
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX09Z/xJSp23jF
 ppr4D0cTsPlgkoEly2Tz+ZUIpoadsGPAz1HhnfUX6hHs8PfHPpuY/RnRm5CwjzlT7fM8mlwoGWE
 5z8JuQZBLAoDh/fN8Q05URqzaAi/OfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX6wWO3PDQzOvj
 /uKTiDCEANJL1C2YgV3f4GCRjUMcibl+B8GqtGi2M8p0DspKk3dZCJLij46/X+R06jMqamHBCPT
 e1ik+bcWphNodqUYeJokDtq09QAYbG6+0twYQXGsmYTt4N3oqv1/AGlasTtyM4a0HREzkzEBI/8
 9p2V/l8KxyrXgOiCbCuyyPqDwf5JPta/oGE+Jt93ROZurvtXWPmrBooVNkIvI4WxI/8ZJRT95Fe
 qlsiHv+gC/6pb/v2IrmQANRCYNvKHOdew6JSYooYRnkevKU7TPAXdzSlsrBmOzhTYyAa9T8LTqo
 eXeRw1PvBN8+KwdbFmia4frcic2rHyS+arNoOR7/4OBCFNMGhVPDeUYsQ+oPPOFEtQPhvyM6Ozk
 XQyy98Tvb+E7XwkdrvE1VtqDI/R3/PhJ+SXkNa+HtnTEK6BRr2zmu0mfVCvnky1INXFLA97e5BC
 YEpwW7CGcTOLjueHSLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/init-mm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 3e792aad7626..cf53058410b1 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,8 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
+#include <asm/sections.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +21,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -50,6 +59,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {

-- 
2.53.0

