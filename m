Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07EC383C84;
	Sat, 10 Oct 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646966; cv=pass; b=em4MeeQzT2JQtL7t3V3gmJyQTP94g23zsDbaLvmUIBGSUh8cWfBW2s1rN0gQRfEGFfjRAk8SY2JxvqOz1jHbOLYCLdNGs+Ze8Bbwqt7nj5NeXMP7ofkLDKtfwsSV4rRev69I+u7fvivK6fDskckAeR/cV9sXGJDWVPB8nyyBTiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646966; c=relaxed/simple;
	bh=uehHqoqohVFSdcOITTzTOxoXsh7o/wPuKgwaJNehyHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vvt27i6qjUehdKYOA/ZLwKfOKiOdAAjbmsOesp9AsA9nB5E2UQzsCGU3+lZJsumzPawcBYo3uyi0oi5oLTvPfr8uQq/AWspDLwWMiCAybDq06FnLDnm68RhjAcziKbClNjP0oaWqoQV1nBXz9g/Xr2xv2lFfO8NtgJImpDgxORc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=vwFmL2uR; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=c8MsO3c9; arc=pass smtp.client-ip=185.56.87.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="vwFmL2uR";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="c8MsO3c9"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; s=arckey; t=1791646965;
	 b=pVashaPXwVAbCOPtW932rVo6qUaLi7KH0KuK7vawRPCAWCuhIiIZ6quqa8CkcVr8jMX4sEo0Uq
	  bhRPLM/WlLmGEJ/lQ+luPsvrc2TcUwmdCdlnZgyy7nZje0j2LoQQSyzrz0q/tCNG5bWBbMwjm2
	  2gQIwjgXjPhMaEmnF9eWKzmIluw8FoZbZzJ68kXyrBc1S3lbA6be/vVoFNXIrQ9HQhwMwJJ7Mg
	  byZpJA1DsNbR5jW4y33P84UwZVwl757LwQTR0C0Dg2swi6yEDNxM1UlCd6LnnuvQvuNqjE8TqF
	  Jt2Gk4hGxh+5oFEWXouFWF7qFW5kgl8IiFHIyte7DMfY6A==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com; s=arckey; t=1791646965;
	bh=uehHqoqohVFSdcOITTzTOxoXsh7o/wPuKgwaJNehyHs=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=ZbuOADy4N3eY0G6/yAEMNIU/twJIrNWT/GJzXVZcUEqGJ3LKE7HZvSev7U69MUs5XbRYO/BeEw
	  b5Ci/fkj9LMonqZXj7P9Wi+uicxS7Mx0rn2KgYTCmewWLBtEufas1GYqTnxpmtf9O3yJBzGHks
	  JlmSdqKujMQvUJ3m6lUnwapYxTzY+r1EZDFDXuRqjmA/0L/5G9sTmY8El7GpUWHqF9r+MG4Dud
	  kFl0Qpbx7aa/Kn8f8Mur4d3L7M8+qsiGRJ9UJHIoVgg9S1xkFvd95516dEN3k8JoUZ9aZA4E4V
	  8qCHrBzaHyQ/HbL2ZiZfFad1Zc7nbFTU1Qsk9RlW58au0Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=EfW5Is/3d/QRdzLd0rps9SjaL17NnRd0QqobJ45BXlc=; b=vwFmL2uR0r1RH81bIEkFE7oCy7
	RYdP7iuNBFWU6Pam/LjNoGBl43ECmhK5dZIbazs7Ojrg01tv+GeU0yiOrCDSTjjCJFNxTndAoP6Ku
	cJLPyvl0cOd+N4xXkoqbW6Zc5sJig+7V/exmlIoSSv+bVGaPAyt+mYeH3/LgReteQxcQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYt0-0000000Bm5g-2Ayg;
	Sat, 10 Oct 2026 15:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=EfW5Is/3d/QRdzLd0rps9SjaL17NnRd0QqobJ45BXlc=; b=c8MsO3c9EcUOl++HcQ1ILDVaSG
	7ZAwGIZqMK2+A+c9sLBA1CnP/tA1E7uO2zptXIya5P4b6wT6tetDCI9ZZsO+HsMRE8mmL4rZcpYGs
	aMgI+Ub3HtM4zJsmj+4uhg9H+lm4RJGEwdLWMlRoClDZ69P3D4NoZySAEjwH7gsIgdts=;
Received: from [79.22.26.204] (port=62594 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYsw-00000000AgQ-0s17;
	Sat, 10 Oct 2026 15:21:18 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 10 Oct 2026 17:21:08 +0200
Subject: [PATCH 3/3] remoteproc: virtio: remove stray white space
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-remoteproc_rework-v1-3-cc30dc34d866@valla.it>
References: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
In-Reply-To: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=797; i=francesco@valla.it;
 h=from:subject:message-id; bh=uehHqoqohVFSdcOITTzTOxoXsh7o/wPuKgwaJNehyHs=;
 b=kA0DAAoW4q9sUlxIuQAByyZiAGrKV+2iZavBlPcQ5/SmcVQ5hso6o+PBvQBcSdX1RXl4A2fj0
 Yh1BAAWCgAdFiEEVK7Y3rydN/ZmsAHi4q9sUlxIuQAFAmrKV+0ACgkQ4q9sUlxIuQDwUwEAnS6U
 EuGOS+6S9+kiYLpT8CSKK6W7QGOtsjDyMD3iRuQBAMSrgcKOUf2+s6GMhzvQFn4IRM0TJolJ3qp
 xNKFpt5kF
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 1dfd82e3552913a8f250587752ea52a8
X-AntiAbuse: ID - 1dfd82e3552913a8f250587752ea52a8
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xFYt0-0000000Bm5g-2Ayg-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-1b4f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Remove a stray white space in function definition. No functional
changes.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 6db228a9f87a..4ed47ccffa13 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -55,7 +55,7 @@ static struct rproc_vdev *vdev_to_rvdev(struct virtio_device *vdev)
 	return platform_get_drvdata(pdev);
 }
 
-static  struct rproc *vdev_to_rproc(struct virtio_device *vdev)
+static struct rproc *vdev_to_rproc(struct virtio_device *vdev)
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 

-- 
2.56.0

