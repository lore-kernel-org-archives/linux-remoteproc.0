Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9392C207673;
	Thu, 27 Mar 2025 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064233; cv=none; b=gqF8bpY0uEKNehwzABe6x7iPtyXd9GYNwsjiWtk+zqSdSZWwbVEZWxugDHbT8RdwmTFWC6jTexrSGiqEgdqVDFzJVwdLsWlkuUuW/tX9f5MrxKA8kGY9wb1q8sz/hSXSEDe5DGXvgFP9ovyvN7RyeTBd4rE1xoTWthh5eP17BcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064233; c=relaxed/simple;
	bh=7aRxn016cduRYWqcqszkwFib9wwX66b4Cxm4UsEQB1g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r0KF7d7mAALPFHgIVNSPsZZLSLXHOXXraI+VWMiY1FirnOqjj9OrMPkir8KRtQ+XlpZ97zvMUcfHPDAUuBlvCAYp+X5IsWx3Be3AYewuCPYt+M9Z73sNSd+Wj5SuK2+TVYAbKxO8qqjybv/aulrCpj/+xc4qmAUA48QHIAykyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=2RpZwxSO; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="2RpZwxSO"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R89RxZ028645;
	Thu, 27 Mar 2025 09:30:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4spI71XBW9TktNPtgUKlhmqprWhHOZmJMEc8QqOQvcI=; b=2RpZwxSO5XM74kUR
	Xd7QhwnrX0ayzf9nUUJP8QHePjZSkMTl+SZTM3AQCk4kji6BvhVuo5Iuickozzlp
	dMKeUW0lf/fAL7nyg2nIrhmfcWF11Zrj1o+z5cu2JCkhYCY3xB6qZNHOz6xie9nJ
	TsS2rZ5qhWEYNzn8wnhONGr8dNeQt/Ya9QJK9cXHw5TSlo9W2JcMcDIVaWDzo57u
	l+FN3waH2aV3VvdJ2DDqOrmoWUrp91x9SamMgIRohF7owMqjZKNUjjgtT6bVNQUg
	5HZPO6veSDHT4KyBIHQv5IS1UWfqE0tRuohu7pZfdUcuWnt+qSWfy+WDwSm07CbF
	oQTMbQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45hkgrtt26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:30:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 14E3F400B7;
	Thu, 27 Mar 2025 09:28:59 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 55E368329E1;
	Thu, 27 Mar 2025 09:27:34 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:34 +0100
Received: from localhost (10.252.3.68) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:33 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 2/2] drivers: remoteproc: stm32_rproc: Allow to specify firmware default name
Date: Thu, 27 Mar 2025 09:27:21 +0100
Message-ID: <20250327082721.641278-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
References: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01

Enhance the stm32_rproc driver to allow enabling the configuration of the
firmware name based on the 'firmware-name' property in the device tree,
offering flexibility compared to using the remote proc device node
name.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index b02b36a3f515..431648607d53 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -835,6 +835,7 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_rproc *ddata;
 	struct device_node *np = dev->of_node;
+	const char *fw_name;
 	struct rproc *rproc;
 	unsigned int state;
 	int ret;
@@ -843,7 +844,12 @@ static int stm32_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*ddata));
+	/* Look for an optional firmware name */
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
+	rproc = devm_rproc_alloc(dev, np->name, &st_rproc_ops, fw_name, sizeof(*ddata));
 	if (!rproc)
 		return -ENOMEM;
 
-- 
2.25.1

