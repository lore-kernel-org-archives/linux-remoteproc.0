Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795550466;
	b=3i/2UlMLF1QHrjz5RV1/FedPXrSo1scWZx6AsI+7X1ssYhvAyOCYDd4qDGrBjDryAmlS
	 dv1hD68xr8F1BAi/TnJp46tqsfGGNAmg0fyqe+/L+Kqi0usC2txABRsi3+yAvBiGEuykY
	 FJTOm2wfw00GDIjCMRcH3lM73DdAMPIoFFRKTyg0rUri26T8yM0yk8DTr+RWFZ+OKIVrY
	 B3cU19Vs+uOP9Ud0fS3euXZ8ndqgQncmmc2zR3rCJciX/rFHLlSC9jW6QILaZSIOvCCQQ
	 ln1CBCeoRYhToK++KCp3lKw1IK1ESwLxXOXfHBur9B7WhjhPvyhoDhk8o6e3jttqyeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550466;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:X-Source-Dir:
	 X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:AntiSpam-DLSRS:
	 AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=97oeh3WPjQB4M9l6gs/79PWPCWdQ8B5MEn8g4V43w0g=;
	b=1S1rPExNq1UHjKzIpVIkpDLIlXPQUhiOSNb/QVcl3HZ7JJgz/ZDkv+b3fYV3CGwinn0G
	 ASRhUTC7Ep6Zi6hkeMzd4UB7fkikUSWgobN+FaquwSTgEurVg/h1bkj2DXhJd4rx65cWX
	 vQUp3mycHP0axvThDwLu1WO2ptVXASLCbe1H9wDr1RklrJYz7V6ySyaGc8XLJWXtttJDE
	 n8wSyckJbwO/bS3BLvyhvaQ3bKd9IaBG5P0tMKjOiI6uLbschYZlZA+H14MJmvPI4tHlt
	 rzmstZ6kReegfyhUnSwOA8PxPNJwnTtBaRblmPTqxPqOYotkYjG6DVC6iN/p9zZbkSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=sIuciU24;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=rylYaQ7v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.56.87.5
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB982606A32A;
	Tue, 24 Nov 2026 20:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB982606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=sIuciU24;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=rylYaQ7v
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795550464;
	 b=dkfKljufGjeClcPQ3zqpvK+60Hgkf62FY1lkQa6eUA8nCq8nx+LG1ASwRwUpN40RPUYn0oarSV
	  aqPh6CgQMTsd3rBDkzVzbEKU5NKikAhUDKhq/Y0RvQuU3cJ/bP8LzId3QRUPqXX66f4kXGjFO6
	  P13lp4yvk35ZRm17XmloQ4XgoD4Yt566iFX9KR1+k6u4AZj+Z1oPqGSo5F2p/K9w28QCUQoyrh
	  0WWGl8a9tGoxQddHZUr1iaYN/luV298kPgtdCWtWyE2KKazXkrdmkW6rH497L9vwZ+7EtYRhjW
	  TOR/jeAaTOGrESwHX02Ci9P3BHN9CeRMSrBFBSA7vubIyA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com; s=arckey; t=1795550464;
	bh=S8EvdfoIn88NFG1rfIS+4LDzcigel+ukTMuhC8UQRvc=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=DOW4P/PHN2o3LZ31bNJli714ec3zgM5UbaDFjuIRp1uK763uxaKa4PJOn8VLj2cksDTL9krus3
	  /xFgz6fRvTuv7zazROV/84iyJJxC+GAQukARIAkGV4kvbrbSmos69z35yJdqhxS432Gm1l3nNx
	  eWHKEBICqtYTFLmr0rnJVllwXBx/0Hj24jdgWMVfrsTWML0d1nqFIGDMrAp4Ohf9CyNhg4Sbvk
	  rgY+6HpaDglVlYVJs2k6A7MKzakLGoX3Qku8X1tbe941WrnLub7NmY3p2aM2QG1H9Uo7jrGNg1
	  oOJjUVIBSAjM6yhphUqbAzckICm/4pa80owslkBRC0on9g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=97oeh3WPjQB4M9l6gs/79PWPCWdQ8B5MEn8g4V43w0g=; b=sIuciU24OCMy63IeCkstMam3At
	NYB80gDsodHpcj6tl3n86QW4HPzryvcrr+rFbuzu2fWbErKYEeqiytTUY+3HHdxCafwIoY3HO7psd
	5yPgtf869/lIyO7UMwVrxm354294bwYZVqk4CRt0VQtP5nhtc7TJStnQUUQh+FZrPo/o=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-h034.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xVwhE-0000000DPS9-0m9E;
	Tue, 24 Nov 2026 20:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=97oeh3WPjQB4M9l6gs/79PWPCWdQ8B5MEn8g4V43w0g=; b=rylYaQ7vruKoLNsAcbVWzJuDCA
	GLFfqK2jBD9kQNjHlG9ykE70nrlfD4l01iVTKILSJ0A9vUO+ch8JHEMq5NSg29AzpzWIvmaPCu/EH
	Xldm0McavAlvmO6FUzFD8srTq2RZCqCg9YL5FDe+seOGgCMY59ZjnB4QcmB+JIdu8uCA=;
