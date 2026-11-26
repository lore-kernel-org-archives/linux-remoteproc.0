Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795659650;
	b=jK7Ksd49gLxKGjMXwon4KSWM6dg5RFR77qyUiYL8dha0koChEingnn0xpqCD18+s82FL
	 NN4pQQAMriyelfLvA9yT6R19K4hPEDlH6qGxeYF/pgLe/YtmIMuAZNj8GPttf7K5+6mjS
	 bHwtyQR2J/Ad29Nj2mqZu64ENCaqoGkTPSwy6fA3dCfqMTQ67oldcTeL1k1CZSX9okY4X
	 hPDO/rUEzAuIDVczS9s22Zj0hBFg28/SjUrV429AczcCoZNHVl+HXJ6wqWCzESISQjPd9
	 tkdlE/5nMNx7QU7q+Ei4GHNGc3RGs1nVBRVxWO9wy6G1mVoUvcCxASLfvMVXQMT4e0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659650;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9ICH6jzRveYr7sN98Pm6PxuRLL1mzTItpfOnDtcHUic=;
	b=Y5+c7rDE7rQKImy5zrXJDAXr1BA5OqMIoPM/AO2Dqpx5oF0ppvXdcsqBzwzZ5o6o0DQ/
	 ZoR6Ys+wtrjQqQqGhbFVDhK/ruUhFYniAy3RIuVwE69iiLZz5MzEx+YeuFhCfSWTfubjV
	 Na4cofOCAz2L3HfZRPdaAwDXZoEwoFJjtaKvECT/owe5ZKMGl7vpGPfe/ze1pRzWsYDiu
	 R+vBHLBAAaXnXeDu4xAO4KIjzynYO6W92z+UQgYiN7lBzxMw878N2vvNC6EMKmBCij6pW
	 GMXJNtqA7VRdBL/yfCKLRbJYBuyod2PZbtHVPmwkxizCbehEmAxGCTgGSM7/1wx31YQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A79PxVxb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F80606A321;
	Thu, 26 Nov 2026 02:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A79PxVxb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795659650;
	b=PMxGB/VL0tWxqujylA4U2Hsj8dQrIHM8p0nl1YCL1x+nyhq6GvEm21jyU3ijjUVs3x7I
	 EGV9lqGtjpdpF21nHiN7HFCFaG3rqSxFCXHr2HwdnL+mOoMonMLzK/01aKL9eIaU6WmPW
	 Rn7CiqMUZJfwWTxv2S88znFbQGlLDe3rRGBiRK6mxdBEczZcYcdWomehpPAeNwFlCiB1k
	 sS5yiIa4UBf1i6eu635WG3jk9AZ0wo3DlzyHp4Fa8SX5XUNmYNYMqezANXSmDs21Hbox5
	 V3ft8zQcmOLbUpHnblTuY2Up5q2hYNlh+LkLOa9f+inFMsh7xCwtCtusWanoWfD91NQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795659650;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9ICH6jzRveYr7sN98Pm6PxuRLL1mzTItpfOnDtcHUic=;
	b=RSH9CxmBfMdweTU3q9/5cSwPUlWmeWD5c/j3RsDxJ0m/39yRKgydsXZ+ih4nkrVqOWVC
	 cpsjmytVahMzwURS6xK2hv8veHVaQv7UDk4NUvHXGaW3slyi/bymSJSmVPmhe522HmHQj
	 YdyZ+C47+WnNHJHc+QU1ItibuftfevMHfEbkNLCes7+lxVPtm5QrXvgEp03jqT9O+SlBb
	 8EYRNWlUOc209ZCUVqhUWHMKcCksDYJGSUTLryUheMIMHSmdl4NzWPvBhwoutmZkL55c7
	 X6CyQbj5OEQa+vmPa1JiOHz986xbHFBXBUMANIhjlwLvAq/JM/TX0dRuhj4S1l+Tk8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 066DF1F000CA;
	Thu, 26 Nov 2026 02:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795659650;
	bh=9ICH6jzRveYr7sN98Pm6PxuRLL1mzTItpfOnDtcHUic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=A79PxVxbUqBeZe/Exidqlh0p/iQrfTuyRD/bM0J2f9kz77qZDHp7GE38QT65Uxltn
	 JtusuiBJ48xXbCPAdbuatz7cchqBDpNToD7wKgk9ASGpDcmGy+TjqRRMFOcmAuwhyX
	 iyFE06/VxBXkF+S0mzPDpPV0Nvb8mxlLU6fCAYzNdCVpcScbpoNkrSfoILD2tZvCZq
	 J6RSRIm5LNRvEZI6qSfCHMK+1ZcltQHp5AAlu255BYCpY/16JFj7cn5R0UgIynD2qA
	 iA0z6irR3kvJWgOnmQnyNDHIut9sZiDJTyONAtv1Kg7EHtuVyLvcONRC6+lc3Vzxh9
	 JzNC6o1XdkoFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 852D34D1A0;
	Thu, 26 Nov 2026 02:20:35 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 23:20:35 -0300
Subject: [PATCH 2/2] arm64: dts: qcom: sdm630: Power the ADSP from the SSC
 CX rail
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
Message-Id: <20261125-sdm660-adsp-proxy-rail-v1-2-b91784c69623@gmail.com>
References: <20261125-sdm660-adsp-proxy-rail-v1-0-b91784c69623@gmail.com>
In-Reply-To: <20261125-sdm660-adsp-proxy-rail-v1-0-b91784c69623@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795659634; l=1000;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=vvfBXxukbqq5MzPAqDR7snLRrnKmtOIK0SM+DFfx3eA=;
 b=u3Y2Dg68BstIxRMFXbdZlmBYQ3q3sTD2+AUVxj2nF8Tsw+O8m0+wKMHZEWJEvLrnHQm0SIl4T
 D/zyfT2Z6msCcuxCSF2o6847kL75znTjoLpGQtnpppgGZAAcJ0ZcwZX
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

The ADSP node names RPMPD_VDDCX as its power domain. The rail the ADSP
needs to boot is the RPM's "rwlc" resource, PM660L LDO9, which is
RPMPD_SSCCX: with it voted the DSP starts again after a stop, and with
VDDCX voted it does not.

Fixes: 7ca2ebc90a46 ("arm64: dts: qcom: sdm630: Add ADSP remoteproc configuration")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 20225732e4a8..90990dc36b01 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2414,7 +2414,7 @@ adsp_pil: remoteproc@15700000 {
 			clock-names = "xo";
 
 			memory-region = <&adsp_region>;
-			power-domains = <&rpmpd RPMPD_VDDCX>;
+			power-domains = <&rpmpd RPMPD_SSCCX>;
 			power-domain-names = "cx";
 
 			qcom,smem-states = <&adsp_smp2p_out 0>;

-- 
2.56.1


