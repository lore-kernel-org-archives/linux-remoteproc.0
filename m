Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673262;
	b=tCf67RrpKsKQzYOkcWiqcxGxR+HTyOx8B8dpnNawBk2dLbFU+OBQEKlrQr0UF7rnTCTT
	 JQTkndydvpbBIB/31a64iwqRxW6lmqhli/KbgEa4D+cCaQ1qe3WPMFwxxwODrjvoeBKB0
	 +4900t8tHiB35EHeosRpjFeo1xmUHNIAqa94xU417jzxJ/5inIQ8CZ009cYzegn0uPiOu
	 vAw8Ca7L1232Qgbzf8WBh4RLMKZ19PE5e5up9MOsT8PJLgQkLZDn41Zgq2/zyqN+7BTsm
	 l92PO70+vfXd84ZHIbnBQnz7RXvZ4pgTfdEXn6vlG4Uu1Nd6vB5i5irvriSmdJAaRAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ47YPzPmrE=;
	b=2my6J8Jytzahtw69MW5X8yX9CzMrA/hs/lwXxj4RZcz9PH7Z39OONKQCAUs9zNVRAUrE
	 hFPj/n6PzoGZqdHFi9U3sjl2vDFothRT80gb1v4q/1Cr3lQGPImGV4OilJQ1LAZFQOvir
	 RdyeaNRUc2wettZ4NlKhyzOiwNeXNqAIfkGQj5hR0i6oclmnCqvIrvSfcwCyBhEVGuqYX
	 8bzDNR5qp4UkAM6w/7/8rmkqMF1D3pe/Pce6EM3CVaI5YxRskcjpcBtqDHkvGucbrXKkc
	 xoifIGXRuqYjmpRbX+Vo7MPkY0g9aBRQSv4CWWuRfBwDSl1OnhyzL5+iPEbxNRtI13Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxpGIW1f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHSVLl8p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A85606A31E
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 06:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A85606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZxpGIW1f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHSVLl8p
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36dWh2176269
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 06:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ4
	7YPzPmrE=; b=ZxpGIW1f3wRwAsuS8fdnLkKWkmN1KsMQofzVlZLEtuGlYgO3/tw
	1BFRC0+Y9ODurL24LrqwIipXPPLbwXpJVBSmR+MmxWzKPYbGJ6QbF1TihBeYm21+
	O6ppnajcLDdMZuEXKVOMye3UjZULbCVkciC1yd6cpY9uIsjxdsX54Pz5Qh7NXUVD
	wyTg1Hle8WPVUNo1kPddkHocZEc9JoYDe3arNEsFjBQV93q48UX0FFdu1PSomkzs
	lrc4k1QicQLg0r/kCSj6SYYRXHmXEoBjfQP2XlP6/37Igr6k8FLRGjh+Li2SrvWc
	LAAKbKuJMh+vdqXj1qBk9B8sf04RVgByghg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhv7tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 06:07:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so2522222eec.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 22:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795673253; x=1796278053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ47YPzPmrE=;
        b=gHSVLl8pvHI9DIp0uzH/qZjVYZ6410FuWHBYAX/zuQcraHr/s0IniNDZeGR6P+TbCX
         MOmH5jlDyNmKEtW0CxZW5/GaryW/4rwH7S0jb2gI/nDNgfwR+6jy8CXXzw11sgllDYHy
         96MnJ8qFnDvmIc9L1s2IkXVcGycCQt7DzubTQxPQT6eaMvJdSGL+uJO1nLYwhKPKhR5B
         cEUZ6QjvRId27qCserLzTPUc07KMbX7hpg46o0X3Gh8magrkq4a2dBZv61f6nctx4Rau
         CRLSPCMEGXE0AN2/0yQgXFkOF7covQib9dXaprc5X10ecv9JLkWL9lwOlnuYtMYcBkWo
         TG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673253; x=1796278053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wt1UcVx9IjJ8YEc0AnKHGmTetQKxa5XfiJ47YPzPmrE=;
        b=pIHXdjG3zO6we086VEG1OlrPwm8M73w9lVFqjENkRokRrFhrFO5z8rYFVJmdQOa2VX
         v2cSoEmpJczGIlGigo5IeR14/amNq/JvZy66YPPh+MMo4QfdGpj+DpyXPSUBc9Wcp9bU
         oohAaQ+WaYBXzmQ5hw6mH0MPjUOrBUhUJXmwZaxWc0IyNvacuHmwJZmGd2RUiY7QQ4xn
         W9MxYw9g+NZS6qpgu4j542Wdz58YqVIKay6a5F5IqgapfVnszHk0iNyqbYb3LXGRlgYU
         1cImt8rKWAmK16WwvdAaRGR/RBJ5fbCVNkvwL6t/OSOJiSUlgeO3kmkOct+dZl8ZBj9S
         0lxw==
