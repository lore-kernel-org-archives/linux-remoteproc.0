Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A363BBFAD
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489004; cv=none; b=bgD0A2tAWGs5S6ZJhg04QwJ7IlY0kWcRSvJOfsYV5Iwj1G4eCEkn+E3Z3MYU13RtSX6K8Nw5USOyCpjbbqcoqVlfz+haJaJwm5DFBcuDULsVLwdqGu+4eTC70ZDHQnohZIa2NTOaQNFZULVHJnkkuSpz6XPhW1yw0DwV62GgxIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489004; c=relaxed/simple;
	bh=6zWg2efwvk7/IxI9WkFGX94qU9nMXnZuURGzm95EFMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIepqPAfX5jTGyBegaHJAK10GczP9OanJq+b4EqTyz4c71dEoJkQYWHSI9SzC7RgXNzjRSR7ZdiRnpqQJOmxvbbhs7rcUFsismED2ueiOj36TOCXeUrRznYp6FJyJy8vT26fHZ9iRsHBvXVgd4Q9ztSZZSGa0LRZx3bOFdg011Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bY7gB7vt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsgKTG+r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bY7gB7vt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsgKTG+r"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842WJk1638178
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=; b=bY7gB7vtGS8iufzp
	Aps8jeKcX4XgrAJWi3U8RG1DNWLmc23/ZS5++izX2zXirGVrH7nHEhYlRn42vY6i
	wGhTFMamIDLJoj3sUgqu6VBwoxT7ZVJGKkPInUh/xbag4Ja8O3yK2XKc0m2L2zfg
	kB15s+RoFoP4iezQSUzk8iCZFz6w+ddGEwklrZMf2jkdbOd7U2f5I64Vo2EZHR45
	6coNpwsO3rlnQuL9jAqb6b3WJUSaMRwvXcM2wNosfqs+DnOyFsS37ELYHTE3QCn5
	8qwWqZ91PSGQzaQV8mWRyyzhsc8FQ06P9/r9HAG/4mej+cAA2O4p9EyHAW2D28g2
	uSjXMw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a8y1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:36:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479c6c6cbeso403067b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489001; x=1784093801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=;
        b=MsgKTG+rAZvOnOYtL0AcU0Pjo73lESfzBY0jto/GhrgZlrsnxiD9iGpAPmdAB0iFVp
         jRa0FCKKlZ0G7nsonzcie/W7MCqSVtMqpBi51lBWtU8EqRSrfd6YMUWYPh0/Bf3cbZEX
         D6LocBv+pLU5KdIZBjhJ5IXfXGZf7/LNE9/O+EyqdrnrgVQA6NRjI2705zgx3wsf6Txb
         K8U9ztB+zmkXVwYSoiN3kj6thtX35ZrGRfCipgxvY/jktcZDUsTREYFZZ2V5TTKo+rlY
         yaq4UxqZQludDgalL/2sa1G0Ia/2j+Sob5lZPKKLdZjpBcytsZkBjIRK/8K1b8WT4Hb7
         gEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489001; x=1784093801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UqTfYZuS5v9TxvWd8p5QVvgMLn1YG1IPnoC+xwtJa7I=;
        b=ZdQAO60RjSU2D89P7y3iy2gW3P0DeUIE6qDizZgW/AL556hMZLQOhUNPUdEcmg8VD/
         B8VR6shvn550OfKU/SsVn8gS9TTSpeqOYda2o+li9djJvYxiHRlM2SYgSw+hr2iDbXne
         pO/hD2ibql2Zofu8YuJpnF56/x1naBEiKFU9VEoYXkcaQMXiCEzfhSUtociTuiA2UtPK
         Tm+TIrD8NbXo/mr7O8Jo07BPgAaScwmzuwbeUub1TEFo/aZns35tu+JIBOlbGbNDkmlD
         RJ8inqJwcs92+D5apJ8xgDgvRN+n+g51dY4MS7ScHsQaiX+n+wIj7uiaqM6VrrT9hnCN
         fupQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpt9H/DdVJq3OmRj3c28hiLI1S9m4HZPZS92UoSKuwiNv23Wny51gahHm6j/gS+V/9NtOjhiJl4Yf2fvb3vLuBb@vger.kernel.org
