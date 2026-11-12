Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483601;
	b=RmGUg0JVfJclXNCLfA2KKuz4FEIZE0YVHslzIghpqn/4L1wsYAabtFRdW1i8CTmahhLU
	 s0a71SfC4qh/wisPXv7gNiBQW7tCu0q3GqbPMk00F2AX1sjMf+exqVru7MSBxNlYHuH8+
	 /jrlGRShhPcOGFkvBbo1ICiN/blD9djwNlrkaI4Nrk0dINiv6XTrobRV6PCNzwmjke9Gb
	 gPVgw+VgvDscr98J/yk5Y9ObW+pE7Nv+dYftXAE9q2vAmtb1aLS/khh/tmdMnChyjHkHU
	 td2GcS0isRRMj+n0SuoeCvoKPMNQajifPRdN0Z301XgSYY5oxh/XNLaopKcf0BXBXYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
	b=cPHhaxK8JHnA12UfXA/NOfNedAqVsPxmakaN5ASddMJOZ8rklWk/Ne5j4l1qQrFwy9IE
	 OJnVdXIgEzaMPvpA5t2Q06hJ1NEJcem7l40LFFovvGN6yJeYPh92w1TVrsF+NLYgARxoj
	 uG07w7QAfdiUheKsG1RVtgF3PbL4rINxl9nCuDAbiZFW1S8NndPS2E6V3CA/0rNr7C+Qf
	 LY38IbuQscuO1LWf69Ipe1RIRHZdU9eMCGXwYoP35xVZTLKWT4z2Asebtnh0cHo7lfDKA
	 DNTWX1Zxabyf+m4GO9ZAViepefLU2yFt+BzrjxxWIgt4WfSe6Xe8f7N9tIeKWpR8oxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U0CQwUHe;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09F606A88B
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 11:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB09F606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=U0CQwUHe
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so38766815e9.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Nov 2026 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794483599; x=1795088399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=U0CQwUHemHFbBxqW9VsnxFohmwNfgKvTSToszBtA+5XssJMQIKbmmXVfmZJGhf467f
         Lte51ln40ut1omGhjOEC4ISaGpXBpxcz8hyuYC5TdqP77Qtol9sTnUEk9tmNfMasInAX
         Z1Phyj3c1UoZPv1fVWYNaOwoIddrCmkEFWRz4WlMg2UODFWbM+5PYKJag4qiCeIHCkqt
         Lrova3BmheH0NJ5b8eiyrYYJn/NnHVnu2WODQoxA3V+UBZXFVRl2R0J6LMx363G3PFFU
         22agP2Q7L4y4QuDPWTTAyISHf2prGbbBH8MD/uL5v8Ft31DR35onVBJ7vwDaJq8nD3Mm
         NOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483599; x=1795088399;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAkMK2tRWJvVq1ApX47OvdLFJWtUKDboSiivt2OouPg=;
        b=nkpf/yj+g9lxxquXNv/AiO3Xl/bUIvivvalLiYQenqsnP8WqFCdyMviEmMW5zrwXlw
         DAeHx0rPMSkZsb1a9t/XrG4L1ej/BbvJF3Tv3YA+vvamSA8ZULD4EmvHNGVFggqPD81n
         ljOICwX5CS+qhP9hBq18LHueXCdKRaLxRL8+IoU9nfa1vS+V7fvDxAPh7/sK7XRFwDnB
         5EDvttHz9evcQPpR6pKHbJTyJ5dpZP1KUEtLgcNgnjOQ60vTY2KPoC78//bRvuhV8kUm
         jL2Yn/j8wXFWEXvqbIGVQvuCaSgERGlIDiqN6oMDpuDELfjcFEpF6i9UQKhAPT+CHm4/
         69UQ==
X-Forwarded-Encrypted: i=1; AL+hErHPx4idK+9ses/PPKL+dJlkouwxrY6UFR5ASc7cOJtAe3ZEHYKObWZOXvqzii1V9n2EHSJHea4bORCIe2Zq7jSm@vger.kernel.org
X-Gm-Message-State: APuU4Z8KRDBwunL8ol+sIjQYZbnYxUshkUSTQWA2rAlAz+c+1phx9T9v
	c0WRZHGfMQ/pFSO70NeXNgkSkxCqBJMrJsOLzaYtNKOl3/2fLLh5NWKo7GUaIheK77Q=
