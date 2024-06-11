Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981D172BAD;
	Tue, 11 Jun 2024 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091627; cv=none; b=nAIYhttfYG+tJbGKiA3EuFVk3o5QlxJ5LjWH6kINMiIcdCOCdw+XXzXXyk6+4N9Huqt8tB8KW6baEm3rd7LFDgfGuxRvlgERDq4gBTz9Wiim3Uv6lEi8n2htRMCCH4huc12w/p3vxEQVH7cNzqIiu6qg85oIX/w14rdXXJ5Zrkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091627; c=relaxed/simple;
	bh=qzje3sYU1WIKZiIPjc4DmoKB6qgaXBjYoxgEvqjOXWQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oRaR44uKhH/l/la6kuVCQrojZGNuKCM9y2EwRu5jkDTEiYPuiznq/++U5BTN8POvlV8sWo0SzM07eLhwCfp68QqlsdBiZPuYjruTQE7WAXdF6ZxE3bKQV76B29WEXPQCXKmlooTXCMGtWLuckwBXZ1dDPaKLPrfN/rgc8R2JKRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ktY96qGx; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ktY96qGx"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7XuOI012243;
	Tue, 11 Jun 2024 09:39:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=/hlZYM3ZTO4WkdaB5sfY6D
	eqBGgAr0GqV3xBZuxJ8Zs=; b=ktY96qGxRB+tok22dAlKsu8H/Azpkn3LJDtKzP
	STHOm2BKKxyJp3EiP6HzUjwhebwdcrIuQi7vLr5B1JZLlho3s752QRNuwvrBsigl
	kkhvoTaW9Co6P3wBTnA+eEf+nwZ119MpVnWlwkUf7jLetLPfFsqHwjFutxGK1yh8
	m4eSR3sdj2yqDDruCBCVGe8DtHGeZRaAzqW00qOdfWx525u+LdcY8FQWU1kpv/4a
	mRqTu6IdcPCI6IIxqD4e4mXk1Mq1LeqgWvLwY43lfkBKQ8+GEy8M/off9SF2YReU
	Xc7ZuSOlLix8nBhw58I1PHqG+JcaUAkLmYnONgr3mlI9E/Ew==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp3sfb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 09:39:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 181D640052;
	Tue, 11 Jun 2024 09:39:41 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2207620FA2A;
	Tue, 11 Jun 2024 09:39:09 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 09:39:08 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 09:39:08 +0200
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
Subject: [PATCH v7 0/5] Introduction of a remoteproc tee to load signed firmware
Date: Tue, 11 Jun 2024 09:38:59 +0200
Message-ID: <20240611073904.475019-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_03,2024-06-11_01,2024-05-17_01

Main updates from version V6:
------------------------------------------

- Fix kernel robot build report on in tee_rproc_find_loaded_rsc_table() inline
  default definition.

Main updates from version V5[1][2]:
------------------------------------------

1) Rework resource table management
  - Rework tee_rproc_parse_fw to temporary map the resource table address
    to create a cached_table (similar to what is done in
    rproc_elf_load_rsc_table()).
  - Rename tee_rproc_get_loaded_rsc_table to tee_rproc_find_loaded_rsc_table
  - Introduce rproc_pa_to_va() allowing to translate the resource table
    physical address to virtual address based on remoteproc carveouts.

2) Merge the 2 "st,stm32-rproc.yaml" bindings patch in one
   As the st,rproc-id" is linked to the introduction of the
   "st,stm32mp1-m4-tee" compatible, merge following patches to address
   Krzysztof concern.
   - [PATCH v5 2/7] dt-bindings: remoteproc: Add compatibility for TEE support
   - [PATCH v5 3/7] dt-bindings: remoteproc: Add processor identifier property

More details on updates are listed in commits messages.

[1] https://lore.kernel.org/lkml/Zlil4YSjHxb0FRgf@p14s/T/
[2] https://lore.kernel.org/lkml/20240521122458.3517054-1-arnaud.pouliquen@foss.st.com/

base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0

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

No sysfs impact.the user only needs to provide the signed firmware image
instead of the ELF image.


For more information about the implementation, a presentation is available here
(note that the format of the signed image has evolved between the presentation
and the integration in OP-TEE).

https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds

Arnaud Pouliquen (5):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 ++-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  74 ++-
 drivers/remoteproc/stm32_rproc.c              | 147 ++++--
 drivers/remoteproc/tee_remoteproc.c           | 451 ++++++++++++++++++
 include/linux/remoteproc.h                    |   7 +
 include/linux/tee_remoteproc.h                | 100 ++++
 8 files changed, 802 insertions(+), 46 deletions(-)
 create mode 100644 drivers/remoteproc/tee_remoteproc.c
 create mode 100644 include/linux/tee_remoteproc.h


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.25.1

