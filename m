Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A171420BB5C;
	Fri, 25 Oct 2024 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729890099; cv=none; b=WY0A2FSt0smSqvzCPzvQ4tb0bIc3JIjs74F/Yxv7Q8PMV5genNzzBAXR3EMN24aCY38GLIbOVBolO1Eys9b6tqcln2sowqAnbil8vcrbysnxSFh3fNFaWB6DAd1jevwBMyMGUzs6NZkCThp5N4f9mKFY2o8n/UaRq25avr+sziE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729890099; c=relaxed/simple;
	bh=jfENoLF1kzMeNh/QtaxCgKr3kKAzBNGY4YsdS4oEHew=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gEuxJpjFv9Fn5952P0uHPBXL+XAotzNVHPxIpFbREF3kjAY5du3EWi+3SJ/g0WAjTkCxSRW3T+A8B34nwyVB5rwidHaB77GqNcIW85hQJ/pSlhnUX6Op79lcxY6gxhHlAIJmUZapp12GSbuguSIMBzVo4qp4rRvQ22NCdheykB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HwFxvG+0; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HwFxvG+0"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PInJh9002936;
	Fri, 25 Oct 2024 23:01:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Rey2MIFbXJYbf7gqd9/z8w
	WxcJ52jSMJCnsq2KEpbKM=; b=HwFxvG+0+WmkBMhtVGNHyeVECBGX8UeMq34LnX
	LFMKCuOS8brOr8the56XTU19CQkHSWO7RTRMx4fbA6Wt5g90Q/9R8dCweBrubQW5
	YudbXJZnq/HFKApL7wk7XmQQtCGpb8VfuTcRfYXhXb/L8CgNWjmqpHMhjEvps5l6
	UIwpwPniY09YARFcaIXGwyZU/2L6Y7GpajVY3dKu3jP/5zSv/a2pMhmmXke7bmBd
	EPFdRH3y5JEtN/bypyUncVKBv0f/pxflDHxLAKXJrZYYxNgY2z5ga5G7612qmlwS
	dAhtzUFPgrM5SHYNyXiqj69G2hsE+1oimxSHRBIQPGaYW3bg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42em4afjru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 23:01:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 713BD4002D;
	Fri, 25 Oct 2024 23:00:02 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C670E23193A;
	Fri, 25 Oct 2024 22:59:31 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 25 Oct
 2024 22:59:31 +0200
Received: from localhost (10.252.3.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 25 Oct
 2024 22:59:30 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v12 0/7] Introduction of a remoteproc tee to load signed firmware
Date: Fri, 25 Oct 2024 22:59:17 +0200
Message-ID: <20241025205924.2087768-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



Main updates from version V11[1]:
- rename structures, functions, and variables from "tee_rproc_xxx" to
  "rproc_tee_xxx",
- update rproc_tee_register to return an error instead of
  "struct rproc_tee *" pointer
  
[1] https://lore.kernel.org/lkml/ZxZ4cBilIlpf3IPw@p14s/T/

Tested-on: 42f7652d3eb5 ("Linux 6.12-rc4")

Description of the feature:
--------------------------
This series proposes the implementation of a remoteproc tee driver to
communicate with a TEE trusted application responsible for authenticating
and loading the remoteproc firmware image in an Arm secure context.

1) Principle:

The remoteproc tee driver provides services to communicate with the OP-TEE
trusted application running on the Trusted Execution Context (TEE).
The trusted application in TEE manages the remote processor lifecycle:

- authenticating and loading firmware images,
- isolating and securing the remote processor memories,
- supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
- managing the start and stop of the firmware by the TEE.

2) Format of the signed image:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57

3) OP-TEE trusted application API:

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h

4) OP-TEE signature script

Refer to:
https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py

Example of usage:
sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem


5) Impact on User space Application

No sysfs impact. The user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (7):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  remoteproc: core: Refactor resource table cleanup into
    rproc_release_fw
  remoteproc: Introduce release_fw optional operation
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  72 ++-
 drivers/remoteproc/remoteproc_tee.c           | 510 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 139 +++--
 include/linux/remoteproc.h                    |   8 +
 include/linux/remoteproc_tee.h                | 106 ++++
 8 files changed, 849 insertions(+), 55 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
-- 
2.25.1

