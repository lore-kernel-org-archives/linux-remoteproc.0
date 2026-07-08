Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CFA3AA510
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 05:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489116; cv=none; b=eIf6zteY1lCk7Mse85/bYYGsvNiExb176yxgBiPJ9bxcku68YJ93N+of1g/O9uHeWBnsukYQQVQdS8rw124z+99XZBCVnED7V2njDaUYwHHhOve6MDU5/KOQkUfbkmPvTD0Dtp2qyhVIJzwK1VXzCYEvqq/7pNHYhoCBaS26ZOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489116; c=relaxed/simple;
	bh=H0KVhlKv6aukA6G+LK06aNYu+V1ALsrFFp4+gyDYr68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=md4PoL35hiVSjuhHnKwW3nzRvRic7GW5a2pb3Yzb+4U7yp7OijKh5PEB0H2/ZktoKXfykRuD7PlgwNUoadUaGBkuLmsIYPgxSZwu85V19NIzAI/r1/BZOZ18EuPetFCghfatQ+Tyz8MzRPZSD6iQXCM/ptihQCKbhutAq87/msE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQQM5//9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EUYpCWnM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQQM5//9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EUYpCWnM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842Jmm1638089
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 05:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fca21ZgkD7LFTSRCvjaeWw9IaPpMxur6ce+e2Kwqgnw=; b=LQQM5//9LbOc30Sx
	Mt1bSo5SZ+865GzEibBA6hJzyNwcXqIeC4xNa/lu+UrzBww8zpjUEoagRsBmiPsk
	bkIL9n2SSQ19liYsFwanGwNmXHDW4XvXIoQZQxPmi+k7pFEdgT1XVz5dllYIE8DA
	i2jCbyd3PlNEPfvdrqQznXquMv+tj8ZFi9hvpMf5XJHJMqhFG0XtrH09BaVTscJk
	EWmbh2EI7f+Tk0n9foFwNQ2P0/bE/ssMfwnAVa8nh35hZbW16HSd312t0lqw/LBc
	7JXd0SWCeELa3ZGymk4NGryqrDs460Gg056U4JmmadqGfExst5nRMOgWFF6iRP7K
	vMhrhQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6a8ya7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 05:38:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478947e047so639317b3a.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Jul 2026 22:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489113; x=1784093913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fca21ZgkD7LFTSRCvjaeWw9IaPpMxur6ce+e2Kwqgnw=;
        b=EUYpCWnMXH2QcaEHqKVuRhQwWpl0myzOHq09DpenpOSYNZ/Angd8GCsdCj6rBHkpI4
         bwTAFg1/FAKPqIu3ms/Ixo6/doPkPN7BpZe1lkFQHaWb+VFYRpA4bZ5IuSFZc4B1jKxT
         KGZVXwAilpUHeMahq5jhFbUeeim7BIGmYMHEbEbP4dvTwTeKHhiUE2ZrHEjxqduFiMiz
         QYpphM4VktGkS/iyItqaGj3cqSes7Xsv6LY19JIyQ66ZG0roLuhaCbZWC3FNGXqfRixT
         SEjtagCbS44MrvmniYVsOYCj88tNwjVV4KqNRtSOsimOH7PZpTDyPDdYSCDPNZLP1vkt
         5ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489113; x=1784093913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fca21ZgkD7LFTSRCvjaeWw9IaPpMxur6ce+e2Kwqgnw=;
        b=Uqe9+r6MrusV+IpKfCmP6PABJHraZgD4aTIymF3TJQJEuwrw7cG4Kxqoi31DJ9pc2s
         eqePcvX1FMuz1+G2CpjNUot/e0Ca3LGT0MZ0KWdKp4LN5aVLIZM/kZcAjn9YG9IJJ6V4
         otYb2DQuq7R9dXzYFE6AX1S8suJ+iaYZsgSUIF317ldeYGHXjC9VJZ25AHHKrfjxA+Oa
         WV7dfYarna/DFfuHjI7EikOEssx0MHbyqnjdZt572FsZy6bSdXCiF0jXvjo0Lcg5U60U
         AuXTKX5lifwdZByQ+h3muJ5F+wW/USL2kddYAFUuD9uUOmh7IjLMt9wt+M89rkJEcqCG
         26Ag==
X-Forwarded-Encrypted: i=1; AHgh+RojROqL0l3GgdjXw6DfsSjl5S7QNJamvjWcI87PFXMeDIO/i9F3hRuXg/lB6SjyXKgYfERt8sekjl3XUnaNf7hg@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFstIZd2ee/EQ8wVl+ZnBLMrGaxK3Gcu48kznp+jhIcX26rCl
	mMswKsyYVAsGOm39igvUhSAkeeRTtQrudDvSqQwtvIsYEg2qyGIuHXXA2u9q0AyhA+cLgr/VF+y
	336ZWT+og8eE0ps8mFQMmISCzLFXP1x0VFI9aSodT4OaUU5Wjg6i3Frw4dADu/hBX81KkUEJx
