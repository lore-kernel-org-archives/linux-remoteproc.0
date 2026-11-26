Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795659639;
	b=Z/uO+MZt3jIYl86hObvNKp52oFbRtXt4NQvYjMoRKpmPzfBX7Ffs4AqjDoeSn19Re/JJ
	 6Seh2vgIMv1o0sg3SORy99cSnmYTniYJIwUVZtT5/WKMW6MP6E9rfeKMFc6zfdZvFQPHT
	 RMGYd56rPGokRpY5ZeLm6WxXYYeZQu6ER861r1qZBJqkzBpeYy7fmcUx6LGB7/MwYigeo
	 wUo7Eqil+QlC9UkMI6vzLSoeiB/pQdM7q8LEBQM4oXmJW3QkZTxvWq9oDwFsY+u88ZNWW
	 5hJlDGu1+Pgp82Xojjlo2dgLwouGEmpD2CU/zrbMR0CG56fR7OaRLKlQdVduReajBNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659639;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=WnePcuwevgV26kVkAvmfJCbG/76NPHcQYJa7Bah0gyw=;
	b=aCIneyBFX8BfaVBpErFCUpGeN2EgDA9k3ORhuazBQCS9rChIDaw7DN/zB9mSvyZdaT42
	 XYrOpMoSeMHWD0J3zRtbcGejGX0BvVA9dyDup1b5zoJvn+o61NMQZikEOH4RFXIYnfDaU
	 nShnyTLyGRJ8YydLbTR+BxlsvnKLacFP8+LW04sTqNd4yCLaWoHd8FNaIBrXsFbRgfiqD
	 05IwQx8TY8eUh7YVBb1tXoXDuJw6g8zF3QLuGYwFbhkBJXiFZ+r9LnStcb5M7CGgDQ8f7
	 lP0uzuZ9ND8PikYSjPH7k9P+ZojVKc2jca9IDUEcI7ExTj0glbkKXZ0ZLSoMOT0Xd/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l78BYZaK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6174C606A31E;
	Thu, 26 Nov 2026 02:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l78BYZaK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795659639;
	b=RyCl8qhYh3ZLq5pGt0uNpS4HkeqXxYZQRPNrNeiHgw+YbIHB02WimGRMAwZ/X325UQfV
	 7L4kv2KIDL8IOfjQYxbEzCHmunzeY1VC3UytUZAH7kI2Z2igdC1MgM6tVZtNd0vRaorrz
	 Kq51bvh46NqmlfmTef/25UZTIEIzVIu3N4PZF4f5WDs4ExHLfP+6NBuMhgEDp4oUhdoBP
	 xb4EXV29d6a0htzUz++EymTpFpKnB+ADU3186bxbgVTklXzWmzi2paO90M9dOB366sMhf
	 jVB2rqTIdW/n0CaejO1fCEJbDrnWiu06nAr6pdAH02u3/QEOkyWtVyBgzK5iRSdQ5JQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795659639;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WnePcuwevgV26kVkAvmfJCbG/76NPHcQYJa7Bah0gyw=;
	b=2UL548w8VfajNmI6CuhFf19N6HI6FLfXnHrej1u58xm2XXRMUp8DBXWgP3BKFiPrCzZP
	 xKf3F4CuJvBbkstljEm33UW8QNdZDe74lkMqIwGbuHLpHLM4zimlb9fQsauNJ8EPjWkBv
	 YUrIJphW8o5WNHRF+O4lWI46HXggx7zdRxTAi5JNMKfQAFAQ5YUPyl/Xw1MJvQkJ3Kn0D
	 efsgVSQWY0cDdjoKaHqBFRd5JKgyEI0eEsIp6vVUA+aU0FbMl9DApzXLcTmct76krkO8J
	 iyW3H1X6EBml7UCdcDRe8K90q/xmbGc0sRn2tzzA9gDIBeMC+5UvTSNwGA11JVg5F9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E030C1F000C4;
	Thu, 26 Nov 2026 02:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795659638;
	bh=WnePcuwevgV26kVkAvmfJCbG/76NPHcQYJa7Bah0gyw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=l78BYZaKmsD9kQceAxVfKRgMvd8Xijj0erXzE+Sl8PMD33S0q1Et18D1SeH7Uqp/b
	 h4TENEPhiMLTa3tWTYxAd3rk1W8ytrI4F4MhCLFA0oP4c9MUMR6rR+nm5VWX7y/4n5
	 /hcFfOj8BYijR+IuTlJZ+6bLOfmkwNaFTiuEQ/UBiqC6CJhhaJYgG3vlmbvQeuHc2v
	 EyOls/BMCwqm0pOAr4+26YhV6DoEARmgbBvAAsyK1BPgYMmF3KtsZZlF2RB0BDQ7nY
	 NYM30LdXOcrVTUX3Bpk05TFrevPse1mkhnMNeahzDQX/Ss7YuFAwv6D/bvUIp6EGPi
	 2s/x1yQwSwFVw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3ED554D178;
	Thu, 26 Nov 2026 02:20:35 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Subject: [PATCH 0/2] SDM660 ADSP: vote the DSP's rail while it boots
