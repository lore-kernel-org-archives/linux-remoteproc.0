Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8423C3449
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 18:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536817; cv=none; b=EVo7D05OhhdOZKWuoVhnFFTfZ1708Dgtg9vA2NCRhnpfuU3bwtdvhzCmhCVEX06poiiB1Th1ZE0irsW50QPZWG6/h/Fhcqx30Qj+gVrSCA4LlWUCw5lKI0njKMEwaCwmkyCeVvnYXIkILZDViYMqdayDb0DUwfFZ4FihQ9wC+EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536817; c=relaxed/simple;
	bh=auKhlcHAZaqly05VI9TXDKV4vskrttOa3zEQbwSam5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRoOZEnZtxkYHwOL8Tg8FEfO5NrjmNu2LplcjQP5MiwEP+ak1Qw0XoEUvGeTA+iLXJSPW5LaE1geeoYoh4oDoqJmVBZNsOueWzRIiKBhjkw9STcOVr8h2fhKvtod5rCdILWQADAGAghFyF9QXe6dwH6bDQwhlCgUS1pQxacn338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pzn6zAx3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4zAhSZB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pzn6zAx3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4zAhSZB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668IM1Ug3579914
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 18:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MDd5hUGl91pvH2nEiZvHsBpB
	wd3Dg/kjAQn4WJRYcLM=; b=Pzn6zAx32z/ioGd9q+dGf95FcLUV361Rgr8snpUZ
	AXUDDl8H4xBi27nUisuSsrKlBbAi3yVvVDWUqWk/4g8P33d5Y8cMcEHjM4mV3Ysj
	6wT45Y93lvgq3qtKD7QyBK6mnKSrURK5EpCYWmg7wYzzObkS8AKf9OXxS0zj3BMw
	0ymhVUdZYzWMpUnvTk8zUTLEUswZYyWtrStGD5jBqwV+fLXiWhr2xcdYbkhJAH4J
	DxVCwO50bJCFx8Gt2O39TOlXL2U5msYKt9ljvHRk8e/FB8RC3p25oKuOT4+39SUW
	fB8X6I6jfIVK9oswSOlBE7R+j/w2Gcgnb94+Au3SymeIhw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvr3s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 18:53:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so200507a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783536813; x=1784141613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDd5hUGl91pvH2nEiZvHsBpBwd3Dg/kjAQn4WJRYcLM=;
        b=P4zAhSZB+sHipdnir3JIcmLCuopEWORC8HhmymYrfu/zhhZaZo1dVXbtC8EP6aj22A
         V6f/+5Xynn7jqmakC+BIsORLM8BwFLC9vKf09gU2aviRDTooOj39f+qMQA9h4nljilN0
         k3Q18ao5cgsNUiOZ63rwmPlQmhWgyLKxTw2JNajOByJ8xFjEghdu5wt+n5a7FlzFft+x
         No8ep3t0fqRP6yXtRsX4PzGUzfGhn/7pin6ouPr4aTxeiVMXIeWF1sDLkd0gUclDTs+r
         0RGJ+UhgS5DChtxpnLDZDGIuhtLA/+yQ9X/+xa/c492g8+19KGLZqF2/M/NtU8CMPA1u
         CBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783536813; x=1784141613;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDd5hUGl91pvH2nEiZvHsBpBwd3Dg/kjAQn4WJRYcLM=;
        b=Nw0mZbjzwzKixFro+TpKu4MXsYEuQlYST+r0TufWN7vRJo+3qly9+4IAE9ye0GssoN
         Eqls6MuSiTt7wuMXPElFmWS/KHqQE0GelCX6IdQqf/4Zx6lyqSHfBBErZzfO5yYxfop1
         TL3y6rOqxT1CsOGPyYBrxpn24lJz2EH9zyOhTLg5z4MON/Madk4T+53kEwM+57XbKz6m
         HhieDdfI4gZCY+r2vVxLZVrvxFoGGpG5SwzWKC8/xk3xN6zeYlmdkJjce2Uo5H5HlfdN
         ciLRhvlWyflKsvi4exMtYlAHCsK+y/zhN+qryRgkXKWnAlWobG+qHfdTfFPpFO3LPTfn
         IDxw==
