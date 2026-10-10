Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047B533D6;
	Sat, 10 Oct 2026 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645687; cv=pass; b=Lqz+9rFDO7bUp/pT7P4IIkBymNUZYY9Dyy+dWq9i3v2hS3I8EXVJA4Oy/NODdxAm2NpvGs1i+3h4FGQ2Ar2yLUz2Lc+YDDIchIL2x/x4kFVGrr8k0KKi8BY0BR4QzbBfQOpnWhZT3eqZLsTGNltpCwDWP/dbK9zVrur0NZXRwFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645687; c=relaxed/simple;
	bh=hwkxqsZu6LjIi9guNtVgTH6gdXsa+TGL7Dh3/wAAdLY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fcx+BPxaeQQjVLEwGCto0WbDpSEm5PU8k85iX/qv7mslDeywAVlhmAkdkCg9Gha1Iie52xg8/E+UNNv7k0wSSDaKVaQkJdAfwIjDJW1C4o6IOa2R2OVRU2mn7cwXmcWpeqoH4KmmVFMDRJcXssfCq3lVRRJHZjiSITnEJO8UpO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=njyVJNhz; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=QhfFEcUe; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="njyVJNhz";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="QhfFEcUe"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; s=arckey; t=1791645684;
	 b=HLQnOvO53hmH4lVx2tzkZdpnlPXheJysA7oTWRsOPtDNLpbCx8wWgPFtze00blOhOgHKhuKcKO
	  kQXgDMUHwnxX7XhIXATbvAl7HxDIEx4g34YheeEcpKzBYH9isPYPO0sGsiJ67eSZ3Bdd6bxesj
	  0+kcWAlZrM7XRWmO5qON3BJRQICQc+b7Y/chtQH7BkRZ5Wqj9CBSI2ML7i4w92kf4lZvX/nY0T
	  4fv6kbyJQ7Z6O1JAc73sQS1QsXao8rdPL1JEzgvGABb3dmk2GYg5ByYimHqJZumBdOzV7w70TQ
	  AOSSiHj3vCB9tRQA92649lt0bX91GdOnRl9f4538Vl7T8Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com; s=arckey; t=1791645684;
	bh=hwkxqsZu6LjIi9guNtVgTH6gdXsa+TGL7Dh3/wAAdLY=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=DpxjWTcLy+Sqa7R2cY69R2gCD/9N4eKQkFUg2plFyUjaVAhxn85m+VmwCckXDK0KyzN63HWYtd
	  TzQQRepVbpFc1C4yieaoWkZDhYbEE+7KeKp8TV7WF7yvZlQ4l/qS8gBppguNaJIupOnFzdSRy/
	  zpujnB5+MSNwJK1keOnJTfrS4e2IxNRaH7okG6w7usa6kjdbHY1gm8DghmSCYFw7j5g33itRQO
	  maCv6ZAlvxJ2Cxyx/vj0H65PXeQiaKPqWpIy6sc5vY1kVg+CGiXpZCpE1qHgrh7x5is0RAhhWy
	  oGHy4ACo/05TlKR6GxpFao6tU9WxNMihgiU9metfkr7C7Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=hR0QMO1+RnK1SztdzoFBGeJtpXv/ygfurJYpj3gyAog=; b=njyVJNhzt4iIfOXDQOeFWW96b5
	tmM2oT3x661YoeblzFASHfd+8BQuquIKASJ2EoH/8wTsFAx77yMLyWcfdYr+gvGi6R4N1vTOgYi7v
	8N0h40T3UNSk0jIjLLe7t4C0kO+37gSfReVQ4sHMuxCSj+I4a+LGu0sjtKMa0KM+UBXU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-c54f.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYt0-00000005Xmy-097s;
	Sat, 10 Oct 2026 15:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=hR0QMO1+RnK1SztdzoFBGeJtpXv/ygfurJYpj3gyAog=; b=QhfFEcUeHVvB3Cd0Z7rkJJ0ZlI
	pf7xi6sW1SdNP4ey20d3Bjr4odPNrhAVsQ1JVfbYWi4reF3agLERsucHfImFwgjwVwSceFRMl+akd
	/Vmi2URSjMCuC3wShOTrl2UU0kRfE91LskKfX2FcwjcHg3DgyMaSEvu5ZKTS8R6mZElg=;
Received: from [79.22.26.204] (port=62594 helo=[192.168.178.158])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xFYsv-00000000AgQ-1tVh;
	Sat, 10 Oct 2026 15:21:17 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH 0/3] Minor improvements for remoteproc_virtio
Date: Sat, 10 Oct 2026 17:21:05 +0200
Message-Id: <20261010-remoteproc_rework-v1-0-cc30dc34d866@valla.it>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMWwqDMBBG4a3IPDeQCAbbrUgpMf1tp6KRSbyAu
 PfG9vF7OGenCGFEuhU7CRaOHMYMcynIv934guJnNpW6tEYbrQRDSJgk+IdgDdIr67RFe63gaku
 5mwQdb79nc/87zu0HPp0jOo4vA2A5aHUAAAA=
X-Change-ID: 20261010-remoteproc_rework-6a06eb95ea86
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=francesco@valla.it;
 h=from:subject:message-id; bh=hwkxqsZu6LjIi9guNtVgTH6gdXsa+TGL7Dh3/wAAdLY=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmnwl+Y7d3x8keA67Skm05He6qsdi5ecaJszQI2Ju3oL
 W5LPnzb21HKwiDGxSArpsgSsu7GvT1zzb+lbWB8BDOHlQlkCAMXpwBMJPoPwx9uXrYw/fmOCwz3
 e5s2uHyK8/Htlr8aN+louaDf+5WB30sY/tkevGnY639L+1qJubyCjrLB2eO6T4X3vLZ4fODpArX
 rCVwA
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
X-SGantispam-id: c66cb660e805705eddcb33fce96c8bb5
X-AntiAbuse: ID - c66cb660e805705eddcb33fce96c8bb5
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xFYt0-00000005Xmy-097s-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c54f.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello,

while working on the v2 of [1] I noticed a couple of areas that can be
improved in remoteproc_virtio, without a real functional impact.
Nothing critical.

Thank you!

Regards,
Francesco

[1] https://lore.kernel.org/linux-remoteproc/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it/

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (3):
      remoteproc: virtio: add vdev_to_rsc() helper
      remoteproc: virtio: replace kmemdup with kmemdup_array
      remoteproc: virtio: remove stray white space

 drivers/remoteproc/remoteproc_virtio.c | 61 +++++++++++++---------------------
 1 file changed, 24 insertions(+), 37 deletions(-)
---
base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
change-id: 20261010-remoteproc_rework-6a06eb95ea86

Best regards,
--  
Francesco Valla <francesco@valla.it>

