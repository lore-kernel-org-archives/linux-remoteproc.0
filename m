Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1666B3E92B5
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173927; cv=none; b=Sv1DWOMU6MzrmNaxcRtG96rGuNVP8chfh7mWOlWv4Ky+jTEQg9L26bVB7aRHaeYIMpgmBZXiPVm4lHxsmImoTsWg46MbFrPst0TpaTOI+vusAzAq7wdG7WDj0viLquG5TlHF8K5tIx4T330NmLoRY3wG6djYVykaWtgWGRZIb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173927; c=relaxed/simple;
	bh=lQDikNlzlcSt50phSDa4IXhRVO0iEhluLF5Uv4Ogkaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syF9dGm7jnrSnBwrOpQ38yX5wZMQL81fk3RpfNW7WdaBcoQT/PZFbvh/nZPnX0hTB2AtB3OERMTXhWfi7mqXg3hG40mQxm/GtI36YRVs6k2cP1sp5sWKk3YIimmBm7tyeZhbcAVU/ZxOo+66O9tEopWu+wiL03PZthrt9ZPX4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ik9HsVe2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Exh9BpQY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik9HsVe2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Exh9BpQY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AInb463417119
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRfV+v8T0vtqGrE/H48Sbm8BwZSwOTwP5bNFawAy1Fk=; b=ik9HsVe27x7k7E+e
	7lwbkzTzKs+Xaa30Gwlu8DLnPa/d9oQ0nR6g8WEDDpquIfohhaf/ldNmONkYrHSX
	5+aozV2K6RXs05Ks5/qSSt8OAA7DFEB3znqkdC1gCDMTAN3Hz9nvYgKTD3vtKpYC
	1UZKCggpJTEftG2QeJGWx9Pdfz72tXsFE0kTxa5COwTCVBIoN3KguwyA4zxmhHWL
	p/w8XWCMBJhl44cJq9qnOKhcsk8lSeDdyOGEv0v/xA1rAPZyLpsaXrNFnHrYFcTx
	TYYN1mU1HNA35xh9h1gWfC0mcaWaRFK52is/s4kKpby5MgjBrr3SPbnthq6zQtzF
	ojqwBQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2a3r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:18:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829a535ad7fso12894668b3a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173924; x=1773778724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRfV+v8T0vtqGrE/H48Sbm8BwZSwOTwP5bNFawAy1Fk=;
        b=Exh9BpQYFlFZvvy+VZDSDnSidMsMs4kHfFHA9yzR7UAvNALmXMNFvOFm+sqwKa5FwZ
         0rYD7oxh6WPD01uLWNpckcgfQmX5D810Z05/2Nhsqk09QTqw6MGlL1gFi5AlLrRrQHfN
         e7c3FeI8H1yJojfhsKUP2jf51cfOm7/RoQhTneFkdjw28oajCNQsfHATa51LCEuuG6OI
         r0+KMQ5NwlZDUy8Ju3jdenSgM+Z6otcAoucBnXo2d/N/3ugarfUJt4ULkxnWpvk2tcvb
         6uBBK4UmGk96H2IevXWpD2Xla1L0/a4JbnwW/suZPJpW4LPGTYddVuV/g9lcDewebkkT
         w4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173924; x=1773778724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRfV+v8T0vtqGrE/H48Sbm8BwZSwOTwP5bNFawAy1Fk=;
        b=C90HpMgoQBXt3cRp1ZDhn9BPk6A0HZjfvd1qTUSPg0TdlILAf71a8YIMizdPvnMLK4
         ykaHiftaoSmhqJK+sQL7HZJ9Q0CsDE2GZEvsT9fximZ58PmpOwo/AVWBY5kJVd0sEQGF
         NofCXgEPMd+xHXHX7rXUzIGxkqq7ej2fYbegvPW+qSCPvrNcDjWRQ8pAdn4pagL67ujQ
         enI7RvxIZU9yiny4IpJ+sNiniVdMk9iiXyNqr79LAtQb0MXHldWZqq4ekp/fKaRrLX67
         22jgBHTzw9Gl4H/h10fTayx+RYfDfbsOLT1upgOJmGhQJ7zEwbhuLjLDNjGbIqWCo01g
         uR7w==
