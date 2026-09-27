Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFAE3CEB83;
	Sun, 27 Sep 2026 22:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790547706; cv=pass; b=a76B+xeO+m1pycisgHdm9IFrDr6krVEseXzQjUW6ffcYj0Itb0XyMCRU6L8j5frz5wsxvHEAeezVi7o6Ig/OlhwY6aIaIXeTBnu3ko2CT7JIK0ynHq0RbKffUeCzqlRLdB4TOhtr3cVtP2295A5jH7X8nK0k40QkHqwf2ThE5eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790547706; c=relaxed/simple;
	bh=g3a6aFez5u5R7XhphSxDPGFXrJlVJwrOjK3Tk7gWDUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RejyrgD6Fgpj2GrP8nAFakvyfXLXJwmF6pqNwOdZ69bRKsZOyLbPWWQY7C2vE3LACagSphEgfUssLS/rhQe4kbvj8rCMLDNDq95OwNQ6/nLHwNPjF8+Kyq41HiBDBh6rHmCvzo0S1qGPx9jg9Ce+pQT25BMXzfbUOdug4A7p3FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=LqyIM/dy; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=FL5/baBM; arc=pass smtp.client-ip=185.56.87.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="LqyIM/dy";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="FL5/baBM"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com; s=arckey; t=1790547703;
	 b=YU1MolKJ25aBoUZ7jA5Vu32BCBk+aAR06qTCLR8OaOOFn9cXahoSKHLQOP+K2CU5USfJTF0tCk
	  jxqLFdAtA4f0q1ER6zmSZzPpHhoCAUZx5wU64gxg6KBZAj4GTMh73J2uaZyAyobJnDpadVm4kl
	  Vd36zEkJk2L32aqkqi23Jwhoo8PuNbyQGuSBnMFUWLf020nfXgpj89dFwRFZTJXpMBvi8nVcKk
	  9OiBQN16TNLeX4BTgW6cDZT8cLf21A7RIniQWiCuLnBKpznxHbd6ZuETdRPsmirzvWfv330FY8
	  Dol4W7lVkKTFeCb7ootO04vYaH08VERergHzJ3Gq2BYJQA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com; s=arckey; t=1790547703;
	bh=g3a6aFez5u5R7XhphSxDPGFXrJlVJwrOjK3Tk7gWDUU=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=jQjSf5ml/uVw4/d51SgZU7pVV7rprI/3CBjJxNJAR5WJgEEtI2YSMGBM75hDXaPJgv56pvIBuU
	  qnGaB0W8J8goMX4X1L3HoV6WLSQYFZOMxvRTJKHZ2W/9GSw5YrfliNEkfwxgZ27E4HlfMhckoy
	  GsxKeFizarHyKmVlOmFcvo9HAfaEuob0SN6LLO0eww3bzQLsJI1bx/979G9wJ/2aWpjBa+c5j1
	  wKP26CuEe1/riRzJhlU9IJpxXux/oK8nsUmCt7UoLQnvuRv2doLmIb6b46nFt8tp6QHUJV7pl/
	  rC/e/hdpYuNSl7S42pAPV1UO5TZLnpX+bVUezs7q4C1Y6Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=9LWHPNFgWOuxhAUuO+Xov6euQfWdO2vKk+2zNuLyRVI=; b=LqyIM/dy8Vh9QyN5jk7jUK3PrZ
	6EikolVYcaUqnHSihTk5JmajC89NckjCiZACgnKmgbj4kfOPwtfzPuaaIdUh7D6B552+nxBNocGhi
	Nph6/9rDSmiedjeE9+WOYZxoB3asgpgTNNM7Wca+ZTvlXigDxI3dE/5+3ff2yPaGrLxg=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-97jw.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xAx7S-0000000AqXG-3MT6;
	Sun, 27 Sep 2026 22:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=9LWHPNFgWOuxhAUuO+Xov6euQfWdO2vKk+2zNuLyRVI=; b=FL5/baBM4QfixLkgL9NSA6Gyy2
	e1NYko/DLCVpo5o5+Rbfp/9900ufixVb3f8AGPtX/OPhC9dncfOIpVHwSCZvGdZ3rM3UMtZddQ9Ur
	oz9rBVaIxeWlXzNCpvxp9IpKiOI6hQ/Hx6U4NFNTSbJo/G5AYMKSunvdUnfPaJPR9taY=;
