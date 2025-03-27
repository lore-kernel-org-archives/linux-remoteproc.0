Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734EA20764B;
	Thu, 27 Mar 2025 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064232; cv=none; b=l+Vsdhxcf/ZorfaBi5loEqDjVRPvmXVdzHDhT1ImlUcJB59pvindPa6AyqI2OEy7CS6KSvkVFhGwPJJ2k0XlCqcpM3dj03+kYzu2zwLOIr/J8zCRFhmGV9C0NxlfZxpc8G0RzHpTrxn3CCs3EgVHN/ZAgblUS6+SjTt+Bg+oOVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064232; c=relaxed/simple;
	bh=KiHi053QWRNWU2KsjEHYFN94kS2d/rNecMtACLhRtck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FFVvxvimKR5yqLWMA32YkApr910RK0FoQWIS2gzH4rNSxyi2jbNtVqWXAhHmV8Sx5Sb9JQvaPFn478F0gY6l6n725iVLf5SN45kUZt/y+BfoJ0dL1skyo+fTQPfCPfOk27Q0lCzHGynP9sM8y8VaxW0N4xMEZa1OQu6E1aevfXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=h33hU/l4; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="h33hU/l4"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5oYpX010674;
	Thu, 27 Mar 2025 09:30:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=RwQA9b/mWaVp+3r4CodO9C
	jopcR6rVnhFumfJnY0gE0=; b=h33hU/l4STScdpRVI9zvhixwzWwfXEZJVEOENO
	smat1YitnZ6UnS2mtrUyF5nL5sVArlpOIrWzRcZHSZksDK2dj8w4Mi5/U8ES9Mt3
	qcQnIoFj6fj3oktYTwC92EKiPvft/BpMeiNtztYd1xcUIOCKnsNOaivtgmfWYdi9
	RG4UrurOwopaOgOdKPPXdeFWfF9kuMQJfCrrRDMVDm7Z2A2aojsg1GV5ZJ/TgCC4
	im0p22kz1d+1YI2YsdKSpekXg1u7sqf/5srwtsAV8eVZzZ6/+YS9brKPSbmY1iZf
	0MR9GH3SCGmyBfVhCirUAKRbBG6A2ixlF22RUzPFLbXoCvEg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45mwrb2c4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 09:30:05 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 012A640096;
	Thu, 27 Mar 2025 09:28:58 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D6A28329EE;
	Thu, 27 Mar 2025 09:27:32 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:32 +0100
Received: from localhost (10.252.3.68) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 09:27:32 +0100
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
Subject: [PATCH v2 0/2] stm32-rproc: Add firmware-name DT property support
Date: Thu, 27 Mar 2025 09:27:19 +0100
Message-ID: <20250327082721.641278-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
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

Add flexibility by supporting the optional "firmware-name" property.

This allows specifying in the device tree the firmware that needs to
be loaded on boot, if the "st,auto-boot" DT property is set.

Arnaud Pouliquen (2):
  dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
  drivers: remoteproc: stm32_rproc: Allow to specify firmware default
    name

 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml    | 4 ++++
 drivers/remoteproc/stm32_rproc.c                          | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.25.1

