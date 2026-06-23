Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2725393E
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205547; cv=none; b=ZVcZ4v/EWevQ26fYplLC+p/E+rlsUnAfj5JFqwlUmzL8WeKv8czRh7kZm7P+SDgLxgcDMgD6UYXL/a0qev2cNzYohcxjpLWem/eDWm3gQysq7A40FXtI6voWE+gUM0Gucrzx2nsuK5wZsITxzTb8NrkDsa9nRZ9h0h88h0x4xKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205547; c=relaxed/simple;
	bh=m09dXU35z7l8Q30pWTfNs5F2aijM7BoLIXy56DEBktA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umR8Qc3OqdEBHrmy/fGDtRuujWAb4u4bCK+KYo5rWH+YmAIKBFJCB+1Nm9K/F9IPpKqenAZ/4jF1sZfFFIW/5TxSZiOrxLJoAYpma8Zd++OVdOFTVLB5KQ6KqMNsYBmlE9Rulm9TaTgxmHzltlhqb963DsEAd4RK4p06c4C/lQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVxade75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9nbL+wx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVxade75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9nbL+wx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N7j9471778180
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpeXTeEkRe5huhO1+goJRDTdUJiTgwAWTB5ITNNsno4=; b=fVxade75hiR0GXV1
	bk77SEDIM/P3qydsmRDsrzXHmOJNpA4IKOpkgLqxKpJFf6Anz9IujNP2s7ZFUErH
	Qpf5/JSfzMK/YgNP0adlZaXnZECoGKzk9JgLQUBe2gbISLZ+SnH99OV2fHJKLCnp
	zwGXsdFDKvASjf70qsXe6Ijod5mynbf90aF3pr/aB/9mls9+Yca0NTYcj08onky2
	hcKFoIGveN6Olf7fxKMM4yLMZFGL5yB3M3mZZT6wLbWR6/322Rhwk3VL+HLqa2TZ
	fShCPcTCjlYn1aZf5GgCNkg+ogxuDenK+lFFTKexxyIx5iKmRO4gsYw8nyvRtwyw
	7TBU4Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp1gr9xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 09:05:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bf794ce48so792362eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jun 2026 02:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782205545; x=1782810345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpeXTeEkRe5huhO1+goJRDTdUJiTgwAWTB5ITNNsno4=;
        b=P9nbL+wxjMIPPXwNWqzzxia7Z3iqOpYLt+NCvOt1ZLBSWCypIySZ6syHhexww9qJxr
         yE2BYpBd2gLpSsLsZEocn7Fu+WulyRMDcTz9Der0HQcLOKyGKaWclp86cu6JsjaI3fuk
         UjH796hbyV7/4/lkktOCTdxlnIyvoZU/m9s63hkLMoUnGNYJEmgk8nvNhQBpml2jscZY
         /DABri+JHJas0E1GniaMs69serkj/S8Xsr0tP8Km4LB0lU4wsdxImmp55EqQktL06NxE
         wC9CUrSsSChq0XCOT5OWloM6oGW8qCjFJc4CG1GxqonaOnNlwsq1ym628z2MDZpvW65A
         jHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205545; x=1782810345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zpeXTeEkRe5huhO1+goJRDTdUJiTgwAWTB5ITNNsno4=;
        b=K/ZH+v/Esi232NtjqBNRu0a+BD6ZaiuYbrdPQA0PuN6NTNWmcydrav873BMO3ZQNLQ
         rG9Gh0qJ3jlektRzatj/MMW+GNJkW1cjjWmWlAap64sZ9KvKqOz7wSsJBgsQ+n1g1MrQ
         ovDYGxGkX0Flaq4uRzuxYBehTT045ypBq1MBgUDKjxoRACcxvB4cg9KWBq2RB2nFKkZf
         gWZmqf5DRlhNKstyKNVzxmSnKKbkAsVKIPRL/VtozvqO/e+4Gy6HFnv46Iyq9uX/Cf5g
         SvJvlszuZYqGbTqhXKUbsPn2WZjLwjWGTshqsNqjMwWgaEJisSxLpFja0+LFc/DAa6I/
         HXWg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6a/KPRRyO/s0Qwcu9E5DDFNn7kOMqEkM6cOlyDsSoBcFAue/dK1AOxfU0VVaUaW76TdMaCzwLUO0JeGXVm2+v@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0S5s6IC7yECiSwQO8hY7+L+WheqkJ6SYYKoRNNO+Ion2WtK9q
	NoSZPqix21fPi8Mm93vDhcYyg0FnwSLajJPqyCrmj8gKONd1aEfUu7T2i8tt2/yLRWAP03U07fq
	51QAw+Y5LFgCNsFJ77+dQcqjQEmmCoI6B+092C/RH5Ca4QxEODwUvvfPeZeBUntWuRfTd+bzS70
	EL0v6aJTSPfA==
X-Gm-Gg: AfdE7cnaaenzVEOP8WYw2C311UP48zG/xpaNQGDFkRldL8unmw+CDx3Jay+ub9W3DAs
	J8PgYRbV8ZrdBMPM3xqFcNPm8MFUETa81fy1IwunlgDeHcrX2/U9aPRDPQAF9mMqWiAn3780kF9
	RxNqu/NJiWJqxyDAg6jeTinySjvbkeASVRBVuS9c/zmClykuObeLZCrzGOiTSZWB9rASMRjCIS6
	jB0FSb/o0ZJUrkkstc67DZQfAQzxXtO9nDXviZp3OSJg857vr8VHgZHZtCSfz5Rh3WqBSFoZRHu
	QwjROgzgpWaJqAmnmKhQsgTH9yjhEqMuKjJBIzBeBcdxroIS95W9OebREGNM2cq/miSNpK/IFBb
	2rAQEa8MNYrmsCCRthMDh5rclIFJo6icIneBIsk1WolWvAAndtzqdw7mZIZib2w==
