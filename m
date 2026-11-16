Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794844258;
	b=BxZxifjCV0KZzfzKG9S9n3ZlvTyVkLmqMUF3sMiy/cQqcrQUeurRSTtlZPR3Kh9HHyjC
	 qfFf3wnczTrlxFDnpObKDPlcgRzps2GAu5jmYYxfhQ/1EYZy5nPU4Ym2d3N4COP5I5e/S
	 yvJtNWe2kTaD+9RP0kRWEYgsMAvGxpsTsb40dGSIPcNiWW7VMRArYzNAHugHmlUH0qX25
	 T2bRCUIvye768zPVUeJ0wQlyFk5D1+/LyRKVuHK8xiqLIORZhSqWjWny7KOE2g9zEYqoG
	 awGEKRpuASBwwXP333lPbC9J45hBnHvH0/jzvsUN99uoZ1fNazBAVpeFlCLT430F0Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844258;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Or4NikZZZ2rCCHMnzA67i4ix/lYg7mAEFyfG4auz7A0=;
	b=ltB6mu/9/IYcQxEi6v909hZ+ziNVfVdAaSUJeZS6jm8paj40lrVPtFT+mXnrfUqOkXuA
	 ffujJF+1Tluh7xlYz6B6R5paPvgv82Ha2VRBnW/MF0a0r3SFpanwIdBM4OyGSo5rulIuS
	 14VnonuUUtNQvMr+Z0vfRsD+Z9jvCjqHgDUlumuxryglPsEPXOVi/9vn2FRqNEuTvdXK1
	 sPGdgRCQ8sg7qm/uhj5aUneSkTw+OrqG2677LyNkyZlQOHzbpSPMYcHZn+7P1SGvs3qSR
	 K4OtsrROIJuTnLGokTYO3jyViNMb2MFarnlfcMkJ6jSy9E2jkSvafNsjcjwC0EPzI7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOO3qL3j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B56606A32F;
	Mon, 16 Nov 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QOO3qL3j
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794844258;
	b=M9Y6sIOjzpQE/9wzO8rt/GAMbqY5jiJzWOx9ioBPZ8t53+pfOmHfJZiLAhIK7ihUxpEJ
	 hBtmvly4AuFdumSxbSfvYQ/VzSmyXedlakKv29SFLADuDxR0agYByIpF6TrZ7qawIZ1Ct
	 3MKyplHusCMT9akiNiaqhAu55jk19/BD7hcnUSpRYws5wdEtQhfM3h2x3Go6KinCd7YuS
	 O18lKWFU+eG+bPSJJqoanxL62mVhaNM8WZpEdK8M3uK8muNbmm7zogvZQVxXulGcwWZlN
	 cNK7QGxmASP26pSoQkwDYgYt7ibS7OpM8raRR+xvrEwWFJnF1fogryWoT1+sv8lyVKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844258;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Or4NikZZZ2rCCHMnzA67i4ix/lYg7mAEFyfG4auz7A0=;
	b=En6BJ0bBzu+3DwUqGI3cDupPaCX0gO/hlz3TIzCoSQJie8jg/lGI9OjtJQw8LFuiQ4sZ
	 bDzVPprpcoBTAup9DfmqaE0e+F9/UF05zt8KDyOoU+BZNiW+iiEGEErRXFfefBt9QTL6x
	 krdOXOt149z3NvTeIrUMahMNaDd/sAJMsx66ia8FQZ/yajYV/JYM9dbtgLhL8i6uQCwfd
	 WlC6o62rYBOIyUnM5MRZzLzBKBVSrOUKnb5vg6iyMtob1AYy5Q8VtQRNXzVyQqANSJCw0
	 fkuRinKJ5nWIznJzq7fPSXM5V8BxYNUeHQ9R5xJkBHalUVOLWGb2Ywl21XHgoYyNvzg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34DD91F000CB;
	Mon, 16 Nov 2026 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844257;
	bh=Or4NikZZZ2rCCHMnzA67i4ix/lYg7mAEFyfG4auz7A0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QOO3qL3jGoI3JX+PyXtfJTp/grquRY8+HkQCI7wEUuYYJu0VZkNul0B7sTG9mP7w3
	 r2bEytDYpJtdZF+iY1Uf12FKS2aUJcYFsAWbGnK+vPevxbEBRCdlpl4S/ztypJMEOV
	 IWqmTeVPKHy7IFzL/nHgIucyNRLiq3xGnZ8DTNrXGK6wz+OrkRW22URiDAA4bt8ESh
	 sEesKHGPV8jbHwPshWjzRSdVvBLBLAHv4iq4V+hFiP20oUffj4McXCkkNpjG0a/H8o
	 pgiWB6ctcCGGxdkzr1zw+JDsioaIi6ezyC2lvxWCnvlgS+Z4TRoEMFIm+WxFnxp7qu
	 dXr2GZCh600Pg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B8E8C4A4FC;
	Mon, 16 Nov 2026 15:50:56 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 16 Nov 2026 16:50:45 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-google: Require modem
 socinfo
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
Message-Id: <20261116-modemsmem-v3-3-24ebc7ed6eb9@ixit.cz>
References: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
In-Reply-To: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Miro Mraz <mraz.miro@seznam.cz>
Cc: Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1063; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=b1c7/PH/ZBn7CdtqlJWGuvtm6FqXDNuZ6icQBu1gPcY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq+yZfCBjZfqAB9dl+hwLxqMcVD+vRV83mg27jl
 mjt0BEn8kKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavsmXwAKCRBgAj/E00kg
 cpW7D/0ad5tAGVKYbk22HnkEzkUniurD9zTrHxnP69SKU6x4Vk3wz6hWCgU2RkTXbnS3noCyr+P
 xXYgsUeSqtbijHuOeL1RRgnm4KVF2YQoBUTC4ckQjawG4amRkXVdrCCKnS0boFfYacgvo/YDK3i
 nEGJr3UjkJTtSJ1BXFKBBk8NkRvD4uL9n0QlwENblcczRk1UfdUoQWQvyKRFa7Bmic139oHN7BY
 CSyBlFOImkl4BHZfZAgDAR6Sr89z4hODyLsLGezuku+LZHeBEIlV/UlTp7k1rB0214w0z399Rlu
 ogePFbq4kOi1WdobGimlDW2pCh9RWzbSTRwHY95ew8yy7FM3odS3PvqtrTMnSyt2miboLtxNTdQ
 BA2up2/kImr16CTATZ06fKn+IuaUgKU4OGYVrvudnvHqaXLJOTX4SImKsoUBxdHkA+SSGRBq0Uo
 AQObPCpxQ1mnRjJ9aub3RVFJvN8alCSVQmugkknCg+hpQgaM73QgrCnNzyEOAgirNrpuZ0zPzwC
 jVWt/IjpLyWGBld6doRb1ELF80zxfvMLmgeFPb98sMrlrvWixFvULVkHzsA3pT4t/uNpFmJZjT4
 SzMJ72yNm1L9rgKVSBgBczue034etP1O/Pf+8e9KolQX6Tim9mhNMI2iIrrk1SSLtsXP261S78K
 igwr5kv6j4Nf9hA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

The modem firmware on the Google Pixel 3 and Pixel 3 XL reads the SoC
platform information from the first vendor-reserved SMEM item before
booting. Add the google,require-socinfo property to the MSS remoteproc
node so the MSS driver publishes it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 3c9656b88b696..0a18d9a124566 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -426,16 +426,18 @@ &ipa {
 &mdss {
 	status = "okay";
 };
 
 &mss_pil {
 	firmware-name = "qcom/sdm845/Google/blueline/mba.mbn",
 			"qcom/sdm845/Google/blueline/modem.mbn";
 
+	google,require-socinfo;
+
 	status = "okay";
 };
 
 &pm8998_gpios {
 	volume_up_gpio: vol-up-active-state {
 		pins = "gpio6";
 		function = "normal";
 		input-enable;

-- 
2.55.0


