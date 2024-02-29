Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CEA45948
	for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247636; cv=none; b=hHU01dgrNwXg9anq31QWjCgic9pIygOHebxnLzGs0k/lyiWVClnYFJev93EHCHkTUIgn4czpsC69qcWx/yuA0AS4LqLqEep+4u7BqtLxFGqlOc3iWbEPZYlhXBtzsXGBBA9/16FIlIzMokxouzGyYugQaEt4YLr9Egh5QD3I28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247636; c=relaxed/simple;
	bh=+T5+H0U5dzjLispNcIuGF+noXB9m/To2YuAnBJYDNUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G6s0vvgSiOOs0VFsCOSrn1OZ3vQOxQ2Hsex7BONp+9rSTuUAlbiyehMRiUJYJzuEOUtUKLf1Yd2n4JrU2/1NpWvul9Zw1SwmZjOjSc/Ca0K+FcWmOm7zDss5fKu8Dv5E/dZ29wScLkVFUCUnpkVXiM3RvD9c/js4Np7qDxRg1HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r4rqsMaa; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r4rqsMaa"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51321e71673so1695489e87.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Feb 2024 15:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247632; x=1709852432; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JEIpRk0LC/c4ywAm8vFYSwlqzlbtnoXQp2uEJM7f74k=;
        b=r4rqsMaaXjT2YRmsDJLFuIGSAHnsXs4DnLL1CLseQGYSnxgMMQoACIhC3p1wpvy4vk
         rpxTuS543qMfyQ/wWVZ1uUa2xa5TIRWUF3Jjb8Kst8tbtFFkwSjdfZ3PHFAMFwYEmZwX
         Oa9frG1wUAUOnL34N7p3G49nT5k5w9uUbogje0UOVqa+JZwU3qluHkDaRgtg9j3LZfIW
         tvAXnnFe51xtXNep0E3o2ckQiESWik5xzDF3KWienoMQJqSRzLgXrH1R4jvoQCqDIROn
         QhKSui36QGr4qx1YEdijkw0V5+bMDN5QvY4OPI6s6ZXOL4hIbauwnHyokP94JMNCXYUD
         x5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247632; x=1709852432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEIpRk0LC/c4ywAm8vFYSwlqzlbtnoXQp2uEJM7f74k=;
        b=i2gBa6DOe+eTenxoM61+TOqeB+UFKFwbHCsPJ/JF9nFMCLsPxcorPS7ZckWDH96lnW
         u/9wbr29VbabS3cFNRKPpbQSnYfLLKEwV1Q6ZjeCzBsHJ4ELHWKvbbuotvTWNVoDEtRt
         RCCkGDnqAPMdZxQc7Dqfk0IlLThHjZoq9qOPEuNZYi497P5o07mL4iMoaQVSE5B/tn91
         ZjuTCpH74m9+6m93bWRdAsgnL+K2FGrJpuOGKFtpNJtl9cNPAL/9wBqcjWQAyX7RY5AX
         LWRuQvcOQfdKAFyrlMfhjlQ/wTRDog3/a8gJN6b1G+51QiVaGioolza9IXJ0fv1FAD3e
         lL9A==
X-Forwarded-Encrypted: i=1; AJvYcCU2X/fNRiL60MRc2LJS5m+KjSPB0ENa4fJ9ckYWASKFNP9ss+7qKEyVCEle0KwP0+gcyZLlE1BDHs44BTEwBE5Mtmd06ufQz0h7xhXTHxTXBg==
X-Gm-Message-State: AOJu0Yw2W9zrM8+d5pRbdmCwdREka1o8M2nQEURds+Dg90v7YDWYsYDu
	mUeXfxOLnHoAaEvPJNQKyUVsb937PlaeUqLdS4C5SBP6o0RneAIXCDI/McWftqQ=
X-Google-Smtp-Source: AGHT+IHthEQuAHP/Yz5PlgdBFz2RKl7blXptTH2C9jKARlqsQ7uOIGZV6KrNY3oUJF35Vyyz3UogHw==
X-Received: by 2002:a05:6512:10c7:b0:513:29a5:7306 with SMTP id k7-20020a05651210c700b0051329a57306mr2030563lfg.64.1709247632307;
        Thu, 29 Feb 2024 15:00:32 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s26-20020a19771a000000b00512ed2cf297sm408455lfc.151.2024.02.29.15.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:00:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/5] soc: qcom: add in-kernel pd-mapper
 implementation
