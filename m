Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628AC3C4B63
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Sep 2026 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377641; cv=none; b=si8184VmU29M4e76F4P6wsO2EZ0ZmBGMA9fl+77VgM3cVAV+q8fnrY3PrHBDbB3egZ+s7h/gkXSQNjD3vebFuAGcKEsd8AOYYsHy564z7qiHRB25mk+U9gtdDrLeHrakd3yp6qsQqi0NN0lfrK4yIY7vcZKqGGYB8JMfchRp8eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377641; c=relaxed/simple;
	bh=Crm82oV7JVqGnZOIfCO8NwuU81rufC4hrXnm6cKBWew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKKCH/m5d9v+s8QOBxmcC0Y0+8MIb1AuO9pqdf61KNWTaNWH3P4D1W08l4CbIchmImScWo25AHf1+HaGZPCGODC8tFbWa2UClOijff5uLDJDnz4NIZsomJcLR7n48Lh/NOzy0cQ4PFLtNCZ79vVqHnOwFgoKb9Wg+K4KbFd/5E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX4JQ/1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UN7KhTkF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX4JQ/1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UN7KhTkF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HrgjX2730686
	for <linux-remoteproc@vger.kernel.org>; Wed, 2 Sep 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9YC6YErE41l
	8W35ksQZbtiaD52ARA7MPQK738ggjJaM=; b=OX4JQ/1cNTWEywLeOT9AktduM0d
	Pcj7mQhhCAiB1R60vhTbqpbcZP3xNDeRyBzV8y+VDoIiabCtck7KBOmtq9gb0rmj
	jzPRkPY+IDp2XTnOcQ/9EbSxLcMNg6a53uqOaIm6pVe9/Bu4M604WtzEiO6Mwfnl
	jNlO+QQtoib6crXTgjSzwQMj6YJsZuD89OdoaPnRjeYmuYg4Ga0edOT8d68XQS4J
	1k3fXYW9S6PpiNtiYGmwo8CxPQTOKDrqNd2iX0NKCDrkS/oyzrdOtEGk18k2UvYe
	FQwwJGXpHzwKM+sDFGJT3eYmL1dVU5vYU2hoLV7CnXqSnyzs2uRXFunoICQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2nh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 19:33:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so18630355ad.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Sep 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788377623; x=1788982423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=UN7KhTkFO8gxx7X4z7Sk9yuczWdnWKogoM/3YnYfs/SiQwclzFqOhGA6RjojHYwzrR
         V6Ml3z/uCJU0j0Y2p26tyd8tetKBP+tB7z0uncDutzrKJoaPnfFM/IWmhAaG/oJ52tEQ
         s+qLBlvN5vB+1xyEcGGFQbqQglw9rsYw+4FpJNCxCcb+w6IQgdXmdx2o/JdJrk6hbDYF
         SsXbjaKJMjeftcJh1KrNFWelCPvd0eLPZUCC+nqY0QFsqzHTXVbDsKM8+Gte8ZI86WNJ
         bjDxOp9BAOEIeTBLjQ1LejOqoHAUFCVy1XSh1BUgXQl8fZ085huI8mdwl+HwaLL91ylW
         CbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377623; x=1788982423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9YC6YErE41l8W35ksQZbtiaD52ARA7MPQK738ggjJaM=;
        b=SC5AMbIDWmtUdweWTka4THPyn63W0SPQHehnC45MiKDahGi1DHvo1R7/xaBhf/NHnQ
         ITOvObNvgGVdSo/R/lwLNjwoRySau1zT50WjJxsEoVGctq5wE/86uyhQSEeyyyHxezXO
         aIGG7OwhfVglaI2MsKKCyV6+a1OS7f+4htvlTTY9ksnPHQHxSqpdabt/h90we7uV/grP
         FcC1qunaRqXZYGMIW5sr6E+308O05RIQnU57QMlTYiVzQ+ebsIcmOtS9LE3jWvr/LBrb
         0Xw+5WZP+JPTQlg1frBxKJXa9gnFka5KkV6pXkedJV8U4cD/Jp9KeJuRtzmJ8WddP8n0
         JpBQ==
X-Gm-Message-State: AFuF++m8v7fdJ7M4GkcwXqi/EwaeVLYm0QWR+1v8ziJardj/SW80b2bC
	WU6t44X/Wcqegw2rZaUDgDbIU/VqGaQ1tQuBEYIr+ORwVubLOW5qZfnz1o9XQ4Ca3ZztsGPVEea
	6iiVDVlAGt5UcgiWKvcgOE3nKTtlavv9iPaTRDOFqe965Tl118XPrwADG12Lan1o800jRJ52s
