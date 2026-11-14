Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643620;
	b=uQD4YgYYy+eFIi2jAE06L/soApPgh0yEyNkLNhQGZJhJpAOSc8XUFcdN49GFHhCK0BpZ
	 uKMGkjlibHDGj3nZ9Dh93SC9SBYU0ox8Tg3aXtYssWxBcLfNnr/VR8txpZ8gKFZw6AbFk
	 uv5q5aLxfLF776sC5tA/qgrjWibumfzLjKwJNq19hz4pOxkEK/aOCWWHyCYG75rE6C5rA
	 zMaKwCVM8Uaihr5Dql0PZi7ihIvW1h4QkYfPihlID0IDDULFZCsQNpdSfRgEQjqtyuLxN
	 6xhwU3JJCob31awctgmS6j34PSleCs5wCIpvWbDdqgXEYTOzUvuzOkuCWbiIhjRNxxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643620;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=pvKnu9PKD1YodpvoDcIgSocWazvWVQaBVSGf7BZjma8=;
	b=TtPrh2LhLys2/Xe14LHDWUgsncev8qyRNSoVX2dFg7JtXG1LS671PJvCzFUIL0NrVhU/
	 WSBsXgT38okDGtvdKGjrivNjAD1yjDTNy1dlPmRvAxTXzHnHif2NHOsj7jR23pawF0LM2
	 knbOnuFt3YgyNr7l4+lexU4gZy9DRdHxkkxthy/fY/mMrvpBffX+FrGvDYDrRya7BF6AO
	 k1XPqQ7sX6ZlBVUcBN4RGPT5x1db/9NFvHsgQqekrvOtK7xq4j2RNovu0ikdfHxzXngZt
	 QmLwPR+gHq65KvLCj/4eZ5BxTZyawQKN0fIE3BJ/n2X73j2tb6qyD7mT3I2/RgQPytg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=z1HtlsBY;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=hcSXyDYc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.11
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525A606A327;
	Sat, 14 Nov 2026 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B525A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=z1HtlsBY;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=hcSXyDYc
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794643619;
	 b=Gd4pi16P9962x1/zZhF1w7A9NTjfpuMoWl4zi94LJnTHaRRcwKOnYzOUImmqat/ufgB6rw9wdV
	  eZhVnoJ/6tUWbQJ77gleoeV1SIfOIInwhnjAXBC1vkTbh3UrhdGYosEZ1w6lGyf67Jnoe5e3UE
	  MaIpsK/64NsonkvM1tg1ro8zw2zWPHvfFCC2Z0u0XRAa5Rl8pu2D3SrWOQldVFTURLPnBV4gZ/
	  tZuzMY6DMK3yqqx5mx487RH+hUKmtylIoKsSs998bprMmwbZrItYHfncoQoauCP6IB6LJBXHAH
	  A43cELULjIbghSeIOFIvNwfbZuFkweK6JIZts5o8o4xWbg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com; s=arckey; t=1794643619;
	bh=gKUZgvz15E3Zaxe7syGeKEN6pEC6M0BCaLz8Jc0yZ/Y=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=qSkaGfjvY8JtTdjbtSILEBXBmj/2Moaoc8rc4El9BerdEJsDCEXwMU8Mf2KaDSvGD0PbruiiN9
	  vswUZiQXF35s2uMf2Rmx5iwhpQeX83d1yHVSzAKXu0A9fUgJBUsERew6e34K/axID8uFECcACi
	  4L1KCmWsZhdcttB7ssyTTLuudYsbLEqprdkPFzXe3P5Q1pN571DWyHtosgNNxDmPEbD7Vg7drM
	  MXUwfmFdbmpg5YKixEPfgX1H7mHeXgI9oncYVPty4DCkAh8hFukOUByQIJv1ULegWO9RF1VmJb
	  jv3K8EdBpGuLX4Ajkc+jb1MBhe3ZpuZx5epX/poSJefBGg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=pvKnu9PKD1YodpvoDcIgSocWazvWVQaBVSGf7BZjma8=; b=z1HtlsBYUafxjmy14pQEJls6yY
	sxiVqQfHfYpRjUFI2whvMYG2nGcQkYwGH50i8mb+E9oNFCEl6CrGepltK79tVKU44vmkQZnwIkdZp
	+TuRl04INiAMI9X8e2qOgCYBYnECjfNnHZ0DBSw3lvqlrQbykovV6jfQ8N3sJuazhf58=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8mn-00000008wMm-0Rj8;
	Sat, 14 Nov 2026 08:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=pvKnu9PKD1YodpvoDcIgSocWazvWVQaBVSGf7BZjma8=; b=hcSXyDYchDzlvGAHsyIvkBu1AQ
	r6t/UgpGAdGcF7XdK7uZHXTIikE4ciQK5XqLgOXHEGOvUP0PPafP/2RYfbjAdgL3QA1fsIHQQQ9vV
	SRyexrujxFGbsVuRn46Ni/TKKAFsgJRiINhmk6lH7czHztHCTkxPlodDsGcQb/aBlyAE=;
