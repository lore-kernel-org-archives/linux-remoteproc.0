Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F583CDF
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780687; cv=none; b=nkwRy/6m34llEDisIFaWEKuRNQDPP6fkBhjYg8AfWNmOc96x6wuCQLeHhlDQ5UgQxtCrIqmZBmi+FEp6FD0T5vUloNDeG6I6XjBJ/7yQi2oH4Fk/RQMSllqIzl75n2gtpYkJ+Nxvn4cvSVskFP1cVJW1M5qQn0KCIULxlGPj4+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780687; c=relaxed/simple;
	bh=tBpi40/zB5GxFBlNNNsb9NVLwpxRzapyur7krJNrANw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A6jAuayiieH4b++6j219Pb5sNHWMiYmOLqMwcu07Dcbaw6TwLWkx52D0f6bFAE3cdoysaIN5sAVcOhq/kWeOB5LSZFMAFUcp6AfI0ZGKXLaYYvRIu/NxuseHWzl1/rfOjNKxmJi70CZY5WWLZEY8yL1XS37+V8IGMqtK98r/oOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCOCOPaS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCOCOPaS"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a55b78510bbso74999566b.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780683; x=1714385483; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7V/ShmXk7/p6SXAN3Z2PaUcTmaFz1OajveTK4GbFWGY=;
        b=iCOCOPaSxi0Isczf8VAGi42TB8TWTZiUoxEfnPevtCleN793dKiNAmuV7GMtvNehlA
         5iY+LJzMT3bKqnWJhoGEWHowu0EwWQMklByZYxugpttWJ+wsoXXah0phDB+JUaN+k/JO
         JuJf6j9SkiJ9GXd2yqixSpXKoZfhJ4E2exXd3vn+fTleg+cYE6c23fGDLWIlqEX5SgXt
         20Bp0hwjTAiEZcUG5C0oIkpjZlYgfeb7NbZ38nZQq/jvu4rYE9xSlYTg7SEQsr6RIC3w
         z5JWrgLO7YUsl2vy/Y1Q3BQXTkTKyYb02ML9SiP66v3VrReP1VHNs+BO3IYElV8bogkv
         z+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780683; x=1714385483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V/ShmXk7/p6SXAN3Z2PaUcTmaFz1OajveTK4GbFWGY=;
        b=Q4XBQmtLnGhOOlXi7yj4Uy82nbmtCu8HcegxdYblPrO/sV0FGVU0gfah/GsXW35BxK
         PJJOtVnsphT7ASiGS7Z16WfEvcuwm/HGtR9OFaeZiT4284mCe1U2pTvaflpZqWTLxlp1
         9ehU1UczVVj9+fnnKwHrSowhnWLgDRtCyAS+YQQNKQlDrUvPT+BWgJdftfoH57kS/Xz6
         Ott95HHeu40UtkBPlBxkL7EjvDBTqBNqbketHNenpGL63cdjA5X+VVMTN2Ujbj8SWDzb
         H41rW32XTyxQfEnNLwzVPJ4aNB0Z+i9St7dZf4VAwdqQbn+tEGkqLBfg+LAPkT4mUnvl
         zG+A==
X-Forwarded-Encrypted: i=1; AJvYcCV7iUQlIq1LyZtONa+LwfohTw7gJPlseFyMUZrzyaOWz+MfU4Yzrfd0jHeSax5kHRh0Hw1n5OE7Kcft9MzQGBP2NEDHbd/aRzNG3EYUNzldKQ==
X-Gm-Message-State: AOJu0Yxm3RIR9Pay1pT+ts2K3/UtwFCXaCinzvKUFINmsenrJLuDBVTA
	GzM7vgaOoVoTbG9svMrzc8+rNecBKHTHabTpyrFcpQ/X3PivONBRKFUGTowR0Ww=
X-Google-Smtp-Source: AGHT+IFvUxvG3qgOiGLQ/SWeR+itOkvSCwTMQCSbJ0W3DbcMi1M5rvlE47NfA7GOAYc8yjwRZzsvlQ==
X-Received: by 2002:a17:906:e091:b0:a57:c758:738f with SMTP id gh17-20020a170906e09100b00a57c758738fmr255771ejb.0.1713780683584;
        Mon, 22 Apr 2024 03:11:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm5576339ejb.169.2024.04.22.03.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:11:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 0/6] soc: qcom: add in-kernel pd-mapper implementation