Received: from [79.28.115.6] (port=59733 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xVwh4-0000000083F-1WbN;
	Tue, 24 Nov 2026 20:00:46 +0000
Date: Tue, 24 Nov 2026 21:00:44 +0100
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Joakim Zhang <joakim.zhang@cixtech.com>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] remoteproc: virtio: Decouple vdev from the parent
 pdev
Message-ID: <awXq4WK1_HLSPVeB@bywater>
References: <20261114-remoteproc_pdev_decouple-v2-0-95235dd056aa@valla.it>
 <20261114-remoteproc_pdev_decouple-v2-1-95235dd056aa@valla.it>
 <awXBjZ9jqXW1ETNZ@p14s>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awXBjZ9jqXW1ETNZ@p14s>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 306b02710da0b043ae26ecd8375a2e5c
X-AntiAbuse: ID - 306b02710da0b043ae26ecd8375a2e5c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xVwhE-0000000DPS9-0m9E-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-h034.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Mathieu,

On Tue, Nov 24, 2026 at 10:55:41AM -0600, Mathieu Poirier wrote:
> On Sat, Nov 14, 2026 at 09:06:33AM +0100, Francesco Valla wrote:
> > The rproc-virtio platform device can have a lifetime different from the
> > virtio_device it registers. During cleanup (e.g.: when a remoteproc is
> > stopped) the platform device is de-registered by the remoteproc core,
> > but the related virtio_device might be released later; if this happens,
> > rproc_virtio_dev_release() will try to de-reference a NULL pointer as
> > part of vdev_to_rvdev(). This can easily be reproduced with
> > CONFIG_DEBUG_KOBJECT_RELEASE.
> 
> Can you provide steps to reproduce this problem?  Otherwise I'm good with the
> simplifications provided by this patch.
>

