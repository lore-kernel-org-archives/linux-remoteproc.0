Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880005;
	b=lHCOHGsuU5YH0MnjmPKGKNHg69jWY0UV7abOwmi6WwoSrqRBXs48Zf3+kZC86lOI9eXn
	 jdiOnGomv62shav+k14HEEfw2kytRU5oRGHTPECVI6xkhPdDetJjJj7ORXjJc+ysaa37C
	 fGepRtbCDgxfQ5Az+o72nTjPed4vNRtY6PDlAz7BWF/oDtaUehUmfY3Y/f6S2apYJJo44
	 GvJzhN8XoyXnKlNKVq6uQgMnvfuNa5gg8aFekTXuNRXOMq4WaWprKSe2K4F8K9lT6qAeY
	 z4Bq18fk/uVpf8UbxTxeeiwWb6DqhlZn/oH5Db4Bzt0cqJiD7TA9k9rWs64uJpLPNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
	b=yVZ+peKPtQA8zg46Fp3lRLpBQMeHw/PdSpxuJcUe2zpJ04kVJhRqxB25S+EaxR1lx/42
	 taJUPXrF0kU/qGQnkXsd6sZ4TdHYDoj0QjBxYov6tdXy/g91NDvs2m303rOfDG1gg6DfU
	 tzuEdEkfR/KNBgB/Ra3cLhyotW1Rb196tZSjPX5r+qPWhbx5V8XYr7x4Nk8dk/vd4Tnhv
	 2emgSdxtdzu9yrycXWS98hJkpcLL5K0kj1aZ/YTOX0xHqd5xISO68LMesfbyUpXiUMxks
	 48Oj3WnlkF1rghPWSpcLyPwqi4/hPREd/Omo63keacuRZJprfq4cYEb3F+XeuudsziQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="J/si1JGI";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788ED606A32D
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Nov 2026 12:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=J/si1JGI
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso792230f8f.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Nov 2026 04:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793880003; x=1794484803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=J/si1JGIC/I90qBie8as03R/pjvBIZwpYccmmb9iWM7k9+1/1rdMhq/WDQOSykjYjt
         VRqsJewusWooUzixq2YMOnxb3JjPecQMPZ4D0zVldayzI+XgLGnWGU4Sg3X208Mqp1/Z
         md+QVKaH2c+6FjJsCbj52NCIBFSH6XC/g4c1nH65hTQznyzt2GiW8zI4D5Dd3TWAzUYH
         HLDbMZN0jxDw5mx7EXFijJXjU4QLZGYmcEdc3iNQt3gYDQwODTQiGtRta9zZ+2AEybDM
         2tSHxmIIB8K21U0RhOFP/WTZ01Ria527N6OpCdIqLupEwqLhjTWqDxWLJIi/pRF8dUwq
         BZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880003; x=1794484803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKhGMwWEaq+Cm90GvlNAnPOqyBlaMvPivUMvlM2FYLs=;
        b=o22Uaax4JUzh4Gn1Oe/kAwUcV6stZl6FUuUsL2uL7QfA+P7x/WSqJUvM9rQqniNhCI
         WyfcO6irQ2+UQSKpCJ+DC0mdJojKx60CvmyKaXnxoroWD8uwTaBqP/Lu1L/xbupsxt48
         z4Jg5DAsfKg329QuVxXUrpLDQZ5H3GfbuEKLGQiyWlJGRNhPqGDWd0ZwkxLtBM86//q9
         +YTlgw4wVdqZQ0iYH8rOY1Eot/JtJr+UEJ2I0AMN84swlnxnW1pb4/P22tHlncbjBnpn
         juWUKEEuQmIOTiPoBL/jVfyfGGnF5q50Lubr+DuO7y5A46roTWnacVE48inRneLG+p8J
         /Uxg==
