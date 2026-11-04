Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779341;
	b=gqQneqBc7TFyI3P4NJx/FfW9Z+BUX0wKLkpkSs3B2gznkxtFl4RcqE9bzsC0mUsdvO0q
	 8hmjDBcaBIcJLIbLz6H44hUz/CSZe9COMz9wNEgofK3e+IIcv/2mVNb1lDpn4S6SPDfRJ
	 WklIJidrQCMcI1bLMI98hEsSTYeLf0amgAH5e7D4DPEPhRoLEjroFSydRLG2qcaelcqM+
	 E0BR1TEq6ossV7RJkpghOkDAQuFQN2ZQXAu/L6htjRoWBKhBt8+OfZU3f3MjsPFpAKO48
	 OP40y1g7UW8QVobwtehEoEajkZlhGohilpvJpKSYB57K6sfXBdczyJMlm9H+2vcnNfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779341;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t8uP9Ly29iloNSXoPoKSZxb5cyB9+X0Nbm/O6FRZ1K8=;
	b=pVMk6iLkQdoJg5+bxoCi83zClxX7ksiNrw/7ryDSRGMu/r9CXnrSnXGU1TE6Wdvj79OC
	 maQ6drAyhaC/o3NJK7+P0NqKS6bpJpQqXVV+NPmg/M3QwUCS3wdkn/cfQihSTMS738+gq
	 GEzoZoup0hIIKj8bjVmsGWOVCMIJ3yeGyRvVpqMj9SkgTM0O7f0Ussmeq245WBHdrIOYo
	 Th2KcEYif/JIoF8UlDqfv+5erPyR3EPjCfOeEzr+GCayCrQguBJbByi/NrLtjFAly9KhW
	 /zXi8kswZpjU8Y8u6qsNiNmxFxDumJJnrhZCGpyiEZ+f1aHnPvFiDqSLLJVpLSQQAQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=cSsaQ2ml;
	arc=none smtp.remote-ip=95.215.58.69
Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDDA606A332
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Nov 2026 08:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDDA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=cSsaQ2ml
X-Envelope-To: linux-remoteproc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZlrHENQm7ZQStJytmobgsP2mX//JSNUxTzz4cjrG2JU=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793779338; v=1; x=1794384138;
 b=cSsaQ2ml9zSzb/3UkFLpUz/LAyJWdM/8EkI2w4iYup+fDE5UMmCm+cT2j0Yvr48Hf2inC1DZ
 hkEVLInA3jD/Z40fBRsSAcJdgtscwupxrih4iYKBWGRoU50rtvc9M8iW/LRbW82eUu1NRapUYia
 Jtg6/TY8jbTxDmQAIL12LOr6j9otWcMbGkh9IooglkpEQH3K037V3vHupEXJlNb2nj2ntPZUnnz
 E0WdGhmEgLNCKhzqMPouFCWzUZvPd0IN3DE1lLG9A2XqN8753OMz4kwDQ2miOpVNN6B32i7DAFh
 i4LcZUU0ATJYLAfAXM1N84FyFEXsIEqMFHTKJIo6Qh+yQ==
X-Envelope-To: linux-remoteproc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1f6a471c368c48bd;
	Wed, 04 Nov 2026 08:02:18 +0000
X-Mizu-Trace-ID: 1f6a471c368c48bd
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
Date: Wed,  4 Nov 2026 05:01:41 -0300
Message-ID: <20261104080200.135431-2-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104080200.135431-1-val@packett.cool>
References: <20261104080200.135431-1-val@packett.cool>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SLPI on the SC8180X is identical to the one on SM8150, reuse the
same data SM8150 (and SDM845) uses.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index cefbe8931407..775a522f6a3b 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2042,6 +2042,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource },
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource },
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource },
+	{ .compatible = "qcom,sc8180x-slpi-pas", .data = &sdm845_slpi_resource_init },
 	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource },
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource },
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
-- 
2.56.0