Date: Wed, 25 Nov 2026 23:20:33 -0300
Message-Id: <20261125-sdm660-adsp-proxy-rail-v1-0-b91784c69623@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPduELVkRX8V4mKxojcLSosEQ3
 p2hx+/w/wsYq7DBqVpA+SMm41DgDhV09zjcGCUVg689OecDWnoR1RiTZcw6zl/UKE8M3ISmbY8
 9UYQSZ+Ve5t/4fPnb3tcHd9N+g3XdAJYvCo16AAAA
X-Change-ID: 20261125-sdm660-adsp-proxy-rail-5e757998f66a
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <lumag@kernel.org>, Martin Botka <martin.botka1@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795659634; l=2228;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=SC6vWKcK3HXEfRgQN0qt9mObuOdi9RmiKKXpA6CHRXg=;
 b=q36PbOxzt50UA6rVsCtatmP0aF4LvZpFqnEefswkoGom6OldgPv0RlFUG9gLdviBec8fVuwh9
 eG/lhlhGp0YBX4AxKiqTbowJ6QU2mBxwVv6eLrd0cblQkCFbCQJtzOs
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

On SDM630 the ADSP starts once per boot. After a stop or a crash, the
next start times out waiting for the DSP:

  qcom_q6v5_pas 15700000.remoteproc: start timed out
  remoteproc remoteproc0: can't start rproc adsp: -110

The driver votes no power domain for this compatible while the DSP
boots, and sdm630.dtsi gives the node the SoC's CX. Downstream votes the
RPM's "rwlc" resource, PM660L LDO9, as the ADSP's supply while it boots,
on SDM630 and SDM660:
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm630.dtsi#L1737
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/sdm660.dtsi#L2008
https://github.com/LineageOS/android_kernel_motorola_msm8998/blob/ce9ea8f125c7302ae9b2fec84f23a69271e957c3/arch/arm/boot/dts/qcom/msm-pm660l-rpm-regulator.dtsi#L194

Patch 1 makes the driver vote the node's "cx" power domain until
handover, as it does for MSM8998. Patch 2 points that domain at
RPMPD_SSCCX, which is "rwlc". With either patch alone the start after a
stop still times out.

With patch 1 the driver does not probe a node without the power domain,
as for the other users of msm8996_adsp_resource. The binding does not
require the property; sdm630.dtsi has had it since the node was added.

Tested on a Motorola Moto X4 (SDM630), whose board file is not in
mainline yet, on sdm660-mainline's 7.2 kernel: the ADSP stopped and
started five times, and a fatal error and a watchdog timeout injected
into the DSP both recovered. The SDM636, SDM660 and SDA660 boards are
not tested.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Fabricio Akio (2):
      remoteproc: qcom: pas: Vote the SDM660 ADSP's power domain while it boots
      arm64: dts: qcom: sdm630: Power the ADSP from the SSC CX rail

 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 drivers/remoteproc/qcom_q6v5_pas.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261125-sdm660-adsp-proxy-rail-5e757998f66a

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


