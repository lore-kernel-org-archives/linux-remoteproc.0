Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F43C0630
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489131; cv=none; b=Ca0srAJE9+ZYrMSyySZiBBiBn6uSLM8kJAreS66oFRYg8I2I+Cg/VwcoKNyo1TE9kjcyk7oOLJ17hrD1MTAJsGWBjbssx82vQsGogKwxkx8L2q9yeUupzlYGf878GJckHQcNnY6TK/9ydHbwOqhB3uws6jOH2iFrxfzg60wAJFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489131; c=relaxed/simple;
	bh=EqDXuZR+VwoiCHQ8MrohT0WWo31+t7/SKpMrOr+qFys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTK9Lpn6s44pl2pgozdbCHXj+U0EhOoIONqlpk2E6juxY2KxGFzz201TpVCxDHl97/95o381Bky6fgCjLl+Hx3wEYmgyPlmtQs90wqR4+BDPZf2ZWt7Wz85xZR0GwqEpfp3YSo8LhoaZu3SyY+SXijkp+RvzZgsdrIy5w7T/FTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EL1hUm14; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdSvC/us; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EL1hUm14";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdSvC/us"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842FKC1508891
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=; b=EL1hUm14z7DQ/aie
	toNLc4wir5Xb7/R5+/n78Td6Qp5uABES0LJgz4U+ZxNgO8BvtYeOqdrL5eOOVSFE
	m5PoMxOtc0Eaa2+A75pDlYyY6cjeVwVkKOX5uod5btMfqbbbcweOq4IaKvVAPzp2
	MRIiAN2E0zt9hOIDizdPd7FV568FNMWtqI8aL3Frj/zkRyFC6Bw0lg77CueNscoE
	u9DYL0J732btCGqOW6qoCVurAKfExy9bYfY2Q9v//RR7PJszsZSKyEK64fzA/ACN
	xniDwxlXOLHuncXkbf+VtRHuPf93pMMKWEbkIBli1yE/kw8mhtGqMmEkqSnV7Im+
	Xo2Lng==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be591vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:38:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so401846a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489129; x=1784093929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=;
        b=OdSvC/usiAtNIVVvxs3IHuNuF/YPYvRFLWV+F4+tyP8B7F6j/bmntdhHNwGNziZhiQ
         PdugBOu3FaV4OsZ6nbvzxhaSgKSbRrxKSq5XFPhc6y7TG8iawR8SXKtaklp2qDF6U+wl
         CR5sKikf8NJH+bxarRrM6fnVro3/lZHgYY75vsFxCD5k6qIfrbnnwVeozMwyHrzTh28B
         YqIL6T2m41lcI7sFHkiJLlwR792avSpmztrwGqKoKBGOiWQ4Yix6NRaFROAbFJzgIXAF
         eCldhU/9Vib+tIMZLND7mRLgiWGDvUWxGV67cc19zqz04Jo7Z1PC/uXK7z5BxhTi6C7+
         wVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489129; x=1784093929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X3PuP0EE4zFbYmFK+cTACEjEy2NM6zeM7tRQiHecKY=;
        b=MyherBEdOwLGCWvOCJ96Ps/nMBr+wJs8vTZ3x/ZRm7oNZgaFpr+NDTdnujbYhafB6U
         DGFlnEOk8AeWnM6luaRoNPw25Bf2g26jci0txasNulrSheAQkafmVLqHXeJHyeHPVF2n
         BUuOKyfY+Ei/MojUGB+0ZoyUg2B0L4Ycv/nsTFy2HVxlPI2aSee+EcgmOcpA0M/uCNvc
         5ksYcA0dcyBqll7b2usG850s5Hm7Sps1kQPQZjVI028ale4cbQX32HSF9HjKyHr4MM1n
         JzQTEBbh2qhsbmuK1sIRMDBLOIwZjFOKo7QQ78t7uY+aXAXS7plzyEPxMo7dzBMeUPxz
         u8Kw==
X-Forwarded-Encrypted: i=1; AHgh+RqMIn04S4IO1+MRcLZSHaHC7APs/U0vij7pP2BoCodVjJ5E7k+ZdoJ1vtcLuoR7H1n60PyrYZoi0rBYNvXVRlt9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5zALG95dK3SYuG3N75mmxrpW6naGmaK7KmzL+JB69RQgvHcL
	6wxdRCPc+1e9oFTXMkGBiB+1Grf0v7IRpHZeGpCEkcEHMN9J9PpPWGuzBjm6+S9+4S19sq+4Al6
	2uUQK5+eGJaQEYI2R2c8Ej/1MKMkbB7he7fU6swbS/+eLBiDWt4i0uSoRFI0QWSoTXM34d4VV
