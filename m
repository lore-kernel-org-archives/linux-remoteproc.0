Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C050A389DE8;
	Sat, 10 Oct 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645686; cv=pass; b=nEYBe4/6FN0pzji620QFi6IDx7ZbTs6RL0Ph9z5TGDmGz0PwcCFGDDptvejw1a1/OLFtT74WLWe+6Z4Dgm020SuhTQ+T2r2mctoIE0APJKwPaKcvOOtoyb0LDWb67j/yM9kubF/vWvyIxtqDVIkL8FX/dxpJLtIoVhDKSGDvMSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645686; c=relaxed/simple;
	bh=IjEzwgIb5TjccftVIqY/fSjyWvCfZPrbyWFd1WXAQE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvabTTPO5xwiXQZYbuaOfJ3ORPnUj1z/QeR5e8wqmmHVpZ1JoC7EF7xRAFldeXRFSyatn/tWU6+TPRS+DQbx5PzjIOyIh6jQ5clB7toZyig+TZCu7I4CgsMBi4VTlbqXi0Aqcqd/6qUjRz1Ee7cuytefKUNvhRBn9MVvTPhQ8RM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=j9tW/c0k; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=P0iv15Ix; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="j9tW/c0k";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="P0iv15Ix"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-bg17.prod.antispam.mailspamprotection.com; s=arckey; t=1791645684;
	 b=ah24R6ZFyPxuneiirUABnokWB47zUNhv0Rmq/hsl6lVYL2SgIVwFCc7mRBx4BWDAPo9HAh3pqk
	  FWEz1T3mQM0KLFFZqPHbRAJdejNoSbFAFf9hX4qsfiEvQF1QF1A69Jf1vrTcNVqi3GFh5aNqeI
	  dumN4cVyos2i4h/F5T2sHyO2zlrXPW44e0GTH7ODutLA0QvGp4zO5Bxy3kTwZvAimv6LCcBdOO
	  RHtPIMFXFlF09hfk3KYqqie+pOZmZJ1jLnsh/4rT9/tSw8ntSkalQaneWn51dg39nI9kRWT5tO
	  fnOkRur4QyRl50J6Eappag9Cx/nWc87/axMal1DmaMRw5g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-bg17.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-bg17.prod.antispam.mailspamprotection.com; s=arckey; t=1791645684;
	bh=IjEzwgIb5TjccftVIqY/fSjyWvCfZPrbyWFd1WXAQE0=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=F3CBvdaR5o+JZ6oV2XKiEDl5r2bjSA8ALrBVHyHKNFLSc8nImOj4gH8yxrbLK5qZu2eTNGA9Vr
	  hJmEPFbWZXDAIG7p8lPHsGI8/CXW1/dTRpU23BB1bOXnIoJxaf770EwLWLPkfS0yoth2TIi04n
	  wyAdH3rwqmRaep1C1usfJq4Rd4YSLfR2BeRlguzdeZq5eEpbqSWVoSbEi/lMdshWEQ/gs9IVml
	  MNM6tO1vdO9VvvUYpCIOI7HDq1PbMt+spBIgom+AbErlFCOx81/fNpVXOOBblibxNI06ha4gwe
	  dOcrO6bvjl9YacbuCNBcZopJ82WkTfBITGEmzhwRsdG1bg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=nApwmsvMXQzrQMTWsvLrWMX/vK157C/fkFF2IqnJdaQ=; b=j9tW/c0kvwYUuGyEIOAQdo532j
	Eresdtalxrlqx68mF5ORdnsixnQ5MnINn5s7Krpv2a/7xgLryoHep35khPkwRzVQruNBC//g+YD8r
	6oWnyFaNSfXjIUBxhipPFJtWH7i4TKIM2SpoPGeZBuPhjChWaAjVUgikOz/Xcczn7eno=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-bg17.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYt0-00000009Aiy-200M;
	Sat, 10 Oct 2026 15:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=nApwmsvMXQzrQMTWsvLrWMX/vK157C/fkFF2IqnJdaQ=; b=P0iv15IxjGV2n+vh3n6Ts70gvB
	fQvFJgWa9bkOleO3RV7J6F70WYcWV1B5Uy8edf7C194NXVtXrckHgy3Et2hGY8KvpHVDA8YYQLvD5
	l/6ugL6vHIF7n7cRy4eB9Jv0CO/3NCEy+VgWyVjJZHRwGN1dBezowqRejz+71Id1dKmU=;
Received: from [79.22.26.204] (port=62594 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYsv-00000000AgQ-41Ox;
	Sat, 10 Oct 2026 15:21:17 +0000
From: Francesco Valla <francesco@valla.it>
Date: Sat, 10 Oct 2026 17:21:07 +0200
Subject: [PATCH 2/3] remoteproc: virtio: replace kmemdup with kmemdup_array
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-remoteproc_rework-v1-2-cc30dc34d866@valla.it>
References: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
In-Reply-To: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=francesco@valla.it;
 h=from:subject:message-id; bh=IjEzwgIb5TjccftVIqY/fSjyWvCfZPrbyWFd1WXAQE0=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmnwt9m2fanzj4bvijtatnumtLtG7S/9c361STKJnXm3
 7bIM7HHOkpZGMS4GGTFFFlC1t24t2eu+be0DYyPYOawMoEMYeDiFICJyP9nZDh7KzP54nmmn33s
 m36yCAkXfjKa8e/4To6dU+fPSq95/GIxw3+PCnOhhy6v7lpyLGGKYl9y+InjxJP6i84Z3jI5+uC
 a6F52AA==
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
X-SGantispam-id: 2767757b8dd20ea5a269deab488f5221
X-AntiAbuse: ID - 2767757b8dd20ea5a269deab488f5221
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xFYt0-00000009Aiy-200M-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-bg17.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Let kmemdup_array take care of multiplication and overflows.

While at it, add blank lines in the same function for readability.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index dcafdfa7eab6..6db228a9f87a 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -37,11 +37,12 @@ static int copy_dma_range_map(struct device *to, struct device *from)
 	for (r = map; r->size; r++)
 		num_ranges++;
 
-	new_map = kmemdup(map, array_size(num_ranges + 1, sizeof(*map)),
-			  GFP_KERNEL);
+	new_map = kmemdup_array(map, num_ranges + 1, sizeof(*map), GFP_KERNEL);
 	if (!new_map)
 		return -ENOMEM;
+
 	to->dma_range_map = new_map;
+
 	return 0;
 }
 

-- 
2.56.0

