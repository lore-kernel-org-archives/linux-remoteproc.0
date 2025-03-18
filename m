Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FB1F9DA;
	Tue, 18 Mar 2025 22:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742336678; cv=none; b=J5syIvMujBt406Mg54UtJuZB4mb+0ecPLvf7yJvb5luE9IH0YS9dxcbyVlr01zW93RNRONmbO7IPuQSsx4Hz+znw08Q151r5UspfZU9u8Du6rfA2JfkmVDDRL+ven1ztDsMn6lksjA8SWEPaGK7tE1Wvce/Zb4p7Xfm9e5jfHbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742336678; c=relaxed/simple;
	bh=1kIVihgqc8aluSZgJJicYxOEEtfe4zDvBWptMZBFkrw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RLo2VzKJbd7FTRvEVf9epdJ7NuhSMb80D0I/Fw2nfsdreWFv7Sd05fqB0571E4xIQ00gDXOT5kuSV/exmwAHADthMditppYTwni4O1Mo4Q2t2FCUKL6Kjh4WL+NM3muYJQWKhgSEl1ZoQatF7DABZjcDRqZY43iTA3Y0T9+ztZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IJP6drnC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IJP6drnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742336674;
	bh=1kIVihgqc8aluSZgJJicYxOEEtfe4zDvBWptMZBFkrw=;
	h=From:Subject:Date:To:Cc:From;
	b=IJP6drnCoopWboiMcMsU0/pSrwjl5jDWiMPDTwCCSAztV1dm9AZwIUdn+wp3OOC22
	 kynMnvERfpExm96Z+lsQW8xW2ZuNyhs0Lv1qaEE5oPPaMavV+yrIxJn5iQAx8Qcub4
	 uvkXIa4mfWTtzaYtUB6wJnhZrLGjDgaEsOHT60gt6DXl5/yxFnQdCI04SEpeVYf38Z
	 AeKgfQFVDVAgVH4cGTEmmMLBgpMstzUgh1OKiDHx0yQ+ql3jq74ujqDUFLuKsi9UCi
	 S7ozqFtqHZ305Z+kIBRkRnrPzuO9nrF23hJYSCfpheoNKE+h7AV0H2vSLQznZq7Xj4
	 o/upThrAyY3kg==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CEA517E0B25;
	Tue, 18 Mar 2025 23:24:31 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/4] Describe MT8188's SCP as dual-core
Date: Tue, 18 Mar 2025 18:22:14 -0400
Message-Id: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABby2WcC/x3MTQqAIBBA4avErBvQkcC6SrQoHWugP7QiiO6et
 PwW7z2QOAonaIoHIl+SZFszdFmAm/p1ZBSfDaSoUkZbTG5Hf/Yzui0yLoc1tULLQQ+KAvmaIKd
 75CD3v2279/0AsBdsE2YAAAA=
X-Change-ID: 20250318-scp-dual-core-mt8390-8ef1b02f2d92
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jason Chen <jason-ch.chen@mediatek.corp-partner.google.com>
X-Mailer: b4 0.14.2

This series updates the MT8188 SCP description to dual-core and prepares
its usage. Patch 3 updates the MT8188 DT to describe the SCP as a dual
core cluster and patch 4 adds the firmware-name property so the firmware
can be loaded. Patches 1 and 2 are dt-binding fixes for the SCP.

Depends on the "MediaTek MT8188 MDP3 Enablement" series [1].

[1] https://lore.kernel.org/all/20241218105320.38980-1-angelogioacchino.delregno@collabora.com

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (4):
      dt-bindings: remoteproc: mediatek: Add missing minItems for 8192/8195
      dt-bindings: remoteproc: mediatek: Remove l1tcm for dual-core MT8188 SCP
      arm64: dts: mediatek: mt8188: Describe SCP as a cluster with two cores
      arm64: dts: mediatek: mt8390-genio-common: Add firmware-name for scp0

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    | 20 ++++++++++--
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts        |  6 +++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           | 36 ++++++++++++++++------
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  7 ++++-
 4 files changed, 55 insertions(+), 14 deletions(-)
---
base-commit: 04b0d54949f9660384ceefc6f707e40daba6bf3e
change-id: 20250318-scp-dual-core-mt8390-8ef1b02f2d92

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