X-Gm-Message-State: AOJu0YwEKJpihcpQNHg3LWWqCLmeF+yQqOU8FczPPKRaDB6wIlOWrPs6
	bLL4UkQ9C9I8i4VT/mk7ggKNuFdYVgG97QespUfQXqirjX5ZCxCXq293NMJ3qRZI8/dD096Cs+/
	WpEx2oKPtOi7tsXPx7DCAfGxf09tnj5TVgwgL2Zvq9jNX0k0xueitrzsLwYXavJHebCP90uF/
X-Gm-Gg: AfdE7clG00+9JhUhwy08N1oou6yS/5J2hT005o3Tfu5D4frFZhQsObrhbN/9b/3Sg2u
	8kOaHWbItos46GHM5HyY3oxgDq3RTYavs5FtHrL323L5RshwPwYv+OUkuURB9cuwLy1ATwIznHD
	LFk7Gy+cNrnbykMZ7+PIwh/QWKBCCJpfSyfjEaqFawX4a2xFVeFAV07wAkSyjuz2ZMXN8yqWY/w
	dQMyBtxRAoF2Y1Nbny2O+7Qt5zFi01otROOynhEz16gfk+MmJ59MeWQjfqTjKUmBTrKDUUA62MC
	ES1decsVQUncTS8cr5e1TrALpnJoyyApm7A0EUaxEyR7D6z36QocXR6Mrc77Q+htVR1+ZT1HP8J
	dOUrzw/1exm6770Uq5dxd1s6YEeY9MGQEkJpz3A==
X-Received: by 2002:a05:6a00:2e88:b0:848:2f71:b661 with SMTP id d2e1a72fcca58-84843000749mr1202851b3a.76.1783489001227;
        Tue, 07 Jul 2026 22:36:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e88:b0:848:2f71:b661 with SMTP id d2e1a72fcca58-84843000749mr1202755b3a.76.1783489000489;
        Tue, 07 Jul 2026 22:36:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:36:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:56 +0530
Subject: [PATCH v3 17/26] mm/mm_init: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-17-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=909;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=4qnpCkPRiE5CsuQx1UWQEXlwAhSangPKX8XiWfRWTRE=;
 b=z97EtvKBT6y9k21SRqlalAiHkntvPI/WQIsgr0jHNuEecXk60Tdz+odDPSt9xKDoeipWusU9X
 d9152pff/1jClPE14SdlYcsdmZc6dXry9myPmuVfXbE/BcULjts2es9
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX5U3FenmKKGSM
 W6RXLr2rDYQq3Ajat3zCKpM0BsqRXeKAGmVtqIDWCniLxfPgvAF/vDyiV2GQecUfz8EXhWNkFgf
 OxbTWDAJWcj7yYh0AYH2U7Ilc4LsGtBVFFC70BrJ2vXLXOZCYWIKYw8WJ1DRifcjcrCy11nf90Z
 cUey7t2/FmsDxFsn0N1cP65/OKP9dDbpwy9VmD3JGgqJgxt87M49tyVVVRFyCpjByKLRWQYjRmz
 IswVsp26QnMfA4Xt9GHB0PliBVw5NlxtEVE2AVbPzAAzrDkesqYWlUu5B19shAiV+i2b39pAYHa
 li8q0RvHnUQZmtG5zTZuFAfmBQbKpW514jUJc3O1eqLNU366GoEPd1sTNrnetdowV7a0/0XpJlU
 7NJbLnY9+ujCfKOW6HF7ZINz7bhNCWpm7xBGlqIBqjdWEefqSNMnBRDmoMQWeLxpFmJxZ9mbC1/
 8MleFC5cAW9Byuh9zjA==
X-Proofpoint-ORIG-GUID: YAqwfwJVeyLBJTUv3tRGCN3af4kmzDXs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX2wa4QeudYz4F
 5LcZUWMIVoWiGHWL8Gt8pCepp/0xvg/GkefkWwqcHYuy9NkSP5Uswz78hFbVTLO4RNLHVKlqwfF
 LS+Q29SE0CwCVgPf3fMAf8VvOHPseHE=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4de1ea cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R-PfVeyQBJMsRd_P_MAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YAqwfwJVeyLBJTUv3tRGCN3af4kmzDXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - high_memory

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3ff2e90aa17a..d98b6071d2a1 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include "page_alloc.h"
 #include "slab.h"
@@ -53,6 +54,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);

-- 
2.53.0