X-Forwarded-Encrypted: i=1; AL+hErG6JpJFECozWFy3Rjc+ffW2kiOdQArBDXUhe9wupcvM4sNsjn8iT2YPyIU+NfFsBd7y0vVP+PmMGjOaZH0bsB5y@vger.kernel.org
X-Gm-Message-State: APuU4Z/BprWbF9tYsvh3Ze3UMHkaA0VflzYIrP4CJPJDwycXSGLU5bQr
	oMN9xPjOhVsrzYEELjPU0KIT0ED/HIrl0P7xwzJzE1L23ZiHeRYDWzWG0tw6FgLPpJDbgFdrSPC
	0CgOocyALXNpjPDwi2PGakzP6mpqO2C01Ho5Fop6j92a/JPkCIO75UqhqcQkWP4o71su7HAVF
X-Gm-Gg: AZFdTZcOqLSzLnKydoaoQ+C1mcq3o3+TOZ3BfaCXJoOMk0tqZvbOxcA5SZoUQqd6RDe
	CkJtMGEK2LUk4N7fotWMjYsnw/a/SMeHLeMWWCQy+Gb56rQQJtwNq2M44snjWWKPw8DwerANhZq
	uHkZGuaI9wtlCCA+ixXfEBUpUDM8kM3vx4Y2Hli+FZRsRlHhY6fIa2nJSmnXtGNQlaGlnT8JSqs
	aAHAt6Y7eWRcGaZEJHSOZW8Ku36yHmO2JnTV8FmVCo/8ZhmZRRsMXn9w9ydUWiCDII04gnzkxdk
	R4Ic1YZO8qUHeGj176vxXgpZkdP7F4e/iE+vA3YcYC0p32ohyJJpRHWBOCTx1OIgwaauSr/gWjJ
	4ITdGk9vpur1XBYkdw4FTaVEc/ITMQKQvvvDkPoNLxfxm2hGD2F8owSocSSVS8Y4VBpTnNtZGfH
	CvON9Y0zoLiWSB5BLbfA42jLgCxnI/oifRvnXFSw==
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr11418437eec.40.1795673252913;
        Wed, 25 Nov 2026 22:07:32 -0800 (PST)
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr11418418eec.40.1795673252407;
        Wed, 25 Nov 2026 22:07:32 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm66099113eec.21.2026.11.25.22.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:07:32 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom: sysmon: Skip shutdown-ack state check if there is no IRQ
Date: Wed, 25 Nov 2026 22:07:28 -0800
Message-Id: <20261126060728.784236-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07cca5 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5-Z4-tGBdPLDt7CazJkA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Qdyx63rB-tfX9ky7E9HgpqP4llOHf8DQ
X-Proofpoint-ORIG-GUID: Qdyx63rB-tfX9ky7E9HgpqP4llOHf8DQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfX20mFIuiT5gaw
 PidC1gB0xndhSPjxDRro8KuULaFFDPpTAzJXitt2Ep678IXzjfJ4e8CwODHFqNSAohphgiXdKRL
 3Nf2GBekGcrdoA4+9CIzlLiP4zLgWJg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMyBTYWx0ZWRfX17tm3rVufWiA
 3NVXWUb/YBaOyICzdHYmqtInAT9ApW3bO4TiED7kCmEpFcpZf5kKVlaOjri2u87hIroyKomoVx8
 V3WBaMWZYur/O8ID1avTJTAFPUaQ5JFdEjwsT7keRPYjC9+Kc7Lre7vJtWpw8PYZFVlWJ+xAA0X
 zeKxJ63BhXFVGwMYxhOmmKqeXOTH62bKiGvEomEhMK95E2sZ0w8Y3ht7028yOvXNVdz+0NONLHG
 L6az5rVbvIea3U3GV6X00jWTA7UKha/rEepoM6HUYupuDcj8sV1a8DJrhqw9PbRCq8vI89PdHDL
 su4Xhdsqptd/xOwIsw3azCErTEM6lDlmoxE+Wei6v+9bgbPlLw7g/+by6ziRpHyrHXOYnJKQxZN
 F5nVQ576+94IGhdBmne1km4Wzw+H4w9LchK/m426xbS580X6ccE5rG3c9pRAV8RnI0CLAI8kgSS
 YGnC2e8CTMLL526KbkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260023

Not every subsystem has a shutdown-ack interrupt. The SoCCP on Glymur,
for example, only has wdog, fatal, ready, handover, stop-ack and pong.
In that case sysmon->shutdown_irq keeps the negative -ENODATA returned
by of_irq_get_byname().

When the subsystem is attached late, qcom_sysmon_shutdown_irq_state() is
called with that value, irq_get_irqchip_state() fails with -EINVAL, and
the driver prints a warning at every boot:

  qcom_q6v5_pas d00000.remoteproc: failed to get shutdown_state: -22

Return false early when there is no shutdown-ack interrupt, since there
is no state to read.

Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 61e1038328e8..1e6d6608bce3 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -739,7 +739,7 @@ bool qcom_sysmon_shutdown_irq_state(struct qcom_sysmon *sysmon)
 	bool shutdown_state;
 	int ret;
 
-	if (!sysmon)
+	if (!sysmon || sysmon->shutdown_irq < 0)
 		return false;
 
 	ret = irq_get_irqchip_state(sysmon->shutdown_irq,
-- 
2.34.1

