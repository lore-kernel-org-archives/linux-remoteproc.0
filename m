Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C70426D07
	for <linux-remoteproc@vger.kernel.org>; Fri,  5 Jun 2026 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659477; cv=none; b=mZeqxPistLeMQYo7C3zKGJd0ZRrT1YA06lYA5pR95NHLAvdV2N2yAl6RoHbMbuhphGrm7Af8+Ban+5KFQf1uJlW5Y7VafJmoqs5rJRlC9aFSl5xUOZ6TMlSJuKt4SgXvOCRS++Z6DYlBYBvtDM9hkJL/eqf80emCoe0AdsjRn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659477; c=relaxed/simple;
	bh=ud1+XTOztQEAwav4x9KhbkFv14fOVw5zbe6eOpJ7gUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJtFBtgOmQ03UGmPsh1eHJYyQXGdISBkee+qDV5jRAKhutblmJMHbxfY4bsfxN723E0zNGOjA7Lj5itN1Hgm4LPC06QuXMSVBpE6oMT387csNYr9hlNOWiSPDkjePQrINkWAK2eebu2kIe4lcdDzqn3NnlYW+OAC0Qjahwbd0wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LiO6o03K; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LiO6o03K"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1037202f8f.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 05 Jun 2026 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659475; x=1781264275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3r95IPdKLEoIca50s981PYU1XFf+JhCBe7GdZYnQ8c=;
        b=LiO6o03KzxpoA8hVBc+vIFXU4BjfWLV04t0T7W5VlnVVefIsrd24QcP1JnxG45Ot69
         BCNp9EeqoHOVupNDSlb0xRTAkpgAqK0V6Eo8yY/1asKrSMIi9OXgP4SZnozuHQtCwowf
         Q7NoQPFpd0tWf5pBuC8u1XawavYxBRl6c7oUKWL5OwB/XggDa8LfH7cz3aobWt9ERP2V
         ZqdxZyMSrZV7151WTzSHq0eHB55WUGLA029wZD2JkspsScrOcc+FwxoqlTU7uG1STItq
         wVD/GWqQfH97YFtTolHo+6WY1Rf78020zaB4EeutyXjH+lsDtjWxxNkHeHC1ztlWnyaY
         Ifvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659475; x=1781264275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3r95IPdKLEoIca50s981PYU1XFf+JhCBe7GdZYnQ8c=;
        b=b+TXmrPKK96dOc51BRQpU2Nyoketx8omXh3im6fEUEnKdEWcg0P+17Q+uk+guMTkXg
         mRedn5DMxh8toUlSpQMdp+5dy2QglATVV6aL7xaPCUFn/FdKmTYuhLCovyW/TLus46z2
         RXR8gpL9nol1aiFHO1s+HaSLWpBxXxFDo3BqDrL+mDjJbxUMCoxunV2ZoGlLqex2ejms
         hMKdoxouCVHW/VIQizb1xLncm4GR7XLmb4cIs/YSGZe+1BLihkjkia5h9nfLZdROd2OQ
         cxhfIwdpsRaTGXlxVds+Hm1grknsyoe2MphPBdpflM8v0G2OR0ZxMLUgXI+yGtySQzbn
         sjCQ==
X-Gm-Message-State: AOJu0Yx3BCbdlL0ETRrFnKsbP06FqcJg2FKCoLOMrkoUAnOhc6MVW5tM
	uTuNVwKv3yJRcAZoTewjq/UoWmm0DYRbV1ATHvxCACjgA1gZDUNEuR73
X-Gm-Gg: Acq92OEZ0CfvRbHAI99CIIoGeyKQ4AAUKKcL3NbL4rVfoofY26FbPD06l7E8Lxyo4OG
	atdKnuAjbYBg2AYUZEmH0z4yV4Oayv5tBdcXVylDaoKqAuVBztlaDyFgaH90elvBeddbBZcbgMD
	t4sslV1MN8G+vVffW9Q0QjG/VhtMLBaQHxoyEeuPpv/tui90Bp8qBgNtoZuJ2dorPmjetTHK8oX
	6CQ0Fl59zbRhtiR0TtaRWtZbc82Whlqws+XNmxDcEumIe9HR4SGPh664y0YFA/sBAdViOOxyLJs
	h87BcT6/nzaipN5zF6qddnocaaUUJ/aqsvD4y4ESxfnH8rfPTecEPmx4/uofNXaOLndOcLjCpji
	ylQProDjR7y2tF1wvvMtdPnz/SZjGGbyunuO8LhPWHZyOYSl0zMPCuZ1PuIob32nkfbPhvOrX4W
	L1+GgEFVEh+8I9n5SV607WDgDEUGNEAylOrBIL8Hs8E03MTYy4JDfLlk2UlZVv
X-Received: by 2002:a05:6000:bce:b0:45f:f142:d56e with SMTP id ffacd0b85a97d-460302e4674mr4256841f8f.13.1780659474765;
        Fri, 05 Jun 2026 04:37:54 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:37:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Add RPROC support for the MX95-15x15-FRDM board
Date: Fri,  5 Jun 2026 04:36:17 -0700
Message-ID: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Hi folks,

As you can see from the title, this series attempts to introduce/enable
RPROC support for the MX95-15x15-FRDM board.

For a while now, the imx_rproc driver has been using the reserved memory
DT nodes as the carveout names, which would force DT writers to go against
the DT specification's recommendation and use non-generic names (e.g.
"vdev0vring0", "vdev0vring1", etc...). This series also tries to fix this
issue by introducing the "memory-region-names" property and using it in
the imx_rproc driver to figure out the carveout names. The driver will
still allow the old way of doing things (i.e. no "memory-region-names"
property) but a warning will now be printed since this should be
discouraged.

---

Changes in v2:

* change commit message of binding patch to describe why it's needed
* drop restrictions on the string names passed via "memory-region-names"
* drop patch moving the CM7 node to the SoC DTSI. CM7 node is now added
in the RPMSG DT overlay
* rewrite commit message of patch removing some of the RMEM regions from
the bord DTS - previous version was a stale version from first iterations
of this series
* change "micfil" node status from "disabled" to "reserved"
* add check against rmem phandle count and string count mismatch
* include "of_reserved_mem.h" in "imx_rproc.h" to avoid having to rely on
the consumers including it

---

Laurentiu Mihalcea (4):
  dt-bindings: remoteproc: imx_rproc: document optional
    "memory-region-names"
  remoteproc: imx_rpoc: fix carveout name parsing
  arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
  arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  4 ++
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 ------
 drivers/remoteproc/imx_rproc.c                | 13 +++-
 drivers/remoteproc/imx_rproc.h                | 21 ++++++
 6 files changed, 106 insertions(+), 23 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

-- 
2.43.0

