Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7A35AC07
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174049; cv=none; b=pNWonSdquZXcjDdBMBoxWngoiN0KDyHujSSq9457H88vrm7Pz0f0KrzWAt6x8XQWuNiZ3+h/0M0aOyXs1CjT/zNm+p6WtLU64zp+c9aGgb1oXE4h+4E0qNCAMFddhjAZMWwwSLKsgyu3dxM0zhqj2+J096geUMzWZj5KFQiPQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174049; c=relaxed/simple;
	bh=6Bj6mC+a6VBQpII15E95Sp6w7GOQTay+uqnC/6WwCwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9/eh5qNNA9K8Uw16k9d0TkL3yu9qv/j3WQgdkWksGSp1WLB16blwECUknX8Rj7OeWXj6oknX4mHipoql0R5IWZfYip/BEnCCT+n7C5A8bLjk4KFUHx1TK2kIQcAsd6+nPcH4qmt2CQLYbbIyEyDFy98jZDk3Sid1Zd8nxD0O2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TA9HNEAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDJW3FnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TA9HNEAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDJW3FnF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJNlfN3295792
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jopR4iBKMZiW0WEP0sLMhWOcTp6GXZxGsMBTPgmxLMk=; b=TA9HNEAS5Og9Z2Fk
	ReNSVQ1eeRV43iBdF8RJ0o+ZkbZMFzv62RmBioWH2uZQ5SxhGftXd7erjg/h5JUz
	AEIwuvWttlHhFCoDGWWBB4PUnq5fLu8MhbDVUVsO/XLUiPu9a7d9V+HaPKy1nTAX
	BEhwiXcEQwgOVRKwfPNCYi+fogRJxPvYFeibZfpIxiTGfsZUuKho1/ZTQ8Bdq4T5
	OKuwj6BnpDpdAn0jJ6pEcoED8ux8lYBJw+LzCj/cAn6NyA64nF17PjpxxswLXfsH
	AWF80tVORsa7QPW4nJFoM7DzoLE7rCX9L0RIR30iZJg1tfIREX+RwJFHHJoa9Cgo
	hP2gyQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mtpkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:20:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so8345251a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174046; x=1773778846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jopR4iBKMZiW0WEP0sLMhWOcTp6GXZxGsMBTPgmxLMk=;
        b=ZDJW3FnFXEpNhwbrESJkN4UJINRxCbCiwoG+AowG4ZGiufQZGiNlFrll4QoZRycJ+X
         bKtv6lyPUo4g9sVQhWUI3wwm87+tXqDmmR0cYiFUBr0u6ZtPde3XSD3mbvkxpBcusbBz
         a34kYt2RyuxbB975AUZzjiaP6q/63S3it8/h0Ql3KJXilzRzMk+He3jdIUVAeZ0/P+e1
         dvuhsji5czjDN0BUOFTVAf8t+5ZDL50uMx6qLivJ4tcUI2r7C4ZoHOkUR7Dydhod3T8n
         OxpijVDugx26NhcA9sYpyoFUlIekq2o/8smv1ruUY/zBlP7nUHjhzaALSDr75DYLRJPS
         cOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174046; x=1773778846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jopR4iBKMZiW0WEP0sLMhWOcTp6GXZxGsMBTPgmxLMk=;
        b=Y/NzT+j1veSEiMgsjCJRRbHgwmbkPEvuzL2tzFIfIGmTP/yJ2yFHQlaUsuEd88YH/M
         MbVAx/L882ol9BhlJBzajb0Neik11i+eqwCnERm0PZ8LSd7fQuBTJ7HK7b7TxULszpBe
         6NtYpQbUNA860yGIhDGvmV8ICHa3ddIKyUwvotkLDIw/zectPuAKhMQ0eUUxRhPHvA5I
         /7UWo6j2ApfaZXt32K1fa6cJv5voQgBUMo7pq55eC8dWz2I9LliYvgDCmKbSn3byF46W
         PK1+PMTFaiEtqZ2IAKYaTqwmebYVNmXqizQAfslXAbSf1wZQNGuqofCKwlTw4qmYCdIC
         oc8g==
