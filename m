Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A303BBFC3
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488924; cv=none; b=b+Wbe8mcGWwwbUWwK4NK53I2+3iVUAkxpKmA5eReUVKjghAZZKYcS8eD+fhyBWZmWvZi9q+SWNRRJW7JnrY+iA/XsyMbseYQ8KPit/Mfg0JC1RZQTLWZ+ph4chqi/sYSkQL59pyqzVlrM6LLHTnBQhSVjVojKv/6t0gy/tIar40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488924; c=relaxed/simple;
	bh=kXuP+iYqiN6Gh3fmA4NpDHbdFws0o7gCzdFgMdl0MNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqMii07y8s6PFZ5MEbG455uBTbQnviHaZUvgFF662BJC0NnFJ/1a5X+rwdu/MGZzWrh5JvC1eTPWaLBV56ePC9y6UVZ1mUm7rpJEWmK6zWsRbZZV4gwOqlMuNlYQ0OlX4u8uQnTISSGy4Rbp8+6DxwfMOTFSCOHbl9B8avgduxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFo9WSIh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLEzr+R5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFo9WSIh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLEzr+R5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Tcl1447423
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=; b=pFo9WSIhwEYdEYNM
	wWtorKvFh3bDjSxFAinXAxdKwm7Z024P8hmHhadMiLzMLCPdruqT4rmAkY4tQewl
	ElxyGsMl3gajlha+6ZroCW63wi4nK1ktdBuPuX3FAL9ZXixN/0lx3tvC3Y7lNvyR
	Yt37rMWQBgF6yWC5dLeTfFhuwBZ3VQbRD+U49GV2ROHTYrVtws5GaKRnlbgrdpHZ
	M9IeaDbto9UL5CGReS7Hx4YXldYcCpau+lqO1CfXLCQmq064VIbY5TSiGRZKMPxl
	6MIkzT6lV54A4TStfdW2tLHHia2uaiAGk/gWoiKa4LRQQf7oCcF59MGEh9tFrS5Y
	PF8WXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u11trw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:35:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848452dd146so762574b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488921; x=1784093721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=;
        b=NLEzr+R5WsREVMtSlKqx3g7oz3sn7jpQFjtnrh9XUCCJMo8o2MSE2ym4BCSb4UEvVf
         rdw97vBQsNueVZgRPZ9UEOV0Acu/JvJKo/+rH9oW8H17BxlOCPT9PSu3YjhcCipdUCk5
         mdQ++022x+uVQ+otXpDK1ES9YVzl2zGq1kS0Bfl3bJBkl8+e9SK8biXT5n8bQscwGLp6
         SDgUbefSb9ab60YJtlAK7sgSRjHwQbMlsm2mcyXnm23zLfcdfTICXqDmzQ1ZC0YAlgrm
         Fnzd1MOGmcJimFCP5vL+L3SOZVfNVpuhxsRpa+raG+DYg/1YCYwoNDgmtBsjxrw+Ag66
         Ov7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488921; x=1784093721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+3x+TMMzYs51Q57TTs1j42iOpyhdFk+I0hp3TICnwjg=;
        b=XKOnNsQIjWNQwcAZc6QDIwdWkr4GEAgGGYGZrAq2PYqr8Y68mxRgHgU/VJapjC9zVx
         quShZiLQJmNXtkeLRC+qYu2jLQEoUBFPoXYY/+nRKcVSeGYgj6IPtk7MrQK+NQQkx3zl
         naIeoDMMoULHCteLE9Lbes+iZzlijgIW2N+YoQgJvGHQewEDaOPEHlso3FCwoStMBORN
         UtcmMyd1RN9+wFh6B1+AHp4Ek7G3qLcEut/+E4dLhxKiSw83esHQR+ZSErh8frLLOd9T
         HU0FVEp9eV+J40drxTdS6UjQxsShmTqE0TCJjZSzgaXfoMYv3l67cVwsWCm5wx8MJnK4
         vU7w==
X-Forwarded-Encrypted: i=1; AHgh+Rqxpshu1UzhRbLd9l8i9ivA37Kl6F0OyIxBPJe+je95DO6mXzjcAbJPmaKM4BKiFhHXJE6Z0EfZ4ovLVDEeYGO4@vger.kernel.org
X-Gm-Message-State: AOJu0YwP6L7w7gNoV9JQQUkZVIx0fhGjkkR35s9DBIblfyeficyUkLSZ
	45ICVhChtRHGnkAuwfTlOL2O17m4DNkLylQc7tOUp4Y9QLY0tgNt9k4RE0GQkP8Bk3Ryj5MOhc6
	AwPsJUAYQmBS3q56DPfBtu3P0590eeqwq8XcORXsANmkoEhMzKYYi1G++yv9NEy6H6lC6BU2Y
