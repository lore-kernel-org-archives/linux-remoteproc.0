Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794844258;
	b=e+jxGwXq4ePWVNu6aj2jGA41sjO3vnpILdLGNwGbaadvLUY331IKtBxKP43EoAGh5zXf
	 2GCUMwkr3UHNmHnsbWHuojbt7XkJtlADDxhIAhEt5rePBzlNXNRgGyoxZZAFem+ehWR9w
	 wCKNjJp+U/DNiNcikspbiTKzf6pyiJVjTT2b3GHXkBBvFvz9Qq+Ns0DuMbCcSaPokFRjy
	 /MZtCpWoXWACEOtWhGZ9j5XHQVkZcPxoRhPGKJQC+yWiOdXl+WV/saZ2jryNNfWnl3/gh
	 nt5YGHen44baI90zo+xMJd9DbjmTbZrs/IBaJ+7v1rNG+G3+KjlTlevSZhki7XbBCnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844258;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=/Wr7rLgwPO/kl6sPu2xqiUA1pdDi5+xjSNosX7o2cpE=;
	b=ky7Ig18oCa6ILBu+ac+JocAnT8ZAoiFfFtAVaqWwGK71C29mGR6gFXrqbr8fCKDe7vix
	 QlGiyHk4Wu20UVxIn3MXG5w/+GIceLVUQu1HFkS9BmKEGbMn/SbZYTB7cfKEyT4+T0wd/
	 t0fcWYXp8f0tqwEv2q/vwgroZvxQ4rOrA+znUx+cPjTTDwel3xjSeOdqRmNrAYPnb2PlR
	 oFaWFIb9koYd85dzlVHHb1Q481TJe88jZnZu4cU6pdo0GJNC5KIsyoqEytjsp2jf5m16Q
	 fiddg4Bk10oFOehUAqDa4Z/ypLZ/2PoqixByYqUuuLHBoijOP7CfhtiHDgJiQ2rLQVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixp5V3Xs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0631606A322;
	Mon, 16 Nov 2026 15:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ixp5V3Xs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794844257;
	b=2WmeOqr+7xBZa9fVD8PAmbdwXsRhL6oS8r5ujCx1Stsc+gBbeKBax4BA1+OGwbKn0Mby
	 20nvg2+JhS7yWpKfHKzbYhyZYNb4QAzEH8WU9tz6iWMzAIva6kwe4A/2c2C3PUUQssHEV
	 OlXIQrQCvsm/3E1e1EOUa09eLdhj5z5spMD+8Ytci1W0VcEqSHFpFByEqhn2fXoQSOcHI
	 1eGoMwwASyntxHxARvEEufzrDjekmO30BC7dVHWgPW8T1xN5SaMMaupJxM3MD8VqByNpH
	 cil7sYsFntByrho5i3I1Kev3EungtM4mvluJfYCrBq2ReHItFZ154Q9LFw7UlcVlW1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794844257;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=/Wr7rLgwPO/kl6sPu2xqiUA1pdDi5+xjSNosX7o2cpE=;
	b=qs+EAjDk250MUh3z5TyV6X5bDdut8qkmyoXJMeXnFsXPYc2vQX5qYK8HKhk5iR6qtJc+
	 B85xmANQqKwh7Xrs1OChpGJPkYPtHAzxvzci7sTSK5puRxhbVw/nVsuJaIxH+rPg4YRl7
	 /zAWd6xC4kxZ4cwCNzrFBPvpnG6N7plIpsvr052WLiwCDUzuWRQl8iJFGZqKmicy1bUr/
	 aGbbqBiEtGwMUoR1Ztx7yOuep+BcAYJP+DSUJj6mT84dQcCmWSgkv5pTJEPRiA0wgsgrf
	 PNxdCbRfz0xRplkh7XK/omikhbntHyJ4WrohbvmdBhL9+Q2L3bALeOct+yzV4m3THUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED1F61F000C4;
	Mon, 16 Nov 2026 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794844257;
	bh=/Wr7rLgwPO/kl6sPu2xqiUA1pdDi5+xjSNosX7o2cpE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ixp5V3XshpHG+KnKN9cG4M87RVl7cmSXxcEDXm7TJFgh4bE2Vh6SVJd9LrluNYacY
	 WKVQImTqXp51NbMHbbYhxHuz8NeTvpVaVQ7aqcek42P9vD9MtoGRatR6pAu7V4IaxF
	 A6VveE2T5GBL6sKPKn+VV6Btd4Bdr1V9n0PezGISTvrn2cCfncJYG1BQj07fl3DY+X
	 OqvmxjKl1nOVvT28qe9VyUqqR+IEb2uEa0PSH23TNyQE0VyFC7wUPDz3w4Z1Ibun3Y
	 27uXSUipKxLM0wz9RaLPkvqzOi/VR6+l3Y8s1jEdzQsRP7mFDqecEquIdvTX+zhhZg
	 Jb7poZ3j9hM1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4EB914A4F4;
	Mon, 16 Nov 2026 15:50:56 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/3] Add modemsmem for Google phones