X-Forwarded-Encrypted: i=1; AHgh+RoCfepvP0F1q0cxSjd1LilzDY4zSLVlUvRrXPciYoCJhADLnNXfYFRdjB+UtzL1mn5MwEf9UFmKHtW7x692J6M5@vger.kernel.org
X-Gm-Message-State: AOJu0YzmETwZvvONGBx1X7G0wVqi7unzvynAEDk7/Zshodx7efIUqhig
	mz0L0JdQnjsFfjpzOubrmvRmPrpk+UmTyZzioEzsyQUqsniLZMAP/5k9jQeKu4oczc19418YpKl
	rHeBiLxwJhqXH4ywAZcJDTueHvgaZnQ8BIkIdiGywdZ/QEcskqJFOLf7IgFpJrZuLc5T+pLJp
X-Gm-Gg: AfdE7cmZUyCw75Mj3I5V8APLq4hsfHnKcbxnlSNJaz6ZzIBq91vXKaZZ+r5iuveOQuq
	cZCGEbTElt8fILN/U5kxQxC+wnF0fvf6VlcCdSYDMLXELfKq/D+5Jry8vt0TX6HnPNi0uqDo3XN
	PAj4Njm9LOn/M5HMxi9XDS4pTzZZxcv8d2zYkoDyjy48Zb1Nva05C/9lWdlFUdk6XXtA69RgHmF
	4iMeh+mHaMw9pKbmU67FTl314yWmk0NyvkNnSawj+SVT5eWj8wmpZrwbOEY3SIq1N6i6SR5sNbr
	+B4rUMYczbWHYyvxkFkujzDdAPZqL+12waoKoPlZC6ZtumSfwI44x3EOyaQXQVDDzGT+Yg3E0vY
	VZ6v7QQacEJHXj83D6F4jrJFH5nNNHtwm9pDJ8g==
X-Received: by 2002:a17:90b:17d0:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-389416e7dbdmr3591571a91.27.1783536812839;
        Wed, 08 Jul 2026 11:53:32 -0700 (PDT)
X-Received: by 2002:a17:90b:17d0:b0:382:1aaf:4bab with SMTP id 98e67ed59e1d1-389416e7dbdmr3591525a91.27.1783536812170;
        Wed, 08 Jul 2026 11:53:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483941csm23706217eec.7.2026.07.08.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:53:31 -0700 (PDT)
Date: Thu, 9 Jul 2026 00:23:13 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@gentwo.org>,
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
        David Hildenbrand <david@kernel.org>,
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
        Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 21/26] printk: Register information into meminspect
Message-ID: <20260708185313.2fj7vltdoevflu7i@hu-mojha-hyd.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-21-7aa5a0a74d5c@oss.qualcomm.com>
 <ak4Cr5GEMdo8xWqu@lucifer>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4Cr5GEMdo8xWqu@lucifer>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfX7bIpOt+MjDMa
 coHrm/O5AJy25FEBqMxeDspWDhS4PVP3A/IJUwNVFcz8Z1pI0tKn2Dvhh9gFxc2bWmAz7WKhVVo
 FliCu47c5eR6j4cZNlZa8LnrS7wgQpY=
X-Proofpoint-GUID: t7jGSTu0dccbCWHqfKxNxV0uTC2nuUH2
X-Proofpoint-ORIG-GUID: t7jGSTu0dccbCWHqfKxNxV0uTC2nuUH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NSBTYWx0ZWRfXzk9vTXRBSYYB
 heeTr0d6kjwWFjQBiGo2477AoBiyCQUbDkqHZ1mPSGLh3Vmn83AA4Ub3nicxIStQG34pQfzvHR5
 q6+hurltj5SC/lmpSGQe+QGegaxGFCbHfS9lueygpJJXSrWVaAYEzVJ8nkuzl95qH9gVrGKCmUo
 Z/7C8VEVyTWttQ20dkuR2jwnrgBOaczln9PUV0sBQQDMCxP51YovyZrnE8KGM1tWJnN5eLsXqHT
 Tcoc6NnMzzxESoNL15LqR7AlHMZCdhAJBXpIygdSC1avYfk3jLlP2dA6VyVF59xIlaPtuyHxXAP
 C88WUNS4jdUhn/yT8E3uQ4qPMonhBWNSVk5isGXVqNnzTLy/CKO+KOf+uosrKMBP3HdTsE7peBk
 CVeRcXvwlUlocfOY79VGG4XNj2uADwbyxhKnyEBC+el0l/+YR2geGdgMJ8ZbIVDBhh5AfH+/aU9
 b1COQw25+zYJqqo+MTg==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4e9cad cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=iox4zFpeAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Oescfv6KCf7l1tfy-NUA:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080185