X-Received: by 2002:a05:7301:1e97:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30c5556e1f5mr2053910eec.10.1782205544439;
        Tue, 23 Jun 2026 02:05:44 -0700 (PDT)
X-Received: by 2002:a05:7301:1e97:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30c5556e1f5mr2053882eec.10.1782205543687;
        Tue, 23 Jun 2026 02:05:43 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be5c5desm15202122eec.28.2026.06.23.02.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:05:43 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 02:05:35 -0700
Subject: [PATCH v3 2/3] remoteproc: qcom: Check subdev start status in
 rproc_stop()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-rproc-attach-issue-v3-2-8e24310707ce@oss.qualcomm.com>
References: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
In-Reply-To: <20260623-rproc-attach-issue-v3-0-8e24310707ce@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782205541; l=2980;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=m09dXU35z7l8Q30pWTfNs5F2aijM7BoLIXy56DEBktA=;
 b=ZZsNTADeoRXcbMtKok1Uytri8ib25eeVeUviV9OL+agDGgTV3qj3a91MHWi/esClhutiGbe+w
 LLleEV5OnzKCACDvIxZJCalrcd+CHeKUQ7vNXYARTUOCj2RjZQfGryn
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: 3hwvqD2eT-vfhXgcASyRUpmseDrZ2osN
X-Proofpoint-GUID: 3hwvqD2eT-vfhXgcASyRUpmseDrZ2osN
X-Authority-Analysis: v=2.4 cv=QJhYgALL c=1 sm=1 tr=0 ts=6a3a4c69 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9H_D3iXqDRE50K2jjPsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfXxqDmD+6P2PNY
 gZPhzg941ur6pg0eEevS/6w1D/YyjgBaZNpltki1Eqc2b5BvbamzqXE0bf7PL0T5clSd6jM8QxE
 H/HBZb38X18dpCHDxt2jFf83dNyjMfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MiBTYWx0ZWRfX95xvuUJyKD9n
 aChoJs0grtl+NOrWBXYfm08x9WhPn17L1N6MCyfiigWlBsTu9idqbgEtz56akws3g4JMESxBXbB
 7Qd+Bbe02HfarTK+EzbQxaH31t9nXzW0fWt/Oszi8j9XjvQwZpZSJ7VgQJp6gNTuQdPpTvHuuDX
 aReeYOy16kEwANPk61ZJX9kSJurYUICPa1D+dZcNwQlLByMSfYL2CwiJoI4CJVUBtOy22Cjjpze
 c+Ame4F1Leuz2h0kpwE8+486fatIhMpuvRylwH4w21lgS3yZwQLV+P76EnB/8ASBXofotg99F0t
 jPioh9N9ytKqlRfb85/8XvQBQaKOn4f4EtCOH0AevXmEfQqxTwaCSYTRN6Ia4MJOMiJkbOn8txz
 0jOi5U3DxnvaxS0GW/ikaSPMqEsD+JWYstcXbRsk5YnxzS0ZBfOeytEljcsJKxEfGCEYNV+9lkQ
 jcAyHytmcfcJo6fv1nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230072

For rproc that doing attach, rproc_start_subdevices() is called only when
attach successfully. If rproc_report_crash() is called in the attach
function, rproc_boot_recovery()->rproc_stop()->rproc_stop_subdevices()->
glink_subdev_stop() could be called and cause NULL pointer dereference:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
 Mem abort info:
 ...
 pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
 lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
 ...
 Call trace:
  qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
  glink_subdev_stop+0x1c/0x30 [qcom_common]
  rproc_stop+0x58/0x17c
  rproc_trigger_recovery+0xb0/0x150
  rproc_crash_handler_work+0xa4/0xc4
  process_scheduled_works+0x18c/0x2d8
  worker_thread+0x144/0x280
  kthread+0x124/0x138
  ret_from_fork+0x10/0x20
 Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
 ---[ end trace 0000000000000000 ]---

Introduce "subdevs_started" flag to indicate rproc_start_subdevices() has
been called successfully. Ensure subdevices are only stopped if they have
been started.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 7 +++++++
 include/linux/remoteproc.h           | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 50f754e27d1a..71a7be7c1e9f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1099,6 +1099,8 @@ static int rproc_start_subdevices(struct rproc *rproc)
 		}
 	}
 
+	rproc->subdevs_started = true;
+
 	return 0;
 
 unroll_registration:
@@ -1114,10 +1116,15 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
 
+	if (!rproc->subdevs_started)
+		return;
+
 	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
 		if (subdev->stop)
 			subdev->stop(subdev, crashed);
 	}
+
+	rproc->subdevs_started = false;
 }
 
 static void rproc_unprepare_subdevices(struct rproc *rproc)
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f1d14d075bf3..17ed75a11e15 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -272,6 +272,7 @@ enum rproc_features {
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
  * @sysfs_read_only: flag to make remoteproc sysfs files read only
+ * @subdevs_started: flag to indicate if subdevs have started
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @elf_class: firmware ELF class
@@ -314,6 +315,7 @@ struct rproc {
 	bool has_iommu;
 	bool auto_boot;
 	bool sysfs_read_only;
+	bool subdevs_started;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;

-- 
2.34.1