Received: from [79.45.60.29] (port=64303 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xAx72-000000002xa-3Ygs;
	Sun, 27 Sep 2026 22:12:48 +0000
Date: Mon, 28 Sep 2026 00:12:46 +0200
From: Francesco Valla <francesco@valla.it>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
Message-ID: <armUKG0TYwHkpG56@bywater>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
 <arKlvZGqu2nt6Ci0@p14s>
 <arLXthhYbKkwZ9zY@bywater>
 <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
 <arP38OEaabFFu8lJ@bywater>
 <araOI_duKIAbphq6@p14s>
 <1b55f680-2413-4db1-b928-ed5741696d07@arm.com>
 <arbEmz1jy0V7gjrU@bywater>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arbEmz1jy0V7gjrU@bywater>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 4ba5549e1a641721078d2af594eafedf
X-AntiAbuse: ID - 4ba5549e1a641721078d2af594eafedf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xAx7S-0000000AqXG-3MT6-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-97jw.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Fri, Sep 25, 2026 at 09:05:43PM +0200, Francesco Valla wrote:
> Hi Robin, Mathieu,
> 
> On Fri, Sep 25, 2026 at 05:48:25PM +0100, Robin Murphy wrote:
> > On 25/09/2026 4:07 pm, Mathieu Poirier wrote:
> > > On Wed, Sep 23, 2026 at 06:05:35PM +0200, Francesco Valla wrote:
> > > > On Wed, Sep 23, 2026 at 08:44:41AM -0600, Mathieu Poirier wrote:
> > > > > On Tue, 22 Sept 2026 at 13:39, Francesco Valla <francesco@valla.it> wrote:
> > > > > > 
> > > > > > On Tue, Sep 22, 2026 at 09:58:53AM -0600, Mathieu Poirier wrote:
> > > > > > > On Wed, Sep 16, 2026 at 11:10:51PM +0200, Francesco Valla wrote:
> > > > > > > > Depending on the driver originating them, data buffers used for virtio
> > > > > > > > communication can either:
> > > > > > > > 
> > > > > > > >    - already be allocated from the coherent memory area that is
> > > > > > > >      accessible by the remote processor; this is the case of rpmsg
> > > > > > > >      and the rproc flavor of virtio-console;
> > > > > > > >    - be allocated from generic kmem, and thus not accessible directly by
> > > > > > > >      the remote processor.
> > > > > > > > 
> > > > > > > > Exploiting the map operations, which are used by the virtio framework
> > > > > > > > when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
> > > > > > > > bounce buffering for the second case: when the map() callback is called
> > > > > > > > for a buffer, one or more pages of coherent memory are allocated and
> > > > > > > > data is copied to them, then they are exposed to the remote processor;
> > > > > > > > the data is  then bounced back on unmap().
> > > > > > > > 
> > > > > > > > The first case is not impacted, since buffers already suitable for
> > > > > > > > remote transmission are passed through.
> > > > > > > > 
> > > > > > > > With the bounce buffering in place, any kind of virtio device can be
> > > > > > > > supported through the remoteproc-virtio transport, at least from a
> > > > > > > > data exchange standpoint.
> > > > > > > 
> > > > > > > Is this _necessary_ for the imx93 platform you are implementing feature for?
> > > > > > > 
> > > > > > 
> > > > > > If I don't want to fundamentally change how the remoteproc integration
> > > > > > works (i.e.: using buffers only from a pre-shared area), yes. While in
> > > > > > my test environment the Cortex-M33 serving as remoteproc is able to
> > > > > > access the whole RAM space, that is not always the case.
> > > > > 
> > > > > The first sentence tells me it is mandatory while the second says it
> > > > > is not.  I understand the use case but don't want to bloat the
> > > > > subsystem with code that is trying to address a problem you currently
> > > > > don't have.
> > > > > 
> > > > 
> > > > Let me rephrase: while on i.MX93 the Cortex-M33 can theoretically access
> > > > the whole RAM space, that is not a good idea from a security point of
> > > > view and can be the source of a number of bugs. The target is to
> > > > statically define a static shared memory area (as I am doing on i.MX95)
> > > > and only use that.
> > > 
> > > As Robin pointed out, have you looked at using a restricted-dma-pool for that?
> > > Note that I am not familiar with the concept but open to go that way if it can
> > > work for us.
> > > 
> > > Robin, can you point us to a simple example we could look at?
> > The only in-tree example is mt8192-asurada.dtsi, but even there the
> > fundamental principle seems exactly the same - the system interconnect is
> > locked down such that there's only a particular region of "shared" memory
> > that PCIe DMA can access, so the restricted pool is placed there, and in
> > that case can occupy the entire region since the wifi adapter only really
> > does streaming DMA - restricted pools have some limited ability to act as a
> > fallback for coherent allocations, which won't work for everything, but does
> > happen to be enough for that wifi driver.
> > 
> > Here it would be a case of reserving some of the shared region for a
> > restricted pool alongside the "vdevbuffer" coherent pool, adding it to the
> > memory-region list of the relevant device(s), and usually that would then
> > just work, since the setup is all done automatically by the core DT code.
> > However I know remoteproc does some funky stuff with child devices, so it's
> > quite possible there might need to be something more done there. But still
> > far, far less than reimplementing a whole other bounce-buffering system.
> > 
> > Thanks,
> > Robin.
> 
> I took a look at the restricted-memory-pool - with which I wasn't
> familiar - and seems exactly what is needed here.
> 
> I am working on a new prototype with it - if everything works as
> expected (I still did not have time to try it) it should only need some
> very limited glue code, cutting the modifications in the
> remoteproc_virtio driver by 95%. I'll let you knwow.
>

Quick update: it works, with minimal glue code as expected. I am
preparing a v2 based on restricted-memory-pool, but it will take some
days, as I am addressing the other topics pointed out by Mathieu. I plan
to propose an update to the documentation too, since the setup is not so
straightforward.

Thank you again.

Regards,
Francesco