On Wed, Jul 08, 2026 at 08:59:26AM +0100, Lorenzo Stoakes wrote:
> On Wed, Jul 08, 2026 at 11:02:00AM +0530, Mukesh Ojha wrote:
> > Annotate vital static, dynamic information into meminspect for debugging
> >
> > Static:
> >  - prb_descs
> >  - prb_infos
> >  - prb
> >  - prb_data
> >  - clear_seq
> >  - printk_rb_static
> >  - printk_rb_dynamic
> >
> > Dynamic:
> >  - new_descs
> >  - new_infos
> >  - new_log_buf
> >
> > meminspect uses a different API to annotate variables for inspection,
> > and information about these variables is stored in the inspection table.
> 
> This commit message is a mess again. You're writing what the code does, not why,
> you mention separate API but not which or why.
> 
> It's useless basically, and it's weird to list arbitrary fields like this.
> 
> Always think 'what would be useful to reviewers and people coming back to this
> patch in debug/development'.
> 
> If it just says what the code says it's useless. Put what's NOT there.

Ack., will reword this.

> 
> >
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Reviewed-by: John Ogness <john.ogness@linutronix.de>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  kernel/printk/printk.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 2fe9a963c823..f7f32c09b9b8 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -49,6 +49,7 @@
> >  #include <linux/sched/debug.h>
> >  #include <linux/sched/task_stack.h>
> >  #include <linux/panic.h>
> > +#include <linux/meminspect.h>
> >
> >  #include <linux/uaccess.h>
> >  #include <asm/sections.h>
> > @@ -518,10 +519,17 @@ static u32 log_buf_len = __LOG_BUF_LEN;
> >  #endif
> >  _DEFINE_PRINTKRB(printk_rb_static, CONFIG_LOG_BUF_SHIFT - PRB_AVGBITS,
> >  		 PRB_AVGBITS, &__log_buf[0]);
> > +MEMINSPECT_NAMED_ENTRY(prb_descs, _printk_rb_static_descs);
> > +MEMINSPECT_NAMED_ENTRY(prb_infos, _printk_rb_static_infos);
> > +MEMINSPECT_NAMED_ENTRY(prb_data, __log_buf);
> > +MEMINSPECT_SIMPLE_ENTRY(printk_rb_static);
> >
> >  static struct printk_ringbuffer printk_rb_dynamic;
> > +MEMINSPECT_SIMPLE_ENTRY(printk_rb_dynamic);
> >
> >  struct printk_ringbuffer *prb = &printk_rb_static;
> > +MEMINSPECT_SIMPLE_ENTRY(prb);
> > +MEMINSPECT_SIMPLE_ENTRY(clear_seq);
> >
> >  /*
> >   * We cannot access per-CPU data (e.g. per-CPU flush irq_work) before
> > @@ -1238,6 +1246,10 @@ void __init setup_log_buf(int early)
> >
> >  	local_irq_restore(flags);
> >
> > +	meminspect_lock_register_va(new_log_buf, new_log_buf_len);
> > +	meminspect_lock_register_va(new_descs, new_descs_size);
> > +	meminspect_lock_register_va(new_infos, new_infos_size);
> > +
> >  	/*
> >  	 * Copy any remaining messages that might have appeared from
> >  	 * NMI context after copying but before switching to the
> >
> > --
> > 2.53.0
> >
> 
> Overall exposing live dynamic printk information to drivers seems unwise, but
> not quite as insane as some of the other stuff thus exposed...

Thanks, this is minimal information needed to collect dmesg from
crash-utility in --minimal mode.

> 
> Thanks, Lorenzo

-- 
-Mukesh Ojha
