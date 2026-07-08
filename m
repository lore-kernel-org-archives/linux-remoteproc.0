Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A390F3BA237
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488971; cv=none; b=TKtLh2ygKgAgvyBo8yaL/zz6CD7UzqJf8FSGZySL2RqqmtBVYwH7QA3Irxylmz1xWkaEqRhKs7qNtlUZyVkQLlUOAgk+xWY79aa9TCMLiHX9YayFSYI/geg7kfpYgPHfKouJnH9I0t2BfBPbstmGaQZ+M9DGEedieZo8tS6LrV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488971; c=relaxed/simple;
	bh=FiYNk05u3l6OjFfNfEuezoiD9Cy7r8n24C3ZFgyQiD8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCAWKfE6QW4XlNVBx/JfGjj33PhwneYrzH7/ra+2xgEwpGlrLIVuRRBq4jAv3Eb1fdSiLb8vG9E1Cg+yt3QwilFzbB8x83sDPzu+PEVbghcFBN2Gq8F1xwbmH0pojVCTw1cEPcc0vQ4b/08nX6kXFkDc2WKy9hZIBkTL8XCSZMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jIQYjWOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQjJ2HvQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jIQYjWOp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQjJ2HvQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842BP51695065
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:36:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=; b=jIQYjWOpMdm4Yf7/
	4ZAx6VsUGkkHx0nISbMer6Ogn/gK2G51oS6foy6Mgwl4NbjhK79MVO52gyhU8v4+
	lw+vlWG0mBYq153kmRtblw9p85pGfVTgoBpeqdZ8A6nDtgtpcHmfumsr30eRS9L9
	iwpMpdI9qaaC26l7CgW+S28KPz1Bw8vDhH4rSyEWBFhXFaJ2m9/Yn9YxEFw0L+RZ
	Av9xJ+vKxbgKHJWyxplIeJ82xC/NRVC6fyNpAmMjrVZ1ynOf78It107ASYJ6z3kA
	FSRJ+dnkJ64wUDccTgvDKXl0OIkKNM6qSZG+Z9+vIvUNqnDvu5CwLUQVKhBpYqQo
	6/3Dcw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw8suf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:36:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847e78d656bso813862b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488969; x=1784093769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=;
        b=DQjJ2HvQGQsfPr0RcnfRtvFzCtssajuwo5xG6dFi9Nppkn4tBwulL4u16wxQYDwdq7
         DT/pU0GzOVUwQkx6ql4G3jTooy8pgTlU0vt7A5TNM+JoqswPkg0Tw5BoK79me9DdzGQF
         DRXDVj4bWuwPcVgb6JQFT9X82CoN76wrep7wtkWf8PdvaSr5YRgXttkEnIWtt9WxT0f7
         YK1Rw73PiWd7PmXQpZA4vGy0kwj6mwce9Xynq4xw1qotiCDhf4nrelPQzrVHea7zV0J2
         59NUEcjc7hjADXE/OY17uUQlyxzjW49NnadHc1ONHS+Ec+n97WWHMs8jHjatCtG/Pheh
         qNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488969; x=1784093769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+bdn6fLnN4RyU1mq30fExI6NTYfDOdkcveqvmjmCHE=;
        b=JBLJOw1Zihk2olhExWWID64R5nWS5L6cpWHS9rQNEfDnRx9FS/4SBpc5kTqlVhvyOA
         XdvppHMyMO5y0yalkX0m4PVKHpiWLxF+uhOYdn0wWrEPkHEoRliojJ/oJyiyTZVry30U
         thHPRYIUVpm6ZUvVoz1hBrWS9jjdtJNd7FRcWvmSBe31lwFwY5Z1bmjms3paYaVKZ5Ld
         6YjzA/VzJQHFhzmz2Th2ojzkx4dWNvKdGUK97/sRf+IVk+h+p503Lf/17byCrqtaj10Y
         3W4RX18Db5Wxc8YwknG3A38s84q35YR5uXuWH8OmF9DVlhredQmEhITBfgMNGaCLA1so
         gLAA==
X-Forwarded-Encrypted: i=1; AHgh+RqgeY9XaeXqND4zPCxaitLZ3jpXtxz+eM+A2PerGhTvquiTih1IWX5Hwh3BM0AUbDac1fRxr4U2Va32Oya5FGuB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7fIc80bKM7CtbL6W3hDxxUMkk0hagUYxnEr57J7DS5BeUDARV
	R6R51lcm+ZhE7qg+x6phM6mII7PDlkkS0rEeQCBgkdMkzhiNegkT4nOWPML2FlFHuw0eQUzkuwy
	vDcqhvAw+GeorBOAOoMjqDn4faVY/bjNSmWRCgDZVkDgJJdSnwjEExvYE31Di/ih/nlPpmJvL