X-Forwarded-Encrypted: i=1; AJvYcCV4jF688Vs+FRRUGbhCMxIZEDzlKSRyhTDVBEmzxaYtoZXvxgewvkHowlXXZoCFU5RI/tFF3GrjFQBD2gJsPHcB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx11T3CF3FmXqaaJ2PQ71PMDZX8qS2U/CD9lhPc3gHSNYyK152x
	HWtXB9ELzU+EPDOGVn9sx8ng+uOMJ2TvMMjylUjGc194BmT3bY/yIaoBJp+5uuT+qQTpQO1L2jm
	3mIsr+oTuPwXkxAyuJxFKwmy6t1+Hghg+wdSUPwz3Kiu8SB7ZhMz4jQUA3+fq4SVbQAo4JFNr
X-Gm-Gg: ATEYQzwE9Rf4/eRXgxFYCprCQjf5O8gFO4hHGNamlKB2H5X6tWUEYLgJzKw+CZ+ySrM
	7donJK1RtaOmQStEezZgmv1V/S6zXo4AftwBJxp0L2cZVDQ9dDe1V444W6kTKmaejvRHSGNGE22
	pe8HIj1YRAo9C3apI2yoYl65i3bKsX1JaOHK7Fxyw7R2vmb6R1tL4+m1HZqp9icZ0R6VlZfH+iE
	BFzjzCLFZfbxJ33qciqq6m3bn5qjBa+5P9/e6xhJ27D0hOn72Wlj0DxUOnyFGm68lMoTcO3c229
	tLNcFEJYrpBwxfrPJ8SgSVmhlZdmeWcBZiKnGN8vlc44eVRnKEtWA4giALB8RC5W/cDpC0/xSeJ
	KRGB3zXMTQCQ7TPNHxXfhOoggdfBI0y09RkXWZChSEWPx4mJ2
X-Received: by 2002:a05:6a00:7082:b0:827:2cee:ed88 with SMTP id d2e1a72fcca58-829f71c2ddemr118133b3a.66.1773173923951;
        Tue, 10 Mar 2026 13:18:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:7082:b0:827:2cee:ed88 with SMTP id d2e1a72fcca58-829f71c2ddemr118106b3a.66.1773173923413;
        Tue, 10 Mar 2026 13:18:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:43 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:54 +0530
Subject: [PATCH v2 10/25] mm/swapfile: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-10-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=977;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Tfb2N6LauUTGiRFAYk0nYJYKBMAQNAqF6HcYVIzPbHw=;
 b=So4F5y2//OWXVBpu6mb1G2pjPDprKl6dD0OwLjg3M54+O5uetJywuxdJPx+lFXIZJyyrlQ8RK
 O05sCcy76vCAVjm8ctNTaSyWivzLnJvWFr91LSWTGqkpzQ2TiYaDGt2
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b07ca5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7W-H8-9HiqHpPtFVMfQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: nwkHtUaJN0mjUOk1ykP9TYUcURQz5eZd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXyZw9EAvL+/eq
 7CByw7fbs+KECsFn4mCDnI7MSzlNmjIFzRK/HULZWkAMpZkgoGizeP11gHGF+oWHoSs66deUy6b
 7Lk1tg/GLs3B+raXSEk60AYlE574y9qOlQRiJDgX0B9Mycyx2Jv9NfJUuOw6Ee674pjen8MTCaK
 mRCoXAca+5RCw5POZkEAKZ4kyr2ALp0CHIJzoBq7Q2Dq+1O+48UY3sPFxkNWN+FpXeZvFL2B1wf
 F92qYd9UGp9fR6i+TLrIIvTY0HS9NkAyzfwVbDuAoOMUqz58zg2EIyZKDwZzE0AkMH1GPtSlkQs
 LU3qW8nyQRpEzJTd/+8c/htBWVRYzrQ+6ZUmDAhkmXxC4teAnT3I+noUD7F3Bv9N1pRWW3F7rYd
 YsEKhnjyhKY5vLub9a0b392cqzmYtE9XFC9QfYnHIbadFE/ioORtWIau2kECZHB8z94wRVMd9Qn
 DZ3JckmIa/+lISSVP7w==
X-Proofpoint-GUID: nwkHtUaJN0mjUOk1ykP9TYUcURQz5eZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - nr_swapfiles

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index f39c3d712273..03aee425bdbd 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -67,6 +68,7 @@ static void move_cluster(struct swap_info_struct *si,
  */
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under

-- 
2.50.1