X-Gm-Gg: AfdE7ckapHz64ipl2VBUUNcwYeTDQHyZcbBr8gcSTZasjA/OBozf0/ULQiaS0xkrNMq
	6jxqOI0RQrDnWmPL6+wsNgOQXP1rBTC3ZOzVGLZWMAy3YveqrgO9DPx8LkTJ7EYmF57cv/RUcV7
	kj/6HjckD8QL9ZIAo9Dvg6Sy+buw+EiqQHLeQaexjkuS7Bu9G2tp6YkOd/0dmFlgMlgW0BZJFVj
	vvoI7riQZUbJY+flX9mt27PAK68ZbY66CqZ4oDMaWpXNIEolMzh60hRlKfHAy34Th5aNPQubT9w
	we8E+DDx22XJy0O6BbRo1iwRc1MiEKIlaLN9vki0+XzY7jQKJEgK3h0gSiaAwrfdRcQlH/3+Fbb
	lk3AYzZOeHZy+HKwIwStrkFfRpFuuHlVyhlMObA==
X-Received: by 2002:a05:6a00:1992:b0:848:2aad:3393 with SMTP id d2e1a72fcca58-84842fd495emr1090494b3a.44.1783489128290;
        Tue, 07 Jul 2026 22:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1992:b0:848:2aad:3393 with SMTP id d2e1a72fcca58-84842fd495emr1090447b3a.44.1783489127740;
        Tue, 07 Jul 2026 22:38:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:38:47 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:02:04 +0530
Subject: [PATCH v3 25/26] dt-bindings: reserved-memory: Add Google Kinfo
 Pixel reserved memory
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-25-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=2504;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=EqDXuZR+VwoiCHQ8MrohT0WWo31+t7/SKpMrOr+qFys=;
 b=IlHziXitcvmT7aPW0vG9xreygnlcWjxZOdssLB909oS1UY6NFTJQZL2kltBAv7qt9PX7Oo/km
 XzLe3BF48Z2BxC3z5wIZKkBAe17AW3wGDH17Hjo8UngU4VxpQsJGmSU
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de269 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=37rDS-QxAAAA:8 a=iNqdCcJJzjlvehcLF60A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX1TxaawWStSxp
 QsYJ6rCOMbj4jma8lX70c+gjJx1CiKx2Rt2hAMehgL8UNbjxXVe+qi5HCG00ul2KP3z0SVxo7MI
 UTHFOpgMzY+PUqK6fNWjKXMRh5uKhyU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX3wfSz5eCRI2y
 X/XMeBag0JXWW29mM+DiI9e6IlITTx305uF68STDQP2ZYZRO0x1KyXf25rOLVG2q00GNw1ZmNbC
 0oygeuDnEhVkY9D2a+07h73y7sIGNz9Hq/bZ6vXMUKabEiv8lHSXLb1vAP3MeYA2D+7LCV1c59g
 oWKow6h8rl1SPJQyIso3NHAZ24D5NKw5eqXK17kwQNEx04kkpg3+zfoTUiW3q6QsEhIf/GnbUCU
 sfvKhN5KgH77MzxkqL3K6sRQ6FhQTHQDe36hzKpAzEiIueW1AyvFjAIptuIUMyvATKSLsb0hfyo
 oBMSJz34M4u2ZXOlisROKmvvuInv9MnGwvCuMf6LjPPdzp7m99bhFc1q+oHqLEFU7f3BIyneQZQ
 ZHYNjwoAUBpTO+42Z9gi60w3KkXjjIfoW1BW87UB7uVCn+ax1kayb+CPOAmeX6YGfexfQM7w+98
 vV/zNPqjOhQkOOdad4Q==
X-Proofpoint-ORIG-GUID: 7ow9M66_8WFU8QlRhgZUNMCMx681wj9H
X-Proofpoint-GUID: 7ow9M66_8WFU8QlRhgZUNMCMx681wj9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080051

Add documentation for Google Kinfo Pixel reserved memory area.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../reserved-memory/google,debug-kinfo.yaml        | 48 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml b/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
new file mode 100644
index 000000000000..d260c2d5f70b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/google,debug-kinfo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Pixel Kinfo reserved memory
+
+maintainers:
+  - Eugen Hristev <eugen.hristev@linaro.org>
+  - Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+
+description:
+  Reserved memory region for storing kernel debugging information that
+  can be read by firmware and bootloader on Google Pixel platforms.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: google,debug-kinfo
+
+  reg:
+    maxItems: 1
+    description: >
+      Page-aligned region of memory containing debugging data of the
+      running kernel.
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
index fdad8ef377c8..2d816d783024 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16901,6 +16901,12 @@ F:	Documentation/dev-tools/meminspect.rst
 F:	include/linux/meminspect.h
 F:	kernel/meminspect/*
 
+MEMINSPECT KINFO DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
+
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
 L:	linux-mm@kvack.org

-- 
2.53.0