This is actually very simple to reproduce, at least on the platforms I am
working on this (i.MX93 and BeagleY-AI's AM67A).

With CONFIG_DEBUG_KOBJECT_RELEASE defined and a rpmsg-enabled firmware
(I am using Zephyr's openamp_rsc_table sample, but anything would work),
stopping the remoteproc will trigger the NULL dereference.

On the BeagleY-AI:

[   73.051869] kobject: 'rpmsg' (0000000058d91be6): kobject_release, parent 0000000000000000 (delayed 250)
[   73.051906] kobject: '(null)' (00000000ee88117f): kobject_release, parent 00000000eb0302a3 (delayed 250)
[   73.051959] kobject: 'virtio1.rpmsg_ctrl.0.0' (000000007eeaaf42): kobject_release, parent 0000000000000000 (delayed 750)
[   73.052079] kobject: 'virtio1.rpmsg_ns.53.53' (000000004cd28f83): kobject_release, parent 0000000000000000 (delayed 250)
[   73.052175] kobject: 'virtio1.rpmsg-tty.-1.1024' (00000000a54df55b): kobject_release, parent 0000000000000000 (delayed 500)
[   73.052265] kobject: 'virtio1.rpmsg-client-sample.-1.1025' (00000000bf62fa8b): kobject_release, parent 0000000000000000 (delayed 750)
[   73.052420] kobject: 'virtio1.rpmsg-tty.-1.1026' (00000000063ab658): kobject_release, parent 0000000000000000 (delayed 1000)
[   73.053420] kobject: 'virtio1' (00000000a3047c6c): kobject_release, parent 0000000000000000 (delayed 1000)
[   73.053548] remoteproc remoteproc1: stopped remote processor 79000000.r5f
[   74.076813] kobject: 'rpmsg_ctrl1' (00000000eb0302a3): kobject_release, parent 0000000000000000 (delayed 750)
[   77.276843] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
[   77.276865] Mem abort info:
[   77.276867]   ESR = 0x0000000096000004
[   77.276870]   EC = 0x25: DABT (current EL), IL = 32 bits
[   77.276875]   SET = 0, FnV = 0
[   77.276878]   EA = 0, S1PTW = 0
[   77.276880]   FSC = 0x04: level 0 translation fault
[   77.276884] Data abort info:
[   77.276886]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   77.276889]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   77.276892]   GCS = 0, Overlay = 0, DirtyBit = 0
[   77.276896] user pgtable: 4k pages, 48-bit VAs, pgdp=00000008815c6000
[   77.276901] [0000000000000030] pgd=0000000000000000, p4d=0000000000000000
[   77.276915] Internal error: Oops: 0000000096000004 [#1]  SMP
[   77.345309] Modules linked in: <snip>
[   77.391027] CPU: 3 UID: 0 PID: 34 Comm: kworker/3:0 Not tainted 7.4.0-rc4-00002-gd6d63eabb07e #1 PREEMPT(full)
[   77.401095] Hardware name: beagle BeagleBoard.org BeagleY-AI/BeagleBoard.org BeagleY-AI, BIOS 2027.01-rc3 01/01/2027
[   77.411593] Workqueue: events kobject_delayed_cleanup
[   77.416644] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   77.423589] pc : rproc_virtio_dev_release+0x20/0x5c
[   77.428459] lr : rproc_virtio_dev_release+0x20/0x5c
[   77.433325] sp : ffff80008025bd20
[   77.436627] x29: ffff80008025bd20 x28: 0000000000000000 x27: 0000000000000000
[   77.443750] x26: ffff00087f763980 x25: 0000000000000000 x24: ffff000800044805
[   77.450874] x23: ffff0008002e7000 x22: ffff00087f763980 x21: ffff000809f8cc50
[   77.457997] x20: ffff000808920600 x19: 0000000000000000 x18: ffffa2019d699248
[   77.465120] x17: ffff000800068f80 x16: ffffa2019c2fdecc x15: 0000000000000284
[   77.472243] x14: ffff0008002e7080 x13: 0000000000000000 x12: 0000000000000011
[   77.479366] x11: 00000000000000c0 x10: 0000000000000b60 x9 : 000000000000000c
[   77.486488] x8 : ffff80008025bcc0 x7 : ffff000800002dc0 x6 : fffffdffe027e300
[   77.493611] x5 : ffffa2019cbe6e64 x4 : ffff000802654400 x3 : ffff000809f8cc00
[   77.500735] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008002e7000
[   77.507858] Call trace:
[   77.510295]  rproc_virtio_dev_release+0x20/0x5c (P)
[   77.515162]  device_release+0x3c/0xe0
[   77.518818]  kobject_delayed_cleanup+0x40/0x88
[   77.523250]  process_one_work+0x188/0x2e4
[   77.527253]  worker_thread+0x18c/0x2e0
[   77.530994]  kthread+0x110/0x12c
[   77.534216]  ret_from_fork+0x10/0x20
[   77.537787] Code: f9000bf3 f9405401 f9406833 97dc5c1b (f9401a60)
[   77.543866] ---[ end trace 0000000000000000 ]---


> 
> Thanks,
> Mathieu
>

Thank you

Regards,
Francesco

