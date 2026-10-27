Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118340;
	b=FBCZh5jyJUKqQQDbXeT02J4JnN8LmqzxTo6cHYHMvpBsGf+kXFPAlyklQAi4hac7ZZSl
	 6It1YczzbZ3K2AP2VP9PmABM4uSR2WKQmaRUm5aLn6NI5Uy0d/2Cr8vQcytovLoUWgkKy
	 sv2OuUZveA4LON4tMbxA+/FdzNNPMzWiTfTB4xi5KWQcamlwXtW0vyLvJ1ixM2OQquuTQ
	 gwd4d2Wfor1g8uJaJ2k9XRIQi+Wamk7lT1cUYUS7E59RR6hgeth2C4Qd5FE7GgEP/fj14
	 MEDbCJCrHx9YVtHFofLL88PbBuVsAxogjP7q5LCIfX86/JQfxEVIwsoU14mpSDkkyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
	b=RoZf8KO/SjWOPx8+BLh6eSdAzD3r0uNZvbYucEdiZxehl9PnIY76ybpgg2fnyXjV1Syw
	 OtwanqYl7mB0k8Jk3lG3oqrKw90TP+E2kQCDrUtRdXFjQnx4/t3Lq4vT93ZSPg/s+ZGF2
	 3DcVTiHvdB8ltWPDoDc577j+ywu87ax58CegdS1h6SyVQ+8FE2LuDCgwjz9D2z5dsSs8L
	 n8NV1jDWhGGmK7X0DbaQkRE1KcYPIrMj18aUv7CrHe31dImSkyUQZh/eir2Pt5UzyZZ9n
	 kWCBq5H8Zdv60SF/lpmDS+0owMAiC7TB78n3YWTdmL4YdoKNhy5mVPujl+vSVXgXAFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mmi+g5Fp;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11681606A321
	for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 16:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11681606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mmi+g5Fp
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so889899f8f.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793118337; x=1793723137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=mmi+g5FpKUt5scQkPASOjQkt1VaKEMCT7DzNzNX40JfViJW7G2JZFf5BUPMb8cm/K0
         tGP9pKN36s5mLOAv8GbXXzlLQPEp+tF17BVdjg/iy1YdlMk3O2lFq9kSyF+EGoTvk7Cz
         3O1eiO/iGDwbc7FMp7PDZQaoIfV6CPkz85d96h/djp0eBAhNzkWRIIv5W++ISj3YCFV8
         C3J/H1jMcwwdPiXr/0lK7+UmtGE/NmMD9xm2txeOGZbiPm5C+3fsHvPdJ3b2ZH4Kq83f
         pUjIoT0FEO6i+ZzfD2xfIW5y7i23oC9Gggy1/nXedHKVzELgsckW5bYCW+VMLDKJvSMZ
         6geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118337; x=1793723137;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OcV7m+TUCHXLjsYXeJ+5OT+7xEIy8F/NuFzFSLHyvo=;
        b=GooIlMg501s9Vzk2WeMjriWViAeTdw9f86Z8FC3SYtXE9aqI/3zaLYS6fr+H3ClwlY
         +coIm95fJAMWp7rG9O8qP/xqgCxsFX9USiBbcDgJVnTj4DuCnl4r3j1oO9/8oBagVbzC
         Lj1D4AbQnquW0SeFWDd7z/5Sd7AT1FiH3320IideiVSPEFRl1VPbF0MyWIiiOmNAa/SN
         bJLJnwL0j3OqqsZonEwik6mOe8VNs9HqdXQYVuA5c5/n2skGpM3jPmSPZksXWYX/WGbk
         XpkhlPnHKVjdjF06BruvhSEQTS9xNvA6AdqyzGYc4gUx7Au5EMZ3DwUbKdHLEoqXDTzs
         OYOA==
X-Forwarded-Encrypted: i=1; AKwUvByi64aTWeE2Qgq8Q2umiyUwwOcSx91uVSB04Ww9iM7ylVK+xD25JK1i3sJcniW+KTrx8A32PFZBVHts2LsBU4h8@vger.kernel.org
X-Gm-Message-State: AFq9FYLjS7CABniDYRIKuTzeBj6Cb1mrFZnUwNvLO71GHwt1JxSMOGlF
	qGKwwXmuKTHhneFdMV720CGq6TflrUNab91EEd2zL+gW90pg1InAG2yElNCLeofIAyA=
