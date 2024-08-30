Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9067216EBFC;
	Fri, 30 Aug 2024 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725011593; cv=none; b=oIyyCgO/PqtssB+DjnNtw+rnhZhq9NVuRRDptDkjZM0fFDOPtXngFjM/GKCP54DuAog4iy8Ix7PgCGqczdNG0ayd246ogd/rrV3nvq2vS3Xcdu7voVwNeo07CKkRj4bBRNZ/yFHRunEOra8PJbHNWrcKQsBtyX6zsV62mBsvw+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725011593; c=relaxed/simple;
	bh=txyzH0k2IeTL06GUTT7JR1oTRnieW3e6p9wOjCDqdhk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AEfED0VQ1aHiiPo9UHJ2LYBQ6KxSc58cCQTcZimOHmitiv7mV4FLvGCh6fopfkezNwmtvqevZxBNE+sBjN4L2/llPd64jY4VRpLdqow8rwIaGoYLE/jYDc70tpD1yX8urtc7ePrvmRoHlZzYwvltmGbIXccrLGP0J0LGBJYu3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4HYpG/B0; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4HYpG/B0"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U7RFuj001710;
	Fri, 30 Aug 2024 11:52:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=62RaoIRb93QUjR7Ig8jcnu
	3lbbJ9dPz/qnb0wc45UNM=; b=4HYpG/B06txAkSpV2Ti+XNCZzRX9tWTJf5tfi6
	Tf+hPI22h6giVtBYOnBOe1aCCo0ddtzO+3L+9Q31P5FbG8/sTfBf4pfprdBaX0cc
	Tbaf0KbF/1LUFkw/2fg/5GnFKhKOuh0e469zn6JiWcGOP5bXVX6xi0VT2is81/aZ
	VyJSafRR9PRZPE73b++vkKGaJCUH+KtB9DcOZUcySGu7yT2UwfloqYe9YC7QRrWZ
	JC+P50fE4PcPpebsQChtC9V2S8gZJPuxh7ZYXZdOPOhykHok3FGdPdupuu+YL5e9
	IBGgV4Y+adqsvlNjzAkYOKEelRhzfBRa9JtC3ioIa4tIz/xg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41b14uj9wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 11:52:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6AF6A40046;
	Fri, 30 Aug 2024 11:52:31 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 707402564F6;
	Fri, 30 Aug 2024 11:52:15 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:15 +0200
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 11:52:14 +0200
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
Subject: [PATCH v9 0/7] Introduction of a remoteproc tee to load signed firmware
Date: Fri, 30 Aug 2024 11:51:40 +0200
Message-ID: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
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
 definitions=2024-08-30_04,2024-08-30_01,2024-05-17_01

Main updates from version V8[1]:

Add support for tee_rproc_release_fw(), which allows releasing firmware
that has been loaded. This service is used if an error occurs between
the loading of the firmware image and the start of the remote processor.
It is also called on remote processor shutdown.

Associated with this series, an update has been sent to OP-TEE for the
support of the TA_RPROC_CMD_RELEASE_FW TEE command [2].

[1] https://lore.kernel.org/linux-arm-kernel/20240621143759.547793-4-arnaud.pouliquen@foss.st.com/T/
[2]https://github.com/OP-TEE/optee_os/pull/7019

Tested-on: commit 5be63fc19fca ("Linux 6.11-rc5")

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

Arnaud Pouliquen (7):
  remoteproc: core: Introduce rproc_pa_to_va helper
  remoteproc: Add TEE support
  remoteproc: core: Refactor resource table cleanup into
    rproc_release_fw
  remoteproc: core: Add TEE interface support for firmware release
  dt-bindings: remoteproc: Add compatibility for TEE support
  remoteproc: stm32: Create sub-functions to request shutdown and
    release
  remoteproc: stm32: Add support of an OP-TEE TA to load the firmware

 .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 ++-
 drivers/remoteproc/Kconfig                    |  10 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/remoteproc_core.c          |  77 ++-
 drivers/remoteproc/remoteproc_tee.c           | 486 ++++++++++++++++++
 drivers/remoteproc/stm32_rproc.c              | 147 ++++--
 include/linux/remoteproc.h                    |   5 +
 include/linux/remoteproc_tee.h                | 109 ++++
 8 files changed, 836 insertions(+), 57 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_tee.c
 create mode 100644 include/linux/remoteproc_tee.h


base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
-- 
2.25.1