X-Gm-Gg: AYBFou1gF/tULqcE372ur2cCntz58ne+hRh8HQQq4Q2WZL8SuuRdIlO56vzA7Tv/Uqm
	8GqUw4Hw18fwa97m0aD8XKkNoC6e5yLYIHo0NeOb2ZJmCatCzM++bkp1seUr0RrtrThOMSKh1Sv
	BIIjPrcoagQ/ffr32xtoYXCbKH3tBYXZi/Yv9GOru5NRpto3YdH5NhQhu4+bu7+7SnORfWIKg5t
	RXw/wb5MHa5cpjW9G69euTz8WGearitqv30nsjhslRGkyG8n3s6mOs4Jqe33JBmWwjO9W/GHrAw
	uuaHqZG/C0SA6jrLAI768rgsqf3TZkaKbhkg0BGLUPu6d5EIlEcl2JQmovLPzo4pksZJ2V7ifhU
	GfRqDrPkAi1/DNWtOjKyEjRHvjbc=
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566805ad.5.1788377622607;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:a17:902:d4ce:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2daec60cb14mr93566355ad.5.1788377622059;
        Wed, 02 Sep 2026 12:33:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-332501e5447sm518103eec.0.2026.09.02.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:33:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/5] remoteproc: omap: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:03:16 +0530
Message-ID: <20260902193318.1996827-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902193318.1996827-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a987a17 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=NeIE-sOIGFWZl2hhsKQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CXaAg5PFHjC-2SND-GCjIWrYrBokXKGK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX7jGfJiZWBf2/
 8mqwxEJyoKYaUsi9hzu2UFgi+5dXVFRurMIltPDKsMG24pcpYdl8cLFTI1p9UyJ/Waq/9OJjPM8
 lWbpUFkt/jvG48nDvqWJiw4F4wHZOJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MyBTYWx0ZWRfX+sZmzOHa+pe0
 JrrLIOq0zSHEGOYkXknJ7wpgEmViQ4ZZB9AmrigppXYCOzF5jh35j/bppmmR2QYokxhHFtBw10f
 QzqM1BCZU/BYHpOHaWk2uuY+dZeuwLIuvR7Vtg4IeMMP+EF5FKNLLTwcZuhX7Bs+6Zo9C4fmxEy
 mEy95NB7LJfl1bFGXHepn5KlIiYn69PfVdOYSvOHXOIjo7yH4r35jM0R/Jj09NJ/Ip4i7qJbxIL
 WEkc/0Cmrd6b2b1xnlDI2Y7Ki6eROKQ2U0ybD7YZyugfKHYk4toY/X6TgD04LG+RPMG8KYDs2IX
 YH9X/vXhS9OqIjoJWq8IGoeTd3eBG3u95P1/wmIFO87bMyRH3iblg1BMWxUlcrBa4mORjjitAFB
 iB13C8cLEOGGvcG8VPerqph0oE8Dm7S0m0TVr1ljqWOsRYWQBclWs5bcd6vVNoXmAHyOgsSXLZu
 +RC/F/UPiNLZi9LmbpQ==
X-Proofpoint-ORIG-GUID: CXaAg5PFHjC-2SND-GCjIWrYrBokXKGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020173

Replace the hand-rolled omap_rproc_mem_release() devres action with
devm_of_reserved_mem_device_init(), which handles the cleanup
automatically. This removes both the wrapper function and the
devm_add_action_or_reset() call.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/omap_remoteproc.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6ed0f28edac9..74262f873d40 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -1276,13 +1276,6 @@ static int omap_rproc_of_get_timers(struct platform_device *pdev,
 	return 0;
 }
 
-static void omap_rproc_mem_release(void *data)
-{
-	struct device *dev = data;
-
-	of_reserved_mem_device_release(dev);
-}
-
 static int omap_rproc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1359,15 +1352,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (IS_ERR(oproc->fck))
 		return PTR_ERR(oproc->fck);
 
-	ret = of_reserved_mem_device_init(&pdev->dev);
-	if (ret) {
+	if (devm_of_reserved_mem_device_init(&pdev->dev)) {
 		dev_warn(&pdev->dev, "device does not have specific CMA pool.\n");
 		dev_warn(&pdev->dev, "Typically this should be provided,\n");
 		dev_warn(&pdev->dev, "only omit if you know what you are doing.\n");
 	}
-	ret = devm_add_action_or_reset(&pdev->dev, omap_rproc_mem_release, &pdev->dev);
-	if (ret)
-		return ret;
 
 	platform_set_drvdata(pdev, rproc);
 
-- 
2.55.0