Received: from [95.75.15.255] (port=5068 helo=[10.167.111.42])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xS8mi-000000006Ml-1pXf;
	Sat, 14 Nov 2026 08:06:52 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH v2 0/4] remoteproc: virtio: Fixes and cleanups in the
 vdev<->pdev relationship
Date: Sat, 14 Nov 2026 09:06:32 +0100
Message-Id: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WN0Q6CIBhGX8VxHU0gS7rqPZpzCL/5NxUGyGrOd
 09tXXZ5tu87ZyYBPEIg12wmHhIGtOMK/JAR3anxARTNyoTn/MxYfqEeBhvBeatrZyDVBrSdXA9
 USiGgEaqQsiTr3Xlo8bWr79WXw9Q8QcfNty06DNH6995ObNv9MuX/TGI0p8Jo3ipzkgUzt6T6X
 h0xkmpZlg/0EgYG0QAAAA==
X-Change-ID: 20261107-remoteproc_pdev_decouple-9933eb3a5998
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Joakim Zhang <joakim.zhang@cixtech.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1650; i=francesco@valla.it;
 h=from:subject:message-id; bh=gKUZgvz15E3Zaxe7syGeKEN6pEC6M0BCaLz8Jc0yZ/Y=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFk/xCZM3rOh6cN+MXmBFGOeFtbHv3yfiz3j1CspU5F5Y
 rU4iY+to5SFQYyLQVZMkSVk3Y17e+aaf0vbwPgIZg4rE8gQBi5OAZhIshsjwx5Bv39r3bYFPl4s
 3H18o6aFeOJeiWfhDva2RWr1mTpdzxgZHr6PzEk0fPp5X37CFqlsqa6iia+fie46p39deOXnUNF
 qdgA=
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
X-SGantispam-id: 1157e1e055ab9b17bea02591ce87ab24
X-AntiAbuse: ID - 1157e1e055ab9b17bea02591ce87ab24
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xS8mn-00000008wMm-0Rj8-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qv6g.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

V2 is simply a rebase on rproc-next, with conflicts solved.

Hello,

while proceeding on [1] I noticed a possible simplification on the
rproc-virtio registration and tracking path, which led to the discovery
of a couple of bugs. This series is the result of the work that followed
and thus contains both (proposed) fixes for the bugs and the
aforementioned simplification, which consists in less poking the backing
pdev from the vdev side.

Patches 1 and 2 can be collapsed into one, but I preferred to leave them
separate to show the reasoning behind (and to allow cherry-picking, if
that's the case).

Thank you!

Regards,
Francesco

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Changes in v2:
- Rebased on rproc-next, solving conflicts.
- Link to v1: https://patch.msgid.link/20261108-remoteproc_pdev_decouple-v1-0-3dc2fad4951d@valla.it

---
Francesco Valla (4):
      remoteproc: virtio: Decouple vdev from the parent pdev
      remoteproc: virtio: Rework memory release
      remoteproc: virtio: Drop rvdevs list and associated functions
      remoteproc: virtio: Stop de-referencing pdev from its children

 drivers/remoteproc/remoteproc_core.c     | 34 +++++++++++-----------
 drivers/remoteproc/remoteproc_internal.h |  4 +--
 drivers/remoteproc/remoteproc_virtio.c   | 49 ++++++++++++++------------------
 include/linux/remoteproc.h               | 10 ++-----
 4 files changed, 43 insertions(+), 54 deletions(-)
---
base-commit: 3035b6708f61259c93a368238e206dcec313e584
change-id: 20261107-remoteproc_pdev_decouple-9933eb3a5998

Best regards,
--  
Francesco Valla <francesco@valla.it>

