Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793038748;
	b=MjsaxaGuwAuXfffUCO97J/wSVAXQTOHTumaJBiNRpakBcLR7oyC+DiVOWXIdjUlqU4qF
	 SX5GNjaUGZDqv5HbUpGuv997nbKshzkGmD9MRdFTVJZb23+6wuoCr++Yhh7liRama9DVv
	 p6HBECVZnCja46GHHrxEdNbek7BQNZBajefavA3LqOJo0mkdZD/Rf1HTpC45OTegI14O1
	 HhWm3BBofhZWtlmca6gNKi4yAKmSzPCBdTpceBv+SLUPON+haBxnWLL968SxxDsEJO7+d
	 4Q6s7hktNv37lxr15kEyF808JiXrmY5qAViBB9u6ccbRcZViblCt4yhvIaMZxnXlG4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038748;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m08PXGyn7U8s1ZQtlfTCv0P39/uk4oenXTU+aUpG6AY=;
	b=ReaEzpQd8GQCC+59Yk97R3mdCM6g5iBVm5qhYKqNY6uQkHNC5BpxZV80cAmSaowadCfH
	 GFn7+l455pGTtimw9jjRaB1pNL2LG13QAKGdPvbsyTlBzPfzcLk5OwxgaBKlM4wCME6NU
	 7uy1HY0cevgi3HmGH6hrpIxKnaSI8uwLOyy3k5m8W0QT0e+BZ+FWdfPL44zLGcUVXCQz+
	 Zby7KwpuvAiRJPfJDsW3d8kcEb0HGK1TzRN62MgW+oTvoHfOsX0hdY8hy+QOAFb+mgGqq
	 l7820zTWjOA7yMa4w2PLnQLN+PFiwmspsEW5EMW/8w/W18qeSrlCf1uolx3lg1G8Nmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEBkeUXZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0A606A31D;
	Mon, 26 Oct 2026 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEBkeUXZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793038748;
	b=TMuu3Xhc2O8glIct9ox3xNTZlNStQF3ryCGDrEnPzA5jmG/3LOotmSZmpdSxxxwsJhod
	 vEHBGRJd/kdiDWZiul/A1444Q1S1GXXB1ZQZdxJTAooPBYLLEn3mOSNd4b3sufpwPZMnt
	 3pTa2Wwxjs7UQNMuMEoQnj9rEiq4TSSO9XQ63c+NyRPFqs9xI2ZRLREpUw2jayLCQAqMM
	 fF44LMMMRpUk9jThqZbODvT0P87WQ4ka5uxqn2It8p0nB05UlL5gVqzBSmkr6uKLWkpCJ
	 vPh+CwiD+IWEiLSLCSpygfD2NZhN1NXD6dTeZ1/STY7PB5OMCU/JJWRn7MqdRO22b5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793038748;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=m08PXGyn7U8s1ZQtlfTCv0P39/uk4oenXTU+aUpG6AY=;
	b=cLQ7PMmWgQlmeXn2D5t93yyN1PXsESd+iX8mgCP/XgS1FB6V79BnQCFrD6M8efhb6rO/
	 9evONDJMSVm8DXlM+bxVEXoEbh7GTmvmAANNyTR2y6FIl85TZmsoEyeEfRRCUjSkatXxj
	 ZkcHX2ziW+dyek2vJ5muH3VbiKYHQI5We2LBvPNRAC9XxG6V/FQQ1OVxjMV9Gttl8x8BR
	 moSPJL/EBNELL2mrSXh/LlJkml6jg5ksbzI9jgn5wp113846glEO6oHTgnb0ljYi8yLVK
	 njARkApwGoVQ40ThhrPVgawg+KsUILroKV2D0wt5RPJyrTa9qM+bPA5CWlRZ5Jv9kAA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9562E1F01825;
	Mon, 26 Oct 2026 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793038748;
	bh=m08PXGyn7U8s1ZQtlfTCv0P39/uk4oenXTU+aUpG6AY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YEBkeUXZadQDXk7iriQYF75B+lX0bA8c8LVij+9l78XRwZ77m3v5UqMvOVohd/i5h
	 SnxhAtHoxDeht8LOWwyC9Oz2fp0ScEEPYjyDZCzd3Uu1wMQQctfqx4q9jxu/e/ueyx
	 YbjlfPN0fBXcHbiSoV5WPBD7fB1kO3/zQeQJ3IOjSlJeDEInulcB4IWvTTOJk6Wuig
	 iAFOXGeQe5hoQj9atoP458izSMH/ZB5DBe142kKR7LnbHIMU2cYIXuhW0meystprBE
	 OVaQdus3HNjD8S88qhvDgB5X9x2g1SN090+V2piOOP8tXXYvFzWNdoUz8a+1qhfh9R
	 DJFgh4JFcQlcA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2666C44E1F;
	Mon, 26 Oct 2026 18:19:07 +0000 (UTC)
