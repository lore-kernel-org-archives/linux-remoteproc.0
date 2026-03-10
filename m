Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050E43E9F88
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174143; cv=none; b=H/tEiOlKVuZXIrnjrnCDHw1JUE6ghGTNdX5KE1K9Ju79NAcNTW7eDMvLQaj3UT3ZDo5lbcGwJbCCZyKZt3qjGGOly6D8ypOmHkVEnnB5g3EnjpvyRDdb7fnxiQk+hEC33dc3uVHk4YWgk0qa2oWYnO5BxDaa7/0iqxNGZ355Aqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174143; c=relaxed/simple;
	bh=kxkhHL6Inn5vy91sWNPBwxtVUU5b0erQRsexgGrH3n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BdTG5Mb8VSOVOaWGTYfWdZC+rm4D0B1kqjT27O2Ch2HGiyFWiLzY8WfNrVJtGzgJlUJ7lJcPP6PVUdxT1ygbRhPnIvWij7DplDfv+kccDMhNhiSz0IZxjYpJf61zE08WW/V5/KArACznpkte4BJImDcEvYidlg9h+wdXfpXkXFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPw1h3cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gaOgjfA/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPw1h3cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaOgjfA/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHcnSI2179276
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/uUYtzbBAMu+u7bupalNhBTW7BYEt5Sa2Qb3bAaRTLs=; b=aPw1h3ccTPQ6vDva
	8RL6Id8V2H9C8hHgbuFfmEhGDmnb66zSn4duAggHPmCRidkKkeyWI2C71J46RzVh
	xEmYcvijqUFc063opGpKoJds5en9I434aZD37fdwqygNZi38H+sNnj3tiJHvNmaK
	Q/7YZyhp3lwCWmwcUg4mJaVZaWy2BWI6YokznMU+P2LlC6zp2oryV/X9AGryskIB
	D+T2+reeGB3+BB9a4illrxG7VfFFABat1d0C5HOBn7StO11xfUh3IXQinWhjw0he
	4xgTqLGpeGIzh0BoJ8aYSWIPxxkIMDz0RovcfKd90Af+N+l4plGNy856xnj/hPv+
	CzKZIA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqvsrkem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 20:22:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-829b7ed8964so2427096b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 13:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174140; x=1773778940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uUYtzbBAMu+u7bupalNhBTW7BYEt5Sa2Qb3bAaRTLs=;
        b=gaOgjfA/9QQ+dDtnmkWveCJ7EUfyJXyDs0BMbY38kZDWuG6pPdoDm9PTJHU6LToOU0
         /0FIjuYEop+T+3o8D3/JlnRkVbj3BSXbiW70mX7QS8jIc2Bmfj06HmdTW7M4xoKY6J9B
         JP8QsujOh7u0UT/hcDXGyfxgD6+hI1xb6kPYj1+pJLgO1/PBUlX4LZTs4TUmBqZ6c+0I
         ykIvCD68auExw0T4SnfZjx18rEKVfCFe6IbpwLyaMAb2quygDSlXUTOykVRzI+Tm2Trz
         ho9GkO9KgIlJeiEJfduawzeP81zBtHeXgwySWfh6vts//qq3SL+GvkLuAwyUledgJwri
         fyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174140; x=1773778940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/uUYtzbBAMu+u7bupalNhBTW7BYEt5Sa2Qb3bAaRTLs=;
        b=UUGfZ2FZO58l06lkr8kl/TcdY5cWS8EJIGh1vSR/LnLCWZzRpCimmopMSupl1GcL30
         KHGGxoLFBD4MTA1LKLbaN7vjpH4iTgc+R1Xalrw/rDgewAG3R3F4DXoR0T7x01TMdlRo
         WN3QkAsNS99Pm+trywjNKsNlQUEYxbY4Hw/wAYCzuuXRTdxT9FaYg4PTc9OLk1hpa56h
         DSkKO6a1CvxAKRqgm2ibJomlWn0tP96MAOeaIRhe7NI6XL50qIMab2IP69xkiKphZI4w
         TGzQaq3XGZECQyrk3uL8Ldwbv0aele7VEuP1SPZz9HWqDAQnbh1AZCnJDBjO6dj1emCS
         71uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl2m58pPnFoj1qIeAP/A5vgI/vTniHnmQKXH8fYupA44LilVP+bGaIlQBjp6Kgj67DJ+NjsVFPfd/tXtpxSPd6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxns91Yco/Dp7GLs78Y81qCQgEOxNSu1LSZrztcn2Ddzy1ilETd
	nJ2KfmsAhVS4HWVLnISCHG71uwhKcqv04pLftLGVOMzVwCdOBeX7t7KC1yugWswFmjBA7sKb/bq
	xdkS99rGyhW0vLVzmwpoAbKXt9HcxSJw1OaBA1jWggOhaRc4Dc4uzxRUBztRV2DXgGPR6nJuM
