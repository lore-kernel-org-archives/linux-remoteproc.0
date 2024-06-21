Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417D2135A;
	Fri, 21 Jun 2024 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718980770; cv=none; b=qLjP8yLLiaEkMpLlD3EXDGRrUPQGTmdZbYdwxey4yT1BEGtoGz8eBZ7j08VCLxdh18mqrLuVIYHuCUzBZKPklGRdHY/3gHzRGyg1pJFucfO4/r+plLx/dOn7YDPLbl+4GnltMkdnDkH6QIevs14aaXjHHYc8cvJWQCARFdCDP4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718980770; c=relaxed/simple;
	bh=Kh/d55W7oSKLsTkCG6JWquY6oHwnzPyB5mrTl22X1J0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OJ+GpF1IaW2rb+BWLZdnjMlb9oA4GjY8L0f9r4sS9bj1p7BlPCV004/OOXLIV8xdxLx1grK/m6nx/aqDvHgQlGJ9nI+mxEZs8q/M/RsJVzC2R5AEMhPW88L4qPBsAUn0nadRnR2t6UH7WJlf+R3aeziypN/47x1k9wnBFyECO34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=vUSDHV9L; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="vUSDHV9L"
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LBeGoH021255;
	Fri, 21 Jun 2024 16:39:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=upfNIqF8RqAYE+QR9oQGei
	dQLnZRjksKHNJ5Kcaisvc=; b=vUSDHV9LUyJZfM3dl/h7IDRYdGT9Ucm+j+xsqh
	KucQM73aBgtgAUMXOzxkl786Z8kMPexcsVBPEkmxstpRD2O7hlQJ0Oj2l6mD/Adh
	1ENIyUKt1Ac/2Ob0FFgiWoGsR+BaRyXXqH1APO10FNzaWz66JZbuqBIsGDiSHZer
	dqgo9JsQnBRAhZDWLYXf3OkjYSTSLmf56ZlyWvHaiV8GwEwlbbD1SGr8Gcds0qDn
	yTqOnzkrz6PBzgY8V55QAcs2F8fvnaJW+do1b/usRuhY8/GT9IAKlXFXsOvThoMa
	u6uv17Rkxc5FIcA6f7yk3UUGdgPyHODD5rLRZEUXTT4EG3Qg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkbm4ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 16:39:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9612F4002D;
	Fri, 21 Jun 2024 16:39:00 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 494A02207B4;
	Fri, 21 Jun 2024 16:38:10 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 16:38:10 +0200
Received: from localhost (10.252.31.218) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 16:38:09 +0200
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
Subject: [PATCH v8 0/5] Introduction of a remoteproc tee to load signed firmware
Date: Fri, 21 Jun 2024 16:37:54 +0200
Message-ID: <20240621143759.547793-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_06,2024-06-21_01,2024-05-17_01

Main updates from version V7[1]

Update the series based on Mathieu Poirier's comments.
Details of the updates are listed in the commit messages of the patches.

[1] https://lore.kernel.org/linux-arm-kernel/20240611073904.475019-1-arnaud.pouliquen@foss.st.com/

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
 drivers/remoteproc/remoteproc_core.c          |  46 ++
 drivers/remoteproc/remoteproc_tee.c           | 446 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 147 ++++--
 include/linux/remoteproc.h                    |   5 +
 include/linux/remoteproc_tee.h                | 100 ++++
 8 files changed, 769 insertions(+), 44 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.25.1

