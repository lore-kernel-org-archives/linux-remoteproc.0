Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292351AC447;
	Wed, 23 Oct 2024 16:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700510; cv=none; b=Mm4UxzIeqXsXzrf9MyV4HjT/vrAnuONFo+HC4rFW2l1L32eSSbdZGR5tjRkQzmDJuvo3ghbdCyPW/wajo0EnJNpc8imen9T96aYqFLD7U3fnPbCnZEM9LjQSRNGnyFngaBPvG1OoQFUWRDyao9gGUxmTdCpomUZNNI3lfP3OAU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700510; c=relaxed/simple;
	bh=R+e4WFKWlC6L8M0QO4g4MlFjlqMZvvy+JyHKMgMJLPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozUe0+k5JL1l4wpq7DR9+qB0i7fsi73Rx62Wai9PQYMI1YUUCCOfoCBdmSVLTs0Cp7o/2oNzoN/niFGgt5UwVzNgm94XzdZrhHddHdXMfvlGg31Fk1aMGQ820yu1pSGhRJO+xT5Hc0lbLR9HwdB3qyQra16CbgIpBwhsnAeTFZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQW/6W+z; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQW/6W+z"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so5124131a12.2;
        Wed, 23 Oct 2024 09:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729700507; x=1730305307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vf40W6Eua7BzKpxAO9YSg+KzSm2KmjF6yDdNRZz/fU=;
        b=SQW/6W+zCpUeB7Xx3E5Xf9R7acbMR3mOyLf+H7kgWt092W6m2n3fppBaoVulVDBMLt
         u4YIu906o59JnDbzOq4/f8wD6iNEJo1gkRYFhwqVjL8fHLwJ0KGhdQRaT+orcqPw0L4P
         EbaBeQvnps85aQ/kqvS5lYjgW4PmqqzOjdWexqxqsGCChnasZdTVWhvuDAZU9IZLCcYN
         wVikYoO5X/F6HcaQt+lY6W6OAdaW8PZZbWwvESaVLof7Cn3mdqbgJX/A8cKyQqyqxNuE
         89jJFpQmEGPk5x1NVRUhhTsAlEeG9+6Oa3CMkTB2bOjueYiceYW0mmC88oIstAIrI897
         Oy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729700507; x=1730305307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Vf40W6Eua7BzKpxAO9YSg+KzSm2KmjF6yDdNRZz/fU=;
        b=Pa0HI2cKUfLXH8sH0G3lnEC4lu3ba490X3Ui957XchS0eA2TP+94O+mryfQRDrUvu7
         c+LcQWqVzUIbykuFfJzfF1sIKCiswCnMytzYrDl+eE4Ww0tW2NFHvcRsIMCmm3d44m3m
         FU26gc3TkgMvYLispCPtafd9CIN5RPl6FZjY/0FGbG3M3jHwIPv7e2HwrbH/s2AZOi7w
         0fqFkjDHoSXKTaPWbYk5P//OGlv+o9rrCqT/bzwrXrYZRG69EakRCncLjBkBIHu0dBLf
         ke8Qb9FfNrjZ8DVLxPTc32ahNYhtkOm/SYBTw5fhv796dAeImgjC+bsy00GhghjeMDk/
         6mlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSjpX7DUFnqrf/pYBo/lFKOzhYrKdrbThnuVV8mWk9NWWvQ28iYuj4tlPExIwSQ7tB7dCM1XxNYmVFbGU=@vger.kernel.org, AJvYcCVHamQmvQmlE0r5GXZnp+3L8aOB/M7cHBCMasl7Ocy1w8ie0R230QUOv2IpowaVQBEpsP1ic0MTPoTRiyml@vger.kernel.org, AJvYcCWCrHbkLKmrpOuJFTfK8JPf3Zgr+cRXS48vHKqKb4XDI4mpMRztfu5ujfd+Q0r5dTTb+rFZS8DfkqdE@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaH7/GbidlMvBjwyQ4NkGwk/aP4/XF8VbEg14+493a1Q3nTn2
	yvIJpLOwXTB3jxxrcQW88vI3sSA0kQszZ1Cz3A2NPwMxFgZIiiXM
X-Google-Smtp-Source: AGHT+IForx6JPsSbHDkt5X0lZS/onUnpIaCr/eo5xEqs96eIQlISvbsCKmy4d2uWYSjBJfz4rft5SQ==
X-Received: by 2002:a05:6402:2706:b0:5cb:666e:a3be with SMTP id 4fb4d7f45d1cf-5cb8b09884bmr2230032a12.9.1729700507289;
        Wed, 23 Oct 2024 09:21:47 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72609sm4588382a12.88.2024.10.23.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:21:46 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] add sof support on imx95
Date: Wed, 23 Oct 2024 12:21:10 -0400
Message-Id: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add sof support on imx95. This series also includes some changes to
the audio-graph-card2 binding required for the support.

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: fsl,imx-rproc: add new compatible
  ASoC: dt-bindings: audio-graph-card2: add widgets and hp-det-gpios
    support
  ASoC: SOF: imx: add driver for imx95
  arm64: dts: imx: add imx95 dts for sof

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  58 ++-
 .../bindings/sound/audio-graph-card2.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     |  86 ++++
 sound/soc/sof/imx/Kconfig                     |   8 +
 sound/soc/sof/imx/Makefile                    |   2 +
 sound/soc/sof/imx/imx95.c                     | 383 ++++++++++++++++++
 7 files changed, 542 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 sound/soc/sof/imx/imx95.c

-- 
2.34.1