X-Forwarded-Encrypted: i=1; AJvYcCVLkloC2Yuaeihr8xjf7YM0Iuo0pTpKn92ItA1mG4xvKMpIdPBXn786bzZiq9sJq7AEMHW/P01qSchPaH2mfed2@vger.kernel.org
X-Gm-Message-State: AOJu0YxHtkVHvyLwxQDqCnQaVmyhlSAqp2gV+KeK5u6eVEOqo3B6Les/
	Nta8S+7ouP5BxKflizrTgn3g42FTXEUFvzLUfRwhDQiLAwHBAX1Gp4cEcm88Q9uweQa54xleeNb
	pRDWoO4pYa4Rfxul5plR+Gmery3sVnqklGyfeSN3yT5xj9OnslIrIrfE98qItChQM9Vcsev9W
X-Gm-Gg: ATEYQzx8hiUTglxprWLAHAo0iNqEeiBapnIdYWQX7KvprltVmkq/9OXcRv6MDZRwsOd
	/S5I1eSiYjlw5ZmTiD1DBQ041NLc1+wAkA42afZVgEHPMXbcfDrCqZM6ywUGeG+AYBtp3yT9Zm9
	XwsUkXuvt2b98qB42qNpKJmp7Ulwj5EfSawfn7ZE4nARSBzSxlrEWPAdf1p24jskZhVsKK+cHv1
	vkgC0WrOL/LvfLQWiLEFMNBfvtlQEH09rwGUAJWc0quf8cX3cbcKiNrqxLIZ1HV8RbdxyEt3RLt
	1Z6EQiZNlVZByikLtZmaCEYhlrfKYi0tNczc5Z2rJ28EZ5UK6MBnMEiUU7WhN/3siQghaeAn8z+
	7/jnFSyr7QOBoyB9z1NtxDKgUubv37jntZiHZl4flAaGn8+R0
X-Received: by 2002:a05:6a00:a245:b0:829:7a62:5f with SMTP id d2e1a72fcca58-829f70729eamr159372b3a.9.1773174045428;
        Tue, 10 Mar 2026 13:20:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:a245:b0:829:7a62:5f with SMTP id d2e1a72fcca58-829f70729eamr159313b3a.9.1773174044746;
        Tue, 10 Mar 2026 13:20:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:02 +0530
Subject: [PATCH v2 18/25] mm/numa: Register node data information into
 meminspect
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-18-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1043;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=6Bj6mC+a6VBQpII15E95Sp6w7GOQTay+uqnC/6WwCwU=;
 b=sVE7UB8h95VErsPUO4HLhhiTiKsqQAwG/9Ded5XkdsuZg+zS19SjzGCGHXAkoG9YisCapzqnx
 q5gzTZGzf7tAtbmkLgYEPHDDptUq+d/dYvl4noJdNZrSjHyxzW3MTLb
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b07d1e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nLJQaZXserL0MincpKQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4fA0oXb4jEFUKgiEOtrBpQnmoT_wFFWQ
X-Proofpoint-GUID: 4fA0oXb4jEFUKgiEOtrBpQnmoT_wFFWQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfXwJJodtBVMJjo
 0RjTen0mcoPsiytrrCqzG2jFuR5lcMQEotpZmzxuEPZiwFsEU2vCuNl6iX/ymMALK4LsmQDNTBv
 udJU+pE+THh9wMumXRYKnauPUxX//LLSDMTP5LKhBUU4TD0M7MbBvuulxUCypv5IJYF7OylEgZX
 dfBk05C46/kh0KKXFzK/kPuQneZP2pZR0q2081QiB38otjGIG+qIjLZbfFO0oJTuzEz91H3Fqsi
 7QUBJXvjK7uPDkwL2eljxNL44vZpw/Ra3GmWu6dg21k8n3HBIrLYQ+P1+wnoxPqrAQnMS59F4nt
 LzI4KOIl2/xGcmPm9Pb8hiQdCW3UTmTy8viif47vrF3rLCA9oHVoQ4UeGjugg8fmi7R1Kzi1lQE
 tr5vHs3qIX/x9jgcwJkytU5TnZhmVLWF8gp5RNFQZWSQQmKzvCcPD4lld3izI4q8VD+umKT78uc
 tDlBU+rIVBOuTJRZQsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

Register dynamic information into meminspect for debugging:
 - dynamic node data for each node

Use meminspect_register_pa() to collect node data into meminspect.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..fcf31bf2c552 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	meminspect_register_pa(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,

-- 
2.50.1

