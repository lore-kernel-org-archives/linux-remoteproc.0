Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795659642;
	b=cagt8R7obg8J5TbXFTGusFv2KZC7Vk/aQKGMz/aX0eB5gVwbfFOegMME6ezFLEm3xRmq
	 6HbzPJpU03ywisMA2Ewu13j8BGL5V3VPOtMihX6ClrH1y71+iY/QRk6VIPzC7QJwkETqH
	 gCJCmqPmueN7fwTj4n8MQd2Y4rJGGudWXPFLeZ68rrB+spNAkda2LQdSrXKhM4bskj5dV
	 8y5T/W5v9PQM//eKyC6a7OvHpuLJIVo0lSX233XeFgbJRtuzibyhY9nP+9AKv+tiHU+7/
	 fmKNWKQ3DtqYAnAqq/VpMn93AmVokCx9VsClWqSbtzsMRlowkY79ycgaCN+R9GIQAkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795659642;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Pm+/UvfCAYSPyEjNgqW0Y9FuL/rPb1heMpydqsCNqUc=;
	b=Vg5xQdPR+voyoeILZug5ew4jhU3hyB5S0XiVd8xry/3hDcSu7757Z5D99xFtY6mpjBdJ
	 +qL5uHkiP4alL847uMxXoDyG02RnufX09w5q7r8pXRCcTUQirGsFPeS3M8r4WmOd1gmYV
	 U7CspE6Jy1e8JwHymuU+rFXTctn+6Bbtf6zATm66yCZIae8NFWXPzGFTaXEUqfQTEbkMM
	 E/t0iPIDpRNR+wID7cYoFiB+W/x5FBnEj7ju6NA6N39mbhcNzy3yapylLIkjEyLDeaea/
	 18EAwfd1sGNQYhNQwp3gqidvh0+NYr/YtMRGBZEQGbcZ/hoht+Eo1PxUGxk8nT4bpxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n4/aiVpO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2C606A323;
	Thu, 26 Nov 2026 02:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n4/aiVpO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795659641;
	b=YKeVlIfJUBPpdgvp+72sxEH++vk4Ya7n2Zot3sM4c8A3jV22rmkhlkgKs50S9L8mDs9y
	 M8Ys0Vfm9+IG88A06r3BTdW1VAp/mBDXceyZqbW+LJor0pnAuZabJdQiWS8pOY3gkaZS1
	 wiunaZ3D+6+C2eIG2aerL5T4VMjmRPWoHgeNupuR2P6yn0Gq7mscNLCg5LFCCQEW7V+YC
	 /otxIzulqmZBrcU7+ewKfM7YP1N85E8ZJaS94tK+zBnPWGCrKgESdrruQCldHOQSJpDrg
	 u6bVLV0lsATeaAabkXZqkztei8qq3azzrTrUytJR7F4ajrLNXl9iA+c8MQ8rNeGSnUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795659641;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Pm+/UvfCAYSPyEjNgqW0Y9FuL/rPb1heMpydqsCNqUc=;
	b=abmYt00zX/T4RKRq4EUDtYGxX46KnVKQa31w007BChyLTopg4P54ALNIWYhGUvOsSicm
	 6Dj9E7r+h3gDXVD9hGv3vEIxCmDvSaZ95Fll/c4SFLQ1wROODDO5fTCkZ01pC4afi6Z+M
	 7tUibKivSm67id7lv3yr7gLqlfg3rKNUXGCC56v5/oOTxlvVt8vXUGq40LTGdssyrqIg1
	 1b8gbn1/wKAOLwxoBzS6pNgzOnreCBR+rsgmdyFd/DEMGiqj0IXxy3WIztzYvi52UTR+t
	 iFvedJ5RXuOUvYJhgrSlidGmYHEnpTbYI2sc70fIyXWhRZDzAJr0RRWRCBk+mCVWkkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E02571F000C0;
	Thu, 26 Nov 2026 02:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795659641;
	bh=Pm+/UvfCAYSPyEjNgqW0Y9FuL/rPb1heMpydqsCNqUc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n4/aiVpOJIYiHUHbAGXCOnKJ2p3vO5uHg4I7E7Zl6KX9dFsVuhAi4oJvZ5/yJ+YwO
	 isiXz5/2AOIxW1/MPf8w9PeYFkC0MXJKRVPCoFRQmbuGuLq19wcpaOgXqQmwidgUWg
	 pmfBUI+kQIs+5HGqm4HN0zZhktNOqHpCLAnMtnS/JGANhFUv6W+epaUSIZo0RJzKUn
	 Td5XvA4gUIEJMyeB43Fca8jQ7s1ZpAaOKW7tglBpM4DF2Wfzm2tjO4fTy/h3+Cm1Mp
	 FCazPutqFsrFJKRLRIhhbZrD0gmiS/RVpqZmax00AaGlJnVx5kNa/aSaDaTjhAfCgz
	 JGE7HEuqhn8Tw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 652ED4D198;
	Thu, 26 Nov 2026 02:20:35 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 23:20:34 -0300
Subject: [PATCH 1/2] remoteproc: qcom: pas: Vote the SDM660 ADSP's power
 domain while it boots
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
Message-Id: <20261125-sdm660-adsp-proxy-rail-v1-1-b91784c69623@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795659634; l=1546;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=zkoyiWmiLPqXph/5+tayJyD7KHTTIW/Ma10fRXwCfwY=;
 b=GG2gnXZ+nJmYpXxqhPCe5aXn2j6T28oYiN5PTPpZJIpYF3Nba4cMfp3BwSNnXAp3p36jotJ8K
 d0cUJBkDqpEBjtpjtoU+NXpO+omUFbymMp3YQ0xCAI/n8KqTyFnEMGv
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com
Content-Transfer-Encoding: 7bit

From: Fabricio Akio <fabricioakio@gmail.com>

The SDM660 ADSP uses adsp_resource_init, which names no proxy power
domain, so the driver votes no rail for the DSP while it boots. On an
SDM630 phone the first start after boot succeeds without one; after a
stop, every later start times out waiting for the DSP.

Use msm8996_adsp_resource, which differs only in voting the "cx" power
domain until the DSP signals handover.

Fixes: a0a77028c85a ("remoteproc: q6v5_pas: Add sdm660 ADSP PIL compatible")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ff2483529d73..d5b03a433a6d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -2050,7 +2050,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource },
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource },
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
-	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
+	{ .compatible = "qcom,sdm660-adsp-pas", .data = &msm8996_adsp_resource },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm670_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },

-- 
2.56.1


