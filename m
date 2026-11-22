Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354589;
	b=pALL+Q+V2Pn4FRilK0nbQDhmgNHOpcDTP8NtAQ3TI/W7qWTML/a6lUVt8lh09DDf/p2F
	 Ke3XH4MqH8yI4WmjsEpdcGW1CuAIUOO62uqNvhT47A3SEEGcHbno0DEPg1zYqPYXFWLo9
	 Jw1QLe/xzDm2FI6oBTzMpaEPnWF+nh+C0cj5ZtGkAyRYw70c36w6vEUQe5pVKiSI2Q8sZ
	 fyLRXzCBfXhHD+iFBLULAeEgnOJfZpT3ulFTLuKA0jXigoF9X6wGY7Pci9UxeGbpXmCpS
	 /0V6korsFfJ5wHsKD+jaMiAkyQ42XcKo+4s9B1+1ML2eQkOHhRM43MD13qGDgCJ9Zxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354589;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=2g9Hgex6ZynThn+RExZJkDzcMu1b6P+6BZ0CQTWZB38=;
	b=eLoA77poUeNDrspyOofPQBSXe8D7Y/BTJLFeXAJHiAUZDaGUgR4ZO54DrfDiaLqeKToG
	 ysOMWfNRA8W+szmTYUNzM9pUw9VlyhuuGchs/VU62QQO9hMHDdrtG6Fn50GqiqGu3F/O5
	 sxD1o1Y3jUiO8vUExPr3pMP+05BPnvBmBcspSooIG/4DiDF0/TNXek8z6EMVBWL9jYSW1
	 lP527TJQ/a3/54622GJ5GngqY3zRrheaNqSq8PU4Qg9L2wd2iXbakS6g+KazuvdgqtTeV
	 afGTqmeFijw0kA318TOSM/rYtPikbj52K5qAejpNUnzmvnGoYgse6EsT2zTCH2g9OVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oavs78Xa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088D606A320;
	Sun, 22 Nov 2026 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oavs78Xa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354589;
	b=av2EfHQia6RBZJ/EHUG/iNIkrj89hR/k2SBUmKAEOaHYCQGR1tBmsecFFwxQbqxEvShl
	 mAWOp9YO+2OtkuaFYtxF34LO1Pzu9m0biE4CMl5pBChYP7qEmYX4z0GS1noNCTSxnKcIa
	 q6UHrOp8Hrrkmin1wMun+WO84K+93pZ9kkgBMS3Hz3XvRYJ7k9nmloVbmZC+tEcxL7Mwr
	 munyQKUUgQednhsarwsSvobG3kyLaxNyx5uMzt+tJztwuglHeEjDZJ+1Qe4wM0qevLmj4
	 tF9OOrn12yF3E5jpKM3gy7pWW6+/YuXXfCtyLLsQWfOoeKa9aCKXaX+mfcXocRpOeoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354589;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2g9Hgex6ZynThn+RExZJkDzcMu1b6P+6BZ0CQTWZB38=;
	b=UMGq0BPUXHaxH6TqvvvqFPLHSKoQCffgTxBKs2h9a2TncXvp2zyKexR22+kdNuq2qL/b
	 ib6P2Mn7mbbz/9c9RrDZa4gaJkLZ7RVTKMnVPeEnpYkNa3UuicWmF98zM2XhipdkSnMhz
	 hIOBDIOjyHftlYMMBjlZ+SpDba+SqyFPFD6rAYzwQFRt0vdJXpXAoVRCsVSmRUUbke4Im
	 bzv/ZDOVLQzf4ZZX0c39ues+829x4gNVzaMAt3vAauIt1is8KdwvuWSfCI7r9IbWMNgFP
	 ERhO289/4WedxGntoKbHRe6tgWcigQyKP2gKNpSyjTPb6+pEsTqJaP5uOTwEnBg5r4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6662E1F000CF;
	Sun, 22 Nov 2026 13:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354589;
	bh=2g9Hgex6ZynThn+RExZJkDzcMu1b6P+6BZ0CQTWZB38=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Oavs78Xa92UBGg1WU6Nhg3ubpKlcdr9ea4SPzmI7l3/irHkEiKlwFW4Bv5PAYeQUF
	 faDjFOxPDFxcfvks6CfkPEtYRvN5aanic64dt08llt1CMiN7+oAwFdQDZzbnnsRfi9
	 0PcQY8t9nntA17x5GC77a1/NttYoazyNHVI+8AFh1wOkZCAa8qXWzGMx0GXGUbbiyl
	 65cUl+uxkqdj54HB20/odUsAU7lcNu8XPgoXPYi1e8gDXU++HMBtyO2bCHFVJGUjWz
	 XocYASk0p9aJlJlUPCEK09XxZrtFaDaEOin/U+4eTx6TiLIheC5VkrB5r1Uvb6CUKn
	 ntgo03ADjJymQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EBB114C07F;
	Sun, 22 Nov 2026 13:36:22 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Subject: [PATCH 0/2] remoteproc: qcom: add SC8180X SLPI support
Date: Sun, 22 Nov 2026 14:36:20 +0100
Message-Id: <20261122-sc8180x-slpi-v1-0-345903fafc96@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA1kRiqJVykuNE7bEbGSURGCd
 ze2y7f4P4FyFFZoigSRd1H5zhlYFhA+3fxmI0M2kKUakchocOjsYXRaxNjaOf/wWA3kISdL5Jc
 cv92z/Vu3fuSw3g84zwuZ6OyUcAAAAA==
X-Change-ID: 20261122-sc8180x-slpi-068895913d29
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354582; l=1013;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=qrKU9PYXKvGkbkcmvxhVdfuizNi7nVFlwY/5ZILkUr0=;
 b=c44unekNOY2YBEd6u7I5O8tBXcxPB8Jx3uKlMdCJedWQk3tqCEgVfXbaq6jaITg2UVzZGW4gu
 oRG0rTGNk3eD6hkm0kBvTCOflhcQbSWtifgcrjaBCap8oLnHkGxZd3c
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com

Add driver match and SoC devicetree support for the SC8180X SLPI
(Sensors Low-Power Island) remoteproc and its FastRPC SDSP compute
context banks.

The compatible "qcom,sc8180x-slpi-pas" is already documented in
Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml and
sc8180x.dtsi already defines the smp2p-slpi node.

Tested on Microsoft Surface Pro X SQ2 (SC8180X) with live FastRPC
(/dev/fastrpc-sdsp) and QMI SSC sensor enumeration.

Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
Robert Ijtsma (2):
      remoteproc: qcom: pas: add SC8180X SLPI compatible
      arm64: dts: qcom: sc8180x: add SLPI remoteproc and FastRPC SDSP node

 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 61 +++++++++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c    |  1 +
 2 files changed, 62 insertions(+)
---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-sc8180x-slpi-068895913d29

Best regards,
--  
Robert Ijtsma <robertijtsma@gmail.com>


