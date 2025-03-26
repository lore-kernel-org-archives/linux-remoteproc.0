Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921F91A5BA2;
	Wed, 26 Mar 2025 08:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742978602; cv=none; b=ngyIiuNLxUhiQ1rKHCzpNmLSUIpA89Dd2hJY4BQ5CsW2XgulyZiks5WBM10OBb5HvNloFTvBut+DCedVTwPoSM7ASIsls3VyUmQvAeKVlAEuaz+yiCraqwxudmWnxUsb0zb41yc7Dwe5Z5tFt8gEKQIvL7uBeA6gPvaObvbYGWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742978602; c=relaxed/simple;
	bh=ovNgZuY+NbD7763M/eaicHEHxCeaOSZ/OXBWloOm7vM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gias1lcIWmY2EUZ87J/alNjOlC4pa7dBx9pTbhTt6M8HehzS/S+kTn+VLvgbZAdkb5hkfuhNDgVa/qaUeya8lHX/SqqZG19R3mK1ja5CrooqAx2AdKZb96S0gBhaRBe25+IJkphdHx6NfQya6+l+8CHr2uDnvvwa90M7tDYpH48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=J8Dtg6pm; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="J8Dtg6pm"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q8R0E7020083;
	Wed, 26 Mar 2025 09:42:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hAJu0kdEpj3Z9zT+qLxNZn
	npfIMphhCV7QLcQTbwNUM=; b=J8Dtg6pmvhuECRvoHhoHnqlFiH1NWuvQEt+p56
	fwnlYMh7vnreS690X/P4lUsCjB5UtyD5PNaLJyNezb1BoeIP52sLpBlcXQRQuXTG
	64DcznkJqhSUKPAPdzIUlidew4n6HLZxfjYBoTdtrhCg8MaVexfSDD3L8oepicg6
	rTXEJaJD2uIxKk4FrxXQKSKgSxTowKJwbsFbpoJrfxrPfvmRxMfIGk1hSeC4yre6
	kJfIoo5XfdlFC7LzvzwMyPo0PBuIlCj+Uu5rakrGKt1WfZmD4q473sVzGEtBkDJx
	ihbPjK6IlIEu3XfUGJo48/Cg1aOVRPmvsdJv4vOTK2VAqStg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45me348488-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:42:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A145440058;
	Wed, 26 Mar 2025 09:41:50 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4728787F421;
	Wed, 26 Mar 2025 09:40:01 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:01 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 09:40:00 +0100
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
Subject: [PATCH 0/2] stm32-rproc: Add firmware-name DT property support
Date: Wed, 26 Mar 2025 09:39:10 +0100
Message-ID: <20250326083912.12714-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01

Add flexibility by supporting the optional "firmware-name" property.

This allows specifying in the device tree the firmware that needs to
be loaded on boot, if the "st,auto-boot" DT property is set.

Arnaud Pouliquen (2):
  dt-bindings: remoteproc: stm32-rproc: Add firmware-name property
  drivers: remoteproc: stm32_rproc: Allow to specify firmware default
    name

 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml    | 5 +++++
 drivers/remoteproc/stm32_rproc.c                          | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.25.1