X-Gm-Gg: AYBFou2n9BBWAFez1CB5YDuS7102AaZ1ZYjET8URgoGp/ly6GqHNy454wAI4qEntwnl
	sDRh6s0AtqAN461tbcBCtTrNQ4Kywz69TNhAH9MJRha36cvFARx9gXxhBT4hQHlAXmRqaruMUc3
	IgbUh8xXhichti8+wdfEpIxnPcHE3ko0xZZVSImvrsP+i4d36vf8psaTihPlv+ASKyfd6Er9uAt
	QElhO6/r3iv7Hyw+SGuDMZvQmURR9d/8SubzQBT7UcI5QRlV7/0HHbtQugKs+60f01DR6hWp2dA
	24MBe2pAasThp9Y7vbx7rInxuSL0ovLipMH2QMmFbMHkRJZ/p3eUkuWxozgLzHxPutlYxxhQ2E8
	1VfVwvpUkzBCIQpyn+UyXzdHp5MiY0bPZuKiI9YPHgzxKaGsyXA/ff+Z5JfaQ3HsaxVzavJ/qLG
	87j4D4VJnZLY47yjOZeKf6JYo92PlpE8blM7EuEqFhgqm6JHkwSP51yFCEuDJX0mFv7hNEKOiRz
	2TaJ/dUL09aU9qjwX/RYDA+kHzzhMO3Fx6j31IDAtUEnj6y5+6nLd2NIqn41Xm/VOA8DLXYaOh5
	Dry+yQDM4H8TrMo/imWJzFYvIuiaPVYl9L+TIHyQnLY=
X-Received: by 2002:a05:600c:530d:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4a7c100c816mr76768845e9.10.1793118337316;
        Tue, 27 Oct 2026 09:25:37 -0700 (PDT)
Received: from localhost (p200300f65f19a90461358920bbb0c5ad.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6135:8920:bbb0:c5ad])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a9301b6968sm115485e9.8.2026.10.27.09.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:25:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] remoteproc: elf_loader: Make rproc_elf_load_segments() more generic
Date: Tue, 27 Oct 2026 17:25:19 +0100
Message-ID: <cover.1793117996.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=724; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=yA71phFGI7EdUzfKSsZthD23p/0J3Coj+je0F1nEXik=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4NBvSK8H2PN79QFIb53PEqUXlq2S6UgvHblFM 3fLU/YgcDKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauDQbwAKCRCPgPtYfRL+ TqKMCACZfihv0KZEC6jP+ubBQtpsGPs1Cf6qHCbCICL6ZJamGVN4AZzK7Qqj5eO8KnTW/f/teJC EAbMuo1qT1O8t8TbvCo33u6K9dWYBKEUN79V+IHZdXShryweitzNTku3wCE0jgiaCsPJ9noCEMl NxPZnk1/u53JitDtDs6J8ZkB8T+TrfQLZmx5M9w0dotwxiOfGKpnCI0ioe29b9eBeMFCCter2mZ zf8SkXj+ciGyNpIdhuJ5/joaOy0s/aHTVZjORONlyaCi4qUUuCr2lwThaWP9JWVQV1fs/Vmob6O 0hK5Q9FfzhkkaALPaBPjmNqM7T8cl4w23c2s6yIi0cpzg5zd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

changes since (implicit) v1 (available at
https://lore.kernel.org/linux-remoteproc/cover.1793008847.git.u.kleine-koenig@baylibre.com):

 - Add Reviewed-by: tags for Peng Fan
 - Fix checkpatch warnings pointed out by Mathieu

Uwe Kleine-König (2):
  remoteproc: elf_loader: Create new callback for copying segments to
    remote cpu
  remoteproc: imx_dsp_rproc: Implement .memcpy_tova()

 drivers/remoteproc/imx_dsp_rproc.c         | 120 ++++++---------------
 drivers/remoteproc/remoteproc_elf_loader.c |  64 ++++++-----
 include/linux/remoteproc.h                 |   4 +
 3 files changed, 71 insertions(+), 117 deletions(-)


base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
-- 
2.47.3

