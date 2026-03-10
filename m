Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FAB3E95B9
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174032; cv=none; b=MPIwxkpuB2LV6uFRVw8IMjeZ3NHlWMcxQ/RtxfS0NOJ+d/jsnAiFpnC8Yw3d8+l6bv0B/U6sGzUK2Q7XU16rY+FVY9QdEau1uiF5RJpdVPFmU2OX9blr7au0Z+rRzfV9ElZQOHBivzQ0X+qz0AiM475dWtSWCAB8PQeyOjDILDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174032; c=relaxed/simple;
	bh=GJsyRX5M78HpXD5ZIPg64tgahV7EZgChDo8/tB3hlfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7N1JTvmuJsUqbOMfYv39lvP4wKiNLMBlY5PAwgapPgHo37AaC58Af2WLaHVvphcr2BRn9tNRcxmDUnGaINlK74GKNTXis/c/PRIXtpqki8bC99L9A34dPS8SNnx/K/NcrvTY9IBTLYjDK3tw2g/v9r4lGD8NqYgYGJT3mqrzfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNqSVUAR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdQSvb3x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNqSVUAR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdQSvb3x"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AId2tu3760401
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FwPwm9egcX+1gvanmp7QoXzEqEd1Picj/3vW/4UCWRY=; b=bNqSVUAReEBebBrT
	ofohgRxPzbWGJJ38g5iWUzHtnSkL/fjdSQlZ0gdSMlAFXkNkOP4rEQmBrnov7snm
	HbeI38MRtkXkee+aCtlogRvfLkSMIR/qWkWlRtD9sFhEMOtYNytkfbSFOFzMfu+H
	We25PIxl2QFD57enTLWaatpPBvYhic/xuHsemTbMvEUO2G2erVOPG8l2ceamOU6E
	/FgY0+QEaDXlCGBSKoIxprW3BLsxJjuly+/xmQvEwgP3fnHLoVwiugxuExFXjhdY
	vKjH9P2s85pdWK0yn16vc2VtDZR5SmuC+uW+yDzEEAMMmgnLoDpKcDkb8EuWnJFa
	F67aIg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8uhw8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b8bb5173so1230008b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174030; x=1773778830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwPwm9egcX+1gvanmp7QoXzEqEd1Picj/3vW/4UCWRY=;
        b=bdQSvb3x8Bno5avjsdGD1oaHkPQFDn37kSX2EcOjR3T2NQ3zcYRgTK6AVF6FCy73u4
         tMCYmpM9OQtvxi43L7FQpx1j4A1x4PaponcM2lQyQ70o1HAHFaIBJ+pk2E3lZD3Jt+xl
         0Z0zr8XOuT5Eohp4hD9Rs089DTNTKfQH7UiA0SRrUH/Bs+ujVU04dHpDV9w5VgWReR4x
         oWRwrCaufuxqs6+IHlmqJ8NFNWflgQTDa1WDUwJkSdEQtzDSlDGzInpEDIbpfdulSLNV
         6gPejJOCg1rvEG9e3Jz2TYEkxltHfxnP9UeanCAIgF+80TOvrKiNyBO2e2Eb+wrekKox
         pHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174030; x=1773778830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FwPwm9egcX+1gvanmp7QoXzEqEd1Picj/3vW/4UCWRY=;
        b=d3B2Zp4CY2QfmyqrzV9rV6uXB2IgcfySeP3WJlIAUM8wtJX6fen3wNZneCXwDYFGCa
         H72zJnTn+kjQymgItKVWT0pmAOtpJ8LKwoon/tPRTcYjr3xQHG4bjHsjnaP6TlTJ50ii
         d6YVw5u4UWVH4txFpYFA5FsJZBSsguWEERAva0ZuvYQFSsM6wZ1j+4D1wmP7ca872y7O
         T0Ftc+WlphSHN/2xqHYOeoevtvwsziO+ILfXKHzXqC3GWe0hinHQC3S9UoWYqU4R2GbU
         RBHbEhXsVIuRoPf3QRv7Ftf01IeKvxXa+NKLKVh7Sll6N13RASRMiw3fCTj9f9XY22u3
         tYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI9TTctitK1L0SJjSrIs9E7SiqNKOJK5mPeKWKH0NxFKm7MDyjA/yAoUmXsXlRo9bONdSzLAYV7jM6ZpD6Vcob@vger.kernel.org
