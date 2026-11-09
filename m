Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203357;
	b=qyAJLf+NycOnG56WSiqP/Y2yV2a4ZbW47Sf/75ufqmYpGZAxwKnvs4C74v/Mf1yeSPWF
	 kXQIrlsy74QjWnPV3cO2RJI0jnin6l0hrTtUN8546eciAFx5F+erAwCqY0dnGgc1HSGP3
	 IXhnaiWkAYgTQjldOL7f7JtTxyHxUk3ZJSQse8WsMpgk4C5+rF7ZFgLk7rurjTyNwqzHA
	 M63W8OqbI7lIn8vig5JoR3jFk3Jn4BaDcWvnMDEP4GPM2zwjVaAIovr8K79cNTtAXgpGV
	 Web9eUL7wDUurTGsEjdX3MlmPKhMUZfaT795l27RSDPduhKHLt3DtobRyVK2p+fclog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203357;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=bDEd0lZ3r8pPVze6lyuF1lx+sK+jBgyaC53bhqYWg3U=;
	b=dnNOy8SzRQyti19DVDXBwMccdIDhOSQuGlzMxlE4Pbncx8rU2ipSF+5MClh9RFOo0EtE
	 MDcyqdVEdzlweZ9YUPI5SosWzTEvSRn6mEX1YYJ4S4RflP3C4+t3n/3BbpUqTgE0N6w0c
	 hN5DUBzJxB1sW0K+6G1iRvu2LOpf8TJVUnAZ2jsnpzS3GfsMBwNkFbNXD1KwinFFxiIlR
	 +boEaVc7OYaFgKmmuePnXwqTmtbLyjSukel2F8wr9oZOMCeZE6WwozAXdqBwbAX3DzTPS
	 8zUUJm+vhHbD9J7a9yYdpfjQnttr+Jt3h0On4gkSps8JrjEN5xJaIi2AWLgdOVBQLrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=DVxNPoKR;
	arc=none smtp.remote-ip=198.54.127.149
Received: from out-2z4y-a149.jellyfish.systems (out-2z4y-a149.jellyfish.systems [198.54.127.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC6606A322
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 05:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CC6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=DVxNPoKR
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jNJkQ4CQWz8sWQ;
	Mon, 09 Nov 2026 05:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794203346;
	bh=bDEd0lZ3r8pPVze6lyuF1lx+sK+jBgyaC53bhqYWg3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVxNPoKRbZ5jb+Ae6y1tFchCRbwbkxgKYs4pLoX/cuvVkZmi+GSTOwXyRZNmrNqnJ
	 WrcY9Du9b88jTdHeaCog8I16Fi8Lt9iLShpTTTMw1p2MTZRx3tACjL8PVZUmS6i5yV
	 DdB9E+PRenMtguN4OClUEiuVCV140hyE9+ZSWj0LYWpi1QFQDfAmuApYfidqgz6075
	 0JfmRQIghhqGBZmnF5PzlraeGvPovhhiiJ6aNs67AK/6pwWoQvT2a91hIV22EkWj24
	 SGTXyKGgnjOetsXZ6IlGRQOLdbyKIzEIu2fJmP8vKWaeELaC05ExMyd2RWCn1/KpRl
	 hy4wz8sFM1H1w==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: [PATCH 2/2] remoteproc: k3-m4: Leave crash recovery enabled
Date: Mon,  9 Nov 2026 08:48:30 +0300
Message-ID: <20261109054830.42715-3-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109054830.42715-1-dev@chrispinetinega.com>
References: <20261109054830.42715-1-dev@chrispinetinega.com>
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
X-Envelope-From: dev@chrispinetinega.com

The M4 driver disables recovery, but nothing reported a crash to the
remoteproc core, so there was nothing to recover from. Now that
RP_MBOX_CRASH reaches rproc_report_crash(), recovery resets the M4F and
boots its firmware again, while Linux keeps running. The stop is a
plain reset, so it does not need the crashed core's cooperation.

Leave recovery enabled by default. Userspace can still disable it
through /sys/class/remoteproc/remoteprocN/recovery.

Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>
---
 drivers/remoteproc/ti_k3_m4_remoteproc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
index 4c46f4a25..fbd2b7c04 100644
--- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
+++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
@@ -56,7 +56,6 @@ static int k3_m4_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	rproc->has_iommu = false;
-	rproc->recovery_disabled = true;
 	kproc = rproc->priv;
 	kproc->dev = dev;
 	kproc->rproc = rproc;
-- 
2.53.0