X-Forwarded-Encrypted: i=1; AKwUvBxUnoI09O8kDPAaY+7GH/jkGvS/X3p0uCedQ/jLK5rPpPAFddCit1rxIFmx+rZx2jrp2midipWxyZ04vTBCx/Dd@vger.kernel.org
X-Gm-Message-State: APuU4Z9QjuSKtcDx9RjjWZkJTUE6pW1V9FK7hTU4qGCZQ7KM+1wXFfAf
	rKnbtKrcaydeJ4//XVeYIFlmygEWwQ/dGXXJUCOQOjrcqqxZr46htasz/bvUSMS8n1U=
X-Gm-Gg: AYBFou1h7n+Fh28rlvdBQuykVSF9k3y6CoIrrm3Brk0vxfh3kVQHIThDBIp5j8yZyzT
	vIDSxvXedi12+BkaAg4s2SOB8hLWOnLAOAaQbZab8cIjV/oOcopaGR4Xa9UNo90qSdWrXrTQX6N
	6+89DAjSYsR8qiBURJ4Ao/Chz54WGxr/uUyvLUGGTvoto8TcKApXA6VPSE2PrNTGhdAh+jMS5SD
	gQ+yYBCgOGUOsi6vE66snDV2sR5FI5rYxORp7hfvo0EeujLG3iJgiWo4kdKJb19Bl+6OsMd5nI7
	UxHkAjkwQ+38hFh9/C0Iu8zKqUPI2qOL5BWF2l5ytIB0NKY9/yd3cE+uAylkwgdBjapSRJC151h
	/6TL5Ieq3M/Ms9GQ/26d2LgmtuJ1Sqh7vKiaCTlXAF7j9OWUPMk5OXBg2hoy4b97KJmMsXhdJf4
	BEIP4umZcJB80kDG0CEUAGhsxpFuu4nup0XG4x+HAl0+/L++nf317lEWUcrHNcRvLVWlB4wSwqU
	8qUa0ftThe+b3RsbeUSSWmL5b+npfc8jgOXNEwTzgb5HSCjiMPHdvoylTCpXyjV4TcRexj5nn67
	OX0SfjWCNCOZ6pLYlfQs/+SItBC1uMlNwXg6PsUM+ywklt5wVP2IC+4fvdURR4bIFRDQrLakr/t
	AL8/m+MhdWxTEmDkZlv1xlJ98e/4hyXUIgOLlJQ==
X-Received: by 2002:a05:6000:420d:b0:48e:7508:bc12 with SMTP id ffacd0b85a97d-48e7508bda2mr39449627f8f.10.1793880002818;
        Thu, 05 Nov 2026 04:00:02 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fed0844c8sm10144620f8f.26.2026.11.05.04.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:00:01 -0800 (PST)
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
Subject: [PATCH v3 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Thu,  5 Nov 2026 12:59:50 +0100
Message-ID: <cover.1793879714.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=dlFNL/7079gou5h3eVG+eT1NdVjDy6yo/xetSiy1KDM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq7G+3SGG2PzkTYN2mOS+nHHZ3aUUEdmY7PqhmN x13lV6S3UeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauxvtwAKCRCPgPtYfRL+ TlSHB/0f2zV3hLCeaFMGvDmHjdg+j/5IFlFy/1I9gbbilHoloWIuNSZHyN699/+LVlSTqcMhmHi n9XNY0tlZ53Ns0hV6OQmn8m8/cJwLakBd810iEvrbK+zdlETADziNCGWLAyvM934XqLrTqtU3kW LzpfX+f3IaFpGimPEKOrq2r27Xrjr9nh0PtVDsyDiyVioGU1QtBmpOd0fxLvn8Voo5tLFAhDtA1 khBgjXt4t5TUjT3lIFKJjvy3aA0uc+uQsuMK4c9mb204Po+VX7aPr3fqzD+s2HHBnJAhjOg08tW YsL7ATmoSG56BaAFNoziJWlL4i89uLFwls/klK8i7H4i/qbB
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

changes since v2 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793117996.git.u.kleine-koenig@baylibre.com):

 - trivially rebase to next-20261104
 - update commit log of the first patch to justify the new callback
   working on the device address instead of a virtual address. The
   latter would work with imx_dsp_rproc, but on (not yet mainline) ADI
   SC846 it doesn't because the remote proc's memory isn't directly
   accessbile by Linux.

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
-- 
2.47.3