X-Gm-Message-State: AOJu0YwOez9U3IhJ2I8CWS7cyYCyonOTgXHfHl9mwOMi6DmDuzMlAoHm
	50zrUsvQgNvSwrsgDapJM+IiFKcd9o4P8+Pk3MGKwhNURIZZQ83hi4Z9GK5KnibVf0ypYmjnaj0
	lISruwwD9Gw6b8JqT6zJUpilkdlLgGI9kFYmDwAcNxhqH8JvCwjULePGnqlnhK9xmMtMbouuZ
X-Gm-Gg: ATEYQzx7hPHtFFjjjIMrw/eXk+6xk/ZyFH+ZCnpHt7NnbpXyovysbYIJ38uzM+WYK73
	BkJ93l3azCAwOM9rJTvBbaXQOWRsSlHHDUQDQFqEOpdJtT0hcURu+vKD9S5N1r8ccLa3Y/Fyh3V
	0f8KzrbsoOcbXbo7518URckAPQfuttKUXwWstrRY1InE1cZYgCO2Yn+h0b/uHKubmA7hEyOUduB
	Fm4Hj5WUrVn85Cz82gVqRWvyPGA/xDCljgHcJzQo/WzUmQ1yjQVdZShGXXZCehK7BiUfNmOtisc
	QaC57LGiBH1vKnNhml28LiWiyjsxsgv8y2Q569YUvpihNZfldsIJm4ktdQYm/Hb49u/c5kB83nA
	7nwrqKhCfedye+sAczup3gCGtSORZ9RTaJyenw0nUfMx3w3wp
X-Received: by 2002:a05:6a00:1c85:b0:826:b70a:7350 with SMTP id d2e1a72fcca58-829f7240393mr123109b3a.52.1773174030024;
        Tue, 10 Mar 2026 13:20:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c85:b0:826:b70a:7350 with SMTP id d2e1a72fcca58-829f7240393mr123063b3a.52.1773174029418;
        Tue, 10 Mar 2026 13:20:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:01 +0530
Subject: [PATCH v2 17/25] sched/core: Annotate runqueues into meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-17-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1089;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ZO7/bDryoGYv40z36iJsb1xhTIu6V9V40nzuQaYTMw4=;
 b=97ph7aGBo5DOsMrEvMbA9BDZtVSKSQVZcudPly6Z6cNUsdakmi1m/CNdYna9ssoZjW5hq3wnH
 06UefCLXjwxBLjVEa/zKZewRQLiHGj6hw5oxhvMiehOvkGLtM23NX1E
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: L_jZDAgTluDk6oqKivWQCey4uVTxq6SG
X-Proofpoint-GUID: L_jZDAgTluDk6oqKivWQCey4uVTxq6SG
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b07d0e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WIgWxXLGzmshCHNC7soA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXwFUkBCjAR+ad
 /m0Dn+0j3ETH8y5kJWTXTG7shMwgy6zE4pOPG5yNCjzSl1SQGXgW7ZZpD5m+BiNLtDtSyMkfqoV
 lNvmncXi0zvxaP3x8fQP89yjabSfCrBTznsHcpL8SuZUQ42c8NuyCIW1F0WrX4XmUsXsAwlG6sx
 Quaqx/B1CeO5wEgWVG3vwGLF1tZKGjZARMcgngzB4nZZXeJ/WEU3S0cExZSEQhRVVvyp3tQUTbd
 isrmCwHr+wDWbxtDoKJsc09jwVPWin8ohKrv8LQbyczsIf93ZyZ7NvV38mgVCe6e/M2PB69lpEL
 KuzpzobUL6hTtK58QYLE2MXZcw3EBPBZk1yl9fLJf4zMM3drFWJMpynO3+15oTX89OY7syxi3Vi
 39IsW2DzAa7PA9OWReFhcdXxeoDzcfGY/+pWIBeWe73qWaz7dxXgJzwmAOZfMQ+MAwcN8k6zG20
 Vtry0ZWYm3n+KB38YVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate runqueues into meminspect. Even if these are static, they are
defined percpu, and a later init call will instantiate them for each
cpu. Hence, we cannot annotate them in the usual way, but rather have to
call meminspect API at init time.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 82afa387d529..09a532a5e9f7 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -69,6 +69,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/meminspect.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -8804,6 +8805,7 @@ void __init sched_init(void)
 		rq->core_cookie = 0UL;
 #endif
 		zalloc_cpumask_var_node(&rq->scratch_mask, GFP_KERNEL, cpu_to_node(i));
+		meminspect_lock_register_va(rq, sizeof(*rq));
 	}
 
 	set_load_weight(&init_task, false);

-- 
2.50.1

