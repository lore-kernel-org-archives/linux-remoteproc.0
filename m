Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EAA1714AF;
	Wed,  9 Oct 2024 08:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461036; cv=none; b=AbmPD6H54qcjy97zQ4pLojTwv8lY8LXG1mhHL2HLZL4AWq1Dc55QYIhwBiKNH02Vhbi7d8UswqBiX3/01ITnvOmvFT6u04xFqQq1kJyF3NEqtKrUSGU/PEL9AyEUDLjgMFR/bq+K5IR9bsbT8n4jBGtTf9AjmUh/F+/svjXMjwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461036; c=relaxed/simple;
	bh=F/74OTVvaoAvQgdtSaWAf+fol44XumgT8YWgYSZoUcM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EIYGTz/pkcwC2njVpyFEzeUDgIEEWwuhQzyUMW6wLmWBZbZ1aeMlsu59OtRG0CpotEjmQ5H08rtnnJ3Eo+k5pIxea40r//ISY5m6cqRHr2SXJPxMFQGCExZxrqxfUyK5mYXTyKZrXICW/MrDt8fYHpfoeJHXE9qWpavrT5CMh5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=kFCuLbeM; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="kFCuLbeM"
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4995evbS025759;
	Wed, 9 Oct 2024 10:03:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=3uAma6b5+gPHWZkUYZOQ9v
	vdFnpqFDmgkFuZHup+H1A=; b=kFCuLbeMQikeFjKHo/ij9xJHkFI4qBDfZjqSrA
	qUJ7OloheciVW2Q6OTY5K2RWw8PR/RxASfrMEgkWCOaOvxwYOqszcJJorih29An3
	NIEfXkd4qAAqzcu05wDBZ15H644nYs1SlNKAqffHQvBtQMueRmv6ugOcvGyamnHK
	jhfKbLzhw7GYLIvXjVZ6JzggAdOK0HNKgdU+8MF+x1PxcZvUcYcUtvtNfcgW5b4F
	yKC+LESp+LAVE7D2vkLmu74SdEtgi4QQwaeXRQXH+DabFGghOYnAtToYvzR4w3sB
	1gu7DyK9RY+L1/8afkgnk6OQpxzJbN15W3UXsYkYVEBO/ucQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 423f10yrdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:03:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 870EA40050;
	Wed,  9 Oct 2024 10:02:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C3404219BAB;
	Wed,  9 Oct 2024 10:01:23 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 9 Oct
 2024 10:01:23 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 9 Oct
 2024 10:01:23 +0200
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
Subject: [PATCH v11 0/7] Introduction of a remoteproc tee to load signed firmware
Date: Wed, 9 Oct 2024 10:01:01 +0200
Message-ID: <20241009080108.4170320-1-arnaud.pouliquen@foss.st.com>
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
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01



Main updates from version V10[1]:
- remove "select REMOTEPROC_TEE" in STM32_RPROC config to fix kernel robot

To keep history of the updates I have kept in each patches the description
of the updates versus the V9[2] revision.

Main updates from version V9[2]:

- Introduce release_fw remoteproc ops to avoid direct call of
  tee_rproc_release_fw() in remoteproc_core.c:
  - allow to remove link between remoteproc and remoteproc_tee
  - allow to build the remoteproc_tee as a module

[1] https://lore.kernel.org/linux-arm-kernel/ZwVATlRbo0OdRLbj@p14s/T/
[2] https://lore.kernel.org/linux-arm-kernel/ZuMIEp4cVrp1hWa7@p14s/T/

Tested-on: commit 9852d85ec9d4 ("Linux 6.12-rc1")

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
 drivers/remoteproc/remoteproc_tee.c           | 506 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 145 +++--
 include/linux/remoteproc.h                    |   8 +
 include/linux/remoteproc_tee.h                | 107 ++++
 8 files changed, 852 insertions(+), 55 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.25.1