X-Gm-Gg: AfdE7cm8R3piqNWDJISvdc9nL74me1zrOi3ub38n9MBSEHUXqegKgCipx//VAkqWpgu
	iBKXwM1YuXi+ghdqGVv5MKmkJtQw2N0qYlz6jNIDPiA+tJnDgrqTgIdcFkZgp8s4bO5RSUe9KAT
	6/ci8QhL0voXiFfjWQJHOJYUqWjVlO2dwhTcF5pBJSAPkczSBRPvudGMcsXirmpeYwqvE3O5TU7
	0RSh1Mtzw5Se7PR5O44XIiVJ/mMLylYGyavCo0MaCnelx9eRdajY0QtKt2jwOHBQLaiugCVHual
	WlgNe9JKJLTPoKgS5YhY1S7ro+bLBVxPXq2irYKANARMzPJ1tA0w74s7X//CGJBYJLcjdx/iMci
	IDnXkPJYWTgFVf1uKyzENC4Sq24H2jkJBEc64Yg==
X-Received: by 2002:a05:6a00:23c9:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-84843246a07mr1172511b3a.32.1783488969257;
        Tue, 07 Jul 2026 22:36:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c9:b0:842:2ae0:968d with SMTP id d2e1a72fcca58-84843246a07mr1172435b3a.32.1783488968604;
        Tue, 07 Jul 2026 22:36:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:08 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:54 +0530
Subject: [PATCH v3 15/26] panic: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-15-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1392;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=2Ckm+YqBY68LnQw06/xX1Rice7q7oHfxcc3Oa8J95tM=;
 b=kNcFd/6IJruvhbZhgcKF1kf9nMQRpQthTbMHEFUl0hfgNNJOPNaYN4PdRHLxJ2YhHQpTBO7+8
 6jxCLWuRI8VBffFPcyBuoS8d2GFeO7KijR6/mLX0R1hgBfH+2V4jfL9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: KHkDNxG2VWfsADa3mUXcvSM7hAtDXE-h
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX31T9I1Te7L1S
 6m0QMuXvvWzNyY9mrvdgPBirGJz2W5Xx42AaNELlZWb54JtwqnTJVgdXvAc6WAQOIf+QeIvyyqE
 oDyUvk0k4LAwzH+kklwRwGo8Zk4fHqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX0yv5zGprcYiR
 1aUfAltlBAhp5miugf3MVmd/QkaEsX0ATxfg2ftuRolH0wYVLKiEeAOcChVl/LOu3XWEEy5XVdR
 qKP1xjYct7jo30UzaZ01wTvtUBgZXrkrFcSGWhHW4vkbAk8BrDuyzEbykGr/Zfus+oqfEj1p4MK
 mW2wf25GynClR1bkH+Rn55bcWIxD7UJtuFVrcuOY0BBTPGXTQFaZrwNBPTPYt9fw8LFfiQKpOmi
 P/W/XCcxdmSnePPMswe9NuMDGP/UFCDn5BIRXPzp03H6D6P2Clge2IL+6JIKE6eglV14DB6l5/X
 JNrJZqCborXdxd3GhHfHwIUqC7LkXo/UYWPfu70vzPVoAm8r+M2wNrA524xxFOm4t0/+MsCG92S
 dg7pGiq+yhhfQkNRLbzDuY6BA/wHveCoztRA6HahVVe4GJd9n0c/IazOuhcUWaxXzQeOCw6VnVM
 V2IooCzbItygkrDIsDA==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4de1ca cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=sIx07V1IIwI039IRSX0A:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: KHkDNxG2VWfsADa3mUXcvSM7hAtDXE-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - tainted_mask
 - taint_flags

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/panic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index 90e21f15fd7e..31d2e08b7e2b 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -37,6 +37,7 @@
 #include <linux/context_tracking.h>
 #include <linux/seq_buf.h>
 #include <linux/sys_info.h>
+#include <linux/meminspect.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
 #include <kunit/test-bug.h>
@@ -58,6 +59,7 @@ static unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
 int panic_on_oops = IS_ENABLED(CONFIG_PANIC_ON_OOPS);
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
+MEMINSPECT_SIMPLE_ENTRY(tainted_mask);
 static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
@@ -833,6 +835,8 @@ const struct taint_flag taint_flags[TAINT_FLAGS_COUNT] = {
 	TAINT_FLAG(FWCTL,			'J', ' '),
 };
 
+MEMINSPECT_SIMPLE_ENTRY(taint_flags);
+
 #undef TAINT_FLAG
 
 static void print_tainted_seq(struct seq_buf *s, bool verbose)

-- 
2.53.0

