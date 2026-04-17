Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E149E285060
	for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776464024; cv=none; b=g7CGQLpLnuuxsMfxtXAABYp5HpEXW1fPY7WLOhak2qC/sLP7E4KQ+rP+7kE88rQhBHeOfYJR+V7plcrCM+vTtxBWhZ+ui0Q7yJaxK7rYQSpXfNbedPkJhiITazKi9lvddmdCAYteP4OHoai/d8CN2ETldeQP0Lsv9ctGs1uZuWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776464024; c=relaxed/simple;
	bh=HUrzxs8wj7DWHKPBZsNbL6K0NZ4WBVgexvElWyngk4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PRsvU4GhzUTvxibyEhX9/wEgDRANimdcdm32mc1v9pFpdAI9ajvC5sDMhRfl2EFQzSTSA+KD5a7UuhhbptZ4OHOvbPU23k4/cviFZJyHN7/FD59qQDKrzu4Lsacb9h5aDojNQ/ltp952yIZ/XRPwi0KYPLcECEpi5LMOER6LpoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER3qXuHd; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER3qXuHd"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso8608485e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Apr 2026 15:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776464021; x=1777068821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=J4QbAthmgd4MMEN7BSXL7fHJAf2O4q3N5M7d24k21EM=;
        b=ER3qXuHdlkqxG1ZDPkDzxPvt1UBqwYV1NcLHQc1i2bzMRzw8zOwUtLxMLdD33hJuFc
         tf/0QSX4Vc8/AkEg+2OYY7SHgJVdmNiohaJ1LxPm9kwrkZ5+Yz5AKIBpj9WzXlbSh7lT
         n2+wSzkA12HSk18fQS5iKjTCTI9bak8PQS+frBq6qr+j26YLepYRp92U+UMKYKG6nj2z
         sbxwwzwRO8O/Z8nFqFOs7qNwh4z4aDbn6jtVoisWTB2kQWzIBDzcCXOEwU+uLOrmrncE
         i2WwRL3bcvRlCbPZlHjk4FPHmNW/tEje0TemJMvxODlq8jDAJ9+VKrjjpevxwqM1Zc6n
         m1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776464021; x=1777068821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4QbAthmgd4MMEN7BSXL7fHJAf2O4q3N5M7d24k21EM=;
        b=CzgrLSwvAcJoMGCzRCm+TOxMNp/fYqwRC9YBjJP5+C99GtZVtFqX9x0MW08dw0HQbq
         DpKn8uxNVVpF0ZYxW4ZhlN8AuiPGKE6R5JDxJWv1vzJ6dssXLrSXDItzmBpF4MzF8xh2
         f5R+A46+fTOu4kpPUJgZfQNScbQIuLeL+JMAzQoWIjUfY0DXTBJA+P6Na1TwuEZ/64OZ
         FXMxiAkaV2qrpKkeYLmLZNNWzt22HzIJZTRj7ejQpJ5xjUqqAOQapcZjuJSLnu6Ez9IP
         gvEFoqytldb+RX1JhT5TiIQSlJjlliP1mz8PDPJ1EclCLTh8WEVsNsUeddqbwC9O2WLx
         V1zw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ku0PfD1iNHKm5G5Rnyg7a+A2Mk2zc89iOeetDO3uCMt9lYu4uekZgFHUyMYraTxHAOHnB2Gv1FD8glB45xwbX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9AhRamCEk2Qnej8VHIDwlyhk5sezDMG0XQeyp/4iriMYCLzGq
	Om6RLOAWSa4od1TtZtj87WqOBEUfFG/39EFQwCpItGFfa9BJf2Dn5d5qkds0POy7K6rH4Q==
X-Gm-Gg: AeBDietLN6E0uHGaipfemC8TGFtP04PoPbUD0euQX5Q4sd/wZzQOGKyIPvu5Oj5dDWB
	7jUGtFjuwFP6CXNt+RSet7tMMwtUZNTZpIrWtoo5wGyTO+B7eSkPvQxtCF632aOfc1rY1oK0Nr4
	LOpBCORGGp4Yr5uV/scGPwsB+04V1rbfIewwZ+vkPozR27ggY89yP0rHDRxEYwTvN4OLYkdU9WH
	aSOZar5XZnGDmmkWp0Sh9ykYS5Mm8h+7Vh0evtWYCkeJO0F2T2g6yh0wOyAcwqpcyITeuz3pX04
	2ki+txTnR9n55BfJcYHqN7sRqEgBb3aXXISaNF9RheCc2n8/QH3c5YmE5tqsKH1MbF6eotmsae5
	JwB4mfTRM1rVl1v5Y/y5gfYpkco3p7tP3OKI7f3OxDANb9pxPz+3NEVUVUTmI3ixZvskUAYnWOU
	3hsQVkae/SKiuJz7P6d+4GJajfmxDhxB4FGnws7TMhA8YrJXE/8cP+ThegVk5G+Iomn1RUW/0ie
	cxO
X-Received: by 2002:a05:600c:3150:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-488fb7930famr69549535e9.24.1776464021014;
        Fri, 17 Apr 2026 15:13:41 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc181c6dsm69883185e9.6.2026.04.17.15.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:13:40 -0700 (PDT)
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
Subject: [PATCH v2] remoteproc: dead code cleanup in Kconfig for STM32_RPROC
Date: Fri, 17 Apr 2026 23:13:37 +0100
Message-ID: <20260417221337.286313-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is already an 'if REMOTEPROC' condition wrapping this config option,
making the 'depends on REMOTEPROC' statement a duplicate dependency
(dead code).

I propose leaving the outer 'if REMOTEPROC...endif' and removing the
individual 'depends on REMOTEPROC' statement.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
v2: fix typo in commit message
Link to v1: https://lore.kernel.org/all/20260330224545.29769-1-julianbraha@gmail.com/
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
2.53.0