X-Gm-Gg: ATEYQzwge0m0wG9QNg3zx35AGRnGZ9BKXgZNabTKNDyRcV4DbBWfOqYPzhmO/zO4Fjt
	w5tVA+q0Z6m9y8raCHbkOYooo1l3si2kCVy/bdPilbe3xb7XP5PbYw8DJfnyHXxMQ1ZxahK3lR2
	XXfZSSHi1MhCP/wDx2qnXzr1AD4BmNUTd6Z02ERKFk1hbLKn8iFLPtyhEsXvZ8HjJBnzPcHFCpm
	b7yknOx6hYSJvQxU1jmPsI3vkRP4rE2Xam/384Vmc4m6p0uNN9P9qFZFyPN93js5d0VEPcUC+qK
	YzSQVJn7rSi+r6U9RR5xm9oJ2dEy6tTnLX17+cAO6f0T9TKbVuklEtdfqFOAnEfNx5xzvNWCGAq
	D4ILDBYrMz5Q9rYZlufWlTmMuVulQKRBY6/5BafCI2eAIcR50
X-Received: by 2002:a05:6a00:1d90:b0:829:8041:83f with SMTP id d2e1a72fcca58-829f707301dmr155607b3a.7.1773174139088;
        Tue, 10 Mar 2026 13:22:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d90:b0:829:8041:83f with SMTP id d2e1a72fcca58-829f707301dmr155530b3a.7.1773174138369;
        Tue, 10 Mar 2026 13:22:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:22:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:08 +0530
Subject: [PATCH v2 24/25] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-24-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=2474;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=kxkhHL6Inn5vy91sWNPBwxtVUU5b0erQRsexgGrH3n8=;
 b=6MT7VZEYiJ26WHI1HB+RUTYRS5S4mWBasU/tY0AGrn+K0ZHF6GT766OHo8RuR4PhqhgpOtU11
 ixnzFMgK0faBvouTgqwCNSVVa7/2YaR2C2ym1CGyS7TIOWKzb2K+whi
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3OCBTYWx0ZWRfXwhR02Oz9R45v
 EW6H29Iwvfgw+qygvz0zgA9hEnj1iCOnyhlpSATVPw3Upk9t4rDmgewp5isAjESQmggSDxl6oY+
 SrbNYjgR2fpbZvCaIIVNvAUgLeJrP7ECwC9m59KmUk2L52m6+3i3tPPvgb7IKChnXuExykQhjTI
 w6RsSjlNcRG2x7skMlypOMr+nBzGYhT/EcSt6h4/P0n/p5qafB7nX/UzqeE0w7KU/Ny9YXa/C0D
 m/dKFvTVGMdVctcf6Dq1W5DFuu/Bv5qERAULv5M+Iuj7SFVCSLmIqfRWuxV8NgVk7wfXZHCYWGB
 /zGlZR8BY3gIAHTVvUdBPfEBh/rZBzNgN2GZSgt4zSdxLmK8d/4rHYsrJdfoGzRb/Pu1myTVNeL
 xOQNZy1Al4zv+ej3DZwwErdsCiiPcoJGC8sPzAWNJqjhgIlVxkycU7hIHCU1vRqxWFfwB2rAt/5
 DQUUo2iYsmDQ5Gtph+A==
X-Proofpoint-ORIG-GUID: IuGw7aqpGMHiL5yu5LjVu8rXk5xScQR8
X-Authority-Analysis: v=2.4 cv=Lo2fC3dc c=1 sm=1 tr=0 ts=69b07d7c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=37rDS-QxAAAA:8 a=2rb2LGFNx5Mo7s1WZPsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-GUID: IuGw7aqpGMHiL5yu5LjVu8rXk5xScQR8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100178

Add documentation for Google Kinfo Pixel reserved memory area.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../bindings/reserved-memory/google,kinfo.yaml     | 46 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
new file mode 100644
index 000000000000..2f964151f0c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description: |
+  This binding represents reserved-memory used to store data for firmware/bootloader
+  on the Pixel platform. The stored data is debugging information of the running
+  kernel.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: google,debug-kinfo
+
+  reg:
+    description: page-aligned region of memory containing debugging data of running kernel
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        debug-kinfo@fa00000 {
+            compatible = "google,debug-kinfo";
+            reg = <0xfa00000 0x1000>;
+            no-map;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ebf478dbd15c..2504b7df0e7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16592,6 +16592,12 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reserved-memory/google,kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org

-- 
2.50.1