Date: Mon, 22 Apr 2024 13:11:15 +0300
Message-Id: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQ3JmYC/3XO0W6EIBAF0F/Z8FwMDANqn/ofTR9YwJW0ih2Nq
 dn478VNmtqQPt5kzp17Z3OgGGb2fLkzCmucYxpzME8X5no73gKPPmcGAlAoIfmnSwOfPB/sNAX
 iQYI3AB6tFyyjiUIXvx6Fr285d5TPl56C/alREsAIoRDrSglEZTSX3A9xoa26Wtrm/j2tLx9xt
 JSqRLejto/zkmh7zFzhKP930QpccO0lWNFI33p5rjomrerssfAqe9PoprPSOumawuPJy/I/Zg9
 o6tY5qx1g4fWvR9kWXmcflL6arsE6tO0fv+/7NzIhezO0AQAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4190;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=tBpi40/zB5GxFBlNNNsb9NVLwpxRzapyur7krJNrANw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmJjfJ9KXx53A8ro8IPqJGL192PsQc0e8IYYzF5
 i8GiT0/tsWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiY3yQAKCRCLPIo+Aiko
 1QLyB/oD2C1PDQAYdttcA+eW0hQpbGnUxH9k0MDFq2AOlp8XbC+n0BbsOT/YujiDzTHnCf4Oi7v
 ahpVjTOtlsa1H0lW0TwqfwnjXbnuPbAQBVuz1MPKsB6wPg/sp4IyIrpuIy7HWKDFN5D9HxMMj7A
 y4/92w8ZVl5/HX7G351dqdf5C8hhrxMBamc/S+jxH6KAaqQaIt0owj4N+pF58twdletsuU2ZyIN
 2a2PvjttIy3Ge/sdCAsiWXMSMFrLr6PSwBcMnfkroAM17XB/hi8DNIHnqsH3+iYMzs9RsfmuNtT
 F26mi438aU58m2MocyPxrrp5eXiBZADxNydKfizAZ2Q5uzP9
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

Unlike previous revisions of the patchset, this iteration uses static
configuration per platform, rather than building it dynamically from the
list of DSPs being started.

--
2.39.2

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Xilin Wu <wuxilin123@gmail.com>

Changes in v6:
- Reworked mutex to fix lockdep issue on deregistration
- Fixed dependencies between PD-mapper and remoteproc to fix modular
  builds (Krzysztof)
- Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
- Fixed kerneldocs (Krzysztof)
- Removed extra pr_debug messages (Krzysztof)
- Fixed wcss build (Krzysztof)
- Added platforms which do not require protection domain mapping to
  silence the notice on those platforms
- Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org

Changes in v5:
- pdr: drop lock in pdr_register_listener, list_lock is already held (Chris Lew)
- pd_mapper: reworked to provide static configuration per platform
  (Bjorn)
- Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org

Changes in v4:
- Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
- Added configuration for sm6350 (Thanks to Luca)
- Removed RFC tag (Konrad)
- Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org

Changes in RFC v3:
- Send start / stop notifications when PD-mapper domain list is changed
- Reworked the way PD-mapper treats protection domains, register all of
  them in a single batch
- Added SC7180 domains configuration based on TCL Book 14 GO
- Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org

Changes in RFC v2:
- Swapped num_domains / domains (Konrad)
- Fixed an issue with battery not working on sc8280xp
- Added missing configuration for QCS404

---
Dmitry Baryshkov (6):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: pdr: fix parsing of domains lists
      soc: qcom: pdr: extract PDR message marshalling data
      soc: qcom: qmi: add a way to remove running service
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: enable in-kernel PD mapper

 drivers/remoteproc/Kconfig          |   4 +
 drivers/remoteproc/qcom_q6v5_adsp.c |  11 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |  10 +-
 drivers/remoteproc/qcom_q6v5_pas.c  |  12 +-
 drivers/remoteproc/qcom_q6v5_wcss.c |  12 +-
 drivers/soc/qcom/Kconfig            |  14 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |   6 +-
 drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
 drivers/soc/qcom/qcom_pd_mapper.c   | 656 ++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c     | 349 +++++++++++++++++++
 drivers/soc/qcom/qmi_interface.c    |  67 ++++
 include/linux/soc/qcom/pd_mapper.h  |  28 ++
 include/linux/soc/qcom/qmi.h        |   2 +
 14 files changed, 1189 insertions(+), 302 deletions(-)
---
base-commit: a35e92ef04c07bd473404b9b73d489aea19a60a8
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