From: Filippo Falezza via B4 Relay <devnull+effeffe99.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 18:19:07 +0000
Subject: [PATCH] remoteproc: qcom: pas: Print auth error code
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
Message-Id: <20261026-pas-auth-error-v1-1-1569e83358e5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMBCE4VeRPbuQiBTaVykeYhyb7SHKroogv
 ntTPczhO8x/kEEFRq/qIMUmJlMu8HVFMYX8ActQTI1rHr6M52Ac1iUxVCdltLF9un7w0YHKaVa
 Msl/Bd3fb1v6LuPwrdJ4/s+C2enIAAAA=
X-Change-ID: 20261026-pas-auth-error-e4c490bd1c0e
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Filippo Falezza <effeffe99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793038746; l=2798;
 i=effeffe99@gmail.com; s=20261022; h=from:subject:message-id;
 bh=+UAPMP0mpA/2AP1Feq4iEAd04j9ngTHwcofPyCUE/Rw=;
 b=/A113p09qt5dybuOuaIFcfMOHoKqEPwur5s2OMpFXC4z7zJipTjl/hbYB7nEIOxAIUAuYW7Yh
 LamNBz+gD6bAmKVdj1qtMzrew4KsdCHGMtU6w61Kx9mlSpAZyYEyV+u
X-Developer-Key: i=effeffe99@gmail.com; a=ed25519;
 pk=7PPwl4QILojrh+ATB5QOpvXVmmoxaxyLQhrLRLWEL0I=
X-Endpoint-Received: by B4 Relay for effeffe99@gmail.com/20261022 with
 auth_id=1327
X-Original-From: Filippo Falezza <effeffe99@gmail.com>
Reply-To: effeffe99@gmail.com
Content-Transfer-Encoding: 7bit

From: Filippo Falezza <effeffe99@gmail.com>

When a subsystem fails to start, qcom_pas_start() logs "failed to
authenticate image and release reset", but drops the error returned by
qcom_pas_prepare_and_auth_reset(). That code tells the failures apart:
a negative errno is either a clock, interconnect or SHM bridge failure
on the Linux side or the SCM call's own status, remapped by
qcom_scm_call(); a positive value is the status the PIL service
returned for the request. Without it, finding out which one happened
means adding a print and rebuilding the kernel.

Print the error code, for the DTB image as well as the main one.

Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
---
Hello there,

this is a small one: when a remote processor fails to authenticate,
qcom_pas_start() says so but drops the error code, and that code is
what tells a TrustZone refusal apart from a problem on the Linux side.
The patch adds it to both messages, the main image and the DTB one.

I ran into this bringing up the Motorola Moto G 5G Plus (nairo,
SM7250), where the compute DSP will not start. With the patch it
reports "failed to authenticate image and release reset: -22", which
pointed at TrustZone refusing the call rather than at the image. The
ADSP and the modem still start as before. I could not test the DTB
path, as SM7250 has no DTB images.

It builds without warnings with W=1 (arm64 defconfig), checkpatch
--strict is clean, and it applies to rproc-next (82d0bbd67c42). The
change and the changelog were written with Claude Opus 5.5 in Claude
Code during that bring-up; I tested it on the phone and reviewed it
before sending.

Thanks,
Filippo
---
 drivers/remoteproc/qcom_q6v5_pas.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index abc59c0c29f0..ea3eb8e293c2 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -346,7 +346,8 @@ static int qcom_pas_start(struct rproc *rproc)
 		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
 			dev_err(pas->dev,
-				"failed to authenticate dtb image and release reset\n");
+				"failed to authenticate dtb image and release reset: %d\n",
+				ret);
 			goto unmap_dtb_carveout;
 		}
 	}
@@ -365,7 +366,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	ret = qcom_pas_prepare_and_auth_reset(pas->pas_ctx);
 	if (ret) {
 		dev_err(pas->dev,
-			"failed to authenticate image and release reset\n");
+			"failed to authenticate image and release reset: %d\n", ret);
 		goto unmap_carveout;
 	}
 

---
base-commit: 82d0bbd67c42a44f0e18b0b7b0da0f3ace0c9527
change-id: 20261026-pas-auth-error-e4c490bd1c0e

Best regards,
--  
Filippo Falezza <effeffe99@gmail.com>