Date: Mon, 16 Nov 2026 16:50:42 +0100
Message-Id: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOyw6CMBBFf4XM2po+eIgr/8O4gDLImBRIiw1K+
 HdbXOhClye558ws4NASOjgmC1j05GjoA6hdArqr+isyagKD5DLnJc+ZGRo0zqBhZSUaLXjB26K
 GsB8ttjRvrfPlze5e31BPMRAXHblpsI/tmBdx96vrBeOsUrlK6yxTh1ScaKZpr58Qq17+9WTwv
 p/6eOu6vgCnQOQT6gAAAA==
X-Change-ID: 20260906-modemsmem-9a1dc1070f7b
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DdaxKAZ4pdHBSajOP2q91sjAXPyTMnm5rH95OLafWRI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq+yZeP42NQmDeI/FFrlkfauje6HKyxzmxLG95l
 VDhrnJJLAyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavsmXgAKCRBgAj/E00kg
 ciSgEACuAx5BfkA0+fpOXO2lxUj8e6wt5O3Q+0aOZcwR9SeAjX/bKm7P/xxyW5cmKafQyItJt35
 h4YUEIPNMvAsgC5Ab8mY1sVyBHvuHbbPa8WSiP+/r0eznxwX2AyPK9CrqoJIrcqIUBZVxFecdk6
 6cguaWrPUv3NQPTqYLkunb/1wP2XosF4d6oSIkBzo3MW4p4SGE2CKOgQZBO9mpynX94B+jEUH8w
 yTZjCbYow4YF38eW7/3+dQNlz9k0p1iSqhdcemwgn2/BrkO2G2MGKj4W61tpnb+GfLP61UZM4ex
 2bdyc9gnJIfeL/2USoyaYP3pYIw2M09D50VcAlDMNtOB5vUfvOZJm+Uh9NfR9TNk0tkeH0ohNfl
 RZtWER6EB9ZrfdElsoBpXJC+q9WsqFmodZXMK2i3AsWMwpmDrXmevFwqpeIgI/3s6LVhJf48G8i
 i0ObwMTdQxa9BligbhTzP+7xVCAGUBeB9dYYFZd2S9Pnobxq7hzioImkdDUBonzyJn+44oHJJ0x
 UOXohdq57WJAa2mpW2euyGU66VNrkxjT1UVfju36Wb642OIVlg2wWHTYbSlTWo/SeuBGAMCi7Rj
 yFm76Ub74ovUr2cIGspgv3Cqb0sgFOvy+EjE0g5LV5sBqh0JpBfFuexE7SIgUyXhdZjenaof6/s
 2FASUPL4KlzrIEw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

The modem on the Pixel 3 family will not come up without the SoC
information Google's downstream kernel publishes in SMEM item 134.
This is the upstream version, modelled per review feedback as a
property of the modem remoteproc node rather than a standalone node
and driver.

This replaces the standalone drivers/soc/qcom/modemsmem driver from
the previous revision: per review feedback the requirement is better
modelled as a property of the modem remoteproc node, with the
conditional snippet in the remoteproc driver.

Changes in v2:
- Represent the requirement as a "google,require-socinfo" property on
  the MSS remoteproc node instead of a standalone node and driver.
  (Bjorn)
- Move the SMEM publish code into the qcom_q6v5_mss remoteproc driver,
  gated by the property. (Bjorn)
- Hard-code SMEM item id 134, no qcom,smem-id property. (Bjorn, Konrad)
- Drop the RFC prefix.
- Link to v1: https://patch.msgid.link/20260906-modemsmem-v1-0-a3634b553841@ixit.cz
    

---
David Heidelberg (3):
      dt-bindings: remoteproc: qcom,msm8996-mss-pil: Document google,require-socinfo
      remoteproc: qcom_q6v5_mss: Publish socinfo for Pixel modems
      arm64: dts: qcom: sdm845-google: Require modem socinfo

 .../bindings/remoteproc/qcom,msm8996-mss-pil.yaml  |  9 +++
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  2 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 75 ++++++++++++++++++++++
 3 files changed, 86 insertions(+)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20260906-modemsmem-9a1dc1070f7b

Best regards,
--  
David Heidelberg <david@ixit.cz>