X-Gm-Gg: AfdE7ckwUtoqytS+4YblTTvJE6J2D5+8TBkeTuYjX2kLQ6HUC6S6uO/Bqqn+FjNaOhr
	XTkOQ+bT+OmHRem/CDGp7iWtxX/DOLYRGdFACBPNGGlu5VXW+wUPJFBsVeH14NveEXLXJ49SLM+
	nbhVxlQfpUsS1Us/qHclCoxlySGqwTn31iQzGFSwpdA29lRCgAB0foptyKirw7SR/R5zaXjkaTN
	rOkR5BWu3LtNtikkfBdwTmqcgG9vQdUCCMwf4n5V06DRxmJlZoXZDYmNS8UuUES1ZlPWDZIak+Y
	x+hc7dEN6U7zeVBfHSeoi0ZfplSRUCx4mi+tD3rynpIJtARNGRP5TMEBKMhqZ8EZEAUIJmvQ4fs
	APwUnuIGu8AyuxqoTAspoDWPc/1bTPO1M+D13HQ==
X-Received: by 2002:a05:6a00:3c94:b0:847:8bf0:b82 with SMTP id d2e1a72fcca58-848438cc8a0mr1132102b3a.60.1783488921311;
        Tue, 07 Jul 2026 22:35:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c94:b0:847:8bf0:b82 with SMTP id d2e1a72fcca58-848438cc8a0mr1132049b3a.60.1783488920709;
        Tue, 07 Jul 2026 22:35:20 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:20 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:51 +0530
Subject: [PATCH v3 12/26] kernel/vmcore_info: Register dynamic information
 into meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-12-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1258;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5yycsUBwoFxiKNQeKvCsF+mVUdasuljHstmWvn84Jps=;
 b=dh1WtDpiEGxqTk4F/COwgg2DhrAd3AuPXNJplwhLTNVJqIHM4OhNRd1Zmmkp2+owqTNHhWdct
 CiAtW2VX+qgAIDAxAIMI67SaI2XkeGHgfZ7O/D/Y9bcG/K5XSCTPfU+
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: jv0Q030fmWndGhUuHhVA1Jza612TFf6Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX0xvxMcFXPeEE
 TJ6OmlLQEOgU13+s1SC3eqKf1iCc/TA51UFgPOont6tm1n0/BT0QVLltrmJJ87WUlgYg0XwCve4
 6xxShgjF4ztA33OAagm4qrb6D0onAxY=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4de19a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=v3IzjsPwLRQtBGjmhGYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jv0Q030fmWndGhUuHhVA1Jza612TFf6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXyFE5Dch05MBo
 7rl/sJIGCC1PbyJrhfUwNTELcm3XqrX85jzC3LMfD6UY9rGGsb/TgtSggxwU4fLcE/G6OVx7KYM
 nInjFN4LW2pb9WlcXmBeoWodg2agoDHa3I2nUiWnYERuvseqEyXytg3s/YmG2XBYFnaGUNtL69p
 /vrAUGQz2U7KlHK/E0SvLCDFJGPgMjWWu07ppAy5ESZ68/C51ko/ZFdhNygu4kQcFZu5Yh19C7U
 6QKOLave63w92c8REyoRUeml09s4jMk9i/COfp35Gz16Pb73X1SNrYWAQGmNWzLgpTpvgeCrF/q
 lxe+zJtKATNAjoUAoBszIQcSHnAj6619x1GJGT4KgEM/PauXcQqiBO9nVU7U19P9xrYBLAAopjM
 twNzfidnPY59k67BZkhMmMCJwe5Pm6FU7a44Of2UiXVtm2aJEPr6Mm7goE1C5W6GhuEs57LvOnW
 0xFd1uVl3K37Yp5Maig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Register vmcoreinfo information into the inspection table.
Because the size of the info is computed after all entries are
added, there is no point in registering the whole page; instead,
call the inspection registration once everything is in place with
the right size. A second reason is that the vmcoreinfo is added
as a region inside the ELF core image note, so there is no point
in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 8614430ca212..c5181e9d049c 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -247,6 +248,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_lock_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				       (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 

-- 
2.53.0