X-Gm-Gg: AYBFou09dpBzEkHYXX3BENKSy/qZzg+C2cWjIwpAlpAJWNQrKuL0KV76BlOYBpCGTLr
	C5PH83NtJE3yej7SPBwyk8uvM/5jUtAitsIUEdxcj3NRXGF6pfeps95I5UH7U7RfiVrihpOmPUt
	KqmSaJKpqphmkwqevmrPO6K0pPF0e86CT4OiuT4Cl/LhJctE/m8kVkC8KPJKNzZ8S7kxB8eN+eQ
	+Y1YtBI2mEpn8Grm5stQMaWPZQMCrUs2NYjw9Zz+ODwB8OCkeHy4yOTVmsK46zAXWVJv++skkR2
	vmXmkuVIIWGh15bkxDQPibr7sR46vYkp+89kRz+sCGLb38sOKnBZhUEzp4VR06J2mPQBiy876Q0
	qITdt3P3LBAWsUGTCoRFRbtx0O46LoAfWQzCkztS+X8LQKJmaWDx33dK9PxGcQs0AFJNda3tVZM
	RaSC68GEiftemLMvo+t8BXFC0+7hHMtf2oi5MevPTwGmamFPM9IS4W89xdE2QIl+5xccLS3mK8l
	JvxQhmnQ0FcPW4T5vX9xCB4VdSNRWEXJKqvJEAXyQfQEqchK/TLeb2HsME112WwN/xeCefa1C0Z
	2S0Cgbt7aphP5MS7azg1X5atghhFuWJvqJSU63I226uBj/d7BIAILC0U65eM0M4wSYP0aLs0O6v
	LR0zPTqxsA+gJ+89F
X-Received: by 2002:a05:600c:4f81:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4ba093605c2mr91136455e9.14.1794483599210;
        Thu, 12 Nov 2026 03:39:59 -0800 (PST)
Received: from localhost (p200300f65f19a904528996c8ea0fadad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:5289:96c8:ea0f:adad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba09509c74sm72110275e9.2.2026.11.12.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:39:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu, 12 Nov 2026 12:39:49 +0100
Message-ID: <cover.1794483181.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rpD3ZlQEIotpmgm/8a/F0GE3kt8iCsrVMvUNk750HQI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9aV0VygZNHI2SVH27/dYSxqTJjDlywp4XNFMf BZVY/583XSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavWldAAKCRCPgPtYfRL+ TtCQCAClGYs+wv2wyzDrk/79LjPZbrJxNoTbgGZjAjNL8eGW9gHs8Qtu+Ul38KB+Yvlx4MgtF/v 68QyYlSMuYHXaQbGbOS3caVOpqAhhyFW9mM8PzK7wng3qCpRW2IfG4zk8sJ/b7sHISO5LsW4Q2Y jq3i6lhqo2kiw+dw7eJbkLOANZ2WciwA1jE12N3J4FGVwH2cLPWqU99eaaiq2jvcq9iKdY8wF3G DVlNZUgZMzYirkj6IRVOAVLsmMDsQs6BRWvaWplf/mr1RgAw0UEx47fAFp0XNesIZ3AoiCpDO5F Ee1FjbOjYKH4bwaNPe5ccJau4Aiy8JQCTn6mUlgyP1PvkV3V
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

Changes since v3 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793879714.git.u.kleine-koenig@baylibre.com):

 - Improve kdoc comment for new callback describing what it is supposed
   to do as requested by Mathieu.

I'm currently working on another remoteproc driver that cannot use
rproc_elf_load_segments() as is because the remoteproc's va isn't mapped
into the local CPU's memory address space in a useable way. With the new
callback the amount of code that must be repeated is reduced, similar to
how the imx_dsp driver's load routine is reduced.

Best regards
Uwe

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   7 ++
 3 files changed, 74 insertions(+), 117 deletions(-)


base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.56.0.rc1