Date: Fri, 01 Mar 2024 01:00:26 +0200
Message-Id: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIoM4WUC/zWMQQrCMBAAv1L2bEqyiRU8CYIP8CoeYrNtgzaJm
 1IspX83CB5nYGaFTOwpw7FagWn22cdQAHcVtIMNPQnvCgNKNFJLJd5tHEVyYrQpEQtS6BpEZ6y
 TUKLE1PnPb3iD6+UM9yI7Ls00MNn/SyvERkptzKHW0hjd7IUSbvQTL/XD8pKHZ5xPLx8sxzpyD
 9v2BeTOVU+sAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+T5+H0U5dzjLispNcIuGF+noXB9m/To2YuAnBJYDNUM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl4QyOP1pUxSIa060vc13+jRXPdT21F6O6n2CGn
 /YudwtM7/mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeEMjgAKCRCLPIo+Aiko
 1a2MCACrIG9+9+1lYLJqVrkPo7Sy+Cu6SASaYqc8OqtwctVfd/6mkdP39o5A7XHQDGRtJpyHASB
 ht9NyVJuMtaDsR3gUkJNQU8nbiEe7cm2JDXoeYPa2ZuS4Ftn++mjslyWccX4b/wJbDIMw0iA74Z
 uue++ypuamPAE8S6evudvuvw5kKhJZNXZaOAfujUvv71/GvxI7l9fs86xSd6wBWHNpSUenQGOXu
 R/3AM2EzBSX9fRSRf14yMWLf+lFxwhNjWCc4u742aDteFsqdeugEqhINx23drKAoUezE+I8Pk+r
 d249LE79jpfE4E5WPw5ikK243KBX0NSL62DVcXB+H7ssvMW7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Protection domain mapper is a QMI service providing mapping between
'protection domains' and services supported / allowed in these domains.
For example such mapping is required for loading of the WiFi firmware or
for properly starting up the UCSI / altmode / battery manager support.

The existing userspace implementation has several issue. It doesn't play
well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
firmware location is changed (or if the firmware was not available at
the time pd-mapper was started but the corresponding directory is
mounted later), etc.

However this configuration is largely static and common between
different platforms. Provide in-kernel service implementing static
per-platform data.

NOTE: this is an RFC / RFC, the domain mapping data might be inaccurate
(especially for SM6xxx and SC7xxx platforms), which is reflected by
several TODO and FIXME comments in the code.

Changes since RFC v1:
- Swapped num_domains / domains (Konrad)
- Fixed an issue with battery not working on sc8280xp
- Added missing configuration for QCS404

Dmitry Baryshkov (5):
  soc: qcom: add pd-mapper implementation
  remoteproc: qcom: pas: correct data indentation
  remoteproc: qcom: adsp: add configuration for in-kernel pdm
  remoteproc: qcom: mss: add configuration for in-kernel pdm
  remoteproc: qcom: pas: add configuration for in-kernel pdm

 drivers/remoteproc/Kconfig          |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  67 +++++
 drivers/remoteproc/qcom_q6v5_mss.c  |  84 ++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 418 +++++++++++++++++++++++-----
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/qcom_pdm.c         | 302 ++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 189 +++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 include/linux/soc/qcom/pd_mapper.h  |  35 +++
 10 files changed, 1108 insertions(+), 68 deletions(-)
 create mode 100644 drivers/soc/qcom/qcom_pdm.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.c
 create mode 100644 drivers/soc/qcom/qcom_pdm_msg.h
 create mode 100644 include/linux/soc/qcom/pd_mapper.h

--
2.39.2

---
Dmitry Baryshkov (5):
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: pas: correct data indentation
      remoteproc: qcom: adsp: add configuration for in-kernel pdm
      remoteproc: qcom: mss: add configuration for in-kernel pdm
      remoteproc: qcom: pas: add configuration for in-kernel pdm

 drivers/remoteproc/Kconfig          |   3 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  87 ++++++-
 drivers/remoteproc/qcom_q6v5_mss.c  |  84 +++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 483 ++++++++++++++++++++++++++++++------
 drivers/soc/qcom/Kconfig            |  10 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/qcom_pdm.c         | 300 ++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.c     | 188 ++++++++++++++
 drivers/soc/qcom/qcom_pdm_msg.h     |  66 +++++
 include/linux/soc/qcom/pd_mapper.h  |  35 +++
 10 files changed, 1176 insertions(+), 82 deletions(-)
---
base-commit: 20af1ca418d2c0b11bc2a1fe8c0c88f67bcc2a7e
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