X-Gm-Gg: AfdE7clruR85Jkmcj1d2f/cLdoNSRiajn4IrQdlIzW9RQk4bPtOszXQ4vXN/eeUcxoy
	0rAerKBcEA40cZrwNsmc9/59kTJt3DvD8l7a6bJpxbY7pE54DbiX7YjzhAx1fgq77ros90cnOfk
	zi66dpcYJu1+z5pMpVCasgNYJ09l64x0GFtpH0xWQpb8qGMyZ3HEFuVcItFlobgjG5a6L+NoxDW
	KvdFn97kexaf2VlQJn7YX1TWz9HnJGlzpStVJki1je+ClU7CTNfz5sDzVRqg8+L4y84D7biYDis
	MUXSctpDCH8usrGcr65Ick+d/e+P1d/iUOZVjEh3DMaSM//BhLxZHkHoNHDDvZTvFO2Gqj3xMia
	tM4bv2zqeklI7h8tsZHdMFgc6Tmw3bK4/wdHMAQ==
X-Received: by 2002:a05:6a00:2993:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84843689a40mr1216570b3a.63.1783489112604;
        Tue, 07 Jul 2026 22:38:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2993:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84843689a40mr1216519b3a.63.1783489111892;
        Tue, 07 Jul 2026 22:38:31 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:38:31 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:02:03 +0530
Subject: [PATCH v3 24/26] soc: qcom: smem: Add minidump platform device
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-24-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=2166;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=qD/nh641ZSFjZGTcbJ7iS+yBVa/+Otl0CfqdfCxWsT8=;
 b=gt6zHK586TYGPJ/gAqsyCYCD6hbQxtHAnbJHOmkGZ2yjp8Q1La0mBTlUIIpunCFMmTt6hSxAn
 uwkN9HKuN3hBSxqOUojHd4WBwfub/7sr3Dd6ydglmyzHr5NZOT9sPBK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX4yOnQZPSxezH
 c39ZFIyktUK+KjhJZ1+HXfLepcMuGVAOyIv52dT0KRjaHxFZmDara67rpcBtyGlnrPWnT3AOkve
 xoYr1ruPgz49TqH+jlJH7EEKxLhQVJk7pj/0x7FtnAXwyoCb1+3BK4Zsk/qigQr4R8Qx5Ghqu9p
 BeEY2pzXmatwY8InxnvHrCfyEZUrrvS0n8NbA+vEj0fIdkdgaZG+sxmq5bR9qRWou4UW/xUohgv
 n0Hc5NnXUQ4TWWieA8Dv2Z5SEpuIDkqcvm3dM70jThd7mbU5G/2Y7Vu86HbsdEWzGwOE8I1EBbB
 hMS1CDv/6DTNFPUg09juBOXdwBdnYkBYlhx69+A86IMkmLDpKV28ScGZfGz9wkhiGoVztKU8vhb
 /SK5fE9388OrN0w/mDrWLBXybhwQFZ0M13IleItvKQuBqxmEw7r3rZajknZjC/uLQsbEX1aTLlk
 kmC3HoxbeeajLnCgl7Q==
X-Proofpoint-ORIG-GUID: 07ALk-cskNvYEcqL8KaQclExCTnK2Ss6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MSBTYWx0ZWRfX47iX8w5ByJvj
 +QBqwontHbF/YFU+rQEmzON9cnBKV+TsYoX1v4501vxGejEZhNqGuXtNmHf/pMCP4HR7t9vVMMw
 UBuJQ10TQQFFK6o7JDO+sO4puZp2ZFM=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4de259 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3CFpAjl5I9ltKDqHFfsA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 07ALk-cskNvYEcqL8KaQclExCTnK2Ss6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080051

From: Eugen Hristev <ehristev@kernel.org>

Minidump can collect various memory snippets using Qualcomm boot firmware
support. To determine which snippets should be collected, each snippet
must be registered by the kernel into a shared memory table managed by
the Qualcomm SMEM driver. To instantiate the minidump platform driver,
register its data using platform_device_register_data(). The minidump
driver will later probe the device and retrieve the required memory
snippets from the memory inspection table (meminspect).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index afb21a778fe7..11ebcfc34d0c 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -267,6 +267,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -277,6 +278,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct xarray partitions;
@@ -1245,12 +1247,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	xa_destroy(&__smem->partitions);
 	/* Set to -EPROBE_DEFER to signal unprobed state */

-- 
2.53.0

