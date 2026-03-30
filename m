Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD9E2F0C45
	for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 22:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910755; cv=none; b=GZAe4Jxv/kiuHEUFFEfBG82CMf3s5Xsdn8vo25PnriS4WPfqoW4FiVVJLIP7t46DMgOfjvR4jlr7LwrFM+xZanew2QkECp+TDOGAyKzX8CPTp2RnDP5Z4YK//vGas+OF40F99xShaCaiKCRsIoBO2hdpOM9RKwDYteQ1vueZXZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910755; c=relaxed/simple;
	bh=udMGBRTWuIMst/vwlYKLv16Vnp+ZRSldKh91t/KDSP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dp0x1y0AF0KMaWFBKgurqoKUs88/bhRWjXpmx+qrIwQLSKrd+j/FOolUFApcy8BqFH+GVM9lvb8TJKd/BWGZ3uurYesT0mIeJSo7CHc+TY0lT/Zb2SgHm7K4AVUeUJd7jjaxDRNihub0eeMU7biD2j7vdXrQexJa7Lkb5hau8bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0HolFlU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0HolFlU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso50907735e9.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 30 Mar 2026 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774910750; x=1775515550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ELJ8mz9PvTrWhl+sn0+GuiNyLK8+uHw4qBjdjLnnf+o=;
        b=I0HolFlUS4ZyrRs3S4U7dCDEFR8tGyPaFwy4l/rBGMPFQ9YNPpKZwYW9D7tnx/xhvD
         qEfhazkCaN00F1cl4mDweFqxN1yGa3RDdxc4/dIXk1nFeJyOXHeXla4M8SZ/kvZqFIMg
         D+U+OnCZZiBIW0ByswDMwfA6C5aJVgXDk+CzqjgGd4l1Riwebai3YtExsIxOuDS7QxKi
         ev3PdGojxXKZ2KQRICcW9jhHEAmGFo0We1XQ+WpW96ULrfbMyQenY5gCZ2/eid7kvca3
         P/VxsgWufheqP1utAOnK6VYqOtUBnw0J7cLSk86mx/8h84a9pbF2rDWZmzttJtuWQ7Bn
         rGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774910750; x=1775515550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELJ8mz9PvTrWhl+sn0+GuiNyLK8+uHw4qBjdjLnnf+o=;
        b=RPpJIc0h10VzM8yZqXvcpcbE0HuDf/kSnRG7/RkyyE91zdKaO5rTg96sO+dl7HE57t
         m+Xs0kcWPE2MU26S7uRN0ws39Vy3M1u1jEbuRLcF/SXHz/P4jlM/cNxTn7/nRItGnajs
         nUt+B5jpv2b+BDViw5+6Ch2H0O9KQpbdBRdN6MpcEnQtkO/vv7zH/1hvb/PP5qllVMkZ
         89EEREW9LXTjysMyruRRB6bEyj5LIw2QK8X3HBK13KIolqdZ4xggDpFJOl4Z2eDoVs4C
         Ayknnm68dX8tE1jI9yStcqva5FdIAFKHDZNAQG7oooOrub7p2qvTlUjI6rGdrsDa/Sht
         vuHw==
X-Forwarded-Encrypted: i=1; AJvYcCX8jQz5qGBQVL1+M3b8JiyEPZ7j/flD/mb7B46buiEyyWS56kAFvtGgqu55k9phKNXCEOPf3MrbIHjp5ScusUan@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4RZtA72Ohc11aTvJYBzPK+T+2Dc+zlm6K/va9Od+ojjHQNong
	UDRd0tLFM+xCc1s/4+0tiqlsn1SnBU5LSItaZ1Vnyj9HJbegI8OEEEpuaTHYKeBxq2ERYg==
X-Gm-Gg: ATEYQzzteDiXIjtLybcbh/9msMTGoLfHylb1k6ysPmwROj60WPm2AB/tMDdpB4ua0HV
	yn2dD/H8pcfF+6kMWU3IKX84x/E8ql09u09mZd1nUG3K06u/bNqc2bZ7cF7qOA/e/+EyyVN2v3M
	h2vp9vTW+2y4GDckKEz9Xt9b28lLL71CmPDt5Ufyb8H4q5nlOIzbiZ2xT3jQ2VlueBWEQfaIAvz
	6dAa3l0bazJjgcw9jzHnLMkx5Bpo2J2L3q+n05ULGk4CpBJZBmYCe2DpPTQT9efmevr3kHyq73+
	EquVDFjvHnMg0ZA6neQb8FYazcWxXpUq4WRhvFcfU5GOB7XXxGDMRvWyZwqWM2loAMKUIdrnjcq
	624urO+VZm/V02piPKVsNof/pW44yMfAyOGWuDcpemErB8J06W3jUZEJ8kWR7t9RFZfwaOaxD4C
	ZMcvUBw+v4nV/rC+XQQS4qIwkfI0DRyUr3Mp1gMBrwbi92Y5JHc0Oi6k8=
X-Received: by 2002:a05:6000:40dd:b0:43b:445f:3177 with SMTP id ffacd0b85a97d-43b9e9e83f6mr23543434f8f.31.1774910749910;
        Mon, 30 Mar 2026 15:45:49 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2577cbdsm23159193f8f.33.2026.03.30.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 15:45:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org,
	fabien.dessenne@st.com
Cc: ludovic.barre@st.com,
	loic.pallardy@st.com,
	arnaud.pouliquen@st.com,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] remoteproc: dead code cleanup in Kconfig for STM32_RPROC
Date: Mon, 30 Mar 2026 23:45:45 +0100
Message-ID: <20260330224545.29769-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is already an 'if REMOTEPROC' condition wrapping this config option,
making the 'depends on PCI' statement a duplicate dependency (dead code).

I propose leaving the outer 'if REMOTEPROC...endif' and removing the
individual 'depends on REMOTEPROC' statement.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/remoteproc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index ee54436fea5a..c78e431b7b2d 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -316,7 +316,6 @@ config ST_SLIM_REMOTEPROC
 config STM32_RPROC
 	tristate "STM32 remoteproc support"
 	depends on ARCH_STM32 || COMPILE_TEST
-	depends on REMOTEPROC
 	select MAILBOX
 	help
 	  Say y here to support STM32 MCU processors via the
-- 
2.51.2

